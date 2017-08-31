# zerog-ffi-ts

## status
wip:

cloned from git@github.com:darkoverlordofdata/zerog-shmupwarz.git

Adds a top layer api written using genie.
compile with GObject enabled
generate sdx as a *.so or *.dll usable from typescript

roll into zerog

add *cake build:dll* to generate 


## build

### deskstop:
mkdir install
cd install
cmake .. 
make
cp assets install/src
cd install/src
./shmupwarz

the auto
### compact
cake build:desktop

result in ./build

### emscripten
cake build:emscripten

results in ./web

### android
cake build:android

## build requirements
* autovala for desktop
* emscripten and android require ZeroG (https://github.com/darkoverlordofdata/zerog)
* zerog requires nodejs
* android requires SDL2.0.5, SDL_image and SDL_ttf linked or copied to the jni folder


##### <center>[Powered by ZeroG](https://github.com/darkoverlordofdata/zerog)</center>




### todo after install


ln -s /home/bruce/Applications/zerog/lib/goop goop
ln -s /home/bruce/Applications/zerog/lib/entitas entitas
ln -s /home/bruce/Applications/zerog/lib/sdx sdx
ln -s /home/bruce/Applications/zerog/lib/vapis vapis
ln -s /home/bruce/Applications/zerog/lib/vapis-em vapis-em
ln -s /home/bruce/Applications/zerog/lib/mt19937ar.c mt19937ar.c
ln -s /home/bruce/Applications/zerog/lib/mt19937ar.h mt19937ar.h
