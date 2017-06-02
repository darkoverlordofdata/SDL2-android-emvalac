mkdir -p build
emvalac  --builddir build --cc=emcc --define EMSCRIPTEN --define PROFILING --vapidir src/vapis-em --pkg emscripten --pkg mt19937ar --pkg SDL2_image --pkg SDL2_mixer --pkg SDL2_ttf --pkg gio-2.0 --pkg sdl2 -X -O2 -o web/shmupwarz.html  build/src/Factory.vala build/src/Game.vala build/src/components.gs build/src/entitas/Cache.vala build/src/entitas/Group.vala build/src/entitas/Matcher.vala build/src/entitas/World.vala build/src/entitas/entitas.vala build/src/main.vala build/src/sdx/Color.gs build/src/sdx/Files.vala build/src/sdx/Font.vala build/src/sdx/audio/Sound.vala build/src/sdx/audio/audio.vala build/src/sdx/exceptions.gs build/src/sdx/files/FileHandle.vala build/src/sdx/files/files.vala build/src/sdx/graphics/BitmapFont.vala build/src/sdx/graphics/Sprite.vala build/src/sdx/graphics/Surface.vala build/src/sdx/graphics/Texture.vala build/src/sdx/graphics/TextureAtlas.vala build/src/sdx/graphics/TextureEnums.vala build/src/sdx/graphics/TextureRegion.vala build/src/sdx/graphics/graphics.vala build/src/sdx/sdx.vala build/src/sdx/utils/Cache.vala build/src/sdx/utils/File.vala build/src/sdx/utils/Json.vala build/src/sdx/utils/StringTokenizer.vala build/src/sdx/utils/utils.vala build/src/shmupwarz.vala build/src/systems/AnimationSystem.vala build/src/systems/CollisionSystem.vala build/src/systems/DisplaySystem.vala build/src/systems/ExpireSystem.vala build/src/systems/InputSystem.vala build/src/systems/PhysicsSystem.vala build/src/systems/RemoveSystem.vala build/src/systems/ScoreSystem.vala build/src/systems/SpawnSystem.vala