
Note: Your edge impulse is unzipped in the folder
```
--> eta-compile-->third-party-->edgeImpulse 
```


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
