/** updated by emvalac */
/* Group.c generated by valac 0.34.8, the Vala compiler
 * generated from Group.vala, do not modify */


#include <glib.h>
#include <glib-object.h>
#include <stdlib.h>
#include <string.h>
#include <float.h>
#include <math.h>
#include <SDL2/SDL_rect.h>

typedef struct _entitasGroup entitasGroup;
typedef struct _entitasMatcher entitasMatcher;

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
void entitas_matcher_release (entitasMatcher* self);
void entitas_matcher_free (entitasMatcher* self);
entitasMatcher* entitas_matcher_retain (entitasMatcher* self);
#define _entitas_matcher_release0(var) ((var == NULL) ? NULL : (var = (entitas_matcher_release (var), NULL)))
#define _g_list_free0(var) ((var == NULL) ? NULL : (var = (g_list_free (var), NULL)))

#define ENTITAS_TYPE_COMPONENTS (entitas_components_get_type ())
#define _g_free0(var) (var = (g_free (var), NULL))

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

struct _entitasGroup {
	gint _retainCount;
	entitasMatcher* matcher;
	GList* entities;
};

typedef enum  {
	ENTITAS_COMPONENTS_UnknownComponent,
	ENTITAS_COMPONENTS_BackgroundComponent,
	ENTITAS_COMPONENTS_BulletComponent,
	ENTITAS_COMPONENTS_Enemy1Component,
	ENTITAS_COMPONENTS_Enemy2Component,
	ENTITAS_COMPONENTS_Enemy3Component,
	ENTITAS_COMPONENTS_ExpiresComponent,
	ENTITAS_COMPONENTS_HealthComponent,
	ENTITAS_COMPONENTS_HudComponent,
	ENTITAS_COMPONENTS_IndexComponent,
	ENTITAS_COMPONENTS_LayerComponent,
	ENTITAS_COMPONENTS_SoundComponent,
	ENTITAS_COMPONENTS_TextComponent,
	ENTITAS_COMPONENTS_TintComponent,
	ENTITAS_COMPONENTS_TweenComponent,
	ENTITAS_COMPONENTS_VelocityComponent
} entitasComponents;

typedef enum  {
	ENTITAS_EXCEPTION_EntityIsNotEnabled,
	ENTITAS_EXCEPTION_EntityAlreadyHasComponent,
	ENTITAS_EXCEPTION_EntityDoesNotHaveComponent,
	ENTITAS_EXCEPTION_InvalidMatcherExpression,
	ENTITAS_EXCEPTION_EntityIsAlreadyReleased,
	ENTITAS_EXCEPTION_SingleEntity,
	ENTITAS_EXCEPTION_WorldDoesNotContainEntity
} entitasException;
#define ENTITAS_EXCEPTION entitas_exception_quark ()


void entitas_group_free (entitasGroup* self);
void entitas_matcher_free (entitasMatcher* self);
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
static void entitas_group_instance_init (entitasGroup * self);
entitasGroup* entitas_group_retain (entitasGroup* self);
void entitas_group_release (entitasGroup* self);
void entitas_group_free (entitasGroup* self);
entitasGroup* entitas_group_new (entitasMatcher* matcher);
void entitas_group_handleEntitySilently (entitasGroup* self, entitasEntity* entity);
gboolean entitas_matcher_matches (entitasMatcher* self, entitasEntity* entity);
GType entitas_components_get_type (void) G_GNUC_CONST;
void entitas_group_handleEntity (entitasGroup* self, entitasEntity* entity, entitasComponents index);
gboolean entitas_group_containsEntity (entitasGroup* self, entitasEntity* entity);
entitasEntity* entitas_group_getSingleEntity (entitasGroup* self);
gchar* entitas_matcher_toString (entitasMatcher* self);
GQuark entitas_exception_quark (void);


entitasGroup* entitas_group_retain (entitasGroup* self) {
	entitasGroup* result = NULL;
	g_return_val_if_fail (self != NULL, NULL);
	g_atomic_int_add ((volatile gint *) (&self->_retainCount), 1);
	result = self;
	return result;
}


void entitas_group_release (entitasGroup* self) {
	gboolean _tmp0_ = FALSE;
	g_return_if_fail (self != NULL);
	_tmp0_ = g_atomic_int_dec_and_test ((volatile gint *) (&self->_retainCount));
	if (_tmp0_) {
		entitas_group_free (self);
	}
}


static gpointer _entitas_matcher_retain0 (gpointer self) {
	return self ? entitas_matcher_retain (self) : NULL;
}


entitasGroup* entitas_group_new (entitasMatcher* matcher) {
	entitasGroup* self;
	entitasMatcher* _tmp0_ = NULL;
	entitasMatcher* _tmp1_ = NULL;
	g_return_val_if_fail (matcher != NULL, NULL);
	self = g_slice_new0 (entitasGroup);
	entitas_group_instance_init (self);
	_tmp0_ = matcher;
	_tmp1_ = _entitas_matcher_retain0 (_tmp0_);
	_entitas_matcher_release0 (self->matcher);
	self->matcher = _tmp1_;
	return self;
}


/** Add entity to group */
void entitas_group_handleEntitySilently (entitasGroup* self, entitasEntity* entity) {
	entitasMatcher* _tmp0_ = NULL;
	entitasEntity* _tmp1_ = NULL;
	gboolean _tmp2_ = FALSE;
	g_return_if_fail (self != NULL);
	_tmp0_ = self->matcher;
	_tmp1_ = entity;
	_tmp2_ = entitas_matcher_matches (_tmp0_, _tmp1_);
	if (_tmp2_) {
		entitasEntity* _tmp3_ = NULL;
		_tmp3_ = entity;
		self->entities = g_list_prepend (self->entities, _tmp3_);
	} else {
		entitasEntity* _tmp4_ = NULL;
		_tmp4_ = entity;
		self->entities = g_list_remove (self->entities, _tmp4_);
	}
}


/** Add entity to group and raise events */
void entitas_group_handleEntity (entitasGroup* self, entitasEntity* entity, entitasComponents index) {
	entitasMatcher* _tmp0_ = NULL;
	entitasEntity* _tmp1_ = NULL;
	gboolean _tmp2_ = FALSE;
	g_return_if_fail (self != NULL);
	_tmp0_ = self->matcher;
	_tmp1_ = entity;
	_tmp2_ = entitas_matcher_matches (_tmp0_, _tmp1_);
	if (_tmp2_) {
		entitasEntity* _tmp3_ = NULL;
		_tmp3_ = entity;
		self->entities = g_list_prepend (self->entities, _tmp3_);
	} else {
		entitasEntity* _tmp4_ = NULL;
		_tmp4_ = entity;
		self->entities = g_list_remove (self->entities, _tmp4_);
	}
}


gboolean entitas_group_containsEntity (entitasGroup* self, entitasEntity* entity) {
	gboolean result = FALSE;
	GList* _tmp0_ = NULL;
	entitasEntity* _tmp1_ = NULL;
	GList* _tmp2_ = NULL;
	g_return_val_if_fail (self != NULL, FALSE);
	_tmp0_ = self->entities;
	_tmp1_ = entity;
	_tmp2_ = g_list_find (_tmp0_, _tmp1_);
	result = _tmp2_ != NULL;
	return result;
}


entitasEntity* entitas_group_getSingleEntity (entitasGroup* self) {
	entitasEntity* result = NULL;
	guint c = 0U;
	GList* _tmp0_ = NULL;
	guint _tmp1_ = 0U;
	guint _tmp2_ = 0U;
	GError * _inner_error_ = NULL;
	g_return_val_if_fail (self != NULL, NULL);
	_tmp0_ = self->entities;
	_tmp1_ = g_list_length (_tmp0_);
	c = _tmp1_;
	_tmp2_ = c;
	if (_tmp2_ == ((guint) 1)) {
		GList* _tmp3_ = NULL;
		GList* _tmp4_ = NULL;
		gconstpointer _tmp5_ = NULL;
		_tmp3_ = self->entities;
		_tmp4_ = g_list_first (_tmp3_);
		_tmp5_ = _tmp4_->data;
		result = (entitasEntity*) _tmp5_;
		return result;
	} else {
		guint _tmp6_ = 0U;
		_tmp6_ = c;
		if (_tmp6_ == ((guint) 0)) {
			result = NULL;
			return result;
		} else {
			entitasMatcher* _tmp7_ = NULL;
			gchar* _tmp8_ = NULL;
			gchar* _tmp9_ = NULL;
			GError* _tmp10_ = NULL;
			GError* _tmp11_ = NULL;
			_tmp7_ = self->matcher;
			_tmp8_ = entitas_matcher_toString (_tmp7_);
			_tmp9_ = _tmp8_;
			_tmp10_ = g_error_new_literal (ENTITAS_EXCEPTION, ENTITAS_EXCEPTION_SingleEntity, _tmp9_);
			_tmp11_ = _tmp10_;
			_g_free0 (_tmp9_);
			_inner_error_ = _tmp11_;
			g_critical ("file %s: line %d: uncaught error: %s (%s, %d)", __FILE__, __LINE__, _inner_error_->message, g_quark_to_string (_inner_error_->domain), _inner_error_->code);
			g_clear_error (&_inner_error_);
			return NULL;
		}
	}
}


static void entitas_group_instance_init (entitasGroup * self) {
	self->_retainCount = 1;
}


void entitas_group_free (entitasGroup* self) {
	_entitas_matcher_release0 (self->matcher);
	_g_list_free0 (self->entities);
	g_slice_free (entitasGroup, self);
}



