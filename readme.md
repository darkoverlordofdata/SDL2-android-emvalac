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
* emscripten and android require emvalac (https://github.com/darkoverlordofdata/emvalac)
* emvalac requires nodejs
* android requires SDL2.0.5, SDL_image and SDL_ttf linked or copied to the jni folder


##### <center>Powered by ZeroG</center>