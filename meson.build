project('shmupwarz',['c','vala'])

ANDROID = (get_option('ANDROID') != '')
PROFILING = (get_option('PROFILING') != '')
DESKTOP = (get_option('DESKTOP') != '')

add_global_arguments('-DGETTEXT_PACKAGE="shmupwarz"',language: 'c')

SDL2_image_dep = dependency('SDL2_image')
SDL2_mixer_dep = dependency('SDL2_mixer')
SDL2_ttf_dep = dependency('SDL2_ttf')
gio_2_0_dep = dependency('gio-2.0')
glib_2_0_dep = dependency('glib-2.0')
gobject_2_0_dep = dependency('gobject-2.0')
sdl2_dep = dependency('sdl2')
Entitas_dep = dependency('Entitas')
gee_0_8_dep = dependency('gee-0.8')
json_glib_1_0_dep = dependency('json-glib-1.0')
sdx_dep = dependency('sdx')

resources_gresource_xml_generator = generator(find_program('glib-compile-resources'), arguments: [ '--sourcedir=@SOURCE_DIR@/data' , '--generate-source', '--target=@BUILD_DIR@/resources.gresource.xml.c', '@INPUT@'], output: '@PLAINNAME@.c')

resources_gresource_xml_file_c = resources_gresource_xml_generator.process(['data/resources.gresource.xml'])

meson.add_install_script(join_paths(meson.current_source_dir(),'meson_scripts','install_data.sh'),join_paths(get_option('prefix'),get_option('datadir'),'shmupwarz'),join_paths(meson.current_source_dir(),'data/local','','*'))

meson.add_install_script(join_paths(meson.current_source_dir(),'meson_scripts','install_data.sh'),join_paths(get_option('prefix'),get_option('datadir'),'doc'),join_paths(meson.current_source_dir(),'doc','','*'))

install_data('data/shmupwarz.desktop',install_dir:join_paths(get_option('prefix'),get_option('datadir'),'applications'))
install_data('data/icons/shmupwarz.png',install_dir: join_paths(get_option('prefix'),get_option('datadir'),'icons','hicolor/192x192/apps'))
cfg_shmupwarz = configuration_data()
cfg_shmupwarz.set('DATADIR', join_paths(get_option('prefix'),get_option('datadir')))
cfg_shmupwarz.set('PKGDATADIR', join_paths(get_option('prefix'),get_option('datadir'),'shmupwarz'))
cfg_shmupwarz.set('GETTEXT_PACKAGE', 'shmupwarz')
cfg_shmupwarz.set('RELEASE_NAME', 'shmupwarz')
cfg_shmupwarz.set('PREFIX', get_option('prefix'))
cfg_shmupwarz.set('VERSION', '1.0.0')
cfg_shmupwarz.set('TESTSRCDIR', meson.current_source_dir())

cfgfile_1 = configure_file(input: 'src/Config.vala.base',output: 'Config_1.vala',configuration: cfg_shmupwarz)

shmupwarz_deps = [SDL2_image_dep]
shmupwarz_deps += [SDL2_mixer_dep]
shmupwarz_deps += [SDL2_ttf_dep]
shmupwarz_deps += [gio_2_0_dep]
shmupwarz_deps += [glib_2_0_dep]
shmupwarz_deps += [gobject_2_0_dep]
shmupwarz_deps += [sdl2_dep]
shmupwarz_deps += [Entitas_dep]
shmupwarz_deps += [gee_0_8_dep]
shmupwarz_deps += [json_glib_1_0_dep]
shmupwarz_deps += [sdx_dep]
shmupwarz_sources = [cfgfile_1]
shmupwarz_sources += ['src/Factory.vala']
shmupwarz_sources += ['src/Game.vala']
shmupwarz_sources += ['src/components.gs']
shmupwarz_sources += ['src/entitas/Cache.vala']
shmupwarz_sources += ['src/entitas/Group.vala']
shmupwarz_sources += ['src/entitas/Matcher.vala']
shmupwarz_sources += ['src/entitas/World.vala']
shmupwarz_sources += ['src/entitas/entitas.vala']
shmupwarz_sources += ['src/main.vala']
shmupwarz_sources += ['src/sdx/Color.gs']
shmupwarz_sources += ['src/sdx/Files.vala']
shmupwarz_sources += ['src/sdx/Font.vala']
shmupwarz_sources += ['src/sdx/exceptions.gs']
shmupwarz_sources += ['src/sdx/files/FileHandle.vala']
shmupwarz_sources += ['src/sdx/graphics/Sprite.vala']
shmupwarz_sources += ['src/sdx/graphics/Surface.vala']
shmupwarz_sources += ['src/sdx/graphics/TextureAtlas.vala']
shmupwarz_sources += ['src/sdx/sdx.vala']
shmupwarz_sources += ['src/shmupwarz.vala']
shmupwarz_sources += ['src/systems/AnimationSystem.vala']
shmupwarz_sources += ['src/systems/CollisionSystem.vala']
shmupwarz_sources += ['src/systems/DisplaySystem.vala']
shmupwarz_sources += ['src/systems/ExpireSystem.vala']
shmupwarz_sources += ['src/systems/InputSystem.vala']
shmupwarz_sources += ['src/systems/PhysicsSystem.vala']
shmupwarz_sources += ['src/systems/RemoveSystem.vala']
shmupwarz_sources += ['src/systems/ScoreSystem.vala']
shmupwarz_sources += ['src/systems/SpawnSystem.vala']
shmupwarz_sources += ['src/util/Cache.vala']
shmupwarz_sources += ['src/util/File.vala']
shmupwarz_sources += ['src/util/Json.vala']
shmupwarz_sources += [resources_gresource_xml_file_c]
shmupwarz_sources += [join_paths(meson.current_source_dir(),'src/vapis/mt19937ar.vapi')]
shmupwarz_vala_args = ['--vapidir='+join_paths(meson.current_source_dir(),'src/vapis')]
shmupwarz_vala_args += ['--gresources='+join_paths(meson.current_source_dir(),'data/resources.gresource.xml')]
shmupwarz_vala_args += ['--disable-warnings', '--cc=clang']
shmupwarz_c_args = ['-g', '-Og']
if ANDROID
  shmupwarz_vala_args += ['-D', 'ANDROID']
  shmupwarz_c_args += ['-DANDROID']
endif
if PROFILING
  shmupwarz_vala_args += ['-D', 'PROFILING']
  shmupwarz_c_args += ['-DPROFILING']
endif
if DESKTOP
  shmupwarz_vala_args += ['-D', 'DESKTOP']
  shmupwarz_c_args += ['-DDESKTOP']
endif
shmupwarz_deps += [meson.get_compiler('c').find_library('m', required : false)]

executable('shmupwarz',shmupwarz_sources,dependencies: shmupwarz_deps,vala_args: shmupwarz_vala_args,c_args: shmupwarz_c_args,install: true)

