/* sdx.c generated by valac 0.34.8, the Vala compiler
 * generated from sdx.vala, do not modify */


#include <glib.h>
#include <glib-object.h>
#include <SDL2/SDL_rect.h>
#include <SDL2/SDL_render.h>
#include <string.h>
#include <SDL2/SDL_pixels.h>
#include <float.h>
#include <math.h>
#include <SDL2/SDL_events.h>
#include <stdlib.h>
#include <SDL2/SDL_video.h>
#include <SDL2/SDL.h>
#include <SDL2/SDL_image.h>
#include <SDL2/SDL_hints.h>
#include <SDL2/SDL_ttf.h>
#include <android/log.h>
#include <SDL2/SDL_timer.h>
#include <mt19937ar.h>
#include <SDL2/SDL_surface.h>
#include <SDL2/SDL_scancode.h>
#include <SDL2/SDL_keyboard.h>


#define SDX_TYPE_BLIT (sdx_blit_get_type ())
typedef struct _sdxBlit sdxBlit;
typedef struct _sdxFont sdxFont;
typedef struct _sdxgraphicsSprite sdxgraphicsSprite;

#define SDX_TYPE_DIRECTION (sdx_direction_get_type ())
#define _SDL_DestroyWindow0(var) ((var == NULL) ? NULL : (var = (SDL_DestroyWindow (var), NULL)))
#define _SDL_DestroyRenderer0(var) ((var == NULL) ? NULL : (var = (SDL_DestroyRenderer (var), NULL)))
void sdx_font_release (sdxFont* self);
void sdx_font_free (sdxFont* self);
sdxFont* sdx_font_retain (sdxFont* self);
#define _sdx_font_release0(var) ((var == NULL) ? NULL : (var = (sdx_font_release (var), NULL)))
void sdx_graphics_sprite_release (sdxgraphicsSprite* self);
void sdx_graphics_sprite_free (sdxgraphicsSprite* self);
sdxgraphicsSprite* sdx_graphics_sprite_retain (sdxgraphicsSprite* self);
#define _sdx_graphics_sprite_release0(var) ((var == NULL) ? NULL : (var = (sdx_graphics_sprite_release (var), NULL)))
#define _g_free0(var) (var = (g_free (var), NULL))

#define SDX_GRAPHICS_TYPE_SCALE (sdx_graphics_scale_get_type ())
typedef struct _sdxgraphicsScale sdxgraphicsScale;

typedef enum  {
	SDX_SDL_EXCEPTION_Initialization,
	SDX_SDL_EXCEPTION_ImageInitialization,
	SDX_SDL_EXCEPTION_TtfInitialization,
	SDX_SDL_EXCEPTION_TextureFilteringNotEnabled,
	SDX_SDL_EXCEPTION_OpenWindow,
	SDX_SDL_EXCEPTION_CreateRenderer
} sdxSdlException;
#define SDX_SDL_EXCEPTION sdx_sdl_exception_quark ()
struct _sdxBlit {
	SDL_Rect source;
	SDL_Rect dest;
	SDL_RendererFlip flip;
};

typedef sdxBlit* (*sdxCompositor) (gint x, gint y, int* result_length1, void* user_data);
typedef enum  {
	SDX_DIRECTION_NONE,
	SDX_DIRECTION_LEFT,
	SDX_DIRECTION_RIGHT,
	SDX_DIRECTION_UP,
	SDX_DIRECTION_DOWN
} sdxDirection;

struct _sdxgraphicsScale {
	gdouble x;
	gdouble y;
};

struct _sdxgraphicsSprite {
	gint _retainCount;
	SDL_Texture* texture;
	SDL_Surface* surface;
	gint width;
	gint height;
	gint x;
	gint y;
	sdxgraphicsScale scale;
	SDL_Color color;
	gboolean centered;
	gint layer;
	gint id;
	gchar* path;
	gboolean isText;
};


extern SDL_Renderer* sdx_renderer;
SDL_Renderer* sdx_renderer = NULL;
extern sdxFont* sdx_font;
sdxFont* sdx_font = NULL;
extern sdxFont* sdx_smallFont;
sdxFont* sdx_smallFont = NULL;
extern sdxFont* sdx_largeFont;
sdxFont* sdx_largeFont = NULL;
extern sdxgraphicsSprite* sdx_fpsSprite;
sdxgraphicsSprite* sdx_fpsSprite = NULL;
extern SDL_Color sdx_fpsColor;
SDL_Color sdx_fpsColor = {0};
extern SDL_Color sdx_bgdColor;
SDL_Color sdx_bgdColor = {0};
extern gboolean sdx_showFps;
gboolean sdx_showFps = FALSE;
extern gdouble sdx_fps;
gdouble sdx_fps = 0.0;
extern gdouble sdx_delta;
gdouble sdx_delta = 0.0;
extern gdouble sdx_mouseX;
gdouble sdx_mouseX = 0.0;
extern gdouble sdx_mouseY;
gdouble sdx_mouseY = 0.0;
extern gboolean sdx_mouseDown;
gboolean sdx_mouseDown = FALSE;
extern gboolean sdx_running;
gboolean sdx_running = FALSE;
extern guint8* sdx_keys;
extern gint sdx_keys_length1;
guint8* sdx_keys = NULL;
gint sdx_keys_length1 = 0;
static gint _sdx_keys_size_ = 0;
extern gboolean* sdx_dir;
extern gint sdx_dir_length1;
gboolean* sdx_dir = NULL;
gint sdx_dir_length1 = 0;
static gint _sdx_dir_size_ = 0;
extern gint sdx__frames;
gint sdx__frames = 0;
extern SDL_Event sdx__evt;
SDL_Event sdx__evt = {0};
extern gdouble sdx__elapsed;
gdouble sdx__elapsed = 0.0;
extern gdouble sdx__freq;
gdouble sdx__freq = 0.0;
extern gdouble sdx__mark1;
gdouble sdx__mark1 = 0.0;
extern gdouble sdx__mark2;
gdouble sdx__mark2 = 0.0;
extern gint sdx__width;
gint sdx__width = 0;
extern gint sdx__height;
gint sdx__height = 0;

GQuark sdx_sdl_exception_quark (void);
GType sdx_blit_get_type (void) G_GNUC_CONST;
sdxBlit* sdx_blit_dup (const sdxBlit* self);
void sdx_blit_free (sdxBlit* self);
void sdx_font_free (sdxFont* self);
void sdx_graphics_sprite_free (sdxgraphicsSprite* self);
GType sdx_direction_get_type (void) G_GNUC_CONST;
SDL_Window* sdx_initialize (gint width, gint height, const gchar* name);
gdouble sdx_getRandom (void);
void sdx_setDefaultFont (const gchar* path, gint size);
sdxFont* sdx_font_new (const gchar* path, gint size);
void sdx_setSmallFont (const gchar* path, gint size);
void sdx_setLargeFont (const gchar* path, gint size);
void sdx_setShowFps (gboolean value);
sdxgraphicsSprite* sdx_graphics_sprite_fromText (const gchar* path, sdxFont* font, SDL_Color color);
GType sdx_graphics_scale_get_type (void) G_GNUC_CONST;
sdxgraphicsScale* sdx_graphics_scale_dup (const sdxgraphicsScale* self);
void sdx_graphics_scale_free (sdxgraphicsScale* self);
void sdx_drawFps (void);
void sdx_graphics_sprite_setText (sdxgraphicsSprite* self, const gchar* text, sdxFont* font, SDL_Color color);
void sdx_graphics_sprite_render (sdxgraphicsSprite* self, gint x, gint y, SDL_Rect* clip);
gdouble sdx_getNow (void);
void sdx_start (void);
void sdx_update (void);
void sdx_processEvents (void);
void sdx_begin (void);
void sdx_end (void);

extern const SDL_Color SDX_COLOR_AntiqueWhite;

GQuark sdx_sdl_exception_quark (void) {
	return g_quark_from_static_string ("sdx_sdl_exception-quark");
}


sdxBlit* sdx_blit_dup (const sdxBlit* self) {
	sdxBlit* dup;
	dup = g_new0 (sdxBlit, 1);
	memcpy (dup, self, sizeof (sdxBlit));
	return dup;
}


void sdx_blit_free (sdxBlit* self) {
	g_free (self);
}


GType sdx_blit_get_type (void) {
	static volatile gsize sdx_blit_type_id__volatile = 0;
	if (g_once_init_enter (&sdx_blit_type_id__volatile)) {
		GType sdx_blit_type_id;
		sdx_blit_type_id = g_boxed_type_register_static ("sdxBlit", (GBoxedCopyFunc) sdx_blit_dup, (GBoxedFreeFunc) sdx_blit_free);
		g_once_init_leave (&sdx_blit_type_id__volatile, sdx_blit_type_id);
	}
	return sdx_blit_type_id__volatile;
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
	guint8* _tmp0_ = NULL;
	gboolean* _tmp1_ = NULL;
	gint _tmp2_ = 0;
	gint _tmp5_ = 0;
	gboolean _tmp8_ = FALSE;
	gint _tmp11_ = 0;
	int ds = 0;
	int _tmp14_ = 0;
	SDL_DisplayMode mode = {0};
	gint n = 0;
	int _tmp15_ = 0;
	gint _tmp16_ = 0;
	int _tmp17_ = 0;
	SDL_DisplayMode _tmp18_ = {0};
	SDL_DisplayMode _tmp19_ = {0};
	gint _tmp20_ = 0;
	SDL_DisplayMode _tmp21_ = {0};
	gint _tmp22_ = 0;
	SDL_Window* window = NULL;
	const gchar* _tmp23_ = NULL;
	SDL_Window* _tmp24_ = NULL;
	SDL_Window* _tmp25_ = NULL;
	SDL_Window* _tmp28_ = NULL;
	SDL_Renderer* _tmp29_ = NULL;
	SDL_Renderer* _tmp30_ = NULL;
	guint64 _tmp33_ = 0ULL;
	SDL_Color _tmp34_ = {0};
	guint64 _tmp35_ = 0ULL;
	GError * _inner_error_ = NULL;
	g_return_val_if_fail (name != NULL, NULL);
	_tmp0_ = g_new0 (guint8, 256);
	sdx_keys = (g_free (sdx_keys), NULL);
	sdx_keys = _tmp0_;
	sdx_keys_length1 = 256;
	_sdx_keys_size_ = sdx_keys_length1;
	_tmp1_ = g_new0 (gboolean, 5);
	sdx_dir = (g_free (sdx_dir), NULL);
	sdx_dir = _tmp1_;
	sdx_dir_length1 = 5;
	_sdx_dir_size_ = sdx_dir_length1;
	_tmp2_ = SDL_Init ((guint32) ((SDL_INIT_VIDEO | SDL_INIT_TIMER) | SDL_INIT_EVENTS));
	if (_tmp2_ < 0) {
		const gchar* _tmp3_ = NULL;
		GError* _tmp4_ = NULL;
		_tmp3_ = SDL_GetError ();
		_tmp4_ = g_error_new_literal (SDX_SDL_EXCEPTION, SDX_SDL_EXCEPTION_Initialization, _tmp3_);
		_inner_error_ = _tmp4_;
		g_critical ("file %s: line %d: uncaught error: %s (%s, %d)", __FILE__, __LINE__, _inner_error_->message, g_quark_to_string (_inner_error_->domain), _inner_error_->code);
		g_clear_error (&_inner_error_);
		return NULL;
	}
	_tmp5_ = IMG_Init ((gint) IMG_INIT_PNG);
	if (_tmp5_ < 0) {
		const gchar* _tmp6_ = NULL;
		GError* _tmp7_ = NULL;
		_tmp6_ = SDL_GetError ();
		_tmp7_ = g_error_new_literal (SDX_SDL_EXCEPTION, SDX_SDL_EXCEPTION_ImageInitialization, _tmp6_);
		_inner_error_ = _tmp7_;
		g_critical ("file %s: line %d: uncaught error: %s (%s, %d)", __FILE__, __LINE__, _inner_error_->message, g_quark_to_string (_inner_error_->domain), _inner_error_->code);
		g_clear_error (&_inner_error_);
		return NULL;
	}
	_tmp8_ = SDL_SetHint (SDL_HINT_RENDER_SCALE_QUALITY, "1");
	if (!_tmp8_) {
		const gchar* _tmp9_ = NULL;
		GError* _tmp10_ = NULL;
		_tmp9_ = SDL_GetError ();
		_tmp10_ = g_error_new_literal (SDX_SDL_EXCEPTION, SDX_SDL_EXCEPTION_TextureFilteringNotEnabled, _tmp9_);
		_inner_error_ = _tmp10_;
		g_critical ("file %s: line %d: uncaught error: %s (%s, %d)", __FILE__, __LINE__, _inner_error_->message, g_quark_to_string (_inner_error_->domain), _inner_error_->code);
		g_clear_error (&_inner_error_);
		return NULL;
	}
	_tmp11_ = TTF_Init ();
	if (_tmp11_ == -1) {
		const gchar* _tmp12_ = NULL;
		GError* _tmp13_ = NULL;
		_tmp12_ = SDL_GetError ();
		_tmp13_ = g_error_new_literal (SDX_SDL_EXCEPTION, SDX_SDL_EXCEPTION_TtfInitialization, _tmp12_);
		_inner_error_ = _tmp13_;
		g_critical ("file %s: line %d: uncaught error: %s (%s, %d)", __FILE__, __LINE__, _inner_error_->message, g_quark_to_string (_inner_error_->domain), _inner_error_->code);
		g_clear_error (&_inner_error_);
		return NULL;
	}
	ds = _tmp14_;
	_tmp15_ = ds;
	_tmp16_ = SDL_GetNumDisplayModes (_tmp15_);
	n = _tmp16_;
	_tmp17_ = ds;
	SDL_GetDisplayMode (_tmp17_, 0, &_tmp18_);
	 (&mode);
	mode = _tmp18_;
	_tmp19_ = mode;
	_tmp20_ = _tmp19_.w;
	sdx__width = _tmp20_;
	_tmp21_ = mode;
	_tmp22_ = _tmp21_.h;
	sdx__height = _tmp22_;
	__android_log_write (ANDROID_LOG_ERROR, "DISPLAY", "=========================");
	_tmp23_ = name;
	_tmp24_ = SDL_CreateWindow (_tmp23_, (gint) SDL_WINDOWPOS_CENTERED_MASK, (gint) SDL_WINDOWPOS_CENTERED_MASK, 0, 0, (guint32) SDL_WINDOW_SHOWN);
	window = _tmp24_;
	_tmp25_ = window;
	if (_tmp25_ == NULL) {
		const gchar* _tmp26_ = NULL;
		GError* _tmp27_ = NULL;
		_tmp26_ = SDL_GetError ();
		_tmp27_ = g_error_new_literal (SDX_SDL_EXCEPTION, SDX_SDL_EXCEPTION_OpenWindow, _tmp26_);
		_inner_error_ = _tmp27_;
		_SDL_DestroyWindow0 (window);
		 (&mode);
		g_critical ("file %s: line %d: uncaught error: %s (%s, %d)", __FILE__, __LINE__, _inner_error_->message, g_quark_to_string (_inner_error_->domain), _inner_error_->code);
		g_clear_error (&_inner_error_);
		return NULL;
	}
	_tmp28_ = window;
	_tmp29_ = SDL_CreateRenderer (_tmp28_, -1, (guint32) (SDL_RENDERER_ACCELERATED | SDL_RENDERER_PRESENTVSYNC));
	_SDL_DestroyRenderer0 (sdx_renderer);
	sdx_renderer = _tmp29_;
	_tmp30_ = sdx_renderer;
	if (_tmp30_ == NULL) {
		const gchar* _tmp31_ = NULL;
		GError* _tmp32_ = NULL;
		_tmp31_ = SDL_GetError ();
		_tmp32_ = g_error_new_literal (SDX_SDL_EXCEPTION, SDX_SDL_EXCEPTION_CreateRenderer, _tmp31_);
		_inner_error_ = _tmp32_;
		_SDL_DestroyWindow0 (window);
		 (&mode);
		g_critical ("file %s: line %d: uncaught error: %s (%s, %d)", __FILE__, __LINE__, _inner_error_->message, g_quark_to_string (_inner_error_->domain), _inner_error_->code);
		g_clear_error (&_inner_error_);
		return NULL;
	}
	_tmp33_ = SDL_GetPerformanceFrequency ();
	sdx__freq = (gdouble) _tmp33_;
	sdx_fpsColor = SDX_COLOR_AntiqueWhite;
	_tmp34_.r = (guint8) 0;
	_tmp34_.g = (guint8) 0;
	_tmp34_.b = (guint8) 0;
	_tmp34_.a = (guint8) 0;
	sdx_bgdColor = _tmp34_;
	_tmp35_ = SDL_GetPerformanceCounter ();
	init_genrand ((gulong) _tmp35_);
	result = window;
	 (&mode);
	return result;
}


gdouble sdx_getRandom (void) {
	gdouble result = 0.0;
	gdouble _tmp0_ = 0.0;
	_tmp0_ = genrand_real2 ();
	result = _tmp0_;
	return result;
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
		gchar* _tmp2_ = NULL;
		gchar* _tmp3_ = NULL;
		sdxFont* _tmp4_ = NULL;
		SDL_Color _tmp5_ = {0};
		sdxgraphicsSprite* _tmp6_ = NULL;
		sdxgraphicsSprite* _tmp7_ = NULL;
		_tmp2_ = g_strdup_printf ("%2.2f", (gdouble) 60);
		_tmp3_ = _tmp2_;
		_tmp4_ = sdx_font;
		_tmp5_ = sdx_fpsColor;
		_tmp6_ = sdx_graphics_sprite_fromText (_tmp3_, _tmp4_, _tmp5_);
		_sdx_graphics_sprite_release0 (sdx_fpsSprite);
		sdx_fpsSprite = _tmp6_;
		_g_free0 (_tmp3_);
		_tmp7_ = sdx_fpsSprite;
		_tmp7_->centered = FALSE;
	} else {
		_sdx_graphics_sprite_release0 (sdx_fpsSprite);
		sdx_fpsSprite = NULL;
	}
}


void sdx_drawFps (void) {
	gboolean _tmp0_ = FALSE;
	_tmp0_ = sdx_showFps;
	if (_tmp0_) {
		sdxgraphicsSprite* _tmp1_ = NULL;
		gdouble _tmp2_ = 0.0;
		gchar* _tmp3_ = NULL;
		gchar* _tmp4_ = NULL;
		sdxFont* _tmp5_ = NULL;
		SDL_Color _tmp6_ = {0};
		sdxgraphicsSprite* _tmp7_ = NULL;
		_tmp1_ = sdx_fpsSprite;
		_tmp2_ = sdx_fps;
		_tmp3_ = g_strdup_printf ("%2.2f", _tmp2_);
		_tmp4_ = _tmp3_;
		_tmp5_ = sdx_font;
		_tmp6_ = sdx_fpsColor;
		sdx_graphics_sprite_setText (_tmp1_, _tmp4_, _tmp5_, _tmp6_);
		_g_free0 (_tmp4_);
		_tmp7_ = sdx_fpsSprite;
		sdx_graphics_sprite_render (_tmp7_, 0, 0, NULL);
	}
}


gdouble sdx_getNow (void) {
	gdouble result = 0.0;
	guint64 _tmp0_ = 0ULL;
	gdouble _tmp1_ = 0.0;
	_tmp0_ = SDL_GetPerformanceCounter ();
	_tmp1_ = sdx__freq;
	result = ((gdouble) _tmp0_) / _tmp1_;
	return result;
}


void sdx_start (void) {
	guint64 _tmp0_ = 0ULL;
	gdouble _tmp1_ = 0.0;
	sdx_running = TRUE;
	_tmp0_ = SDL_GetPerformanceCounter ();
	_tmp1_ = sdx__freq;
	sdx__mark1 = ((gdouble) _tmp0_) / _tmp1_;
}


void sdx_update (void) {
	guint64 _tmp0_ = 0ULL;
	gdouble _tmp1_ = 0.0;
	gdouble _tmp2_ = 0.0;
	gdouble _tmp3_ = 0.0;
	gdouble _tmp4_ = 0.0;
	gint _tmp5_ = 0;
	gdouble _tmp6_ = 0.0;
	gdouble _tmp7_ = 0.0;
	gdouble _tmp8_ = 0.0;
	_tmp0_ = SDL_GetPerformanceCounter ();
	_tmp1_ = sdx__freq;
	sdx__mark2 = ((gdouble) _tmp0_) / _tmp1_;
	_tmp2_ = sdx__mark2;
	_tmp3_ = sdx__mark1;
	sdx_delta = _tmp2_ - _tmp3_;
	_tmp4_ = sdx__mark2;
	sdx__mark1 = _tmp4_;
	_tmp5_ = sdx__frames;
	sdx__frames = _tmp5_ + 1;
	_tmp6_ = sdx__elapsed;
	_tmp7_ = sdx_delta;
	sdx__elapsed = _tmp6_ + _tmp7_;
	_tmp8_ = sdx__elapsed;
	if (_tmp8_ > 1.0) {
		gint _tmp9_ = 0;
		gdouble _tmp10_ = 0.0;
		_tmp9_ = sdx__frames;
		_tmp10_ = sdx__elapsed;
		sdx_fps = (gdouble) ((gint) (((gdouble) _tmp9_) / _tmp10_));
		sdx__elapsed = 0.0;
		sdx__frames = 0;
	}
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
						_tmp8_ = sdx_dir;
						_tmp8__length1 = sdx_dir_length1;
						_tmp8_[SDX_DIRECTION_LEFT] = TRUE;
						_tmp9_ = _tmp8_[SDX_DIRECTION_LEFT];
						break;
					}
					case SDL_SCANCODE_RIGHT:
					{
						gboolean* _tmp10_ = NULL;
						gint _tmp10__length1 = 0;
						gboolean _tmp11_ = FALSE;
						_tmp10_ = sdx_dir;
						_tmp10__length1 = sdx_dir_length1;
						_tmp10_[SDX_DIRECTION_RIGHT] = TRUE;
						_tmp11_ = _tmp10_[SDX_DIRECTION_RIGHT];
						break;
					}
					case SDL_SCANCODE_UP:
					{
						gboolean* _tmp12_ = NULL;
						gint _tmp12__length1 = 0;
						gboolean _tmp13_ = FALSE;
						_tmp12_ = sdx_dir;
						_tmp12__length1 = sdx_dir_length1;
						_tmp12_[SDX_DIRECTION_UP] = TRUE;
						_tmp13_ = _tmp12_[SDX_DIRECTION_UP];
						break;
					}
					case SDL_SCANCODE_DOWN:
					{
						gboolean* _tmp14_ = NULL;
						gint _tmp14__length1 = 0;
						gboolean _tmp15_ = FALSE;
						_tmp14_ = sdx_dir;
						_tmp14__length1 = sdx_dir_length1;
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
						_tmp35_ = sdx_dir;
						_tmp35__length1 = sdx_dir_length1;
						_tmp35_[SDX_DIRECTION_LEFT] = FALSE;
						_tmp36_ = _tmp35_[SDX_DIRECTION_LEFT];
						break;
					}
					case SDL_SCANCODE_RIGHT:
					{
						gboolean* _tmp37_ = NULL;
						gint _tmp37__length1 = 0;
						gboolean _tmp38_ = FALSE;
						_tmp37_ = sdx_dir;
						_tmp37__length1 = sdx_dir_length1;
						_tmp37_[SDX_DIRECTION_RIGHT] = FALSE;
						_tmp38_ = _tmp37_[SDX_DIRECTION_RIGHT];
						break;
					}
					case SDL_SCANCODE_UP:
					{
						gboolean* _tmp39_ = NULL;
						gint _tmp39__length1 = 0;
						gboolean _tmp40_ = FALSE;
						_tmp39_ = sdx_dir;
						_tmp39__length1 = sdx_dir_length1;
						_tmp39_[SDX_DIRECTION_UP] = FALSE;
						_tmp40_ = _tmp39_[SDX_DIRECTION_UP];
						break;
					}
					case SDL_SCANCODE_DOWN:
					{
						gboolean* _tmp41_ = NULL;
						gint _tmp41__length1 = 0;
						gboolean _tmp42_ = FALSE;
						_tmp41_ = sdx_dir;
						_tmp41__length1 = sdx_dir_length1;
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
				sdx_mouseX = (gdouble) _tmp60_;
				_tmp61_ = sdx__evt;
				_tmp62_ = _tmp61_.motion;
				_tmp63_ = _tmp62_.y;
				sdx_mouseY = (gdouble) _tmp63_;
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



