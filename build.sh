#!/usr/bin/env bash

## build vala
cd ./vala

emvalac --builddir build \
    --cc=jni \
    --define ANDROID \
    --define PROFILING \
    --vapidir src/vapis \
    --pkg sdl2 \
    --pkg SDL2_image \
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
    build/src/sdx/files/FileHandle.vala \
    build/src/sdx/graphics/Sprite.vala \
    build/src/sdx/graphics/Surface.vala \
    build/src/sdx/graphics/TextureAtlas.vala \
    build/src/sdx/sdx.vala \
    build/src/systems/AnimationSystem.vala \
    build/src/systems/CollisionSystem.vala \
    build/src/systems/DisplaySystem.vala \
    build/src/systems/ExpireSystem.vala \
    build/src/systems/InputSystem.vala \
    build/src/systems/PhysicsSystem.vala \
    build/src/systems/RemoveSystem.vala \
    build/src/systems/ScoreSystem.vala \
    build/src/systems/SpawnSystem.vala \
    build/src/util/Cache.vala \
    build/src/util/File.vala \
    build/src/util/Json.vala \
    build/src/util/JsVariant.vala \
    build/src/util/String.vala 



## copy ir output to jni folder
## makes sure main.c inclues sdl2.h
sed  "s/#include <SDL2/#include <SDL2\/SDL.h>\n#include <SDL2/g"  ./build/src/main.c >  ../jni/src/main.c

cp -f ./build/src/Factory.c ../jni/src
cp -f ./build/src/Game.c ../jni/src
cp -f ./build/src/components.c ../jni/src
cp -f ./build/src/entitas/Cache.c ../jni/src/entitas
cp -f ./build/src/entitas/Group.c ../jni/src/entitas
cp -f ./build/src/entitas/Matcher.c ../jni/src/entitas
cp -f ./build/src/entitas/World.c ../jni/src/entitas
cp -f ./build/src/entitas/entitas.c ../jni/src/entitas
cp -f ./build/src/sdx/Color.gs ../jni/src/sdx
cp -f ./build/src/sdx/Files.c ../jni/src/sdx
cp -f ./build/src/sdx/Font.c ../jni/src/sdx
cp -f ./build/src/sdx/files/FileHandle.c ../jni/src/sdx/files
cp -f ./build/src/sdx/graphics/Sprite.c ../jni/src/sdx/graphics
cp -f ./build/src/sdx/graphics/Surface.c ../jni/src/sdx/graphics
cp -f ./build/src/sdx/graphics/TextureAtlas.c ../jni/src/sdx/graphics
cp -f ./build/src/sdx/sdx.c ../jni/src/sdx
cp -f ./build/src/systems/AnimationSystem.c ../jni/src/systems
cp -f ./build/src/systems/CollisionSystem.c ../jni/src/systems
cp -f ./build/src/systems/DisplaySystem.c ../jni/src/systems
cp -f ./build/src/systems/ExpireSystem.c ../jni/src/systems
cp -f ./build/src/systems/InputSystem.c ../jni/src/systems
cp -f ./build/src/systems/PhysicsSystem.c ../jni/src/systems
cp -f ./build/src/systems/RemoveSystem.c ../jni/src/systems
cp -f ./build/src/systems/ScoreSystem.c ../jni/src/systems
cp -f ./build/src/systems/SpawnSystem.c ../jni/src/systems
cp -f ./build/src/util/Cache.c ../jni/src/util
cp -f ./build/src/util/File.c ../jni/src/util
cp -f ./build/src/util/Json.c ../jni/src/util
cp -f ./build/src/util/JsVariant.c ../jni/src/util
cp -f ./build/src/util/String.c ../jni/src/util



cd ../jni

## build jni code
ndk-build

cd ..

## build the apk
ant debug install

