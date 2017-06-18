/** updated by emvalac */
/* sdx.c generated by valac 0.34.8, the Vala compiler
 * generated from sdx.vala, do not modify */


#include <glib.h>
#include <glib-object.h>
#include <SDL2/SDL_render.h>
#include <SDL2/SDL_video.h>
#include <SDL2/SDL_pixels.h>
#include <float.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>
#include <SDL2/SDL_events.h>
#include <SDL2/SDL.h>
#include <SDL2/SDL_image.h>
#include <SDL2/SDL_hints.h>
#include <SDL2/SDL_ttf.h>
#include <SDL2/SDL_timer.h>
#include <mt19937ar.h>
#include <SDL2/SDL_rect.h>
#include <SDL2/SDL_scancode.h>
#include <SDL2/SDL_keyboard.h>
#include <android/log.h>

typedef struct _sdxAbstractPlatform sdxAbstractPlatform;
typedef struct _sdxLambdaReference sdxLambdaReference;
void sdx_lambda_reference_release (sdxLambdaReference* self);
void sdx_lambda_reference_free (sdxLambdaReference* self);
sdxLambdaReference* sdx_lambda_reference_retain (sdxLambdaReference* self);
#define _sdx_lambda_reference_release0(var) ((var == NULL) ? NULL : (var = (sdx_lambda_reference_release (var), NULL)))
typedef struct _sdxAbstractGame sdxAbstractGame;

#define SDX_TYPE_FILE_TYPE (sdx_file_type_get_type ())
typedef struct _sdxFont sdxFont;
typedef struct _sdxgraphicsSprite sdxgraphicsSprite;
typedef sdxgraphicsSprite sdxgraphicsSpriteTextSprite;
typedef sdxgraphicsSprite sdxgraphicsSpriteAnimatedSprite;

#define SDX_TYPE_DIRECTION (sdx_direction_get_type ())
#define _SDL_DestroyWindow0(var) ((var == NULL) ? NULL : (var = (SDL_DestroyWindow (var), NULL)))
#define _SDL_DestroyRenderer0(var) ((var == NULL) ? NULL : (var = (SDL_DestroyRenderer (var), NULL)))
#define _g_free0(var) (var = (g_free (var), NULL))
void sdx_font_release (sdxFont* self);
void sdx_font_free (sdxFont* self);
sdxFont* sdx_font_retain (sdxFont* self);
#define _sdx_font_release0(var) ((var == NULL) ? NULL : (var = (sdx_font_release (var), NULL)))
void sdx_graphics_sprite_release (sdxgraphicsSprite* self);
void sdx_graphics_sprite_free (sdxgraphicsSprite* self);
sdxgraphicsSprite* sdx_graphics_sprite_retain (sdxgraphicsSprite* self);
#define _sdx_graphics_sprite_release0(var) ((var == NULL) ? NULL : (var = (sdx_graphics_sprite_release (var), NULL)))

typedef void (*sdxAbstractPlatformAbstractUpdate) (gint tick, void* user_data);
typedef void (*sdxAbstractPlatformAbstractDraw) (gint tick, void* user_data);
struct _sdxAbstractPlatform {
	gint _retainCount;
	gint width;
	gint height;
	sdxAbstractPlatformAbstractUpdate update;
	gpointer update_target;
	GDestroyNotify update_target_destroy_notify;
	sdxAbstractPlatformAbstractDraw draw;
	gpointer draw_target;
	GDestroyNotify draw_target_destroy_notify;
};

typedef void (*sdxAbstractGameAbstractUpdate) (void* user_data);
typedef void (*sdxAbstractGameAbstractDraw) (void* user_data);
struct _sdxAbstractGame {
	gint _retainCount;
	gint width;
	gint height;
	sdxAbstractGameAbstractUpdate update;
	gpointer update_target;
	GDestroyNotify update_target_destroy_notify;
	sdxAbstractGameAbstractDraw draw;
	gpointer draw_target;
	GDestroyNotify draw_target_destroy_notify;
};

struct _sdxLambdaReference {
	gint _retainCount;
};

typedef enum  {
	SDX_FILE_TYPE_Resource = 1,
	SDX_FILE_TYPE_Asset,
	SDX_FILE_TYPE_Absolute,
	SDX_FILE_TYPE_Relative
} sdxFileType;

typedef enum  {
	SDX_DIRECTION_NONE,
	SDX_DIRECTION_LEFT,
	SDX_DIRECTION_RIGHT,
	SDX_DIRECTION_UP,
	SDX_DIRECTION_DOWN
} sdxDirection;

typedef enum  {
	SDX_SDL_EXCEPTION_Initialization,
	SDX_SDL_EXCEPTION_ImageInitialization,
	SDX_SDL_EXCEPTION_TtfInitialization,
	SDX_SDL_EXCEPTION_TextureFilteringNotEnabled,
	SDX_SDL_EXCEPTION_OpenWindow,
	SDX_SDL_EXCEPTION_CreateRenderer,
	SDX_SDL_EXCEPTION_InvalidForPlatform,
	SDX_SDL_EXCEPTION_UnableToLoadResource,
	SDX_SDL_EXCEPTION_UnableToLoadSurface,
	SDX_SDL_EXCEPTION_UnableToLoadTexture,
	SDX_SDL_EXCEPTION_NullPointer,
	SDX_SDL_EXCEPTION_NoSuchElement,
	SDX_SDL_EXCEPTION_IllegalStateException,
	SDX_SDL_EXCEPTION_RuntimeException,
	SDX_SDL_EXCEPTION_NotReached
} sdxSdlException;
#define SDX_SDL_EXCEPTION sdx_sdl_exception_quark ()

extern sdxFileType sdx_platform;
sdxFileType sdx_platform = SDX_FILE_TYPE_Asset;
extern SDL_Renderer* sdx_renderer;
SDL_Renderer* sdx_renderer = NULL;
extern sdxFont* sdx_font;
sdxFont* sdx_font = NULL;
extern sdxFont* sdx_smallFont;
sdxFont* sdx_smallFont = NULL;
extern sdxFont* sdx_largeFont;
sdxFont* sdx_largeFont = NULL;
extern int sdx_display;
int sdx_display = 0;
extern SDL_DisplayMode sdx_displayMode;
SDL_DisplayMode sdx_displayMode = {0};
extern SDL_Color sdx_fpsColor;
SDL_Color sdx_fpsColor = {0};
extern SDL_Color sdx_bgdColor;
SDL_Color sdx_bgdColor = {0};
extern sdxgraphicsSpriteTextSprite* sdx_fpsSprite;
sdxgraphicsSpriteTextSprite* sdx_fpsSprite = NULL;
extern sdxgraphicsSpriteAnimatedSprite* sdx_fps1;
sdxgraphicsSpriteAnimatedSprite* sdx_fps1 = NULL;
extern sdxgraphicsSpriteAnimatedSprite* sdx_fps2;
sdxgraphicsSpriteAnimatedSprite* sdx_fps2 = NULL;
extern sdxgraphicsSpriteAnimatedSprite* sdx_fps3;
sdxgraphicsSpriteAnimatedSprite* sdx_fps3 = NULL;
extern sdxgraphicsSpriteAnimatedSprite* sdx_fps4;
sdxgraphicsSpriteAnimatedSprite* sdx_fps4 = NULL;
extern sdxgraphicsSpriteAnimatedSprite* sdx_fps5;
sdxgraphicsSpriteAnimatedSprite* sdx_fps5 = NULL;
extern gboolean sdx_showFps;
gboolean sdx_showFps = FALSE;
extern gfloat sdx_fps;
gfloat sdx_fps = 0.0F;
extern gfloat sdx_delta;
gfloat sdx_delta = 1.0f / 60.0f;
extern gint sdx_mouseX;
gint sdx_mouseX = 0;
extern gint sdx_mouseY;
gint sdx_mouseY = 0;
extern gboolean sdx_mouseDown;
gboolean sdx_mouseDown = FALSE;
extern gboolean sdx_running;
gboolean sdx_running = FALSE;
extern guint8* sdx_keys;
extern gint sdx_keys_length1;
guint8* sdx_keys = NULL;
gint sdx_keys_length1 = 0;
static gint _sdx_keys_size_ = 0;
extern gboolean* sdx_direction;
extern gint sdx_direction_length1;
gboolean* sdx_direction = NULL;
gint sdx_direction_length1 = 0;
static gint _sdx_direction_size_ = 0;
extern gchar* sdx_resourceBase;
gchar* sdx_resourceBase = NULL;
extern gdouble sdx_currentTime;
gdouble sdx_currentTime = 0.0;
extern gdouble sdx_accumulator;
gdouble sdx_accumulator = 0.0;
extern gdouble sdx_freq;
gdouble sdx_freq = 0.0;
extern gint sdx_width;
gint sdx_width = 0;
extern gint sdx_height;
gint sdx_height = 0;
extern SDL_Event sdx__evt;
SDL_Event sdx__evt = {0};

void sdx_abstract_platform_free (sdxAbstractPlatform* self);
static void sdx_abstract_platform_instance_init (sdxAbstractPlatform * self);
static void _sdx_abstract_platform_update_lambda24_ (gint tick);
static void __sdx_abstract_platform_update_lambda24__sdx_abstract_platform_abstract_update (gint tick, gpointer self);
static void _sdx_abstract_platform_draw_lambda25_ (gint tick);
static void __sdx_abstract_platform_draw_lambda25__sdx_abstract_platform_abstract_draw (gint tick, gpointer self);
sdxAbstractPlatform* sdx_abstract_platform_retain (sdxAbstractPlatform* self);
void sdx_abstract_platform_release (sdxAbstractPlatform* self);
void sdx_abstract_platform_free (sdxAbstractPlatform* self);
sdxAbstractPlatform* sdx_abstract_platform_new (void);
void sdx_lambda_reference_free (sdxLambdaReference* self);
sdxLambdaReference* sdx_lambda_reference_new (void);
void sdx_abstract_game_free (sdxAbstractGame* self);
static void sdx_abstract_game_instance_init (sdxAbstractGame * self);
static void _sdx_abstract_game_update_lambda6_ (void);
static void __sdx_abstract_game_update_lambda6__sdx_abstract_game_abstract_update (gpointer self);
static void _sdx_abstract_game_draw_lambda7_ (void);
static void __sdx_abstract_game_draw_lambda7__sdx_abstract_game_abstract_draw (gpointer self);
sdxAbstractGame* sdx_abstract_game_retain (sdxAbstractGame* self);
void sdx_abstract_game_release (sdxAbstractGame* self);
void sdx_abstract_game_free (sdxAbstractGame* self);
sdxAbstractGame* sdx_abstract_game_new (void);
void sdx_abstract_game_start (sdxAbstractGame* self);
void sdx_start (void);
static void sdx_lambda_reference_instance_init (sdxLambdaReference * self);
sdxLambdaReference* sdx_lambda_reference_retain (sdxLambdaReference* self);
void sdx_lambda_reference_release (sdxLambdaReference* self);
void sdx_lambda_reference_free (sdxLambdaReference* self);
#define SDX_pixelFactor 2
GType sdx_file_type_get_type (void) G_GNUC_CONST;
void sdx_font_free (sdxFont* self);
void sdx_graphics_sprite_free (sdxgraphicsSprite* self);
#define SDX_MS_PER_UPDATE (1.0 / 60.0)
GType sdx_direction_get_type (void) G_GNUC_CONST;
SDL_Window* sdx_initialize (gint width, gint height, const gchar* name);
GQuark sdx_sdl_exception_quark (void);
gdouble sdx_getRandom (void);
void sdx_setResourceBase (const gchar* path);
void sdx_setDefaultFont (const gchar* path, gint size);
sdxFont* sdx_font_new (const gchar* path, gint size);
void sdx_setSmallFont (const gchar* path, gint size);
void sdx_setLargeFont (const gchar* path, gint size);
void sdx_setShowFps (gboolean value);
sdxgraphicsSpriteAnimatedSprite* sdx_graphics_sprite_animated_sprite_new (const gchar* path, gint width, gint height);
void sdx_drawFps (void);
void sdx_graphics_sprite_animated_sprite_setFrame (sdxgraphicsSpriteAnimatedSprite* self, gint frame);
void sdx_graphics_sprite_render (sdxgraphicsSprite* self, gint x, gint y, SDL_Rect* clip);
gdouble sdx_getNow (void);
void sdx_gameloop (sdxAbstractGame* game);
void sdx_processEvents (void);
void sdx_begin (void);
void sdx_end (void);
void sdx_log (const gchar* text);

extern const SDL_Color SDX_COLOR_AntiqueWhite;
extern const SDL_Color SDX_COLOR_Black;

static void _sdx_abstract_platform_update_lambda24_ (gint tick) {
}


static void __sdx_abstract_platform_update_lambda24__sdx_abstract_platform_abstract_update (gint tick, gpointer self) {
	_sdx_abstract_platform_update_lambda24_ (tick);
}


static void _sdx_abstract_platform_draw_lambda25_ (gint tick) {
}


static void __sdx_abstract_platform_draw_lambda25__sdx_abstract_platform_abstract_draw (gint tick, gpointer self) {
	_sdx_abstract_platform_draw_lambda25_ (tick);
}


sdxAbstractPlatform* sdx_abstract_platform_retain (sdxAbstractPlatform* self) {
	sdxAbstractPlatform* result = NULL;
	g_return_val_if_fail (self != NULL, NULL);
	g_atomic_int_add ((volatile gint *) (&self->_retainCount), 1);
	result = self;
	return result;
}


void sdx_abstract_platform_release (sdxAbstractPlatform* self) {
	gboolean _tmp0_ = FALSE;
	g_return_if_fail (self != NULL);
	_tmp0_ = g_atomic_int_dec_and_test ((volatile gint *) (&self->_retainCount));
	if (_tmp0_) {
		sdx_abstract_platform_free (self);
	}
}


sdxAbstractPlatform* sdx_abstract_platform_new (void) {
	sdxAbstractPlatform* self;
	sdxLambdaReference* r = NULL;
	sdxLambdaReference* _tmp0_ = NULL;
	self = g_slice_new0 (sdxAbstractPlatform);
	sdx_abstract_platform_instance_init (self);
	_tmp0_ = sdx_lambda_reference_new ();
	r = _tmp0_;
	_sdx_lambda_reference_release0 (r);
	return self;
}


static void sdx_abstract_platform_instance_init (sdxAbstractPlatform * self) {
	self->_retainCount = 1;
	self->update = __sdx_abstract_platform_update_lambda24__sdx_abstract_platform_abstract_update;
	self->update_target = self;
	self->update_target_destroy_notify = NULL;
	self->draw = __sdx_abstract_platform_draw_lambda25__sdx_abstract_platform_abstract_draw;
	self->draw_target = self;
	self->draw_target_destroy_notify = NULL;
}


void sdx_abstract_platform_free (sdxAbstractPlatform* self) {
	(self->update_target_destroy_notify == NULL) ? NULL : (self->update_target_destroy_notify (self->update_target), NULL);
	self->update = NULL;
	self->update_target = NULL;
	self->update_target_destroy_notify = NULL;
	(self->draw_target_destroy_notify == NULL) ? NULL : (self->draw_target_destroy_notify (self->draw_target), NULL);
	self->draw = NULL;
	self->draw_target = NULL;
	self->draw_target_destroy_notify = NULL;
	g_slice_free (sdxAbstractPlatform, self);
}


static void _sdx_abstract_game_update_lambda6_ (void) {
}


static void __sdx_abstract_game_update_lambda6__sdx_abstract_game_abstract_update (gpointer self) {
	_sdx_abstract_game_update_lambda6_ ();
}


static void _sdx_abstract_game_draw_lambda7_ (void) {
}


static void __sdx_abstract_game_draw_lambda7__sdx_abstract_game_abstract_draw (gpointer self) {
	_sdx_abstract_game_draw_lambda7_ ();
}


sdxAbstractGame* sdx_abstract_game_retain (sdxAbstractGame* self) {
	sdxAbstractGame* result = NULL;
	g_return_val_if_fail (self != NULL, NULL);
	g_atomic_int_add ((volatile gint *) (&self->_retainCount), 1);
	result = self;
	return result;
}


void sdx_abstract_game_release (sdxAbstractGame* self) {
	gboolean _tmp0_ = FALSE;
	g_return_if_fail (self != NULL);
	_tmp0_ = g_atomic_int_dec_and_test ((volatile gint *) (&self->_retainCount));
	if (_tmp0_) {
		sdx_abstract_game_free (self);
	}
}


sdxAbstractGame* sdx_abstract_game_new (void) {
	sdxAbstractGame* self;
	sdxLambdaReference* r = NULL;
	sdxLambdaReference* _tmp0_ = NULL;
	self = g_slice_new0 (sdxAbstractGame);
	sdx_abstract_game_instance_init (self);
	_tmp0_ = sdx_lambda_reference_new ();
	r = _tmp0_;
	_sdx_lambda_reference_release0 (r);
	return self;
}


void sdx_abstract_game_start (sdxAbstractGame* self) {
	g_return_if_fail (self != NULL);
	sdx_start ();
}


static void sdx_abstract_game_instance_init (sdxAbstractGame * self) {
	self->_retainCount = 1;
	self->update = __sdx_abstract_game_update_lambda6__sdx_abstract_game_abstract_update;
	self->update_target = self;
	self->update_target_destroy_notify = NULL;
	self->draw = __sdx_abstract_game_draw_lambda7__sdx_abstract_game_abstract_draw;
	self->draw_target = self;
	self->draw_target_destroy_notify = NULL;
}


void sdx_abstract_game_free (sdxAbstractGame* self) {
	(self->update_target_destroy_notify == NULL) ? NULL : (self->update_target_destroy_notify (self->update_target), NULL);
	self->update = NULL;
	self->update_target = NULL;
	self->update_target_destroy_notify = NULL;
	(self->draw_target_destroy_notify == NULL) ? NULL : (self->draw_target_destroy_notify (self->draw_target), NULL);
	self->draw = NULL;
	self->draw_target = NULL;
	self->draw_target_destroy_notify = NULL;
	g_slice_free (sdxAbstractGame, self);
}


sdxLambdaReference* sdx_lambda_reference_retain (sdxLambdaReference* self) {
	sdxLambdaReference* result = NULL;
	g_return_val_if_fail (self != NULL, NULL);
	g_atomic_int_add ((volatile gint *) (&self->_retainCount), 1);
	result = self;
	return result;
}


void sdx_lambda_reference_release (sdxLambdaReference* self) {
	gboolean _tmp0_ = FALSE;
	g_return_if_fail (self != NULL);
	_tmp0_ = g_atomic_int_dec_and_test ((volatile gint *) (&self->_retainCount));
	if (_tmp0_) {
		sdx_lambda_reference_free (self);
	}
}


sdxLambdaReference* sdx_lambda_reference_new (void) {
	sdxLambdaReference* self;
	self = g_slice_new0 (sdxLambdaReference);
	sdx_lambda_reference_instance_init (self);
	return self;
}


static void sdx_lambda_reference_instance_init (sdxLambdaReference * self) {
	self->_retainCount = 1;
}


void sdx_lambda_reference_free (sdxLambdaReference* self) {
	g_slice_free (sdxLambdaReference, self);
}


GType sdx_direction_get_type (void) {
	static volatile gsize sdx_direction_type_id__volatile = 0;
	if (g_once_init_enter (&sdx_direction_type_id__volatile)) {
		static const GEnumValue values[] = {{SDX_DIRECTION_NONE, "SDX_DIRECTION_NONE", "none"}, {SDX_DIRECTION_LEFT, "SDX_DIRECTION_LEFT", "left"}, {SDX_DIRECTION_RIGHT, "SDX_DIRECTION_RIGHT", "right"}, {SDX_DIRECTION_UP, "SDX_DIRECTION_UP", "up"}, {SDX_DIRECTION_DOWN, "SDX_DIRECTION_DOWN", "down"}, {0, NULL, NULL}};
		GType sdx_direction_type_id;
		sdx_direction_type_id = g_enum_register_static ("sdxDirection", values);
		g_once_init_leave (&sdx_direction_type_id__volatile, sdx_direction_type_id);
	}
	return sdx_direction_type_id__volatile;
}


/**
 * Initialization
 * 
 */
SDL_Window* sdx_initialize (gint width, gint height, const gchar* name) {
	SDL_Window* result = NULL;
	gint _tmp0_ = 0;
	gint _tmp1_ = 0;
	guint8* _tmp2_ = NULL;
	gboolean* _tmp3_ = NULL;
	gint _tmp4_ = 0;
	gint _tmp7_ = 0;
	gboolean _tmp10_ = FALSE;
	gint _tmp13_ = 0;
	int _tmp16_ = 0;
	SDL_DisplayMode _tmp17_ = {0};
	SDL_DisplayMode _tmp18_ = {0};
	gint _tmp19_ = 0;
	SDL_DisplayMode _tmp20_ = {0};
	gint _tmp21_ = 0;
	SDL_Window* window = NULL;
	const gchar* _tmp22_ = NULL;
	SDL_Window* _tmp23_ = NULL;
	SDL_Window* _tmp24_ = NULL;
	SDL_Window* _tmp27_ = NULL;
	SDL_Renderer* _tmp28_ = NULL;
	SDL_Renderer* _tmp29_ = NULL;
	guint64 _tmp32_ = 0ULL;
	guint64 _tmp33_ = 0ULL;
	GError * _inner_error_ = NULL;
	g_return_val_if_fail (name != NULL, NULL);
	_tmp0_ = height;
	sdx_height = _tmp0_;
	_tmp1_ = width;
	sdx_width = _tmp1_;
	_tmp2_ = g_new0 (guint8, 256);
	sdx_keys = (g_free (sdx_keys), NULL);
	sdx_keys = _tmp2_;
	sdx_keys_length1 = 256;
	_sdx_keys_size_ = sdx_keys_length1;
	_tmp3_ = g_new0 (gboolean, 5);
	sdx_direction = (g_free (sdx_direction), NULL);
	sdx_direction = _tmp3_;
	sdx_direction_length1 = 5;
	_sdx_direction_size_ = sdx_direction_length1;
	_tmp4_ = SDL_Init ((guint32) ((SDL_INIT_VIDEO | SDL_INIT_TIMER) | SDL_INIT_EVENTS));
	if (_tmp4_ < 0) {
		const gchar* _tmp5_ = NULL;
		GError* _tmp6_ = NULL;
		_tmp5_ = SDL_GetError ();
		_tmp6_ = g_error_new_literal (SDX_SDL_EXCEPTION, SDX_SDL_EXCEPTION_Initialization, _tmp5_);
		_inner_error_ = _tmp6_;
		g_critical ("file %s: line %d: uncaught error: %s (%s, %d)", __FILE__, __LINE__, _inner_error_->message, g_quark_to_string (_inner_error_->domain), _inner_error_->code);
		g_clear_error (&_inner_error_);
		return NULL;
	}
	_tmp7_ = IMG_Init ((gint) IMG_INIT_PNG);
	if (_tmp7_ < 0) {
		const gchar* _tmp8_ = NULL;
		GError* _tmp9_ = NULL;
		_tmp8_ = SDL_GetError ();
		_tmp9_ = g_error_new_literal (SDX_SDL_EXCEPTION, SDX_SDL_EXCEPTION_ImageInitialization, _tmp8_);
		_inner_error_ = _tmp9_;
		g_critical ("file %s: line %d: uncaught error: %s (%s, %d)", __FILE__, __LINE__, _inner_error_->message, g_quark_to_string (_inner_error_->domain), _inner_error_->code);
		g_clear_error (&_inner_error_);
		return NULL;
	}
	_tmp10_ = SDL_SetHint (SDL_HINT_RENDER_SCALE_QUALITY, "1");
	if (!_tmp10_) {
		const gchar* _tmp11_ = NULL;
		GError* _tmp12_ = NULL;
		_tmp11_ = SDL_GetError ();
		_tmp12_ = g_error_new_literal (SDX_SDL_EXCEPTION, SDX_SDL_EXCEPTION_TextureFilteringNotEnabled, _tmp11_);
		_inner_error_ = _tmp12_;
		g_critical ("file %s: line %d: uncaught error: %s (%s, %d)", __FILE__, __LINE__, _inner_error_->message, g_quark_to_string (_inner_error_->domain), _inner_error_->code);
		g_clear_error (&_inner_error_);
		return NULL;
	}
	_tmp13_ = TTF_Init ();
	if (_tmp13_ == -1) {
		const gchar* _tmp14_ = NULL;
		GError* _tmp15_ = NULL;
		_tmp14_ = SDL_GetError ();
		_tmp15_ = g_error_new_literal (SDX_SDL_EXCEPTION, SDX_SDL_EXCEPTION_TtfInitialization, _tmp14_);
		_inner_error_ = _tmp15_;
		g_critical ("file %s: line %d: uncaught error: %s (%s, %d)", __FILE__, __LINE__, _inner_error_->message, g_quark_to_string (_inner_error_->domain), _inner_error_->code);
		g_clear_error (&_inner_error_);
		return NULL;
	}
	sdx_display = (int) 0;
	_tmp16_ = sdx_display;
	SDL_GetDisplayMode (_tmp16_, 0, &_tmp17_);
	 (&sdx_displayMode);
	sdx_displayMode = _tmp17_;
	_tmp18_ = sdx_displayMode;
	_tmp19_ = _tmp18_.w;
	width = _tmp19_;
	_tmp20_ = sdx_displayMode;
	_tmp21_ = _tmp20_.h;
	height = _tmp21_;
	_tmp22_ = name;
	_tmp23_ = SDL_CreateWindow (_tmp22_, (gint) SDL_WINDOWPOS_CENTERED_MASK, (gint) SDL_WINDOWPOS_CENTERED_MASK, 0, 0, (guint32) SDL_WINDOW_SHOWN);
	window = _tmp23_;
	_tmp24_ = window;
	if (_tmp24_ == NULL) {
		const gchar* _tmp25_ = NULL;
		GError* _tmp26_ = NULL;
		_tmp25_ = SDL_GetError ();
		_tmp26_ = g_error_new_literal (SDX_SDL_EXCEPTION, SDX_SDL_EXCEPTION_OpenWindow, _tmp25_);
		_inner_error_ = _tmp26_;
		_SDL_DestroyWindow0 (window);
		g_critical ("file %s: line %d: uncaught error: %s (%s, %d)", __FILE__, __LINE__, _inner_error_->message, g_quark_to_string (_inner_error_->domain), _inner_error_->code);
		g_clear_error (&_inner_error_);
		return NULL;
	}
	_tmp27_ = window;
	_tmp28_ = SDL_CreateRenderer (_tmp27_, -1, (guint32) (SDL_RENDERER_ACCELERATED | SDL_RENDERER_PRESENTVSYNC));
	_SDL_DestroyRenderer0 (sdx_renderer);
	sdx_renderer = _tmp28_;
	_tmp29_ = sdx_renderer;
	if (_tmp29_ == NULL) {
		const gchar* _tmp30_ = NULL;
		GError* _tmp31_ = NULL;
		_tmp30_ = SDL_GetError ();
		_tmp31_ = g_error_new_literal (SDX_SDL_EXCEPTION, SDX_SDL_EXCEPTION_CreateRenderer, _tmp30_);
		_inner_error_ = _tmp31_;
		_SDL_DestroyWindow0 (window);
		g_critical ("file %s: line %d: uncaught error: %s (%s, %d)", __FILE__, __LINE__, _inner_error_->message, g_quark_to_string (_inner_error_->domain), _inner_error_->code);
		g_clear_error (&_inner_error_);
		return NULL;
	}
	_tmp32_ = SDL_GetPerformanceFrequency ();
	sdx_freq = (gdouble) _tmp32_;
	sdx_fpsColor = SDX_COLOR_AntiqueWhite;
	sdx_bgdColor = SDX_COLOR_Black;
	sdx_fps = (gfloat) 60;
	_tmp33_ = SDL_GetPerformanceCounter ();
	init_genrand ((gulong) _tmp33_);
	result = window;
	return result;
}


gdouble sdx_getRandom (void) {
	gdouble result = 0.0;
	gdouble _tmp0_ = 0.0;
	_tmp0_ = genrand_real2 ();
	result = _tmp0_;
	return result;
}


void sdx_setResourceBase (const gchar* path) {
	const gchar* _tmp0_ = NULL;
	gchar* _tmp1_ = NULL;
	g_return_if_fail (path != NULL);
	_tmp0_ = path;
	_tmp1_ = g_strdup (_tmp0_);
	_g_free0 (sdx_resourceBase);
	sdx_resourceBase = _tmp1_;
}


void sdx_setDefaultFont (const gchar* path, gint size) {
	const gchar* _tmp0_ = NULL;
	gint _tmp1_ = 0;
	sdxFont* _tmp2_ = NULL;
	g_return_if_fail (path != NULL);
	_tmp0_ = path;
	_tmp1_ = size;
	_tmp2_ = sdx_font_new (_tmp0_, _tmp1_);
	_sdx_font_release0 (sdx_font);
	sdx_font = _tmp2_;
}


void sdx_setSmallFont (const gchar* path, gint size) {
	const gchar* _tmp0_ = NULL;
	gint _tmp1_ = 0;
	sdxFont* _tmp2_ = NULL;
	g_return_if_fail (path != NULL);
	_tmp0_ = path;
	_tmp1_ = size;
	_tmp2_ = sdx_font_new (_tmp0_, _tmp1_);
	_sdx_font_release0 (sdx_smallFont);
	sdx_smallFont = _tmp2_;
}


void sdx_setLargeFont (const gchar* path, gint size) {
	const gchar* _tmp0_ = NULL;
	gint _tmp1_ = 0;
	sdxFont* _tmp2_ = NULL;
	g_return_if_fail (path != NULL);
	_tmp0_ = path;
	_tmp1_ = size;
	_tmp2_ = sdx_font_new (_tmp0_, _tmp1_);
	_sdx_font_release0 (sdx_largeFont);
	sdx_largeFont = _tmp2_;
}


void sdx_setShowFps (gboolean value) {
	gboolean _tmp0_ = FALSE;
	gboolean _tmp1_ = FALSE;
	_tmp0_ = value;
	sdx_showFps = _tmp0_;
	_tmp1_ = sdx_showFps;
	if (_tmp1_ == TRUE) {
		sdxgraphicsSpriteAnimatedSprite* _tmp2_ = NULL;
		sdxgraphicsSpriteAnimatedSprite* _tmp3_ = NULL;
		sdxgraphicsSpriteAnimatedSprite* _tmp4_ = NULL;
		sdxgraphicsSpriteAnimatedSprite* _tmp5_ = NULL;
		sdxgraphicsSpriteAnimatedSprite* _tmp6_ = NULL;
		_tmp2_ = sdx_graphics_sprite_animated_sprite_new ("assets/fonts/tom-thumb-white.png", 16, 24);
		_sdx_graphics_sprite_release0 (sdx_fps1);
		sdx_fps1 = _tmp2_;
		_tmp3_ = sdx_graphics_sprite_animated_sprite_new ("assets/fonts/tom-thumb-white.png", 16, 24);
		_sdx_graphics_sprite_release0 (sdx_fps2);
		sdx_fps2 = _tmp3_;
		_tmp4_ = sdx_graphics_sprite_animated_sprite_new ("assets/fonts/tom-thumb-white.png", 16, 24);
		_sdx_graphics_sprite_release0 (sdx_fps3);
		sdx_fps3 = _tmp4_;
		_tmp5_ = sdx_graphics_sprite_animated_sprite_new ("assets/fonts/tom-thumb-white.png", 16, 24);
		_sdx_graphics_sprite_release0 (sdx_fps4);
		sdx_fps4 = _tmp5_;
		_tmp6_ = sdx_graphics_sprite_animated_sprite_new ("assets/fonts/tom-thumb-white.png", 16, 24);
		_sdx_graphics_sprite_release0 (sdx_fps5);
		sdx_fps5 = _tmp6_;
	} else {
		_sdx_graphics_sprite_release0 (sdx_fpsSprite);
		sdx_fpsSprite = NULL;
	}
}


static gchar string_get (const gchar* self, glong index) {
	gchar result = '\0';
	glong _tmp0_ = 0L;
	gchar _tmp1_ = '\0';
	g_return_val_if_fail (self != NULL, '\0');
	_tmp0_ = index;
	_tmp1_ = ((gchar*) self)[_tmp0_];
	result = _tmp1_;
	return result;
}


void sdx_drawFps (void) {
	gboolean _tmp0_ = FALSE;
	_tmp0_ = sdx_showFps;
	if (_tmp0_) {
		gchar* f = NULL;
		gfloat _tmp1_ = 0.0F;
		gchar* _tmp2_ = NULL;
		sdxgraphicsSpriteAnimatedSprite* _tmp3_ = NULL;
		const gchar* _tmp4_ = NULL;
		gchar _tmp5_ = '\0';
		sdxgraphicsSpriteAnimatedSprite* _tmp6_ = NULL;
		sdxgraphicsSpriteAnimatedSprite* _tmp7_ = NULL;
		const gchar* _tmp8_ = NULL;
		gchar _tmp9_ = '\0';
		sdxgraphicsSpriteAnimatedSprite* _tmp10_ = NULL;
		sdxgraphicsSpriteAnimatedSprite* _tmp11_ = NULL;
		const gchar* _tmp12_ = NULL;
		gchar _tmp13_ = '\0';
		sdxgraphicsSpriteAnimatedSprite* _tmp14_ = NULL;
		sdxgraphicsSpriteAnimatedSprite* _tmp15_ = NULL;
		const gchar* _tmp16_ = NULL;
		gchar _tmp17_ = '\0';
		sdxgraphicsSpriteAnimatedSprite* _tmp18_ = NULL;
		sdxgraphicsSpriteAnimatedSprite* _tmp19_ = NULL;
		const gchar* _tmp20_ = NULL;
		gchar _tmp21_ = '\0';
		sdxgraphicsSpriteAnimatedSprite* _tmp22_ = NULL;
		_tmp1_ = sdx_fps;
		_tmp2_ = g_strdup_printf ("%2.2f", (gdouble) _tmp1_);
		f = _tmp2_;
		_tmp3_ = sdx_fps1;
		_tmp4_ = f;
		_tmp5_ = string_get (_tmp4_, (glong) 0);
		sdx_graphics_sprite_animated_sprite_setFrame (_tmp3_, (gint) _tmp5_);
		_tmp6_ = sdx_fps1;
		sdx_graphics_sprite_render ((sdxgraphicsSprite*) _tmp6_, 20, 12, NULL);
		_tmp7_ = sdx_fps2;
		_tmp8_ = f;
		_tmp9_ = string_get (_tmp8_, (glong) 1);
		sdx_graphics_sprite_animated_sprite_setFrame (_tmp7_, (gint) _tmp9_);
		_tmp10_ = sdx_fps2;
		sdx_graphics_sprite_render ((sdxgraphicsSprite*) _tmp10_, 35, 12, NULL);
		_tmp11_ = sdx_fps3;
		_tmp12_ = f;
		_tmp13_ = string_get (_tmp12_, (glong) 2);
		sdx_graphics_sprite_animated_sprite_setFrame (_tmp11_, (gint) _tmp13_);
		_tmp14_ = sdx_fps3;
		sdx_graphics_sprite_render ((sdxgraphicsSprite*) _tmp14_, 50, 12, NULL);
		_tmp15_ = sdx_fps4;
		_tmp16_ = f;
		_tmp17_ = string_get (_tmp16_, (glong) 3);
		sdx_graphics_sprite_animated_sprite_setFrame (_tmp15_, (gint) _tmp17_);
		_tmp18_ = sdx_fps4;
		sdx_graphics_sprite_render ((sdxgraphicsSprite*) _tmp18_, 65, 12, NULL);
		_tmp19_ = sdx_fps5;
		_tmp20_ = f;
		_tmp21_ = string_get (_tmp20_, (glong) 4);
		sdx_graphics_sprite_animated_sprite_setFrame (_tmp19_, (gint) _tmp21_);
		_tmp22_ = sdx_fps5;
		sdx_graphics_sprite_render ((sdxgraphicsSprite*) _tmp22_, 80, 12, NULL);
		_g_free0 (f);
	}
}


gdouble sdx_getNow (void) {
	gdouble result = 0.0;
	guint64 _tmp0_ = 0ULL;
	gdouble _tmp1_ = 0.0;
	_tmp0_ = SDL_GetPerformanceCounter ();
	_tmp1_ = sdx_freq;
	result = ((gdouble) _tmp0_) / _tmp1_;
	return result;
}


void sdx_start (void) {
	gdouble _tmp0_ = 0.0;
	_tmp0_ = sdx_getNow ();
	sdx_currentTime = _tmp0_;
	sdx_running = TRUE;
}


void sdx_gameloop (sdxAbstractGame* game) {
	gdouble newTime = 0.0;
	gdouble _tmp0_ = 0.0;
	gdouble frameTime = 0.0;
	gdouble _tmp1_ = 0.0;
	gdouble _tmp2_ = 0.0;
	gdouble _tmp3_ = 0.0;
	gdouble _tmp4_ = 0.0;
	gdouble _tmp5_ = 0.0;
	gdouble _tmp6_ = 0.0;
	sdxAbstractGame* _tmp11_ = NULL;
	sdxAbstractGameAbstractDraw _tmp12_ = NULL;
	void* _tmp12__target = NULL;
	g_return_if_fail (game != NULL);
	_tmp0_ = sdx_getNow ();
	newTime = _tmp0_;
	_tmp1_ = newTime;
	_tmp2_ = sdx_currentTime;
	frameTime = _tmp1_ - _tmp2_;
	_tmp3_ = frameTime;
	if (_tmp3_ > 0.25) {
		frameTime = 0.25;
	}
	_tmp4_ = newTime;
	sdx_currentTime = _tmp4_;
	_tmp5_ = sdx_accumulator;
	_tmp6_ = frameTime;
	sdx_accumulator = _tmp5_ + _tmp6_;
	sdx_processEvents ();
	while (TRUE) {
		gdouble _tmp7_ = 0.0;
		sdxAbstractGame* _tmp8_ = NULL;
		sdxAbstractGameAbstractUpdate _tmp9_ = NULL;
		void* _tmp9__target = NULL;
		gdouble _tmp10_ = 0.0;
		_tmp7_ = sdx_accumulator;
		if (!(_tmp7_ >= SDX_MS_PER_UPDATE)) {
			break;
		}
		_tmp8_ = game;
		_tmp9_ = _tmp8_->update;
		_tmp9__target = _tmp8_->update_target;
		_tmp9_ (_tmp9__target);
		_tmp10_ = sdx_accumulator;
		sdx_accumulator = _tmp10_ - SDX_MS_PER_UPDATE;
	}
	_tmp11_ = game;
	_tmp12_ = _tmp11_->draw;
	_tmp12__target = _tmp11_->draw_target;
	_tmp12_ (_tmp12__target);
}


void sdx_processEvents (void) {
	while (TRUE) {
		SDL_Event _tmp0_ = {0};
		gint _tmp1_ = 0;
		SDL_Event _tmp2_ = {0};
		SDL_EventType _tmp3_ = 0;
		_tmp1_ = SDL_PollEvent (&_tmp0_);
		 (sdx__evt);
		sdx__evt = _tmp0_;
		if (!(_tmp1_ != 0)) {
			break;
		}
		_tmp2_ = sdx__evt;
		_tmp3_ = _tmp2_.type;
		switch (_tmp3_) {
			case SDL_QUIT:
			{
				sdx_running = FALSE;
				break;
			}
			case SDL_KEYDOWN:
			{
				SDL_Event _tmp4_ = {0};
				SDL_KeyboardEvent _tmp5_ = {0};
				SDL_Keysym _tmp6_ = {0};
				SDL_Scancode _tmp7_ = 0;
				gboolean _tmp16_ = FALSE;
				SDL_Event _tmp17_ = {0};
				SDL_KeyboardEvent _tmp18_ = {0};
				SDL_Keysym _tmp19_ = {0};
				SDL_Keycode _tmp20_ = 0;
				guint8* _tmp25_ = NULL;
				gint _tmp25__length1 = 0;
				SDL_Event _tmp26_ = {0};
				SDL_KeyboardEvent _tmp27_ = {0};
				SDL_Keysym _tmp28_ = {0};
				SDL_Keycode _tmp29_ = 0;
				guint8 _tmp30_ = 0U;
				_tmp4_ = sdx__evt;
				_tmp5_ = _tmp4_.key;
				_tmp6_ = _tmp5_.keysym;
				_tmp7_ = _tmp6_.scancode;
				switch (_tmp7_) {
					case SDL_SCANCODE_LEFT:
					{
						gboolean* _tmp8_ = NULL;
						gint _tmp8__length1 = 0;
						gboolean _tmp9_ = FALSE;
						_tmp8_ = sdx_direction;
						_tmp8__length1 = sdx_direction_length1;
						_tmp8_[SDX_DIRECTION_LEFT] = TRUE;
						_tmp9_ = _tmp8_[SDX_DIRECTION_LEFT];
						break;
					}
					case SDL_SCANCODE_RIGHT:
					{
						gboolean* _tmp10_ = NULL;
						gint _tmp10__length1 = 0;
						gboolean _tmp11_ = FALSE;
						_tmp10_ = sdx_direction;
						_tmp10__length1 = sdx_direction_length1;
						_tmp10_[SDX_DIRECTION_RIGHT] = TRUE;
						_tmp11_ = _tmp10_[SDX_DIRECTION_RIGHT];
						break;
					}
					case SDL_SCANCODE_UP:
					{
						gboolean* _tmp12_ = NULL;
						gint _tmp12__length1 = 0;
						gboolean _tmp13_ = FALSE;
						_tmp12_ = sdx_direction;
						_tmp12__length1 = sdx_direction_length1;
						_tmp12_[SDX_DIRECTION_UP] = TRUE;
						_tmp13_ = _tmp12_[SDX_DIRECTION_UP];
						break;
					}
					case SDL_SCANCODE_DOWN:
					{
						gboolean* _tmp14_ = NULL;
						gint _tmp14__length1 = 0;
						gboolean _tmp15_ = FALSE;
						_tmp14_ = sdx_direction;
						_tmp14__length1 = sdx_direction_length1;
						_tmp14_[SDX_DIRECTION_DOWN] = TRUE;
						_tmp15_ = _tmp14_[SDX_DIRECTION_DOWN];
						break;
					}
					default:
					break;
				}
				_tmp17_ = sdx__evt;
				_tmp18_ = _tmp17_.key;
				_tmp19_ = _tmp18_.keysym;
				_tmp20_ = _tmp19_.sym;
				if (_tmp20_ < 0) {
					_tmp16_ = TRUE;
				} else {
					SDL_Event _tmp21_ = {0};
					SDL_KeyboardEvent _tmp22_ = {0};
					SDL_Keysym _tmp23_ = {0};
					SDL_Keycode _tmp24_ = 0;
					_tmp21_ = sdx__evt;
					_tmp22_ = _tmp21_.key;
					_tmp23_ = _tmp22_.keysym;
					_tmp24_ = _tmp23_.sym;
					_tmp16_ = _tmp24_ > 255;
				}
				if (_tmp16_) {
					break;
				}
				_tmp25_ = sdx_keys;
				_tmp25__length1 = sdx_keys_length1;
				_tmp26_ = sdx__evt;
				_tmp27_ = _tmp26_.key;
				_tmp28_ = _tmp27_.keysym;
				_tmp29_ = _tmp28_.sym;
				_tmp25_[_tmp29_] = (guint8) 1;
				_tmp30_ = _tmp25_[_tmp29_];
				break;
			}
			case SDL_KEYUP:
			{
				SDL_Event _tmp31_ = {0};
				SDL_KeyboardEvent _tmp32_ = {0};
				SDL_Keysym _tmp33_ = {0};
				SDL_Scancode _tmp34_ = 0;
				gboolean _tmp43_ = FALSE;
				SDL_Event _tmp44_ = {0};
				SDL_KeyboardEvent _tmp45_ = {0};
				SDL_Keysym _tmp46_ = {0};
				SDL_Keycode _tmp47_ = 0;
				guint8* _tmp52_ = NULL;
				gint _tmp52__length1 = 0;
				SDL_Event _tmp53_ = {0};
				SDL_KeyboardEvent _tmp54_ = {0};
				SDL_Keysym _tmp55_ = {0};
				SDL_Keycode _tmp56_ = 0;
				guint8 _tmp57_ = 0U;
				_tmp31_ = sdx__evt;
				_tmp32_ = _tmp31_.key;
				_tmp33_ = _tmp32_.keysym;
				_tmp34_ = _tmp33_.scancode;
				switch (_tmp34_) {
					case SDL_SCANCODE_LEFT:
					{
						gboolean* _tmp35_ = NULL;
						gint _tmp35__length1 = 0;
						gboolean _tmp36_ = FALSE;
						_tmp35_ = sdx_direction;
						_tmp35__length1 = sdx_direction_length1;
						_tmp35_[SDX_DIRECTION_LEFT] = FALSE;
						_tmp36_ = _tmp35_[SDX_DIRECTION_LEFT];
						break;
					}
					case SDL_SCANCODE_RIGHT:
					{
						gboolean* _tmp37_ = NULL;
						gint _tmp37__length1 = 0;
						gboolean _tmp38_ = FALSE;
						_tmp37_ = sdx_direction;
						_tmp37__length1 = sdx_direction_length1;
						_tmp37_[SDX_DIRECTION_RIGHT] = FALSE;
						_tmp38_ = _tmp37_[SDX_DIRECTION_RIGHT];
						break;
					}
					case SDL_SCANCODE_UP:
					{
						gboolean* _tmp39_ = NULL;
						gint _tmp39__length1 = 0;
						gboolean _tmp40_ = FALSE;
						_tmp39_ = sdx_direction;
						_tmp39__length1 = sdx_direction_length1;
						_tmp39_[SDX_DIRECTION_UP] = FALSE;
						_tmp40_ = _tmp39_[SDX_DIRECTION_UP];
						break;
					}
					case SDL_SCANCODE_DOWN:
					{
						gboolean* _tmp41_ = NULL;
						gint _tmp41__length1 = 0;
						gboolean _tmp42_ = FALSE;
						_tmp41_ = sdx_direction;
						_tmp41__length1 = sdx_direction_length1;
						_tmp41_[SDX_DIRECTION_DOWN] = FALSE;
						_tmp42_ = _tmp41_[SDX_DIRECTION_DOWN];
						break;
					}
					default:
					break;
				}
				_tmp44_ = sdx__evt;
				_tmp45_ = _tmp44_.key;
				_tmp46_ = _tmp45_.keysym;
				_tmp47_ = _tmp46_.sym;
				if (_tmp47_ < 0) {
					_tmp43_ = TRUE;
				} else {
					SDL_Event _tmp48_ = {0};
					SDL_KeyboardEvent _tmp49_ = {0};
					SDL_Keysym _tmp50_ = {0};
					SDL_Keycode _tmp51_ = 0;
					_tmp48_ = sdx__evt;
					_tmp49_ = _tmp48_.key;
					_tmp50_ = _tmp49_.keysym;
					_tmp51_ = _tmp50_.sym;
					_tmp43_ = _tmp51_ > 255;
				}
				if (_tmp43_) {
					break;
				}
				_tmp52_ = sdx_keys;
				_tmp52__length1 = sdx_keys_length1;
				_tmp53_ = sdx__evt;
				_tmp54_ = _tmp53_.key;
				_tmp55_ = _tmp54_.keysym;
				_tmp56_ = _tmp55_.sym;
				_tmp52_[_tmp56_] = (guint8) 0;
				_tmp57_ = _tmp52_[_tmp56_];
				break;
			}
			case SDL_MOUSEMOTION:
			{
				SDL_Event _tmp58_ = {0};
				SDL_MouseMotionEvent _tmp59_ = {0};
				gint32 _tmp60_ = 0;
				SDL_Event _tmp61_ = {0};
				SDL_MouseMotionEvent _tmp62_ = {0};
				gint32 _tmp63_ = 0;
				_tmp58_ = sdx__evt;
				_tmp59_ = _tmp58_.motion;
				_tmp60_ = _tmp59_.x;
				sdx_mouseX = (gint) _tmp60_;
				_tmp61_ = sdx__evt;
				_tmp62_ = _tmp61_.motion;
				_tmp63_ = _tmp62_.y;
				sdx_mouseY = (gint) _tmp63_;
				break;
			}
			case SDL_MOUSEBUTTONDOWN:
			{
				sdx_mouseDown = TRUE;
				break;
			}
			case SDL_MOUSEBUTTONUP:
			{
				sdx_mouseDown = FALSE;
				break;
			}
			default:
			break;
		}
	}
}


void sdx_begin (void) {
	SDL_Renderer* _tmp0_ = NULL;
	SDL_Color _tmp1_ = {0};
	guint8 _tmp2_ = 0U;
	SDL_Color _tmp3_ = {0};
	guint8 _tmp4_ = 0U;
	SDL_Color _tmp5_ = {0};
	guint8 _tmp6_ = 0U;
	SDL_Color _tmp7_ = {0};
	guint8 _tmp8_ = 0U;
	SDL_Renderer* _tmp9_ = NULL;
	_tmp0_ = sdx_renderer;
	_tmp1_ = sdx_bgdColor;
	_tmp2_ = _tmp1_.r;
	_tmp3_ = sdx_bgdColor;
	_tmp4_ = _tmp3_.g;
	_tmp5_ = sdx_bgdColor;
	_tmp6_ = _tmp5_.b;
	_tmp7_ = sdx_bgdColor;
	_tmp8_ = _tmp7_.a;
	SDL_SetRenderDrawColor (_tmp0_, _tmp2_, _tmp4_, _tmp6_, _tmp8_);
	_tmp9_ = sdx_renderer;
	SDL_RenderClear (_tmp9_);
}


void sdx_end (void) {
	SDL_Renderer* _tmp0_ = NULL;
	_tmp0_ = sdx_renderer;
	SDL_RenderPresent (_tmp0_);
}


void sdx_log (const gchar* text) {
	const gchar* _tmp0_ = NULL;
	g_return_if_fail (text != NULL);
	_tmp0_ = text;
	__android_log_write (ANDROID_LOG_ERROR, "SDX", _tmp0_);
}



