# my-gitpod-of-edge-impulse
my gitpod of edge impulse



# Note: Only maintaining the Arduino section, specifically for the Portenta Pro Family of boards and shields

The other sections work with varying levels of success.

Make this most uptodate Gitpod by clicking the follwoing link (Need a Github login)
## https://gitpod.io/#github.com/hpssjellis/my-gitpod-of-edge-impulse


.

.

Pre-build (faster to load) on Mach10th 2021, but may have some issues
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
