# sdl2-android-emvalac

vala-entitas running on android, emscripten and linux desktop.

just worked. now it needs to be cleaned up.

## build

### deskstop:
mkdir install
cd install
cmake .. -DDESKTOP=ON -DPROFILING=ON
make
cp assets install/src
cd install/src
./shmupwarz

### emscripten
./emscripten.sh

results in ./web

### android
./android.sh

## requirements
emscripten and android require emvalac (https://github.com/darkoverlordofdata/emvalac)
android requires SDL2.0.5, SDL_image and SDL_ttf linked or copied to the jni folder