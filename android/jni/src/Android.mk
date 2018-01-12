LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := main

SDL_PATH := ../SDL2

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/../SDL2/include \
	$(LOCAL_PATH)/../SDL2_image/include \
	$(LOCAL_PATH)/../SDL2_mixer/include \
	$(LOCAL_PATH)/../SDL2_ttf/include

# Add your application source files here...
LOCAL_SRC_FILES := \
	$(LOCAL_PATH)/../../../build/.lib/entitas/src/events/ComponentReplaced.c \
	$(LOCAL_PATH)/../../../build/.lib/entitas/src/events/EntityChanged.c \
	$(LOCAL_PATH)/../../../build/.lib/entitas/src/events/EntityReleased.c \
	$(LOCAL_PATH)/../../../build/.lib/entitas/src/events/GroupChanged.c \
	$(LOCAL_PATH)/../../../build/.lib/entitas/src/events/GroupsChanged.c \
	$(LOCAL_PATH)/../../../build/.lib/entitas/src/events/GroupUpdated.c \
	$(LOCAL_PATH)/../../../build/.lib/entitas/src/events/WorldChanged.c \
	$(LOCAL_PATH)/../../../build/.lib/entitas/src/entitas.c \
	$(LOCAL_PATH)/../../../build/.lib/entitas/src/Group.c \
	$(LOCAL_PATH)/../../../build/.lib/entitas/src/Matcher.c \
	$(LOCAL_PATH)/../../../build/.lib/entitas/src/World.c \
	$(LOCAL_PATH)/../../../build/.lib/goop/src/Class.c \
	$(LOCAL_PATH)/../../../build/.lib/goop/src/Guid.c \
	$(LOCAL_PATH)/../../../build/.lib/sdx/src/audio/audio.c \
	$(LOCAL_PATH)/../../../build/.lib/sdx/src/audio/Sound.c \
	$(LOCAL_PATH)/../../../build/.lib/sdx/src/file/FileHandle.x
	$(LOCAL_PATH)/../../../build/.lib/sdx/src/file/files.c \
	$(LOCAL_PATH)/../../../build/.lib/sdx/src/graphics/BitmapFont.c \
	$(LOCAL_PATH)/../../../build/.lib/sdx/src/graphics/Camera.c \
	$(LOCAL_PATH)/../../../build/.lib/sdx/src/graphics/graphics.c \
	$(LOCAL_PATH)/../../../build/.lib/sdx/src/graphics/NinePatch.c \
	$(LOCAL_PATH)/../../../build/.lib/sdx/src/graphics/Sprite.c \
	$(LOCAL_PATH)/../../../build/.lib/sdx/src/graphics/Surface.c \
	$(LOCAL_PATH)/../../../build/.lib/sdx/src/graphics/TextureAtlas.c \
	$(LOCAL_PATH)/../../../build/.lib/sdx/src/graphics/TexureEnums.c \
	$(LOCAL_PATH)/../../../build/.lib/sdx/src/graphics/TextureRegion.c \
	$(LOCAL_PATH)/../../../build/.lib/sdx/src/math/Interpolation.c \
	$(LOCAL_PATH)/../../../build/.lib/sdx/src/math/Timeline.c \
	$(LOCAL_PATH)/../../../build/.lib/sdx/src/math/Tween.c \
	$(LOCAL_PATH)/../../../build/.lib/sdx/src/math/TweenAccessor.c \
	$(LOCAL_PATH)/../../../build/.lib/sdx/src/math/Tweenbase.c \
	$(LOCAL_PATH)/../../../build/.lib/sdx/src/math/TweenManager.c \
	$(LOCAL_PATH)/../../../build/.lib/sdx/src/math/Vector2.c \
	$(LOCAL_PATH)/../../../build/.lib/sdx/src/ui/Button.c \
	$(LOCAL_PATH)/../../../build/.lib/sdx/src/ui/Component.c \
	$(LOCAL_PATH)/../../../build/.lib/sdx/src/ui/Label.c \
	$(LOCAL_PATH)/../../../build/.lib/sdx/src/utils/Cache.c \
	$(LOCAL_PATH)/../../../build/.lib/sdx/src/utils/File.c \
	$(LOCAL_PATH)/../../../build/.lib/sdx/src/utils/Json.c \
	$(LOCAL_PATH)/../../../build/.lib/sdx/src/utils/StringTokenizer.c \
	$(LOCAL_PATH)/../../../build/.lib/sdx/src/utils/utils.c \
	$(LOCAL_PATH)/../../../build/.lib/sdx/src/AbstractGame.c \
	$(LOCAL_PATH)/../../../build/.lib/sdx/src/ApplicationListener.c \
	$(LOCAL_PATH)/../../../build/.lib/sdx/src/Color.c \
	$(LOCAL_PATH)/../../../build/.lib/sdx/src/exceptions.c \
	$(LOCAL_PATH)/../../../build/.lib/sdx/src/Files.c \
	$(LOCAL_PATH)/../../../build/.lib/sdx/src/Font.c \
	$(LOCAL_PATH)/../../../build/.lib/sdx/src/InputMultiplexer.c \
	$(LOCAL_PATH)/../../../build/.lib/sdx/src/InputProcessor.c \
	$(LOCAL_PATH)/../../../build/.lib/sdx/src/Screen.c \
	$(LOCAL_PATH)/../../../build/.lib/sdx/src/sdx.c \
	$(LOCAL_PATH)/../../../build/$(LOCAL_PATH)/../../../build/src/Config.c \
	$(LOCAL_PATH)/../../../build/src/components.c \
	$(LOCAL_PATH)/../../../build/src/entity.c \
	$(LOCAL_PATH)/../../../build/src/Factory.c \
	$(LOCAL_PATH)/../../../build/src/Game.c \
	$(LOCAL_PATH)/../../../build/src/main.c \
	$(LOCAL_PATH)/../../../build/src/shmupwarz.c \
	$(LOCAL_PATH)/../../../build/src/systems/AnimationSystem.c \
	$(LOCAL_PATH)/../../../build/src/systems/CollisionSystem.c \
	$(LOCAL_PATH)/../../../build/src/systems/DisplaySystem.c \
	$(LOCAL_PATH)/../../../build/src/systems/ExpireSystem.c \
	$(LOCAL_PATH)/../../../build/src/systems/InputSystem.c \
	$(LOCAL_PATH)/../../../build/src/systems/PhysicsSystem.c \
	$(LOCAL_PATH)/../../../build/src/systems/RemoveSystem.c \
	$(LOCAL_PATH)/../../../build/src/systems/ScoreSystem.c \
	$(LOCAL_PATH)/../../../build/src/systems/SoundSystem.c \
	$(LOCAL_PATH)/../../../build/src/systems/SpawnSystem.c

LOCAL_SHARED_LIBRARIES := SDL2 SDL2_image SDL2_mixer SDL2_ttf

LOCAL_LDLIBS := -lGLESv1_CM -lGLESv2 -llog

include $(BUILD_SHARED_LIBRARY)
