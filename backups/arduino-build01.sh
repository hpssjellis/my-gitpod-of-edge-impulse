#!/bin/bash
set -e

PROJECT=firmware-arduino-portenta
BOARD=arduino:mbed:envie_m7
COMMAND=$1
if [ -z "$ARDUINO_CLI" ]; then
	ARDUINO_CLI=$(which arduino-cli || true)
fi
DIRNAME="$(basename "$SCRIPTPATH")"
EXPECTED_CLI_MAJOR=0
EXPECTED_CLI_MINOR=13

if [ ! -x "$ARDUINO_CLI" ]; then
    echo "Cannot find 'arduino-cli' in your PATH. Install the Arduino CLI before you continue."
    echo "Installation instructions: https://arduino.github.io/arduino-cli/latest/"
    exit 1
fi

CLI_MAJOR=$($ARDUINO_CLI version | cut -d. -f1 | rev | cut -d ' '  -f1)
CLI_MINOR=$($ARDUINO_CLI version | cut -d. -f2)
CLI_REV=$($ARDUINO_CLI version | cut -d. -f3 | cut -d ' '  -f1)

if (( CLI_MINOR < EXPECTED_CLI_MINOR)); then
    echo "You need to upgrade your Arduino CLI version (now: $CLI_MAJOR.$CLI_MINOR.$CLI_REV, but required: $EXPECTED_CLI_MAJOR.$EXPECTED_CLI_MINOR.x or higher)"
    echo "See https://arduino.github.io/arduino-cli/installation/ for upgrade instructions"
    exit 1
fi

if (( CLI_MAJOR != EXPECTED_CLI_MAJOR || CLI_MINOR != EXPECTED_CLI_MINOR )); then
    echo "You're using an untested version of Arduino CLI, this might cause issues (found: $CLI_MAJOR.$CLI_MINOR.$CLI_REV, expected: $EXPECTED_CLI_MAJOR.$EXPECTED_CLI_MINOR.x)"
fi

has_arduino_core() {
    $ARDUINO_CLI core list | grep "arduino:mbed" || true
}
HAS_ARDUINO_CORE="$(has_arduino_core)"
if [ -z "$HAS_ARDUINO_CORE" ]; then
    echo "Installing Arduino Mbed core..."
    $ARDUINO_CLI core update-index
    $ARDUINO_CLI core install arduino:mbed@1.3.2
    echo "Installing Arduino Mbed core OK"
fi

has_mkrwan_lib() {
	$ARDUINO_CLI lib list | grep MKRWAN || true
}
HAS_MKRWAN_LIB="$(has_mkrwan_lib)"
if [ -z "$HAS_MKRWAN_LIB" ]; then
    echo "Installing MKRWAN library..."
    $ARDUINO_CLI lib update-index
	$ARDUINO_CLI lib install MKRWAN@1.0.13	# MKRWAN library
    echo "Installing MKRWAN library OK"
fi

# CLI v0.14 updates the name of this to --build-property
if ((CLI_MAJOR >= 0 && CLI_MINOR >= 14)); then
	BUILD_PROPERTIES_FLAG=--build-property
else
	BUILD_PROPERTIES_FLAG=--build-properties
fi

INCLUDE="-I./src"
INCLUDE+=" -I./src/model-parameters"
INCLUDE+=" -I./src/repl"
INCLUDE+=" -I./src/ingestion-sdk-c/"
INCLUDE+=" -I./src/ingestion-sdk-c/inc"
INCLUDE+=" -I./src/ingestion-sdk-c/inc/signing"
INCLUDE+=" -I./src/ingestion-sdk-platform/portenta"
INCLUDE+=" -I./src/sensors"
INCLUDE+=" -I./src/QCBOR/inc"
INCLUDE+=" -I./src/QCBOR/src"
INCLUDE+=" -I./src/mbedtls_hmac_sha256_sw/"
INCLUDE+=" -I./src/edge-impulse-sdk/"
INCLUDE+=" -I./src/drivers/Himax_HM01B0"
INCLUDE+=" -I./src/drivers/Portenta_Camera"

FLAGS="-DARDUINOSTL_M_H"
FLAGS+=" -DMBED_HEAP_STATS_ENABLED=1"
FLAGS+=" -DMBED_STACK_STATS_ENABLED=1"
FLAGS+=" -O3"
FLAGS+=" -g3"
FLAGS+=" -DEI_SENSOR_AQ_STREAM=FILE"
FLAGS+=" -DEIDSP_QUANTIZE_FILTERBANK=0"
FLAGS+=" -DEI_CLASSIFIER_SLICES_PER_MODEL_WINDOW=3"
FLAGS+=" -DEI_CLASSIFIER_ALLOCATION_STATIC"
FLAGS+=" -DEI_DSP_IMAGE_BUFFER_STATIC_SIZE=128"
FLAGS+=" -DEI_DEVICE_PORTENTA_DISABLE_MICROPHONE"
#FLAGS+=" -mfpu=fpv4-sp-d16"
FLAGS+=" -w"

if [ "$COMMAND" = "--build" ];
then
	echo "Building $PROJECT"
	$ARDUINO_CLI compile --fqbn  $BOARD $BUILD_PROPERTIES_FLAG build.extra_flags="$INCLUDE $FLAGS" --output-dir . &
	pid=$! # Process Id of the previous running command
	while kill -0 $pid 2>/dev/null
	do
		echo "Still building..."
		sleep 2
	done
	wait $pid
	ret=$?
	if [ $ret -eq 0 ]; then
		echo "Building $PROJECT done"
	else
		exit "Building $PROJECT failed"
	fi
elif [ "$COMMAND" = "--flash" ];
then
	$ARDUINO_CLI upload -p $($ARDUINO_CLI board list | grep Arduino | cut -d ' ' -f1) --fqbn $BOARD --input-dir .
elif [ "$COMMAND" = "--all" ];
then
	$ARDUINO_CLI compile --fqbn  $BOARD $BUILD_PROPERTIES_FLAG build.extra_flags="$INCLUDE $FLAGS"
	status=$?
	[ $status -eq 0 ] && $ARDUINO_CLI upload -p $($ARDUINO_CLI board list | grep Arduino | cut -d ' ' -f1) --fqbn $BOARD --input-dir .
else
	echo "Nothing to do for target"
fi
