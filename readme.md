# <del>ShmupWarz II</del> Better Than Shmup


vala-entitas running on android, emscripten and linux desktop.


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


ln -s /home/bruce/Applications/zerog/src/goop goop
ln -s /home/bruce/Applications/zerog/src/entitas entitas
ln -s /home/bruce/Applications/zerog/src/sdx sdx
ln -s /home/bruce/Applications/zerog/src/vapis vapis
ln -s /home/bruce/Applications/zerog/src/vapis-em vapis-em
ln -s /home/bruce/Applications/zerog/src/mt19937ar.c mt19937ar.c
ln -s /home/bruce/Applications/zerog/src/mt19937ar.h mt19937ar.h
