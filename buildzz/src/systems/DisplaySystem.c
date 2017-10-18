/** updated by adriac */
/* DisplaySystem.c generated by valac 0.34.9, the Vala compiler
 * generated from DisplaySystem.vala, do not modify */


#include <glib.h>
#include <glib-object.h>
#include <stdlib.h>
#include <string.h>
#include <float.h>
#include <math.h>
#include <SDL2/SDL_rect.h>
#include <SDL2/SDL_render.h>
#include <SDL2/SDL_pixels.h>

typedef struct _SystemsDisplaySystem SystemsDisplaySystem;

#define ENTITAS_TYPE_ENTITY (entitas_entity_get_type ())

#define ENTITAS_TYPE_TRANSFORM (entitas_transform_get_type ())

#define SDX_MATH_TYPE_VECTOR2 (sdx_math_vector2_get_type ())
typedef struct _SdxMathVector2 SdxMathVector2;
typedef struct _SdxGraphicsSprite SdxGraphicsSprite;
typedef struct _EntitasTransform EntitasTransform;
typedef struct _EntitasEventEntityChanged EntitasEventEntityChanged;
typedef struct _EntitasEventEntityReleased EntitasEventEntityReleased;
typedef struct _EntitasEventComponentReplaced EntitasEventComponentReplaced;

#define ENTITAS_TYPE_BACKGROUND (entitas_background_get_type ())
typedef struct _EntitasBackground EntitasBackground;

#define ENTITAS_TYPE_BULLET (entitas_bullet_get_type ())
typedef struct _EntitasBullet EntitasBullet;

#define ENTITAS_TYPE_ENEMY1 (entitas_enemy1_get_type ())
typedef struct _EntitasEnemy1 EntitasEnemy1;

#define ENTITAS_TYPE_ENEMY2 (entitas_enemy2_get_type ())
typedef struct _EntitasEnemy2 EntitasEnemy2;

#define ENTITAS_TYPE_ENEMY3 (entitas_enemy3_get_type ())
typedef struct _EntitasEnemy3 EntitasEnemy3;

#define ENTITAS_TYPE_EXPIRES (entitas_expires_get_type ())
typedef struct _EntitasExpires EntitasExpires;

#define ENTITAS_TYPE_HEALTH (entitas_health_get_type ())
typedef struct _EntitasHealth EntitasHealth;

#define ENTITAS_TYPE_HUD (entitas_hud_get_type ())
typedef struct _EntitasHud EntitasHud;

#define ENTITAS_TYPE_LAYER (entitas_layer_get_type ())
typedef struct _EntitasLayer EntitasLayer;

#define ENTITAS_TYPE_PLAYER (entitas_player_get_type ())
typedef struct _EntitasPlayer EntitasPlayer;

#define ENTITAS_TYPE_SHOW (entitas_show_get_type ())
typedef struct _EntitasShow EntitasShow;

#define ENTITAS_TYPE_SOUND (entitas_sound_get_type ())
typedef struct _SdxAudioSound SdxAudioSound;
typedef struct _EntitasSound EntitasSound;

#define ENTITAS_TYPE_TEXT (entitas_text_get_type ())
typedef SdxGraphicsSprite SdxGraphicsSpriteTextSprite;
typedef struct _EntitasText EntitasText;

#define ENTITAS_TYPE_TINT (entitas_tint_get_type ())
typedef struct _EntitasTint EntitasTint;

#define ENTITAS_TYPE_TWEEN (entitas_tween_get_type ())
typedef struct _EntitasTween EntitasTween;

#define ENTITAS_TYPE_VELOCITY (entitas_velocity_get_type ())
typedef struct _EntitasVelocity EntitasVelocity;
typedef struct _EntitasEntity EntitasEntity;
#define _g_list_free0(var) ((var == NULL) ? NULL : (var = (g_list_free (var), NULL)))
typedef struct _SdxAbstractGame SdxAbstractGame;
typedef SdxAbstractGame Game;
typedef struct _EntitasWorld EntitasWorld;
typedef EntitasWorld Factory;
typedef struct _EntitasGroup EntitasGroup;
typedef struct _EntitasMatcher EntitasMatcher;

#define ENTITAS_TYPE_COMPONENTS (entitas_components_get_type ())
// symtbl.1 entitas_matcher
void entitas_matcher_release (EntitasMatcher* self);
void entitas_matcher_free (EntitasMatcher* self);
EntitasMatcher* entitas_matcher_retain (EntitasMatcher* self);
#define _entitas_matcher_release0(var) ((var == NULL) ? NULL : (var = (entitas_matcher_release (var), NULL)))
typedef struct _EntitasEventGroupChanged EntitasEventGroupChanged;
typedef struct _EntitasEventGroupUpdated EntitasEventGroupUpdated;
typedef struct _SdxUiComponent SdxUiComponent;
typedef SdxUiComponent SdxUiWindow;
// symtbl.1 entitas_group
void entitas_group_release (EntitasGroup* self);
void entitas_group_free (EntitasGroup* self);
EntitasGroup* entitas_group_retain (EntitasGroup* self);
#define _entitas_group_release0(var) ((var == NULL) ? NULL : (var = (entitas_group_release (var), NULL)))
typedef struct _Class Class;

#define SDX_GRAPHICS_SPRITE_TYPE_KIND (sdx_graphics_sprite_kind_get_type ())

#define SDX_MATH_TYPE_SCALE (sdx_math_scale_get_type ())
typedef struct _SdxMathScale SdxMathScale;

struct _SdxMathVector2 {
	gfloat x;
	gfloat y;
};

struct _EntitasTransform {
	SdxMathVector2* scale;
	SdxMathVector2* position;
	SDL_Rect* aabb;
	SdxGraphicsSprite* sprite;
};

struct _EntitasBackground {
	gboolean active;
};

struct _EntitasBullet {
	gboolean active;
};

struct _EntitasEnemy1 {
	gboolean active;
};

struct _EntitasEnemy2 {
	gboolean active;
};

struct _EntitasEnemy3 {
	gboolean active;
};

struct _EntitasExpires {
	gfloat value;
};

struct _EntitasHealth {
	gfloat current;
	gfloat maximum;
};

struct _EntitasHud {
	gboolean active;
};

struct _EntitasLayer {
	gint value;
};

struct _EntitasPlayer {
	gboolean active;
};

struct _EntitasShow {
	gboolean active;
};

struct _EntitasSound {
	SdxAudioSound* sound;
};

struct _EntitasText {
	gchar* text;
	SdxGraphicsSpriteTextSprite* sprite;
};

struct _EntitasTint {
	gint r;
	gint g;
	gint b;
	gint a;
};

struct _EntitasTween {
	gfloat min;
	gfloat max;
	gfloat speed;
	gboolean repeat;
	gboolean active;
};

struct _EntitasVelocity {
	gfloat x;
	gfloat y;
};

struct _EntitasEntity {
	gint id;
	gchar* name;
	gint pool;
	guint64 mask;
	EntitasTransform transform;
	EntitasEventEntityChanged* onComponentAdded;
	EntitasEventEntityChanged* onComponentRemoved;
	EntitasEventEntityReleased* onEntityReleased;
	EntitasEventComponentReplaced* onComponentReplaced;
	EntitasBackground* background;
	EntitasBullet* bullet;
	EntitasEnemy1* enemy1;
	EntitasEnemy2* enemy2;
	EntitasEnemy3* enemy3;
	EntitasExpires* expires;
	EntitasHealth* health;
	EntitasHud* hud;
	EntitasLayer* layer;
	EntitasPlayer* player;
	EntitasShow* show;
	EntitasSound* sound;
	EntitasText* text;
	EntitasTint* tint;
	EntitasTween* tween;
	EntitasVelocity* velocity;
};

struct _SystemsDisplaySystem {
	gint ref_count;
	GList* sprites;
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
	ENTITAS_COMPONENTS_LayerComponent,
	ENTITAS_COMPONENTS_PlayerComponent,
	ENTITAS_COMPONENTS_ShowComponent,
	ENTITAS_COMPONENTS_SoundComponent,
	ENTITAS_COMPONENTS_TextComponent,
	ENTITAS_COMPONENTS_TintComponent,
	ENTITAS_COMPONENTS_TweenComponent,
	ENTITAS_COMPONENTS_VelocityComponent
} EntitasComponents;

struct _EntitasGroup {
	gint ref_count;
	GList* entities;
	EntitasMatcher* matcher;
	EntitasEventGroupChanged* onEntityAdded;
	EntitasEventGroupChanged* onEntityRemoved;
	EntitasEventGroupUpdated* onEntityUpdated;
};

typedef void (*EntitasEventGroupChangedHandler) (EntitasGroup* g, EntitasEntity* e, gint index, void* component, void* user_data);
typedef void (*SdxAbstractGameAbstractUpdate) (void* user_data);
typedef void (*SdxAbstractGameAbstractDraw) (void* user_data);
struct _SdxAbstractGame {
	gint ref_count;
	gint width;
	gint height;
	SdxAbstractGameAbstractUpdate Update;
	gpointer Update_target;
	GDestroyNotify Update_target_destroy_notify;
	SdxAbstractGameAbstractDraw Draw;
	gpointer Draw_target;
	GDestroyNotify Draw_target_destroy_notify;
};

typedef enum  {
	SDX_GRAPHICS_SPRITE_KIND_AnimatedSprite,
	SDX_GRAPHICS_SPRITE_KIND_TextureSprite,
	SDX_GRAPHICS_SPRITE_KIND_AtlasSprite,
	SDX_GRAPHICS_SPRITE_KIND_NineSliceSprite,
	SDX_GRAPHICS_SPRITE_KIND_CompositeSprite,
	SDX_GRAPHICS_SPRITE_KIND_TextSprite
} SdxGraphicsSpriteKind;

struct _SdxMathScale {
	gfloat x;
	gfloat y;
};

struct _SdxGraphicsSprite {
	gint ref_count;
	Class* klass;
	SdxGraphicsSpriteKind kind;
	gint id;
	SDL_Texture* texture;
	gint width;
	gint height;
	gint x;
	gint y;
	gint index;
	gint frame;
	gdouble angle;
	SdxMathScale scale;
	SDL_Color color;
	SDL_RendererFlip flip;
	SDL_Point center;
	gboolean centered;
	gint layer;
	gchar* path;
};


extern SdxUiWindow* sdx_ui;

void systems_display_system_free (SystemsDisplaySystem* self);
GType entitas_entity_get_type (void) G_GNUC_CONST;
GType entitas_transform_get_type (void) G_GNUC_CONST;
GType sdx_math_vector2_get_type (void) G_GNUC_CONST;
SdxMathVector2* sdx_math_vector2_dup (const SdxMathVector2* self);
void sdx_math_vector2_free (SdxMathVector2* self);
void sdx_graphics_sprite_free (SdxGraphicsSprite* self);
EntitasTransform* entitas_transform_dup (const EntitasTransform* self);
void entitas_transform_free (EntitasTransform* self);
void entitas_transform_copy (const EntitasTransform* self, EntitasTransform* dest);
void entitas_transform_destroy (EntitasTransform* self);
void entitas_event_entity_changed_free (EntitasEventEntityChanged* self);
void entitas_event_entity_released_free (EntitasEventEntityReleased* self);
void entitas_event_component_replaced_free (EntitasEventComponentReplaced* self);
GType entitas_background_get_type (void) G_GNUC_CONST;
EntitasBackground* entitas_background_dup (const EntitasBackground* self);
void entitas_background_free (EntitasBackground* self);
GType entitas_bullet_get_type (void) G_GNUC_CONST;
EntitasBullet* entitas_bullet_dup (const EntitasBullet* self);
void entitas_bullet_free (EntitasBullet* self);
GType entitas_enemy1_get_type (void) G_GNUC_CONST;
EntitasEnemy1* entitas_enemy1_dup (const EntitasEnemy1* self);
void entitas_enemy1_free (EntitasEnemy1* self);
GType entitas_enemy2_get_type (void) G_GNUC_CONST;
EntitasEnemy2* entitas_enemy2_dup (const EntitasEnemy2* self);
void entitas_enemy2_free (EntitasEnemy2* self);
GType entitas_enemy3_get_type (void) G_GNUC_CONST;
EntitasEnemy3* entitas_enemy3_dup (const EntitasEnemy3* self);
void entitas_enemy3_free (EntitasEnemy3* self);
GType entitas_expires_get_type (void) G_GNUC_CONST;
EntitasExpires* entitas_expires_dup (const EntitasExpires* self);
void entitas_expires_free (EntitasExpires* self);
GType entitas_health_get_type (void) G_GNUC_CONST;
EntitasHealth* entitas_health_dup (const EntitasHealth* self);
void entitas_health_free (EntitasHealth* self);
GType entitas_hud_get_type (void) G_GNUC_CONST;
EntitasHud* entitas_hud_dup (const EntitasHud* self);
void entitas_hud_free (EntitasHud* self);
GType entitas_layer_get_type (void) G_GNUC_CONST;
EntitasLayer* entitas_layer_dup (const EntitasLayer* self);
void entitas_layer_free (EntitasLayer* self);
GType entitas_player_get_type (void) G_GNUC_CONST;
EntitasPlayer* entitas_player_dup (const EntitasPlayer* self);
void entitas_player_free (EntitasPlayer* self);
GType entitas_show_get_type (void) G_GNUC_CONST;
EntitasShow* entitas_show_dup (const EntitasShow* self);
void entitas_show_free (EntitasShow* self);
GType entitas_sound_get_type (void) G_GNUC_CONST;
void sdx_audio_sound_free (SdxAudioSound* self);
EntitasSound* entitas_sound_dup (const EntitasSound* self);
void entitas_sound_free (EntitasSound* self);
void entitas_sound_copy (const EntitasSound* self, EntitasSound* dest);
void entitas_sound_destroy (EntitasSound* self);
GType entitas_text_get_type (void) G_GNUC_CONST;
EntitasText* entitas_text_dup (const EntitasText* self);
void entitas_text_free (EntitasText* self);
void entitas_text_copy (const EntitasText* self, EntitasText* dest);
void entitas_text_destroy (EntitasText* self);
GType entitas_tint_get_type (void) G_GNUC_CONST;
EntitasTint* entitas_tint_dup (const EntitasTint* self);
void entitas_tint_free (EntitasTint* self);
GType entitas_tween_get_type (void) G_GNUC_CONST;
EntitasTween* entitas_tween_dup (const EntitasTween* self);
void entitas_tween_free (EntitasTween* self);
GType entitas_velocity_get_type (void) G_GNUC_CONST;
EntitasVelocity* entitas_velocity_dup (const EntitasVelocity* self);
void entitas_velocity_free (EntitasVelocity* self);
EntitasEntity* entitas_entity_dup (const EntitasEntity* self);
void entitas_entity_free (EntitasEntity* self);
void entitas_entity_copy (const EntitasEntity* self, EntitasEntity* dest);
void entitas_entity_destroy (EntitasEntity* self);
static void systems_display_system_instance_init (SystemsDisplaySystem * self);
SystemsDisplaySystem* systems_display_system_retain (SystemsDisplaySystem* self);
void systems_display_system_release (SystemsDisplaySystem* self);
void systems_display_system_free (SystemsDisplaySystem* self);
void sdx_abstract_game_free (SdxAbstractGame* self);
void entitas_world_free (EntitasWorld* self);
// symtbl.3 SystemsDisplaySystem / systems_display_system
SystemsDisplaySystem* systems_display_system_retain (SystemsDisplaySystem* self);
void systems_display_system_release (SystemsDisplaySystem* self);
SystemsDisplaySystem* systems_display_system_new (Game* game, Factory* world);
void entitas_group_free (EntitasGroup* self);
void entitas_matcher_free (EntitasMatcher* self);
EntitasGroup* entitas_world_GetGroup (EntitasWorld* self, EntitasMatcher* matcher);
EntitasMatcher* entitas_matcher_AllOf (gint* components, int components_length1);
GType entitas_components_get_type (void) G_GNUC_CONST;
void entitas_event_group_changed_free (EntitasEventGroupChanged* self);
void entitas_event_group_updated_free (EntitasEventGroupUpdated* self);
void entitas_event_group_changed_Add (EntitasEventGroupChanged* self, EntitasEventGroupChangedHandler event, void* event_target);
static void __lambda48_ (SystemsDisplaySystem* self, EntitasGroup* group, EntitasEntity* entity, gint index, void* comp);
static void ___lambda48__entitas_event_group_changed_handler (EntitasGroup* g, EntitasEntity* e, gint index, void* component, gpointer self);
static void __lambda49_ (SystemsDisplaySystem* self, EntitasGroup* group, EntitasEntity* entity, gint index, void* comp);
static void ___lambda49__entitas_event_group_changed_handler (EntitasGroup* g, EntitasEntity* e, gint index, void* component, gpointer self);
static void __lambda50_ (SystemsDisplaySystem* self);
void sdx_Begin (void);
static void __lambda51_ (SystemsDisplaySystem* self, EntitasEntity* entity);
gboolean entitas_entity_IsActive (EntitasEntity *self);
gboolean systems_display_system_Draw (SystemsDisplaySystem* self, EntitasEntity* e, EntitasTransform* t);
static void ___lambda51__gfunc (gconstpointer data, gpointer self);
void sdx_ui_component_free (SdxUiComponent* self);
void sdx_ui_component_Render (SdxUiComponent* self, gint x, gint y);
void sdx_End (void);
static void ___lambda50__sdx_abstract_game_abstract_draw (gpointer self);
void class_free (Class* self);
GType sdx_graphics_sprite_kind_get_type (void) G_GNUC_CONST;
GType sdx_math_scale_get_type (void) G_GNUC_CONST;
SdxMathScale* sdx_math_scale_dup (const SdxMathScale* self);
void sdx_math_scale_free (SdxMathScale* self);
gboolean entitas_entity_HasTint (EntitasEntity *self);
gint sdx_Render (SDL_Texture* texture, SDL_Rect* srcrect, SDL_Rect* dstrect);
gboolean entitas_entity_HasText (EntitasEntity *self);


SystemsDisplaySystem* systems_display_system_retain (SystemsDisplaySystem* self) {
	SystemsDisplaySystem* result = NULL;
	g_return_val_if_fail (self != NULL, NULL);
	g_atomic_int_add ((volatile gint *) (&self->ref_count), 1);
	result = self;
	return result;
}


void systems_display_system_release (SystemsDisplaySystem* self) {
	gboolean _tmp0_ = FALSE;
	g_return_if_fail (self != NULL);
	_tmp0_ = g_atomic_int_dec_and_test ((volatile gint *) (&self->ref_count));
	if (_tmp0_) {
		systems_display_system_free (self);
	}
}


static void __lambda48_ (SystemsDisplaySystem* self, EntitasGroup* group, EntitasEntity* entity, gint index, void* comp) {
	EntitasEntity* _tmp0_ = NULL;
	g_return_if_fail (group != NULL);
	_tmp0_ = entity;
	self->sprites = g_list_remove (self->sprites, _tmp0_);
}


static void ___lambda48__entitas_event_group_changed_handler (EntitasGroup* g, EntitasEntity* e, gint index, void* component, gpointer self) {
	__lambda48_ ((SystemsDisplaySystem*) self, g, e, index, component);
}


static void __lambda49_ (SystemsDisplaySystem* self, EntitasGroup* group, EntitasEntity* entity, gint index, void* comp) {
	gint layer = 0;
	EntitasEntity* _tmp0_ = NULL;
	EntitasLayer* _tmp1_ = NULL;
	gint _tmp2_ = 0;
	GList* _tmp3_ = NULL;
	guint _tmp4_ = 0U;
	g_return_if_fail (group != NULL);
	_tmp0_ = entity;
	_tmp1_ = (*_tmp0_).layer;
	_tmp2_ = (*_tmp1_).value;
	layer = _tmp2_;
	_tmp3_ = self->sprites;
	_tmp4_ = g_list_length (_tmp3_);
	if (_tmp4_ == ((guint) 0)) {
		EntitasEntity* _tmp5_ = NULL;
		_tmp5_ = entity;
		self->sprites = g_list_append (self->sprites, _tmp5_);
	} else {
		gint i = 0;
		GList* _tmp6_ = NULL;
		EntitasEntity* _tmp14_ = NULL;
		i = 0;
		_tmp6_ = self->sprites;
		{
			GList* sprite_collection = NULL;
			GList* sprite_it = NULL;
			sprite_collection = _tmp6_;
			for (sprite_it = sprite_collection; sprite_it != NULL; sprite_it = sprite_it->next) {
				EntitasEntity* sprite = NULL;
				sprite = sprite_it->data;
				{
					gint _tmp7_ = 0;
					EntitasEntity* _tmp8_ = NULL;
					EntitasLayer* _tmp9_ = NULL;
					gint _tmp10_ = 0;
					gint _tmp13_ = 0;
					_tmp7_ = layer;
					_tmp8_ = sprite;
					_tmp9_ = (*_tmp8_).layer;
					_tmp10_ = (*_tmp9_).value;
					if (_tmp7_ <= _tmp10_) {
						EntitasEntity* _tmp11_ = NULL;
						gint _tmp12_ = 0;
						_tmp11_ = entity;
						_tmp12_ = i;
						self->sprites = g_list_insert (self->sprites, _tmp11_, _tmp12_);
						return;
					}
					_tmp13_ = i;
					i = _tmp13_ + 1;
				}
			}
		}
		_tmp14_ = entity;
		self->sprites = g_list_append (self->sprites, _tmp14_);
	}
}


static void ___lambda49__entitas_event_group_changed_handler (EntitasGroup* g, EntitasEntity* e, gint index, void* component, gpointer self) {
	__lambda49_ ((SystemsDisplaySystem*) self, g, e, index, component);
}


static void __lambda51_ (SystemsDisplaySystem* self, EntitasEntity* entity) {
	gboolean _tmp0_ = FALSE;
	_tmp0_ = entitas_entity_IsActive (entity);
	if (_tmp0_) {
		EntitasEntity* _tmp1_ = NULL;
		_tmp1_ = entity;
		systems_display_system_Draw (self, _tmp1_, &(*entity).transform);
	}
}


static void ___lambda51__gfunc (gconstpointer data, gpointer self) {
	__lambda51_ ((SystemsDisplaySystem*) self, data);
}


static void __lambda50_ (SystemsDisplaySystem* self) {
	GList* _tmp0_ = NULL;
	SdxUiWindow* _tmp1_ = NULL;
	sdx_Begin ();
	_tmp0_ = self->sprites;
	g_list_foreach (_tmp0_, ___lambda51__gfunc, self);
	_tmp1_ = sdx_ui;
	sdx_ui_component_Render ((SdxUiComponent*) _tmp1_, 0, 0);
	sdx_End ();
}


static void ___lambda50__sdx_abstract_game_abstract_draw (gpointer self) {
	__lambda50_ ((SystemsDisplaySystem*) self);
}


// symtbl.3 SystemsDisplaySystem / systems_display_system
SystemsDisplaySystem* systems_display_system_retain (SystemsDisplaySystem* self);
void systems_display_system_release (SystemsDisplaySystem* self);
SystemsDisplaySystem* systems_display_system_new (Game* game, Factory* world) {
	SystemsDisplaySystem* self;
	EntitasGroup* show = NULL;
	Factory* _tmp0_ = NULL;
	gint* _tmp1_ = NULL;
	gint* _tmp2_ = NULL;
	gint _tmp2__length1 = 0;
	EntitasMatcher* _tmp3_ = NULL;
	EntitasMatcher* _tmp4_ = NULL;
	EntitasGroup* _tmp5_ = NULL;
	EntitasGroup* _tmp6_ = NULL;
	EntitasEventGroupChanged* _tmp7_ = NULL;
	EntitasEventGroupChanged* _tmp8_ = NULL;
	Game* _tmp9_ = NULL;
	g_return_val_if_fail (game != NULL, NULL);
	g_return_val_if_fail (world != NULL, NULL);
	self = g_slice_new0 (SystemsDisplaySystem);
	systems_display_system_instance_init (self);
	_tmp0_ = world;
	_tmp1_ = g_new0 (gint, 1);
	_tmp1_[0] = (gint) ENTITAS_COMPONENTS_ShowComponent;
	_tmp2_ = _tmp1_;
	_tmp2__length1 = 1;
	_tmp3_ = entitas_matcher_AllOf (_tmp2_, 1);
	_tmp4_ = _tmp3_;
	_tmp5_ = entitas_world_GetGroup ((EntitasWorld*) _tmp0_, _tmp4_);
	_tmp6_ = _tmp5_;
	_entitas_matcher_release0 (_tmp4_);
	_tmp2_ = (g_free (_tmp2_), NULL);
	show = _tmp6_;
	_tmp7_ = show->onEntityRemoved;
	entitas_event_group_changed_Add (_tmp7_, ___lambda48__entitas_event_group_changed_handler, self);
	_tmp8_ = show->onEntityAdded;
	entitas_event_group_changed_Add (_tmp8_, ___lambda49__entitas_event_group_changed_handler, self);
	_tmp9_ = game;
	(((SdxAbstractGame*) _tmp9_)->Draw_target_destroy_notify == NULL) ? NULL : (((SdxAbstractGame*) _tmp9_)->Draw_target_destroy_notify (((SdxAbstractGame*) _tmp9_)->Draw_target), NULL);
	((SdxAbstractGame*) _tmp9_)->Draw = NULL;
	((SdxAbstractGame*) _tmp9_)->Draw_target = NULL;
	((SdxAbstractGame*) _tmp9_)->Draw_target_destroy_notify = NULL;
	((SdxAbstractGame*) _tmp9_)->Draw = ___lambda50__sdx_abstract_game_abstract_draw;
	((SdxAbstractGame*) _tmp9_)->Draw_target = systems_display_system_retain (self);
	((SdxAbstractGame*) _tmp9_)->Draw_target_destroy_notify = systems_display_system_release;
	_entitas_group_release0 (show);
	return self;
}


gboolean systems_display_system_Draw (SystemsDisplaySystem* self, EntitasEntity* e, EntitasTransform* t) {
	gboolean result = FALSE;
	EntitasTransform _tmp0_ = {0};
	SdxGraphicsSprite* _tmp1_ = NULL;
	g_return_val_if_fail (self != NULL, FALSE);
	g_return_val_if_fail (t != NULL, FALSE);
	_tmp0_ = *t;
	_tmp1_ = _tmp0_.sprite;
	if (_tmp1_ != NULL) {
		EntitasTransform _tmp2_ = {0};
		SDL_Rect* _tmp3_ = NULL;
		EntitasTransform _tmp4_ = {0};
		SdxGraphicsSprite* _tmp5_ = NULL;
		gint _tmp6_ = 0;
		EntitasTransform _tmp7_ = {0};
		SdxMathVector2* _tmp8_ = NULL;
		gfloat _tmp9_ = 0.0F;
		EntitasTransform _tmp10_ = {0};
		SDL_Rect* _tmp11_ = NULL;
		EntitasTransform _tmp12_ = {0};
		SdxGraphicsSprite* _tmp13_ = NULL;
		gint _tmp14_ = 0;
		EntitasTransform _tmp15_ = {0};
		SdxMathVector2* _tmp16_ = NULL;
		gfloat _tmp17_ = 0.0F;
		EntitasTransform _tmp18_ = {0};
		SdxGraphicsSprite* _tmp19_ = NULL;
		gboolean _tmp20_ = FALSE;
		gboolean _tmp37_ = FALSE;
		EntitasTransform _tmp56_ = {0};
		SdxGraphicsSprite* _tmp57_ = NULL;
		SDL_Texture* _tmp58_ = NULL;
		EntitasTransform _tmp59_ = {0};
		SDL_Rect* _tmp60_ = NULL;
		gint _tmp61_ = 0;
		EntitasTransform _tmp62_ = {0};
		SDL_Rect* _tmp63_ = NULL;
		gint _tmp64_ = 0;
		EntitasTransform _tmp65_ = {0};
		SDL_Rect* _tmp66_ = NULL;
		guint _tmp67_ = 0U;
		EntitasTransform _tmp68_ = {0};
		SDL_Rect* _tmp69_ = NULL;
		guint _tmp70_ = 0U;
		SDL_Rect _tmp71_ = {0};
		gboolean _tmp72_ = FALSE;
		_tmp2_ = *t;
		_tmp3_ = _tmp2_.aabb;
		_tmp4_ = *t;
		_tmp5_ = _tmp4_.sprite;
		_tmp6_ = _tmp5_->width;
		_tmp7_ = *t;
		_tmp8_ = _tmp7_.scale;
		_tmp9_ = (*_tmp8_).x;
		(*_tmp3_).w = (guint) ((gint) (((gfloat) _tmp6_) * _tmp9_));
		_tmp10_ = *t;
		_tmp11_ = _tmp10_.aabb;
		_tmp12_ = *t;
		_tmp13_ = _tmp12_.sprite;
		_tmp14_ = _tmp13_->height;
		_tmp15_ = *t;
		_tmp16_ = _tmp15_.scale;
		_tmp17_ = (*_tmp16_).y;
		(*_tmp11_).h = (guint) ((gint) (((gfloat) _tmp14_) * _tmp17_));
		_tmp18_ = *t;
		_tmp19_ = _tmp18_.sprite;
		_tmp20_ = _tmp19_->centered;
		if (_tmp20_) {
			EntitasTransform _tmp21_ = {0};
			SDL_Rect* _tmp22_ = NULL;
			EntitasTransform _tmp23_ = {0};
			SdxMathVector2* _tmp24_ = NULL;
			gfloat _tmp25_ = 0.0F;
			EntitasTransform _tmp26_ = {0};
			SDL_Rect* _tmp27_ = NULL;
			guint _tmp28_ = 0U;
			EntitasTransform _tmp29_ = {0};
			SDL_Rect* _tmp30_ = NULL;
			EntitasTransform _tmp31_ = {0};
			SdxMathVector2* _tmp32_ = NULL;
			gfloat _tmp33_ = 0.0F;
			EntitasTransform _tmp34_ = {0};
			SDL_Rect* _tmp35_ = NULL;
			guint _tmp36_ = 0U;
			_tmp21_ = *t;
			_tmp22_ = _tmp21_.aabb;
			_tmp23_ = *t;
			_tmp24_ = _tmp23_.position;
			_tmp25_ = (*_tmp24_).x;
			_tmp26_ = *t;
			_tmp27_ = _tmp26_.aabb;
			_tmp28_ = (*_tmp27_).w;
			(*_tmp22_).x = (gint) (((gfloat) _tmp25_) - (_tmp28_ / 2));
			_tmp29_ = *t;
			_tmp30_ = _tmp29_.aabb;
			_tmp31_ = *t;
			_tmp32_ = _tmp31_.position;
			_tmp33_ = (*_tmp32_).y;
			_tmp34_ = *t;
			_tmp35_ = _tmp34_.aabb;
			_tmp36_ = (*_tmp35_).h;
			(*_tmp30_).y = (gint) (((gfloat) _tmp33_) - (_tmp36_ / 2));
		}
		_tmp37_ = entitas_entity_HasTint (e);
		if (_tmp37_) {
			EntitasTransform _tmp38_ = {0};
			SdxGraphicsSprite* _tmp39_ = NULL;
			SDL_Texture* _tmp40_ = NULL;
			EntitasEntity* _tmp41_ = NULL;
			EntitasTint* _tmp42_ = NULL;
			gint _tmp43_ = 0;
			EntitasEntity* _tmp44_ = NULL;
			EntitasTint* _tmp45_ = NULL;
			gint _tmp46_ = 0;
			EntitasEntity* _tmp47_ = NULL;
			EntitasTint* _tmp48_ = NULL;
			gint _tmp49_ = 0;
			EntitasTransform _tmp50_ = {0};
			SdxGraphicsSprite* _tmp51_ = NULL;
			SDL_Texture* _tmp52_ = NULL;
			EntitasEntity* _tmp53_ = NULL;
			EntitasTint* _tmp54_ = NULL;
			gint _tmp55_ = 0;
			_tmp38_ = *t;
			_tmp39_ = _tmp38_.sprite;
			_tmp40_ = _tmp39_->texture;
			_tmp41_ = e;
			_tmp42_ = (*_tmp41_).tint;
			_tmp43_ = (*_tmp42_).r;
			_tmp44_ = e;
			_tmp45_ = (*_tmp44_).tint;
			_tmp46_ = (*_tmp45_).g;
			_tmp47_ = e;
			_tmp48_ = (*_tmp47_).tint;
			_tmp49_ = (*_tmp48_).b;
			SDL_SetTextureColorMod (_tmp40_, (guint8) _tmp43_, (guint8) _tmp46_, (guint8) _tmp49_);
			_tmp50_ = *t;
			_tmp51_ = _tmp50_.sprite;
			_tmp52_ = _tmp51_->texture;
			_tmp53_ = e;
			_tmp54_ = (*_tmp53_).tint;
			_tmp55_ = (*_tmp54_).a;
			SDL_SetTextureAlphaMod (_tmp52_, (guint8) _tmp55_);
		}
		_tmp56_ = *t;
		_tmp57_ = _tmp56_.sprite;
		_tmp58_ = _tmp57_->texture;
		_tmp59_ = *t;
		_tmp60_ = _tmp59_.aabb;
		_tmp61_ = (*_tmp60_).x;
		_tmp62_ = *t;
		_tmp63_ = _tmp62_.aabb;
		_tmp64_ = (*_tmp63_).y;
		_tmp65_ = *t;
		_tmp66_ = _tmp65_.aabb;
		_tmp67_ = (*_tmp66_).w;
		_tmp68_ = *t;
		_tmp69_ = _tmp68_.aabb;
		_tmp70_ = (*_tmp69_).h;
		_tmp71_.x = _tmp61_;
		_tmp71_.y = _tmp64_;
		_tmp71_.w = (guint) _tmp67_;
		_tmp71_.h = (guint) _tmp70_;
		sdx_Render (_tmp58_, NULL, &_tmp71_);
		_tmp72_ = entitas_entity_HasText (e);
		if (_tmp72_) {
			EntitasEntity* _tmp73_ = NULL;
			EntitasText* _tmp74_ = NULL;
			SdxGraphicsSpriteTextSprite* _tmp75_ = NULL;
			SDL_Texture* _tmp76_ = NULL;
			EntitasTransform _tmp77_ = {0};
			SdxMathVector2* _tmp78_ = NULL;
			gfloat _tmp79_ = 0.0F;
			EntitasTransform _tmp80_ = {0};
			SdxMathVector2* _tmp81_ = NULL;
			gfloat _tmp82_ = 0.0F;
			EntitasEntity* _tmp83_ = NULL;
			EntitasText* _tmp84_ = NULL;
			SdxGraphicsSpriteTextSprite* _tmp85_ = NULL;
			gint _tmp86_ = 0;
			EntitasEntity* _tmp87_ = NULL;
			EntitasText* _tmp88_ = NULL;
			SdxGraphicsSpriteTextSprite* _tmp89_ = NULL;
			gint _tmp90_ = 0;
			SDL_Rect _tmp91_ = {0};
			_tmp73_ = e;
			_tmp74_ = (*_tmp73_).text;
			_tmp75_ = (*_tmp74_).sprite;
			_tmp76_ = ((SdxGraphicsSprite*) _tmp75_)->texture;
			_tmp77_ = *t;
			_tmp78_ = _tmp77_.position;
			_tmp79_ = (*_tmp78_).x;
			_tmp80_ = *t;
			_tmp81_ = _tmp80_.position;
			_tmp82_ = (*_tmp81_).y;
			_tmp83_ = e;
			_tmp84_ = (*_tmp83_).text;
			_tmp85_ = (*_tmp84_).sprite;
			_tmp86_ = ((SdxGraphicsSprite*) _tmp85_)->width;
			_tmp87_ = e;
			_tmp88_ = (*_tmp87_).text;
			_tmp89_ = (*_tmp88_).sprite;
			_tmp90_ = ((SdxGraphicsSprite*) _tmp89_)->height;
			_tmp91_.x = (gint) _tmp79_;
			_tmp91_.y = (gint) _tmp82_;
			_tmp91_.w = (guint) _tmp86_;
			_tmp91_.h = (guint) _tmp90_;
			sdx_Render (_tmp76_, NULL, &_tmp91_);
		}
	}
	result = TRUE;
	return result;
}


static void systems_display_system_instance_init (SystemsDisplaySystem * self) {
	self->ref_count = 1;
	self->sprites = NULL;
}


void systems_display_system_free (SystemsDisplaySystem* self) {
	_g_list_free0 (self->sprites);
	g_slice_free (SystemsDisplaySystem, self);
}


