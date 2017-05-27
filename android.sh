#!/usr/bin/env bash

## build vala

emvalac --builddir build \
    --cc=jni \
    --define ANDROID \
    --define PROFILING \
    --vapidir src/vapis \
    --pkg sdl2 \
    --pkg SDL2_image \
    --pkg SDL2_mixer \
    --pkg SDL2_ttf \
    --pkg android \
    --pkg posix \
    --pkg mt19937ar \
    -X -O2 \
    build/src/Factory.vala \
    build/src/Game.vala \
    build/src/components.gs \
    build/src/entitas/Cache.vala \
    build/src/entitas/Group.vala \
    build/src/entitas/Matcher.vala \
    build/src/entitas/World.vala \
    build/src/entitas/entitas.vala \
    build/src/main.vala \
    build/src/sdx/Color.gs \
    build/src/sdx/Files.vala \
    build/src/sdx/Font.vala \
    build/src/sdx/audio/Sound.vala \
    build/src/sdx/audio/audio.vala \
    build/src/sdx/exceptions.gs \
    build/src/sdx/files/FileHandle.vala \
    build/src/sdx/files/files.vala \
    build/src/sdx/graphics/Sprite.vala \
    build/src/sdx/graphics/Surface.vala \
    build/src/sdx/graphics/TextureAtlas.vala \
    build/src/sdx/graphics/graphics.vala \
    build/src/sdx/sdx.vala \
    build/src/sdx/utils/Cache.vala \
    build/src/sdx/utils/File.vala \
    build/src/sdx/utils/Json.vala \
    build/src/sdx/utils/StringTokenizer.vala \
    build/src/sdx/utils/utils.vala \
    build/src/shmupwarz.vala \
    build/src/systems/AnimationSystem.vala \
    build/src/systems/CollisionSystem.vala \
    build/src/systems/DisplaySystem.vala \
    build/src/systems/ExpireSystem.vala \
    build/src/systems/InputSystem.vala \
    build/src/systems/PhysicsSystem.vala \
    build/src/systems/RemoveSystem.vala \
    build/src/systems/ScoreSystem.vala \
    build/src/systems/SpawnSystem.vala \


###
## copy ir output to jni folder
## makes sure main.c includes sdl.h
###

sed  "s/#include <SDL2/#include <SDL2\/SDL.h>\n#include <SDL2/g"  ./build/src/main.c >  ./android/jni/src/main.c

cp -f ./build/src/Factory.c ./android/jni/src
cp -f ./build/src/Game.c ./android/jni/src
cp -f ./build/src/components.c ./android/jni/src
cp -f ./build/src/entitas/Cache.c ./android/jni/src/entitas
cp -f ./build/src/entitas/Group.c ./android/jni/src/entitas
cp -f ./build/src/entitas/Matcher.c ./android/jni/src/entitas
cp -f ./build/src/entitas/World.c ./android/jni/src/entitas
cp -f ./build/src/entitas/entitas.c ./android/jni/src/entitas
cp -f ./build/src/sdx/Color.c ./android/jni/src/sdx
cp -f ./build/src/sdx/Files.c ./android/jni/src/sdx
cp -f ./build/src/sdx/Font.c ./android/jni/src/sdx
cp -f ./build/src/sdx/audio/Sound.c ./android/jni/src/sdx/audio
cp -f ./build/src/sdx/audio/audio.c ./android/jni/src/sdx/audio
cp -f ./build/src/sdx/exceptions.c ./android/jni/src/sdx
cp -f ./build/src/sdx/files/FileHandle.c ./android/jni/src/sdx/files
cp -f ./build/src/sdx/files/files.c ./android/jni/src/sdx/files
cp -f ./build/src/sdx/graphics/Sprite.c ./android/jni/src/sdx/graphics
cp -f ./build/src/sdx/graphics/Surface.c ./android/jni/src/sdx/graphics
cp -f ./build/src/sdx/graphics/TextureAtlas.c ./android/jni/src/sdx/graphics
cp -f ./build/src/sdx/graphics/graphics.c ./android/jni/src/sdx/graphics
cp -f ./build/src/sdx/sdx.c ./android/jni/src/sdx
cp -f ./build/src/sdx/utils/Cache.c ./android/jni/src/sdx/utils
cp -f ./build/src/sdx/utils/File.c ./android/jni/src/sdx/utils
cp -f ./build/src/sdx/utils/Json.c ./android/jni/src/sdx/utils
cp -f ./build/src/sdx/utils/StringTokenizer.c ./android/jni/src/sdx/utils
cp -f ./build/src/sdx/utils/utils.c ./android/jni/src/sdx/utils
cp -f ./build/src/shmupwarz.c ./android/jni/src
cp -f ./build/src/systems/AnimationSystem.c ./android/jni/src/systems
cp -f ./build/src/systems/CollisionSystem.c ./android/jni/src/systems
cp -f ./build/src/systems/DisplaySystem.c ./android/jni/src/systems
cp -f ./build/src/systems/ExpireSystem.c ./android/jni/src/systems
cp -f ./build/src/systems/InputSystem.c ./android/jni/src/systems
cp -f ./build/src/systems/PhysicsSystem.c ./android/jni/src/systems
cp -f ./build/src/systems/RemoveSystem.c ./android/jni/src/systems
cp -f ./build/src/systems/ScoreSystem.c ./android/jni/src/systems
cp -f ./build/src/systems/SpawnSystem.c ./android/jni/src/systems


cd ./android/jni

## build jni code
ndk-build

cd ..

## build the apk
ant debug install

