#!/bin/bash

echo "Make a new folder and put this file and the 'arduino-build-portenta.sh' into the folder"
read 


echo "make a .cpp file with the same name as the folder for your Portenta sketch"
echo "make sure your included libraries are in the libraries folder "
ls -la /home/gitpod/Arduino/libraries
read 

echo "make sure your arduino core is the the arduino core location"
echo "You may have to use cd foldername to find it"
ls -la /home/gitpod/.arduino15/packages/arduino/hardware
read 


echo "When ready run the command './arduino-build-portenta.sh --build' Pres enter to auto run it"
./arduino-build-portenta.sh --build

echo "Download the folder 'portenta-edge-serial-upload' and download the gnerated .bin file into the'portenta-edge-serial-upload' folder your downloaded"
echo "Edge impulse client needs to be installed on your local machine"
echo "npm install -g edge-impulse-cli"
echo 'Run the file for your system that will upload the .bin file to your Portenta. May have to double press the portenta button to get it into bootloader mode'
read




