# my-gitpod-of-edge-impulse
my gitpod of edge impulse



## Note: I am only maintaining the Arduino section, specifically for the Portenta Pro Family of boards and shields

The other sections work with varying levels of success.

Make this most uptodate Gitpod by clicking the follwoing link (Need a Github login)
## https://gitpod.io/#github.com/hpssjellis/my-gitpod-of-edge-impulse



For fun I am going to try to include the openMV installation from https://github.com/openmv/openmv/blob/master/src/README.md  I hope it doesn't break what I already have working.



The basic concept is that the folders in /edge-impulse/local-build-firmware/ will have specific folders for the different edge impulse builds. Inside those folders should be a bash file that can walk through a typical edge impulse example local build.

.

Pre-build (faster to load) on March 10th 2021, but may have some issues
[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#snapshot/8517045d-85d0-4fe1-a4c2-1e53e58a29db)


Test the installation with

```

arduino-cli version
west --version
mbed-cli --version
make --version
arm-none-eabi-gcc --version

```





Presently may have to run these commands if re-openning a gitpod

```

              cd /home/linuxbrew/.linuxbrew                                                                                 &&
              curl -fsSL https://raw.githubusercontent.com/arduino/arduino-cli/master/install.sh | sh                       &&
              python3 -m pip install mbed-cli  west  pyserial==3.4 inquirer==2.7.0                                          &&
              ./arduino-build.sh                                                                                            && 
```



Note: Find folders with

```
find  / -type d -iname "project.images" -ls

```

Find files with

```
find  /  -iname "project.md" -ls
```


Make file tutorial   https://www.cs.colby.edu/maxwell/courses/tutorials/maketutor/  



Spresense

https://developer.sony.com/develop/spresense/docs/arduino_set_up_en.html

https://github.com/sonydevworld/spresense-arduino-compatible


Note: Other useful commands

```
arduino-cli lib examples RPC
arduino-cli lib search Portenta
arduino-cli lib install portenta-pro-community-solutions
arduino-cli lib install Arduino_tensorflowlite


```
