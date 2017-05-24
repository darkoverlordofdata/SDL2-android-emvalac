#!/usr/bin/env bash

## build vala
cd ./vala

valac --cc=clang \
    --define PROFILING \
    --vapidir src/vapis \
    --pkg sdl2 \
    --pkg SDL2_image \
    --pkg SDL2_ttf \
    -X -O2 \
    src/sdx/Color.gs \
    src/Sprite.vala \
    src/main.vala \
    -o demo

./demo



