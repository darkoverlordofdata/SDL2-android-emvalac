#!/usr/bin/env bash
#    --pkg emscripten \


emvalac --builddir build \
    --cc=jni \
    --define PROFILING \
    --vapidir src/vapis \
    --pkg sdl2 \
    --pkg SDL2_image \
    -X -O2 \
    -o web/shmupwarz.html  \
    build/src/Sprite.vala \
    build/src/main.vala

