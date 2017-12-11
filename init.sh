# #!/usr/bin/env sh

# cd build
# # cmake -D CMAKE_C_COMPILER=/usr/bin/clang.exe -D CMAKE_CXX_COMPILER=/usr/bin/clang++.exe ..
# cmake -G "MSYS Makefiles" -D CMAKE_C_COMPILER=/c/msys64/mingw64/bin/clang.exe -D CMAKE_CXX_COMPILER=/c/msys64/mingw64/bin/clang++.exe ..

cd build
if [ "$(expr substr $(uname -s) 1 7)" == "MSYS_NT" ]; then

    cmake \
        -G "MSYS Makefiles" \
        -DCMAKE_C_COMPILER=/c/msys64/mingw64/bin/clang.exe \
        -DCMAKE_CXX_COMPILER=/c/msys64/mingw64/bin/clang++.exe \
        ..
else
    cmake \
        -DCMAKE_C_COMPILER=/usr/bin/clang.exe \
        -DCMAKE_CXX_COMPILER=/usr/bin/clang++.exe \
        ..
fi
