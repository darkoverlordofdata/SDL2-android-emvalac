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
    build/src/util/String.vala \
    build/src/util/File.vala \
    build/src/sdx/Color.gs \
    build/src/Sprite.vala \
    build/src/main.vala


## copy ir output to jni folder
cp -f ./build/src/util/String.c ../jni/src/util
cp -f ./build/src/util/File.c ../jni/src/util
cp -f ./build/src/sdx/Color.c ../jni/src/sdx
cp -f ./build/src/Sprite.c ../jni/src
cp -f ./build/src/main.c ../jni/src

cd ../jni

## build jni code
ndk-build

cd ..

## build the apk
ant debug install
