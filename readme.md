# ShmupWarz II - The Wrath of Duane Dibbley 


vala-entitas running on android, emscripten and linux desktop.


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

## build requirements
* autovala for desktop
* emscripten and android require emvalac (https://github.com/darkoverlordofdata/emvalac)
* emvalac requires nodejs
* android requires SDL2.0.5, SDL_image and SDL_ttf linked or copied to the jni folder

use xml2json to convert bitmap font config:

npm install xml2json -g
cat hud.fnt | xml2son > hud.json
cat normal.fnt | xml2son > normal.json
-s ALLOW_MEMORY_GROWTH=1 

enlarged memory arrays from 16777216 to 33554432, took 10 ms (has ArrayBuffer.transfer? false)

java -cp gdx.jar:gdx-tools.jar com.badlogic.gdx.tools.texturepacker.TexturePacker assets outputDir pack

