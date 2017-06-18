/** updated by emvalac */
/* InputSystem.c generated by valac 0.34.8, the Vala compiler
 * generated from InputSystem.vala, do not modify */


#include <glib.h>
#include <glib-object.h>
#include <float.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>
#include <SDL2/SDL_rect.h>

typedef struct _entitasSystem entitasSystem;
typedef entitasSystem systemsInputSystem;
typedef struct _sdxAbstractGame sdxAbstractGame;
typedef sdxAbstractGame Game;
typedef struct _entitasWorld entitasWorld;
typedef entitasWorld Factory;

#define ENTITAS_TYPE_ENTITY (entitas_entity_get_type ())

#define ENTITAS_TYPE_TRANSFORM (entitas_transform_get_type ())

#define SDX_MATH_TYPE_VECTOR2 (sdx_math_vector2_get_type ())
typedef struct _sdxmathVector2 sdxmathVector2;
typedef struct _sdxgraphicsSprite sdxgraphicsSprite;
typedef struct _entitasTransform entitasTransform;

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

#define ENTITAS_TYPE_SOUND (entitas_sound_get_type ())
typedef struct _sdxaudioSound sdxaudioSound;
typedef struct _entitasSound entitasSound;

#define ENTITAS_TYPE_TEXT (entitas_text_get_type ())
typedef sdxgraphicsSprite sdxgraphicsSpriteTextSprite;
typedef struct _entitasText entitasText;

#define ENTITAS_TYPE_TINT (entitas_tint_get_type ())
typedef struct _entitasTint entitasTint;

#define ENTITAS_TYPE_TWEEN (entitas_tween_get_type ())
typedef struct _entitasTween entitasTween;

#define ENTITAS_TYPE_VELOCITY (entitas_velocity_get_type ())
typedef struct _entitasVelocity entitasVelocity;
typedef struct _entitasEntity entitasEntity;
void entitas_world_release (entitasWorld* self);
void entitas_world_free (entitasWorld* self);
entitasWorld* entitas_world_retain (entitasWorld* self);
#define _entitas_world_release0(var) ((var == NULL) ? NULL : (var = (entitas_world_release (var), NULL)))
typedef struct _Block5Data Block5Data;
void entitas_system_release (entitasSystem* self);
void entitas_system_free (entitasSystem* self);
entitasSystem* entitas_system_retain (entitasSystem* self);
#define _entitas_system_release0(var) ((var == NULL) ? NULL : (var = (entitas_system_release (var), NULL)))

typedef void (*entitasSystemInitialize) (void* user_data);
typedef void (*entitasSystemExecute) (gfloat delta, void* user_data);
struct _entitasSystem {
	gint _retainCount;
	entitasSystemInitialize initialize;
	gpointer initialize_target;
	GDestroyNotify initialize_target_destroy_notify;
	entitasSystemExecute execute;
	gpointer execute_target;
	GDestroyNotify execute_target_destroy_notify;
};

struct _sdxmathVector2 {
	gfloat x;
	gfloat y;
};

struct _entitasTransform {
	sdxmathVector2* scale;
	sdxmathVector2* position;
	SDL_Rect* aabb;
	sdxgraphicsSprite* sprite;
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
	gfloat value;
};

struct _entitasHealth {
	gfloat current;
	gfloat maximum;
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

struct _entitasSound {
	sdxaudioSound* sound;
};

struct _entitasText {
	gchar* text;
	sdxgraphicsSpriteTextSprite* sprite;
};

struct _entitasTint {
	gint r;
	gint g;
	gint b;
	gint a;
};

struct _entitasTween {
	gfloat min;
	gfloat max;
	gfloat speed;
	gboolean repeat;
	gboolean active;
};

struct _entitasVelocity {
	gfloat x;
	gfloat y;
};

struct _entitasEntity {
	gint id;
	gchar* name;
	gint pool;
	guint64 mask;
	entitasTransform transform;
	entitasBackground* background;
	entitasBullet* bullet;
	entitasEnemy1* enemy1;
	entitasEnemy2* enemy2;
	entitasEnemy3* enemy3;
	entitasExpires* expires;
	entitasHealth* health;
	entitasHud* hud;
	entitasIndex* index;
	entitasLayer* layer;
	entitasSound* sound;
	entitasText* text;
	entitasTint* tint;
	entitasTween* tween;
	entitasVelocity* velocity;
};

struct _Block5Data {
	int _ref_count_;
	systemsInputSystem* self;
	gboolean shoot;
	gfloat timeToFire;
	entitasEntity* player;
	Factory* world;
};


extern gint sdx_mouseX;
extern gint sdx_mouseY;
extern gboolean sdx_mouseDown;
extern guint8* sdx_keys;
extern gint sdx_keys_length1;

void entitas_system_free (entitasSystem* self);
#define SYSTEMS_INPUT_SYSTEM_FIRE_RATE 0.1f
void sdx_abstract_game_free (sdxAbstractGame* self);
void entitas_world_free (entitasWorld* self);
systemsInputSystem* systems_input_system_new (Game* game, Factory* world);
GType entitas_entity_get_type (void) G_GNUC_CONST;
GType entitas_transform_get_type (void) G_GNUC_CONST;
GType sdx_math_vector2_get_type (void) G_GNUC_CONST;
sdxmathVector2* sdx_math_vector2_dup (const sdxmathVector2* self);
void sdx_math_vector2_free (sdxmathVector2* self);
void sdx_graphics_sprite_free (sdxgraphicsSprite* self);
entitasTransform* entitas_transform_dup (const entitasTransform* self);
void entitas_transform_free (entitasTransform* self);
void entitas_transform_copy (const entitasTransform* self, entitasTransform* dest);
void entitas_transform_destroy (entitasTransform* self);
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
GType entitas_sound_get_type (void) G_GNUC_CONST;
void sdx_audio_sound_free (sdxaudioSound* self);
entitasSound* entitas_sound_dup (const entitasSound* self);
void entitas_sound_free (entitasSound* self);
void entitas_sound_copy (const entitasSound* self, entitasSound* dest);
void entitas_sound_destroy (entitasSound* self);
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
static Block5Data* block5_data_ref (Block5Data* _data5_);
static void block5_data_unref (void * _userdata_);
entitasSystem* entitas_system_new (void);
entitasEntity* factory_createPlayer (Factory* self);
static void __lambda10_ (Block5Data* _data5_, gfloat delta);
entitasEntity* entitas_entity_setPosition (entitasEntity *self, gfloat x, gfloat y);
entitasEntity* factory_bullet (Factory* self, gint x, gint y);
static void ___lambda10__entitas_system_execute (gfloat delta, gpointer self);


static gpointer _entitas_world_retain0 (gpointer self) {
	return self ? entitas_world_retain (self) : NULL;
}


static Block5Data* block5_data_ref (Block5Data* _data5_) {
	g_atomic_int_inc (&_data5_->_ref_count_);
	return _data5_;
}


static void block5_data_unref (void * _userdata_) {
	Block5Data* _data5_;
	_data5_ = (Block5Data*) _userdata_;
	if (g_atomic_int_dec_and_test (&_data5_->_ref_count_)) {
		systemsInputSystem* self;
		self = _data5_->self;
		_entitas_world_release0 (_data5_->world);
		_entitas_system_release0 (self);
		g_slice_free (Block5Data, _data5_);
	}
}


static void __lambda10_ (Block5Data* _data5_, gfloat delta) {
	systemsInputSystem* self;
	gint x = 0;
	gint _tmp0_ = 0;
	gint y = 0;
	gint _tmp1_ = 0;
	gint _tmp2_ = 0;
	gint _tmp3_ = 0;
	gboolean _tmp4_ = FALSE;
	gboolean _tmp5_ = FALSE;
	self = _data5_->self;
	_tmp0_ = sdx_mouseX;
	x = (gint) _tmp0_;
	_tmp1_ = sdx_mouseY;
	y = (gint) _tmp1_;
	_tmp2_ = x;
	_tmp3_ = y;
	entitas_entity_setPosition (_data5_->player, (gfloat) _tmp2_, (gfloat) _tmp3_);
	_tmp5_ = sdx_mouseDown;
	if (_tmp5_) {
		_tmp4_ = TRUE;
	} else {
		guint8* _tmp6_ = NULL;
		gint _tmp6__length1 = 0;
		guint8 _tmp7_ = 0U;
		_tmp6_ = sdx_keys;
		_tmp6__length1 = sdx_keys_length1;
		_tmp7_ = _tmp6_[122];
		_tmp4_ = ((gint) _tmp7_) == 1;
	}
	_data5_->shoot = _tmp4_;
	if (_data5_->shoot) {
		gfloat _tmp8_ = 0.0F;
		_tmp8_ = delta;
		_data5_->timeToFire = _data5_->timeToFire - _tmp8_;
	}
	if (_data5_->timeToFire < ((gfloat) 0)) {
		Factory* _tmp9_ = NULL;
		gint _tmp10_ = 0;
		gint _tmp11_ = 0;
		Factory* _tmp12_ = NULL;
		gint _tmp13_ = 0;
		gint _tmp14_ = 0;
		_tmp9_ = _data5_->world;
		_tmp10_ = x;
		_tmp11_ = y;
		factory_bullet (_tmp9_, _tmp10_ + 27, _tmp11_ + 2);
		_tmp12_ = _data5_->world;
		_tmp13_ = x;
		_tmp14_ = y;
		factory_bullet (_tmp12_, _tmp13_ - 27, _tmp14_ + 2);
		_data5_->timeToFire = SYSTEMS_INPUT_SYSTEM_FIRE_RATE;
	}
}


static void ___lambda10__entitas_system_execute (gfloat delta, gpointer self) {
	__lambda10_ (self, delta);
}


systemsInputSystem* systems_input_system_new (Game* game, Factory* world) {
	systemsInputSystem* self;
	Block5Data* _data5_;
	Factory* _tmp0_ = NULL;
	Factory* _tmp1_ = NULL;
	Factory* _tmp2_ = NULL;
	entitasEntity* _tmp3_ = NULL;
	g_return_val_if_fail (game != NULL, NULL);
	g_return_val_if_fail (world != NULL, NULL);
	_data5_ = g_slice_new0 (Block5Data);
	_data5_->_ref_count_ = 1;
	_tmp0_ = world;
	_tmp1_ = _entitas_world_retain0 (_tmp0_);
	_entitas_world_release0 (_data5_->world);
	_data5_->world = _tmp1_;
	self = (systemsInputSystem*) entitas_system_new ();
	_data5_->self = entitas_system_retain (self);
	_data5_->shoot = FALSE;
	_data5_->timeToFire = SYSTEMS_INPUT_SYSTEM_FIRE_RATE;
	_tmp2_ = _data5_->world;
	_tmp3_ = factory_createPlayer (_tmp2_);
	_data5_->player = _tmp3_;
	(((entitasSystem*) self)->execute_target_destroy_notify == NULL) ? NULL : (((entitasSystem*) self)->execute_target_destroy_notify (((entitasSystem*) self)->execute_target), NULL);
	((entitasSystem*) self)->execute = NULL;
	((entitasSystem*) self)->execute_target = NULL;
	((entitasSystem*) self)->execute_target_destroy_notify = NULL;
	((entitasSystem*) self)->execute = ___lambda10__entitas_system_execute;
	((entitasSystem*) self)->execute_target = block5_data_ref (_data5_);
	((entitasSystem*) self)->execute_target_destroy_notify = block5_data_unref;
	block5_data_unref (_data5_);
	_data5_ = NULL;
	return self;
}


