

emvalac --builddir build \
    --cc=emcc \
    --define PROFILING \
    --vapidir src/vapis \
    --pkg sdl2 \
    -X -O2 \
    -o web/shmupwarz.html  \
    build/src/main.vala


