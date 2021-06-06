
#!/bin/bash

echo "Just make sure the aurdino-build.sh file is in the same folder as your unzipped arduino edge impulse folder"

./arduino-build-portenta.sh --build

echo "Copying the build/edge_impulse_inferencing_bootloader.bin to the downloadable folder eta-edge-serial-upload "
cp build/edge_impulse_inferencing_bootloader.bin     ../portenta-edge-serial-upload/


echo "Download the full folder eta-edge-serial-upload so that you can install the new software on your ETA Compute device using the appropriate installer"
echo "Edge impulse client needs to be installed on your local machine"
echo "npm install -g edge-impulse-cli"

