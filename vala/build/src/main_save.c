/* main_save.c generated by valac 0.34.8, the Vala compiler
 * generated from main_save.vala, do not modify */


#include <glib.h>
#include <glib-object.h>
#include <float.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <SDL2/SDL_video.h>

typedef struct _TestClass TestClass;
#define _g_free0(var) (var = (g_free (var), NULL))
typedef struct _Game Game;
void game_release (Game* self);
void game_free (Game* self);
Game* game_retain (Game* self);
#define _game_release0(var) ((var == NULL) ? NULL : (var = (game_release (var), NULL)))
#define _SDL_DestroyWindow0(var) ((var == NULL) ? NULL : (var = (SDL_DestroyWindow (var), NULL)))

struct _TestClass {
	gchar* name;
};


extern gint k;
gint k = 0;
extern gdouble t;
gdouble t = 0.0;
extern gdouble t1;
gdouble t1 = 0.0;
extern gdouble t2;
gdouble t2 = 0.0;
extern gdouble t3;
gdouble t3 = 0.0;
extern gboolean sdx_running;

void testclass_free (TestClass* self);
static void testclass_instance_init (TestClass * self);
TestClass* testclass_new (void);
void game_free (Game* self);
void gameloop (Game* game);
gdouble sdx_getNow (void);
void game_update (Game* self);
void game_draw (Game* self);
gint _vala_main (const gchar* args, int args_length1);
SDL_Window* sdx_initialize (gint width, gint height, const gchar* name);
Game* game_new (gint width, gint height);
void game_initialize (Game* self);
void game_start (Game* self);


TestClass* testclass_new (void) {
	TestClass* self;
	gchar* _tmp0_ = NULL;
	self = g_slice_new0 (TestClass);
	testclass_instance_init (self);
	g_print ("this is a test class\n");
	_tmp0_ = g_strdup ("frodo");
	_g_free0 (self->name);
	self->name = _tmp0_;
	return self;
}


static void testclass_instance_init (TestClass * self) {
}


void testclass_free (TestClass* self) {
	_g_free0 (self->name);
	g_slice_free (TestClass, self);
}


/**
 * gameloop
 * 
 * process each frame
 * 
 * @param game Game object
 * 
 */
void gameloop (Game* game) {
	gdouble _tmp0_ = 0.0;
	Game* _tmp1_ = NULL;
	gdouble _tmp2_ = 0.0;
	gdouble _tmp3_ = 0.0;
	gdouble _tmp4_ = 0.0;
	gdouble _tmp5_ = 0.0;
	gdouble _tmp6_ = 0.0;
	gint _tmp7_ = 0;
	gint _tmp8_ = 0;
	Game* _tmp12_ = NULL;
	g_return_if_fail (game != NULL);
	_tmp0_ = sdx_getNow ();
	t1 = _tmp0_;
	_tmp1_ = game;
	game_update (_tmp1_);
	_tmp2_ = sdx_getNow ();
	t2 = _tmp2_;
	_tmp3_ = t2;
	_tmp4_ = t1;
	t3 = _tmp3_ - _tmp4_;
	_tmp5_ = t;
	_tmp6_ = t3;
	t = _tmp5_ + _tmp6_;
	_tmp7_ = k;
	k = _tmp7_ + 1;
	_tmp8_ = k;
	if (_tmp8_ == 1000) {
		gdouble _tmp9_ = 0.0;
		FILE* _tmp10_ = NULL;
		gdouble _tmp11_ = 0.0;
		k = 0;
		_tmp9_ = t;
		t = _tmp9_ / 1000.0;
		_tmp10_ = stdout;
		_tmp11_ = t;
		fprintf (_tmp10_, "%f\n", _tmp11_);
		t = (gdouble) 0;
	}
	_tmp12_ = game;
	game_draw (_tmp12_);
}


/**
 * Start the game
 *
 */
gint _vala_main (const gchar* args, int args_length1) {
	gint result = 0;
	SDL_Window* window = NULL;
	SDL_Window* _tmp0_ = NULL;
	Game* game = NULL;
	Game* _tmp1_ = NULL;
	Game* _tmp2_ = NULL;
	Game* _tmp3_ = NULL;
	_tmp0_ = sdx_initialize (720, 512, "Shmupwarz");
	window = _tmp0_;
	_tmp1_ = game_new (720, 512);
	game = _tmp1_;
	_tmp2_ = game;
	game_initialize (_tmp2_);
	_tmp3_ = game;
	game_start (_tmp3_);
	while (TRUE) {
		gboolean _tmp4_ = FALSE;
		Game* _tmp5_ = NULL;
		_tmp4_ = sdx_running;
		if (!_tmp4_) {
			break;
		}
		_tmp5_ = game;
		gameloop (_tmp5_);
	}
	result = 0;
	_game_release0 (game);
	_SDL_DestroyWindow0 (window);
	return result;
}


int main (int argc, char ** argv) {
#if !GLIB_CHECK_VERSION (2,35,0)
	g_type_init ();
#endif
	return _vala_main (argv, argc);
}


