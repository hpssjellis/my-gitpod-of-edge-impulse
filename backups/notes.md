
```

$ sudo apt install -y build-essential
$ bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"
$ cd example-standalone-inferencing
$ CC=clang CXX=clang++ make -j

```




Simpilicity studio

```
curl -SL http://www.silabs.com/Support%20Documents/Software/SimplicityStudio-v4.tgz | tar -xz

sudo dpkg --add-architecture i386
sudo apt-get update
cd SimplicityStudio_v4
sudo ./setup.sh

```
