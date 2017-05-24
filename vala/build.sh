#!/usr/bin/env bash
#    --pkg emscripten \

emvalac --builddir build \
    --cc=jni \
    --define PROFILING \
    --vapidir src/vapis \
    --pkg sdl2 \
    --pkg SDL2_image \
    --pkg SDL2_ttf \
    --pkg posix \
    --pkg mt19937ar \
    -X -O2 \
    build/src/sdx/Color.gs \
    build/src/Sprite.vala \
    build/src/main.vala


