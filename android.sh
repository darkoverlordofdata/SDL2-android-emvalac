emvalac --builddir build --cc=jni --define ANDROID --vapidir src/vapis --pkg android --pkg mt19937ar --pkg SDL2_image --pkg SDL2_mixer --pkg SDL2_ttf --pkg gio-2.0 --pkg sdl2 -X -O2 build/src/Factory.vala build/src/Game.vala build/src/components.gs build/src/entitas/Cache.vala build/src/entitas/Group.vala build/src/entitas/Matcher.vala build/src/entitas/World.vala build/src/entitas/entitas.vala build/src/main.vala build/src/sdx/Color.gs build/src/sdx/Files.vala build/src/sdx/Font.vala build/src/sdx/audio/Sound.vala build/src/sdx/audio/audio.vala build/src/sdx/exceptions.gs build/src/sdx/files/FileHandle.vala build/src/sdx/files/files.vala build/src/sdx/graphics/BitmapFont.vala build/src/sdx/graphics/Sprite.vala build/src/sdx/graphics/Surface.vala build/src/sdx/graphics/TextureAtlas.vala build/src/sdx/graphics/TextureEnums.vala build/src/sdx/graphics/TextureRegion.vala build/src/sdx/graphics/graphics.vala build/src/sdx/sdx.vala build/src/sdx/utils/Cache.vala build/src/sdx/utils/File.vala build/src/sdx/utils/Json.vala build/src/sdx/utils/StringTokenizer.vala build/src/sdx/utils/utils.vala build/src/shmupwarz.vala build/src/systems/AnimationSystem.vala build/src/systems/CollisionSystem.vala build/src/systems/DisplaySystem.vala build/src/systems/ExpireSystem.vala build/src/systems/InputSystem.vala build/src/systems/PhysicsSystem.vala build/src/systems/RemoveSystem.vala build/src/systems/ScoreSystem.vala build/src/systems/SpawnSystem.vala


sed  "s/#include <SDL2/#include <SDL2\/SDL.h>\n#include <SDL2/g"  ./build/src/main.c >  ./android/jni/src/main.c
cp -f ./build/src/Factory.c ./android/jni/src/Factory.c
cp -f ./build/src/Game.c ./android/jni/src/Game.c
cp -f ./build/src/components.c ./android/jni/src/components.c
cp -f ./build/src/entitas/Cache.c ./android/jni/src/entitas/Cache.c
cp -f ./build/src/entitas/Group.c ./android/jni/src/entitas/Group.c
cp -f ./build/src/entitas/Matcher.c ./android/jni/src/entitas/Matcher.c
cp -f ./build/src/entitas/World.c ./android/jni/src/entitas/World.c
cp -f ./build/src/entitas/entitas.c ./android/jni/src/entitas/entitas.c
cp -f ./build/src/sdx/Color.c ./android/jni/src/sdx/Color.c
cp -f ./build/src/sdx/Files.c ./android/jni/src/sdx/Files.c
cp -f ./build/src/sdx/Font.c ./android/jni/src/sdx/Font.c
cp -f ./build/src/sdx/audio/Sound.c ./android/jni/src/sdx/audio/Sound.c
cp -f ./build/src/sdx/audio/audio.c ./android/jni/src/sdx/audio/audio.c
cp -f ./build/src/sdx/exceptions.c ./android/jni/src/sdx/exceptions.c
cp -f ./build/src/sdx/files/FileHandle.c ./android/jni/src/sdx/files/FileHandle.c
cp -f ./build/src/sdx/files/files.c ./android/jni/src/sdx/files/files.c
cp -f ./build/src/sdx/graphics/BitmapFont.c ./android/jni/src/sdx/graphics/BitmapFont.c
cp -f ./build/src/sdx/graphics/Sprite.c ./android/jni/src/sdx/graphics/Sprite.c
cp -f ./build/src/sdx/graphics/Surface.c ./android/jni/src/sdx/graphics/Surface.c
cp -f ./build/src/sdx/graphics/TextureAtlas.c ./android/jni/src/sdx/graphics/TextureAtlas.c
cp -f ./build/src/sdx/graphics/TextureEnums.c ./android/jni/src/sdx/graphics/TextureEnums.c
cp -f ./build/src/sdx/graphics/TextureRegion.c ./android/jni/src/sdx/graphics/TextureRegion.c
cp -f ./build/src/sdx/graphics/graphics.c ./android/jni/src/sdx/graphics/graphics.c
cp -f ./build/src/sdx/sdx.c ./android/jni/src/sdx/sdx.c
cp -f ./build/src/sdx/utils/Cache.c ./android/jni/src/sdx/utils/Cache.c
cp -f ./build/src/sdx/utils/File.c ./android/jni/src/sdx/utils/File.c
cp -f ./build/src/sdx/utils/Json.c ./android/jni/src/sdx/utils/Json.c
cp -f ./build/src/sdx/utils/StringTokenizer.c ./android/jni/src/sdx/utils/StringTokenizer.c
cp -f ./build/src/sdx/utils/utils.c ./android/jni/src/sdx/utils/utils.c
cp -f ./build/src/shmupwarz.c ./android/jni/src/shmupwarz.c
cp -f ./build/src/systems/AnimationSystem.c ./android/jni/src/systems/AnimationSystem.c
cp -f ./build/src/systems/CollisionSystem.c ./android/jni/src/systems/CollisionSystem.c
cp -f ./build/src/systems/DisplaySystem.c ./android/jni/src/systems/DisplaySystem.c
cp -f ./build/src/systems/ExpireSystem.c ./android/jni/src/systems/ExpireSystem.c
cp -f ./build/src/systems/InputSystem.c ./android/jni/src/systems/InputSystem.c
cp -f ./build/src/systems/PhysicsSystem.c ./android/jni/src/systems/PhysicsSystem.c
cp -f ./build/src/systems/RemoveSystem.c ./android/jni/src/systems/RemoveSystem.c
cp -f ./build/src/systems/ScoreSystem.c ./android/jni/src/systems/ScoreSystem.c
cp -f ./build/src/systems/SpawnSystem.c ./android/jni/src/systems/SpawnSystem.c
cd ./android/jni && ndk-build && cd .. &&  ant debug 