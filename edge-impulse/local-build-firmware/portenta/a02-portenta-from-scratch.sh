echo "Just make sure the aurdino-build.sh file is in the same folder as your unzipped arduino edge impulse folder"

./arduino-build-portenta.sh --build

echo "Copying the build/edge_impulse_inferencing_bootloader.bin to the downloadable folder eta-edge-serial-upload "
cp build/edge_impulse_inferencing_bootloader.bin     ../portenta-edge-serial-upload/


echo "Download the full folder eta-edge-serial-upload so that you can install the new software on your ETA Compute device using the appropriate installer"
echo "Edge impulse client needs to be installed on your local machine"
echo "npm install -g edge-impulse-cli"


echo "Make a new folder and put this file into the folder"
read tossaway


echo "make a .cpp file with the same name as the folderfor your Portenta sketch"
echo "make sure your included libraries are in the libraries folder "
ls -la /home/gitpod/Arduino/libraries
read toss2

echo "make sure your arduino core is the the arduino core location"
echo "YOu may have to use cd foldername to find it"
ls -la /home/gitpod/.arduino15/packages/arduino/hardware
read toss2


echo "more"

