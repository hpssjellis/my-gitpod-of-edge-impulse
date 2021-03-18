For ETA Snsor
```
cd Applications/edge-impulse-standalone
mkdir build
cd build
cmake ..
make loadconfig CONFIG="../ai-sensor-boot-config"
make -j
```



for ETA AI Vision
```
cd Applications/edge-impulse-standalone
mkdir build
cd build
cmake ..
make loadconfig CONFIG="../ai-vision-boot-config"
make -j

```
