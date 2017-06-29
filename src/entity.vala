/**
 * Entitas Generated Entity & Components for shmupwarz
 *
 * do not edit this file
 */
namespace entitas {
	
	public struct Entity {			   	
											/* Core component: */  
		public int 			id;				/* sequentially assigned id# */
		public string 		name; 			/* display name */
		public int 			pool;			/* pool entities by type */
		public uint64 		mask;			/* hasComponent bit array */
		public Transform 	transform;		/* core game object */

		/* ============================ */
		public Background? 	background; 
		public Bullet? 		bullet;		
		public Enemy1? 		enemy1;		
		public Enemy2? 		enemy2;		
		public Enemy3? 		enemy3;		
		public Expires? 	expires;		
		public Health? 		health;		
		public Hud? 		hud;			
		public Layer? 		layer;		
		public Player? 		player;		
		public Sound? 		sound;
		public Text? 		text;
		public Tint? 		tint;
		public Tween?		tween;
		public Velocity? 	velocity;
		/* ============================ */

		public bool hasAnyComponent(int[] indices) {
			foreach (var index in indices)
				if ((POW2[index] & mask) != 0) return true;
			return false;
		}

		public bool hasComponent(int index) {
			return (POW2[index] & mask) != 0;
		}

		public bool hasComponents(int[] indices) {
			foreach (var index in indices) 
				if ((POW2[index] & mask) == 0) return false;
			return true;
		}

		public bool isActive() {
			return (mask & ACTIVE) == ACTIVE;
		}

		public Entity* setId(int id) {
			this.id = id;
			return &this;
		}

		public Entity* setName(string name) {
			this.name = name;
			return &this;
		}

		public Entity* setActive(bool active) {
			if (((mask & ACTIVE) == ACTIVE ) == active) return &this;
			if (active) mask |= ACTIVE;
			else mask ^= ACTIVE;
			return &this;
		}

		public Entity* setBounds(int x, int y, int w, int h) {
			transform.aabb.x = x;
			transform.aabb.y = y;
			transform.aabb.w = w;
			transform.aabb.h = h;
			return &this;
		}

		public Entity* setPool(int pool) {
			this.pool = pool;
			return &this;
		}

		public Entity* setPosition(float x, float y) {
			transform.position.x = x;
			transform.position.y = y;

			if (transform.sprite.centered) {
				transform.aabb.x = (int)(x - transform.aabb.w / 2);
				transform.aabb.y = (int)(y - transform.aabb.h / 2);
			} else {
				transform.aabb.x = (int)x;
				transform.aabb.y = (int)y;
			}
			return &this;
		}

		public Entity* setScale(float x, float y) {
			transform.scale.x = x;
			transform.scale.y = y;
			return &this;
		}

		public Entity* setTransform(sdx.graphics.Sprite sprite) {
			transform = Transform(sprite);
			return &this;
		}
		
		public string toString() {
			var sb = "";
			sb = sb + id.to_string() + "(" + name + ")";
			var seperator = false;
			for (var i = 1; i<=ComponentString.length; i++) {
				if (hasComponent(i)) {
					if (seperator) sb = sb + ", ";
					sb = sb + ComponentString[i];
					seperator = true;
				}
			}
			return sb;
		}

		/**
		 * Components:
		 */

		public Entity* setBackground(bool value) {
			if (value) {
				this.background = { true };
				mask |= BACKGROUND;
			} else {
				this.background = null;
				mask ^= BACKGROUND;
			}
			return &this;
		}

		public bool isBackground() {
			return (mask & BACKGROUND) == BACKGROUND;
		}

		public Entity* setBullet(bool value) {
			if (value) {
				this.bullet = { true };
				mask |= BULLET;
				World.onComponentAdded(&this, Components.BulletComponent);
			} else {
				this.bullet = null;
				mask ^= BULLET;
				World.onComponentRemoved(&this, Components.BulletComponent);
			}
			return &this;
		}

		public bool isBullet() {
			return (mask & BULLET)  == BULLET;
		}

		public Entity* setEnemy1(bool value) {
			if (value) {
				this.enemy1 = { true };
				mask |= ENEMY1;
				World.onComponentAdded(&this, Components.Enemy1Component);
			} else {
				this.enemy1 = null;
				mask ^= ENEMY1;
				World.onComponentRemoved(&this, Components.Enemy1Component);
			}
			return &this;
		}

		public bool isEnemy1() {
			return (mask & ENEMY1) == ENEMY1;
		}

		public Entity* setEnemy2(bool value) {
			if (value) {
				this.enemy2 = { true };
				mask |= ENEMY2;
				World.onComponentAdded(&this, Components.Enemy2Component);
			} else {
				this.enemy2 = null;
				mask ^= ENEMY2;
				World.onComponentRemoved(&this, Components.Enemy2Component);
			}
			return &this;
		}

		public bool isEnemy2() {
			return (mask & ENEMY2) == ENEMY2;
		}

		public Entity* setEnemy3(bool value) {
			if (value) {
				this.enemy3 = { true };
				mask |= ENEMY3;
				World.onComponentAdded(&this, Components.Enemy3Component);
			} else {
				this.enemy3 = null;
				mask ^= ENEMY3;
				World.onComponentRemoved(&this, Components.Enemy3Component);
			}
			return &this;
		}

		public bool isEnemy3() {
			return (mask & ENEMY3) == ENEMY3;
		}

		public bool hasExpires() {
			return (mask & EXPIRES) != 0;
		}

		public Entity* addExpires(float value) {
			if ((mask & EXPIRES) == EXPIRES) throw new Exception.EntityAlreadyHasComponent("Expires");
			this.expires = { value };
			mask |= EXPIRES;
			World.onComponentAdded(&this, Components.ExpiresComponent);
			return &this;
		}

		public Entity* setExpires(float value) {
			if ((mask & EXPIRES) != EXPIRES) throw new Exception.EntityDoesNotHaveComponent("Expires");
			this.expires.value = value;
			return &this;
		}

		public Entity* removeExpires() {
			if ((mask & EXPIRES) != EXPIRES) throw new Exception.EntityDoesNotHaveComponent("Expires");
			this.expires = null;
			mask ^= EXPIRES;
			World.onComponentRemoved(&this, Components.ExpiresComponent);
			return &this;
		}

		public bool hasHealth() {
			return (mask & HEALTH) == HEALTH;
		}

		public Entity* addHealth(float current, float maximum) { 
			if ((mask & HEALTH) == HEALTH) throw new Exception.EntityAlreadyHasComponent("Health");
			this.health = { current, maximum };
			mask |= HEALTH;
			World.onComponentAdded(&this, Components.HealthComponent);
			return &this;
		}

		public Entity* setHealth(float current, float maximum) {
			if ((mask & HEALTH) != HEALTH) throw new Exception.EntityDoesNotHaveComponent("Health");
			this.health.current = current;
			this.health.maximum = maximum;
			return &this;
		}

		public Entity* removeHealth() {
			if ((mask & HEALTH) != HEALTH) throw new Exception.EntityDoesNotHaveComponent("Health");
			this.health = null;
			mask ^= HEALTH;
			World.onComponentRemoved(&this, Components.HealthComponent);
			return &this;
		}

		public Entity* setHud(bool value) {
			if (value) {
				this.hud = { true };
				mask |= HUD;
				World.onComponentAdded(&this, Components.HudComponent);
			} else {
				this.hud = null;
				mask ^= HUD;
				World.onComponentRemoved(&this, Components.HudComponent);
			}
			return &this;
		}

		public bool isHud() {
			return (mask & HUD) == HUD;
		}


		public bool hasLayer() {
			return (mask & LAYER) == LAYER;
		}

		public Entity* addLayer(int value) { 
			if ((mask & LAYER) == LAYER) throw new Exception.EntityAlreadyHasComponent("Layer");
			this.layer = { value };
			mask |= LAYER;
			World.onComponentAdded(&this, Components.LayerComponent);
			return &this;
		}

		public Entity* setLayer(int value) {
			if ((mask & LAYER) != LAYER) throw new Exception.EntityDoesNotHaveComponent("Layer");
			this.layer.value = value;
			return &this;
		}

		public Entity* removeLayer() {
			if ((mask & LAYER) != LAYER) throw new Exception.EntityDoesNotHaveComponent("Layer");
			this.layer = null;
			mask ^= LAYER;
			World.onComponentRemoved(&this, Components.LayerComponent);
			return &this;
		}

		public Entity* setPlayer(bool value) {
			if (value) {
				this.player = { true };
				mask |= PLAYER;
				World.onComponentAdded(&this, Components.PlayerComponent);
			} else {
				this.player = null;
				mask ^= PLAYER;
				World.onComponentRemoved(&this, Components.PlayerComponent);
			}
			return &this;
		}

		public bool isPlayer() {
			return (mask & PLAYER) == PLAYER;
		}

		public bool hasSound() {
			return (mask & SOUND) == SOUND;
		}

		public Entity* addSound(sdx.audio.Sound sound) {
			if ((mask & SOUND) == SOUND) throw new Exception.EntityAlreadyHasComponent("Sound");
			this.sound = { sound };
			mask |= SOUND;
			World.onComponentAdded(&this, Components.SoundComponent);
			return &this;
		}

		public Entity* setSound(sdx.audio.Sound sound) {
			if ((mask & SOUND) != SOUND) throw new Exception.EntityDoesNotHaveComponent("Sound");
			this.sound.sound = sound;
			return &this;
		}

		public Entity* removeSound() {
			if ((mask & SOUND) != SOUND) throw new Exception.EntityDoesNotHaveComponent("Sound");
			this.sound = null;
			mask ^= SOUND;
			World.onComponentRemoved(&this, Components.SoundComponent);
			return &this;
		}

		public bool hasText() {
			return (mask & TEXT) == TEXT;
		}

		public Entity* addText(string text, sdx.graphics.Sprite.TextSprite texture) { 
			if ((mask & TEXT) == TEXT) throw new Exception.EntityAlreadyHasComponent("Text");
			this.text = { text, texture };
			mask |= TEXT;
			World.onComponentAdded(&this, Components.TextComponent);
			return &this;
		}

		public Entity* setText(string text, sdx.graphics.Sprite.TextSprite texture) {
			if ((mask & TEXT) != TEXT) throw new Exception.EntityDoesNotHaveComponent("Text");
			this.text.text = text;
			this.text.sprite = texture;
			return &this;
		}

		public Entity* removeText() {
			if ((mask & TEXT) != TEXT) throw new Exception.EntityDoesNotHaveComponent("Text");
			this.text = null;
			mask ^= TEXT;
			World.onComponentRemoved(&this, Components.TextComponent);
			return &this;
		}

		public bool hasTint() {
			return (mask & TINT) == TINT;
		}

		public Entity* addTint(int r, int g, int b, int a) {
			if ((mask & TINT) == TINT) throw new Exception.EntityAlreadyHasComponent("Tint");
			this.tint = { r, g, b, a };
			mask |= TINT;
			World.onComponentAdded(&this, Components.TintComponent);
			return &this;
		}

		public Entity* setTint(int r, int g, int b, int a) {
			if ((mask & TINT) != TINT) throw new Exception.EntityDoesNotHaveComponent("Tint");
			this.tint.r = r;
			this.tint.g = g;
			this.tint.b = b;
			this.tint.a = a;
			return &this;
		}

		public Entity* removeTint() {
			if ((mask & TINT)!= TINT) throw new Exception.EntityDoesNotHaveComponent("Tint");
			this.tint = null;
			mask ^= TINT;
			World.onComponentRemoved(&this, Components.TintComponent);
			return &this;
		}

		public bool hasTween() {
			return (mask & TWEEN) == TWEEN;
		}

		public Entity* addTween(float min, float max, float speed, bool repeat, bool active) { 
			if ((mask & TWEEN) == TWEEN) throw new Exception.EntityAlreadyHasComponent("Tween");
			this.tween = { min, max, speed, repeat, active };
			mask |= TWEEN;
			World.onComponentAdded(&this, Components.TweenComponent);
			return &this;
		}

		public Entity* setTween(float min, float max, float speed, bool repeat, bool active) {
			if ((mask & TWEEN) != TWEEN) throw new Exception.EntityDoesNotHaveComponent("Tween");
			this.tween.min = min;
			this.tween.max = max;
			this.tween.speed = speed;
			this.tween.repeat = repeat;
			this.tween.active = active;
			return &this;
		}

		public Entity* removeTween() {
			if ((mask & TWEEN) != TWEEN) throw new Exception.EntityDoesNotHaveComponent("Tween");
			this.tween = null;
			mask ^= TWEEN;
			World.onComponentRemoved(&this, Components.TweenComponent);
			return &this;
		}

		public bool hasVelocity() {
			return (mask & VELOCITY) == VELOCITY;
		}

		public Entity* addVelocity(float x, float y) { 
			if ((mask & VELOCITY) == VELOCITY) throw new Exception.EntityAlreadyHasComponent("Velocity");
			this.velocity = { x, y };
			mask |= VELOCITY;
			World.onComponentAdded(&this, Components.VelocityComponent);
			return &this;
		}

		public Entity* setVelocity(float x, float y) {
			if ((mask & VELOCITY) != VELOCITY) throw new Exception.EntityDoesNotHaveComponent("Velocity");
			this.velocity.x = x;
			this.velocity.y = y;
			return &this;
		}

		public Entity* removeVelocity() {
			if ((mask & VELOCITY) != VELOCITY) throw new Exception.EntityDoesNotHaveComponent("Velocity");
			this.velocity = null;
			mask ^= VELOCITY;
			World.onComponentRemoved(&this, Components.VelocityComponent);
			return &this;
		}
	}
}
