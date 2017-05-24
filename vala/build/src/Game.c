/* Game.c generated by valac 0.34.8, the Vala compiler
 * generated from Game.vala, do not modify */


#include <glib.h>
#include <glib-object.h>
#include <stdlib.h>
#include <string.h>
#include <SDL2/SDL_rect.h>
#include <float.h>
#include <math.h>

typedef struct _Game Game;
typedef struct _entitasWorld entitasWorld;
typedef entitasWorld Factory;
typedef struct _systemsCollisionSystem systemsCollisionSystem;
typedef struct _systemsExpireSystem systemsExpireSystem;
typedef struct _systemsInputSystem systemsInputSystem;
typedef struct _systemsPhysicsSystem systemsPhysicsSystem;
typedef struct _systemsRemoveSystem systemsRemoveSystem;
typedef struct _systemsSpawnSystem systemsSpawnSystem;
typedef struct _systemsAnimationSystem systemsAnimationSystem;
typedef struct _systemsDisplaySystem systemsDisplaySystem;
typedef struct _systemsScoreSystem systemsScoreSystem;
void entitas_world_release (entitasWorld* self);
void entitas_world_free (entitasWorld* self);
entitasWorld* entitas_world_retain (entitasWorld* self);
#define _entitas_world_release0(var) ((var == NULL) ? NULL : (var = (entitas_world_release (var), NULL)))
void systems_collision_system_release (systemsCollisionSystem* self);
void systems_collision_system_free (systemsCollisionSystem* self);
systemsCollisionSystem* systems_collision_system_retain (systemsCollisionSystem* self);
#define _systems_collision_system_release0(var) ((var == NULL) ? NULL : (var = (systems_collision_system_release (var), NULL)))
void systems_expire_system_release (systemsExpireSystem* self);
void systems_expire_system_free (systemsExpireSystem* self);
systemsExpireSystem* systems_expire_system_retain (systemsExpireSystem* self);
#define _systems_expire_system_release0(var) ((var == NULL) ? NULL : (var = (systems_expire_system_release (var), NULL)))
void systems_input_system_release (systemsInputSystem* self);
void systems_input_system_free (systemsInputSystem* self);
systemsInputSystem* systems_input_system_retain (systemsInputSystem* self);
#define _systems_input_system_release0(var) ((var == NULL) ? NULL : (var = (systems_input_system_release (var), NULL)))
void systems_physics_system_release (systemsPhysicsSystem* self);
void systems_physics_system_free (systemsPhysicsSystem* self);
systemsPhysicsSystem* systems_physics_system_retain (systemsPhysicsSystem* self);
#define _systems_physics_system_release0(var) ((var == NULL) ? NULL : (var = (systems_physics_system_release (var), NULL)))
void systems_remove_system_release (systemsRemoveSystem* self);
void systems_remove_system_free (systemsRemoveSystem* self);
systemsRemoveSystem* systems_remove_system_retain (systemsRemoveSystem* self);
#define _systems_remove_system_release0(var) ((var == NULL) ? NULL : (var = (systems_remove_system_release (var), NULL)))
void systems_spawn_system_release (systemsSpawnSystem* self);
void systems_spawn_system_free (systemsSpawnSystem* self);
systemsSpawnSystem* systems_spawn_system_retain (systemsSpawnSystem* self);
#define _systems_spawn_system_release0(var) ((var == NULL) ? NULL : (var = (systems_spawn_system_release (var), NULL)))
void systems_animation_system_release (systemsAnimationSystem* self);
void systems_animation_system_free (systemsAnimationSystem* self);
systemsAnimationSystem* systems_animation_system_retain (systemsAnimationSystem* self);
#define _systems_animation_system_release0(var) ((var == NULL) ? NULL : (var = (systems_animation_system_release (var), NULL)))
void systems_display_system_release (systemsDisplaySystem* self);
void systems_display_system_free (systemsDisplaySystem* self);
systemsDisplaySystem* systems_display_system_retain (systemsDisplaySystem* self);
#define _systems_display_system_release0(var) ((var == NULL) ? NULL : (var = (systems_display_system_release (var), NULL)))
void systems_score_system_release (systemsScoreSystem* self);
void systems_score_system_free (systemsScoreSystem* self);
systemsScoreSystem* systems_score_system_retain (systemsScoreSystem* self);
#define _systems_score_system_release0(var) ((var == NULL) ? NULL : (var = (systems_score_system_release (var), NULL)))
void game_release (Game* self);
void game_free (Game* self);
Game* game_retain (Game* self);
#define _game_release0(var) ((var == NULL) ? NULL : (var = (game_release (var), NULL)))

#define ENTITAS_TYPE_ENTITY (entitas_entity_get_type ())

#define ENTITAS_TYPE_BACKGROUND (entitas_background_get_type ())
typedef struct _entitasBackground entitasBackground;

#define ENTITAS_TYPE_BULLET (entitas_bullet_get_type ())
typedef struct _entitasBullet entitasBullet;

#define ENTITAS_TYPE_ENEMY1 (entitas_enemy1_get_type ())
typedef struct _entitasEnemy1 entitasEnemy1;

#define ENTITAS_TYPE_ENEMY2 (entitas_enemy2_get_type ())
typedef struct _entitasEnemy2 entitasEnemy2;

#define ENTITAS_TYPE_ENEMY3 (entitas_enemy3_get_type ())
typedef struct _entitasEnemy3 entitasEnemy3;

#define ENTITAS_TYPE_EXPIRES (entitas_expires_get_type ())
typedef struct _entitasExpires entitasExpires;

#define ENTITAS_TYPE_HEALTH (entitas_health_get_type ())
typedef struct _entitasHealth entitasHealth;

#define ENTITAS_TYPE_HUD (entitas_hud_get_type ())
typedef struct _entitasHud entitasHud;

#define ENTITAS_TYPE_INDEX (entitas_index_get_type ())
typedef struct _entitasIndex entitasIndex;

#define ENTITAS_TYPE_LAYER (entitas_layer_get_type ())
typedef struct _entitasLayer entitasLayer;

#define ENTITAS_TYPE_POSITION (entitas_position_get_type ())
typedef struct _entitasPosition entitasPosition;

#define ENTITAS_TYPE_SCALE (entitas_scale_get_type ())
typedef struct _entitasScale entitasScale;

#define ENTITAS_TYPE_SPRITE (entitas_sprite_get_type ())
typedef struct _sdxgraphicsSprite sdxgraphicsSprite;
typedef struct _entitasSprite entitasSprite;

#define ENTITAS_TYPE_TEXT (entitas_text_get_type ())
typedef struct _entitasText entitasText;

#define ENTITAS_TYPE_TINT (entitas_tint_get_type ())
typedef struct _entitasTint entitasTint;

#define ENTITAS_TYPE_TWEEN (entitas_tween_get_type ())
typedef struct _entitasTween entitasTween;

#define ENTITAS_TYPE_VELOCITY (entitas_velocity_get_type ())
typedef struct _entitasVelocity entitasVelocity;
typedef struct _entitasEntity entitasEntity;

#define ENTITAS_TYPE_ISYSTEM (entitas_isystem_get_type ())
typedef struct _entitasISystem entitasISystem;

struct _Game {
	gint _retainCount;
	gint width;
	gint height;
	Factory* world;
	systemsCollisionSystem* collision;
	systemsExpireSystem* expire;
	systemsInputSystem* input;
	systemsPhysicsSystem* physics;
	systemsRemoveSystem* remove;
	systemsSpawnSystem* spawn;
	systemsAnimationSystem* animate;
	systemsDisplaySystem* display;
	systemsScoreSystem* score;
};

struct _entitasBackground {
	gboolean active;
};

struct _entitasBullet {
	gboolean active;
};

struct _entitasEnemy1 {
	gboolean active;
};

struct _entitasEnemy2 {
	gboolean active;
};

struct _entitasEnemy3 {
	gboolean active;
};

struct _entitasExpires {
	gdouble value;
};

struct _entitasHealth {
	gdouble current;
	gdouble maximum;
};

struct _entitasHud {
	gboolean active;
};

struct _entitasIndex {
	gint value;
	gint limit;
	gboolean vertical;
};

struct _entitasLayer {
	gint value;
};

struct _entitasPosition {
	gdouble x;
	gdouble y;
};

struct _entitasScale {
	gdouble x;
	gdouble y;
};

struct _entitasSprite {
	sdxgraphicsSprite* sprite;
	gint width;
	gint height;
};

struct _entitasText {
	gchar* text;
	sdxgraphicsSprite* sprite;
};

struct _entitasTint {
	gint r;
	gint g;
	gint b;
	gint a;
};

struct _entitasTween {
	gdouble min;
	gdouble max;
	gdouble speed;
	gboolean repeat;
	gboolean active;
};

struct _entitasVelocity {
	gdouble x;
	gdouble y;
};

struct _entitasEntity {
	gint id;
	gchar* name;
	gint pool;
	guint64 mask;
	entitasBackground* background;
	SDL_Rect* bounds;
	entitasBullet* bullet;
	entitasEnemy1* enemy1;
	entitasEnemy2* enemy2;
	entitasEnemy3* enemy3;
	entitasExpires* expires;
	entitasHealth* health;
	entitasHud* hud;
	entitasIndex* index;
	entitasLayer* layer;
	entitasPosition* position;
	entitasScale* scale;
	entitasSprite* sprite;
	entitasText* text;
	entitasTint* tint;
	entitasTween* tween;
	entitasVelocity* velocity;
};

typedef entitasEntity* (*entitasEntityRemovedListener) (entitasEntity* e, void* user_data);
typedef void (*entitasSystemInitialize) (void* user_data);
typedef void (*entitasSystemExecute) (gdouble delta, void* user_data);
struct _entitasISystem {
	entitasSystemInitialize initialize;
	gpointer initialize_target;
	entitasSystemExecute execute;
	gpointer execute_target;
};

struct _systemsDisplaySystem {
	gint _retainCount;
	Game* game;
	Factory* world;
	GList* sprites;
};


extern Game* game_instance;
Game* game_instance = NULL;
extern gdouble sdx_delta;

void game_free (Game* self);
void entitas_world_free (entitasWorld* self);
void systems_collision_system_free (systemsCollisionSystem* self);
void systems_expire_system_free (systemsExpireSystem* self);
void systems_input_system_free (systemsInputSystem* self);
void systems_physics_system_free (systemsPhysicsSystem* self);
void systems_remove_system_free (systemsRemoveSystem* self);
void systems_spawn_system_free (systemsSpawnSystem* self);
void systems_animation_system_free (systemsAnimationSystem* self);
void systems_display_system_free (systemsDisplaySystem* self);
void systems_score_system_free (systemsScoreSystem* self);
static void game_instance_init (Game * self);
Game* game_retain (Game* self);
void game_release (Game* self);
void game_free (Game* self);
Game* game_new (gint width, gint height);
void game_initialize (Game* self);
void sdx_setSmallFont (const gchar* path, gint size);
void sdx_setDefaultFont (const gchar* path, gint size);
void sdx_setShowFps (gboolean value);
Factory* factory_new (void);
GType entitas_entity_get_type (void) G_GNUC_CONST;
GType entitas_background_get_type (void) G_GNUC_CONST;
entitasBackground* entitas_background_dup (const entitasBackground* self);
void entitas_background_free (entitasBackground* self);
GType entitas_bullet_get_type (void) G_GNUC_CONST;
entitasBullet* entitas_bullet_dup (const entitasBullet* self);
void entitas_bullet_free (entitasBullet* self);
GType entitas_enemy1_get_type (void) G_GNUC_CONST;
entitasEnemy1* entitas_enemy1_dup (const entitasEnemy1* self);
void entitas_enemy1_free (entitasEnemy1* self);
GType entitas_enemy2_get_type (void) G_GNUC_CONST;
entitasEnemy2* entitas_enemy2_dup (const entitasEnemy2* self);
void entitas_enemy2_free (entitasEnemy2* self);
GType entitas_enemy3_get_type (void) G_GNUC_CONST;
entitasEnemy3* entitas_enemy3_dup (const entitasEnemy3* self);
void entitas_enemy3_free (entitasEnemy3* self);
GType entitas_expires_get_type (void) G_GNUC_CONST;
entitasExpires* entitas_expires_dup (const entitasExpires* self);
void entitas_expires_free (entitasExpires* self);
GType entitas_health_get_type (void) G_GNUC_CONST;
entitasHealth* entitas_health_dup (const entitasHealth* self);
void entitas_health_free (entitasHealth* self);
GType entitas_hud_get_type (void) G_GNUC_CONST;
entitasHud* entitas_hud_dup (const entitasHud* self);
void entitas_hud_free (entitasHud* self);
GType entitas_index_get_type (void) G_GNUC_CONST;
entitasIndex* entitas_index_dup (const entitasIndex* self);
void entitas_index_free (entitasIndex* self);
GType entitas_layer_get_type (void) G_GNUC_CONST;
entitasLayer* entitas_layer_dup (const entitasLayer* self);
void entitas_layer_free (entitasLayer* self);
GType entitas_position_get_type (void) G_GNUC_CONST;
entitasPosition* entitas_position_dup (const entitasPosition* self);
void entitas_position_free (entitasPosition* self);
GType entitas_scale_get_type (void) G_GNUC_CONST;
entitasScale* entitas_scale_dup (const entitasScale* self);
void entitas_scale_free (entitasScale* self);
GType entitas_sprite_get_type (void) G_GNUC_CONST;
void sdx_graphics_sprite_free (sdxgraphicsSprite* self);
entitasSprite* entitas_sprite_dup (const entitasSprite* self);
void entitas_sprite_free (entitasSprite* self);
void entitas_sprite_copy (const entitasSprite* self, entitasSprite* dest);
void entitas_sprite_destroy (entitasSprite* self);
GType entitas_text_get_type (void) G_GNUC_CONST;
entitasText* entitas_text_dup (const entitasText* self);
void entitas_text_free (entitasText* self);
void entitas_text_copy (const entitasText* self, entitasText* dest);
void entitas_text_destroy (entitasText* self);
GType entitas_tint_get_type (void) G_GNUC_CONST;
entitasTint* entitas_tint_dup (const entitasTint* self);
void entitas_tint_free (entitasTint* self);
GType entitas_tween_get_type (void) G_GNUC_CONST;
entitasTween* entitas_tween_dup (const entitasTween* self);
void entitas_tween_free (entitasTween* self);
GType entitas_velocity_get_type (void) G_GNUC_CONST;
entitasVelocity* entitas_velocity_dup (const entitasVelocity* self);
void entitas_velocity_free (entitasVelocity* self);
entitasEntity* entitas_entity_dup (const entitasEntity* self);
void entitas_entity_free (entitasEntity* self);
void entitas_entity_copy (const entitasEntity* self, entitasEntity* dest);
void entitas_entity_destroy (entitasEntity* self);
void entitas_world_setEntityRemovedListener (entitasWorld* self, entitasEntityRemovedListener removed, void* removed_target);
entitasEntity* entityRemoved (entitasEntity* e);
static entitasEntity* _entityRemoved_entitas_entity_removed_listener (entitasEntity* e, gpointer self);
systemsSpawnSystem* systems_spawn_system_new (Game* game, Factory* world);
systemsInputSystem* systems_input_system_new (Game* game, Factory* world);
systemsCollisionSystem* systems_collision_system_new (Game* game, Factory* world);
systemsPhysicsSystem* systems_physics_system_new (Game* game, Factory* world);
systemsExpireSystem* systems_expire_system_new (Game* game, Factory* world);
systemsRemoveSystem* systems_remove_system_new (Game* game, Factory* world);
systemsAnimationSystem* systems_animation_system_new (Game* game, Factory* world);
systemsDisplaySystem* systems_display_system_new (Game* game, Factory* world);
systemsScoreSystem* systems_score_system_new (Game* game, Factory* world);
GType entitas_isystem_get_type (void) G_GNUC_CONST;
entitasISystem* entitas_isystem_dup (const entitasISystem* self);
void entitas_isystem_free (entitasISystem* self);
void entitas_world_addSystem (entitasWorld* self, entitasISystem iface);
entitasISystem systems_spawn_system_get__ISystem (systemsSpawnSystem* self);
entitasISystem systems_input_system_get__ISystem (systemsInputSystem* self);
entitasISystem systems_physics_system_get__ISystem (systemsPhysicsSystem* self);
entitasISystem systems_collision_system_get__ISystem (systemsCollisionSystem* self);
entitasISystem systems_animation_system_get__ISystem (systemsAnimationSystem* self);
entitasISystem systems_expire_system_get__ISystem (systemsExpireSystem* self);
entitasISystem systems_remove_system_get__ISystem (systemsRemoveSystem* self);
entitasISystem systems_score_system_get__ISystem (systemsScoreSystem* self);
entitasISystem systems_display_system_get__ISystem (systemsDisplaySystem* self);
void entitas_world_initialize (entitasWorld* self);
entitasEntity* factory_createBackground (Factory* self);
void game_start (Game* self);
void sdx_start (void);
void game_update (Game* self);
void sdx_update (void);
void sdx_processEvents (void);
void entitas_world_execute (entitasWorld* self, gdouble delta);
void game_draw (Game* self);
void sdx_begin (void);
gboolean entitas_entity_isActive (entitasEntity *self);
gboolean systems_display_system_draw (systemsDisplaySystem* self, entitasEntity* e);
void sdx_drawFps (void);
void sdx_end (void);


Game* game_retain (Game* self) {
	Game* result = NULL;
	g_return_val_if_fail (self != NULL, NULL);
	g_atomic_int_add ((volatile gint *) (&self->_retainCount), 1);
	result = self;
	return result;
}


void game_release (Game* self) {
	gboolean _tmp0_ = FALSE;
	g_return_if_fail (self != NULL);
	_tmp0_ = g_atomic_int_dec_and_test ((volatile gint *) (&self->_retainCount));
	if (_tmp0_) {
		game_free (self);
	}
}


static gpointer _game_retain0 (gpointer self) {
	return self ? game_retain (self) : NULL;
}


Game* game_new (gint width, gint height) {
	Game* self;
	Game* _tmp0_ = NULL;
	gint _tmp1_ = 0;
	gint _tmp2_ = 0;
	self = g_slice_new0 (Game);
	game_instance_init (self);
	_tmp0_ = _game_retain0 (self);
	_game_release0 (game_instance);
	game_instance = _tmp0_;
	_tmp1_ = width;
	self->width = _tmp1_;
	_tmp2_ = height;
	self->height = _tmp2_;
	return self;
}


static entitasEntity* _entityRemoved_entitas_entity_removed_listener (entitasEntity* e, gpointer self) {
	entitasEntity* result;
	result = entityRemoved (e);
	return result;
}


void game_initialize (Game* self) {
	Factory* _tmp0_ = NULL;
	Factory* _tmp1_ = NULL;
	Factory* _tmp2_ = NULL;
	systemsSpawnSystem* _tmp3_ = NULL;
	Factory* _tmp4_ = NULL;
	systemsInputSystem* _tmp5_ = NULL;
	Factory* _tmp6_ = NULL;
	systemsCollisionSystem* _tmp7_ = NULL;
	Factory* _tmp8_ = NULL;
	systemsPhysicsSystem* _tmp9_ = NULL;
	Factory* _tmp10_ = NULL;
	systemsExpireSystem* _tmp11_ = NULL;
	Factory* _tmp12_ = NULL;
	systemsRemoveSystem* _tmp13_ = NULL;
	Factory* _tmp14_ = NULL;
	systemsAnimationSystem* _tmp15_ = NULL;
	Factory* _tmp16_ = NULL;
	systemsDisplaySystem* _tmp17_ = NULL;
	Factory* _tmp18_ = NULL;
	systemsScoreSystem* _tmp19_ = NULL;
	Factory* _tmp20_ = NULL;
	systemsSpawnSystem* _tmp21_ = NULL;
	entitasISystem _tmp22_ = {0};
	entitasISystem _tmp23_ = {0};
	Factory* _tmp24_ = NULL;
	systemsInputSystem* _tmp25_ = NULL;
	entitasISystem _tmp26_ = {0};
	entitasISystem _tmp27_ = {0};
	Factory* _tmp28_ = NULL;
	systemsPhysicsSystem* _tmp29_ = NULL;
	entitasISystem _tmp30_ = {0};
	entitasISystem _tmp31_ = {0};
	Factory* _tmp32_ = NULL;
	systemsCollisionSystem* _tmp33_ = NULL;
	entitasISystem _tmp34_ = {0};
	entitasISystem _tmp35_ = {0};
	Factory* _tmp36_ = NULL;
	systemsAnimationSystem* _tmp37_ = NULL;
	entitasISystem _tmp38_ = {0};
	entitasISystem _tmp39_ = {0};
	Factory* _tmp40_ = NULL;
	systemsExpireSystem* _tmp41_ = NULL;
	entitasISystem _tmp42_ = {0};
	entitasISystem _tmp43_ = {0};
	Factory* _tmp44_ = NULL;
	systemsRemoveSystem* _tmp45_ = NULL;
	entitasISystem _tmp46_ = {0};
	entitasISystem _tmp47_ = {0};
	Factory* _tmp48_ = NULL;
	systemsScoreSystem* _tmp49_ = NULL;
	entitasISystem _tmp50_ = {0};
	entitasISystem _tmp51_ = {0};
	Factory* _tmp52_ = NULL;
	systemsDisplaySystem* _tmp53_ = NULL;
	entitasISystem _tmp54_ = {0};
	entitasISystem _tmp55_ = {0};
	Factory* _tmp56_ = NULL;
	Factory* _tmp57_ = NULL;
	g_return_if_fail (self != NULL);
	sdx_setSmallFont ("assets/fonts/OpenDyslexic-Bold.otf", 16);
	sdx_setDefaultFont ("assets/fonts/OpenDyslexic-Bold.otf", 24);
	sdx_setShowFps (TRUE);
	_tmp0_ = factory_new ();
	_entitas_world_release0 (self->world);
	self->world = _tmp0_;
	_tmp1_ = self->world;
	entitas_world_setEntityRemovedListener ((entitasWorld*) _tmp1_, _entityRemoved_entitas_entity_removed_listener, NULL);
	_tmp2_ = self->world;
	_tmp3_ = systems_spawn_system_new (self, _tmp2_);
	_systems_spawn_system_release0 (self->spawn);
	self->spawn = _tmp3_;
	_tmp4_ = self->world;
	_tmp5_ = systems_input_system_new (self, _tmp4_);
	_systems_input_system_release0 (self->input);
	self->input = _tmp5_;
	_tmp6_ = self->world;
	_tmp7_ = systems_collision_system_new (self, _tmp6_);
	_systems_collision_system_release0 (self->collision);
	self->collision = _tmp7_;
	_tmp8_ = self->world;
	_tmp9_ = systems_physics_system_new (self, _tmp8_);
	_systems_physics_system_release0 (self->physics);
	self->physics = _tmp9_;
	_tmp10_ = self->world;
	_tmp11_ = systems_expire_system_new (self, _tmp10_);
	_systems_expire_system_release0 (self->expire);
	self->expire = _tmp11_;
	_tmp12_ = self->world;
	_tmp13_ = systems_remove_system_new (self, _tmp12_);
	_systems_remove_system_release0 (self->remove);
	self->remove = _tmp13_;
	_tmp14_ = self->world;
	_tmp15_ = systems_animation_system_new (self, _tmp14_);
	_systems_animation_system_release0 (self->animate);
	self->animate = _tmp15_;
	_tmp16_ = self->world;
	_tmp17_ = systems_display_system_new (self, _tmp16_);
	_systems_display_system_release0 (self->display);
	self->display = _tmp17_;
	_tmp18_ = self->world;
	_tmp19_ = systems_score_system_new (self, _tmp18_);
	_systems_score_system_release0 (self->score);
	self->score = _tmp19_;
	_tmp20_ = self->world;
	_tmp21_ = self->spawn;
	_tmp22_ = systems_spawn_system_get__ISystem (_tmp21_);
	_tmp23_ = _tmp22_;
	entitas_world_addSystem ((entitasWorld*) _tmp20_, _tmp23_);
	_tmp24_ = self->world;
	_tmp25_ = self->input;
	_tmp26_ = systems_input_system_get__ISystem (_tmp25_);
	_tmp27_ = _tmp26_;
	entitas_world_addSystem ((entitasWorld*) _tmp24_, _tmp27_);
	_tmp28_ = self->world;
	_tmp29_ = self->physics;
	_tmp30_ = systems_physics_system_get__ISystem (_tmp29_);
	_tmp31_ = _tmp30_;
	entitas_world_addSystem ((entitasWorld*) _tmp28_, _tmp31_);
	_tmp32_ = self->world;
	_tmp33_ = self->collision;
	_tmp34_ = systems_collision_system_get__ISystem (_tmp33_);
	_tmp35_ = _tmp34_;
	entitas_world_addSystem ((entitasWorld*) _tmp32_, _tmp35_);
	_tmp36_ = self->world;
	_tmp37_ = self->animate;
	_tmp38_ = systems_animation_system_get__ISystem (_tmp37_);
	_tmp39_ = _tmp38_;
	entitas_world_addSystem ((entitasWorld*) _tmp36_, _tmp39_);
	_tmp40_ = self->world;
	_tmp41_ = self->expire;
	_tmp42_ = systems_expire_system_get__ISystem (_tmp41_);
	_tmp43_ = _tmp42_;
	entitas_world_addSystem ((entitasWorld*) _tmp40_, _tmp43_);
	_tmp44_ = self->world;
	_tmp45_ = self->remove;
	_tmp46_ = systems_remove_system_get__ISystem (_tmp45_);
	_tmp47_ = _tmp46_;
	entitas_world_addSystem ((entitasWorld*) _tmp44_, _tmp47_);
	_tmp48_ = self->world;
	_tmp49_ = self->score;
	_tmp50_ = systems_score_system_get__ISystem (_tmp49_);
	_tmp51_ = _tmp50_;
	entitas_world_addSystem ((entitasWorld*) _tmp48_, _tmp51_);
	_tmp52_ = self->world;
	_tmp53_ = self->display;
	_tmp54_ = systems_display_system_get__ISystem (_tmp53_);
	_tmp55_ = _tmp54_;
	entitas_world_addSystem ((entitasWorld*) _tmp52_, _tmp55_);
	_tmp56_ = self->world;
	entitas_world_initialize ((entitasWorld*) _tmp56_);
	_tmp57_ = self->world;
	factory_createBackground (_tmp57_);
}


void game_start (Game* self) {
	g_return_if_fail (self != NULL);
	sdx_start ();
}


void game_update (Game* self) {
	Factory* _tmp0_ = NULL;
	gdouble _tmp1_ = 0.0;
	g_return_if_fail (self != NULL);
	sdx_update ();
	sdx_processEvents ();
	_tmp0_ = self->world;
	_tmp1_ = sdx_delta;
	entitas_world_execute ((entitasWorld*) _tmp0_, _tmp1_);
}


void game_draw (Game* self) {
	systemsDisplaySystem* _tmp0_ = NULL;
	GList* _tmp1_ = NULL;
	g_return_if_fail (self != NULL);
	sdx_begin ();
	_tmp0_ = self->display;
	_tmp1_ = _tmp0_->sprites;
	{
		GList* sprite_collection = NULL;
		GList* sprite_it = NULL;
		sprite_collection = _tmp1_;
		for (sprite_it = sprite_collection; sprite_it != NULL; sprite_it = sprite_it->next) {
			entitasEntity* sprite = NULL;
			sprite = sprite_it->data;
			{
				gboolean _tmp2_ = FALSE;
				_tmp2_ = entitas_entity_isActive (sprite);
				if (_tmp2_) {
					systemsDisplaySystem* _tmp3_ = NULL;
					entitasEntity* _tmp4_ = NULL;
					_tmp3_ = self->display;
					_tmp4_ = sprite;
					systems_display_system_draw (_tmp3_, _tmp4_);
				}
			}
		}
	}
	sdx_drawFps ();
	sdx_end ();
}


static void game_instance_init (Game * self) {
	self->_retainCount = 1;
}


void game_free (Game* self) {
	_entitas_world_release0 (self->world);
	_systems_collision_system_release0 (self->collision);
	_systems_expire_system_release0 (self->expire);
	_systems_input_system_release0 (self->input);
	_systems_physics_system_release0 (self->physics);
	_systems_remove_system_release0 (self->remove);
	_systems_spawn_system_release0 (self->spawn);
	_systems_animation_system_release0 (self->animate);
	_systems_display_system_release0 (self->display);
	_systems_score_system_release0 (self->score);
	g_slice_free (Game, self);
}



