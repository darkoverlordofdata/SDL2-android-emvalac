# <del>ShmupWarz II</del> Better Than Shmup

vala-entitas running on android, emscripten and linux desktop.

dev dependencies: valac, npm, doran


## build
    git clone https://github.com/darkoverlordofdata/zerog-shmupwarz.git
    cd zerog-shmupwarz
    npm install
    doran install
    mkdir build
    cd build

### linux gcc
    cmake .. 
    make

### linux clang
    cmake .. -DCMAKE_C_COMPILER=/usr/bin/clang -DCMAKE_CXX_COMPILER=/usr/bin/clang++
    make

### windows mingw
    cmake .. -G "MSYS Makefiles" 
    make

### windows clang
    cmake .. -G "MSYS Makefiles" -DCMAKE_C_COMPILER=/c/msys64/mingw64/bin/clang.exe -DCMAKE_CXX_COMPILER=/c/msys64/mingw64/bin/clang++.exe
    make




"Keep your scanners warm."
            -- Michael Knight

