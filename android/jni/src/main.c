/** updated by emvalac */
/* main.c generated by valac 0.34.8, the Vala compiler
 * generated from main.vala, do not modify */


#include <glib.h>
#include <glib-object.h>
#include <stdlib.h>
#include <string.h>
#include <SDL2/SDL.h>
#include <SDL2/SDL_video.h>

typedef struct _sdxAbstractGame sdxAbstractGame;
typedef sdxAbstractGame Game;
void sdx_abstract_game_release (sdxAbstractGame* self);
void sdx_abstract_game_free (sdxAbstractGame* self);
sdxAbstractGame* sdx_abstract_game_retain (sdxAbstractGame* self);
#define _sdx_abstract_game_release0(var) ((var == NULL) ? NULL : (var = (sdx_abstract_game_release (var), NULL)))
#define _SDL_DestroyWindow0(var) ((var == NULL) ? NULL : (var = (SDL_DestroyWindow (var), NULL)))


extern gboolean sdx_running;

gint _vala_main (const gchar* args, int args_length1);
SDL_Window* sdx_initialize (gint width, gint height, const gchar* name);
void sdx_abstract_game_free (sdxAbstractGame* self);
Game* game_new (gint w, gint h);
void sdx_abstract_game_start (sdxAbstractGame* self);
void sdx_gameloop (sdxAbstractGame* game);


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
	_tmp0_ = sdx_initialize (1184, 768, "Shmupwarz");
	window = _tmp0_;
	_tmp1_ = game_new (1184, 768);
	game = _tmp1_;
	_tmp2_ = game;
	sdx_abstract_game_start ((sdxAbstractGame*) _tmp2_);
	while (TRUE) {
		gboolean _tmp3_ = FALSE;
		Game* _tmp4_ = NULL;
		_tmp3_ = sdx_running;
		if (!_tmp3_) {
			break;
		}
		_tmp4_ = game;
		sdx_gameloop ((sdxAbstractGame*) _tmp4_);
	}
	result = 0;
	_sdx_abstract_game_release0 (game);
	_SDL_DestroyWindow0 (window);
	return result;
}


int main (int argc, char ** argv) {
#if !GLIB_CHECK_VERSION (2,35,0)
	g_type_init ();
#endif
	return _vala_main (argv, argc);
}



