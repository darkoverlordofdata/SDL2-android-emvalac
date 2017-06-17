/**
 * Comoponents
 * 
 * 
 */
namespace entitas { 
    // wtf vala?
	public SDL.Video.Rect unused0;	
    // doesn't compile without the dummy declaration
	public struct Bounds : SDL.Video.Rect {}

	public struct Vector2 {
		public float x;
		public float y;

		public Vector2(float x = 0, float y = 0) {
			this.x = x;
			this.y = y;
		}
	}

	public struct Transform {
		public Vector2 scale;
		public Vector2 position;
		public SDL.Video.Rect aabb;
 		public sdx.graphics.Sprite? sprite;

		public Transform(int width=0, int height=0) {
			position = { 0, 0 };
			scale = { 1, 1 };
			aabb = { 0, 0, width, height };
		}

	}

	[SimpleType, Immutable]
	public struct Background {
		public bool active;
    }
    
	[SimpleType, Immutable]
	public struct Bullet {
		public bool active;
    }

	[SimpleType, Immutable]
	public struct Enemy1 {
		public bool active;
    }

	[SimpleType, Immutable]
	public struct Enemy2 {
		public bool active;
    }

	[SimpleType, Immutable]
	public struct Enemy3 {
		public bool active;
    }

	[SimpleType]
	public struct Expires {
		public float value; 
    }

	[SimpleType]
	public struct Health {
		public float current; 
		public float maximum; 
    }

	[SimpleType, Immutable]
	public struct Hud {
		public bool active;
    }

	[SimpleType]
	public struct Index {
		public int value; 
		public int limit;
		public bool vertical;
    }

	[SimpleType]
	public struct Layer {
		public int value; 
    }

	[SimpleType]
	public struct Position {
		public float x; 
		public float y; 
    }

	[SimpleType]
	public struct Scale {
		public float x; 
		public float y; 
    }


	// public struct Sound {
	// 	public SDL.Chunk sound;
    // } 

	public struct Sprite {
 		public sdx.graphics.Sprite sprite;
		public int width;
		public int height;
    }

	public struct Text {
        public string text;
 		public sdx.graphics.Sprite.TextSprite sprite;
        
    }

	[SimpleType]
	public struct Tint {
        public int r;
        public int g;
        public int b;
        public int a;
    }

	[SimpleType]
	public struct Tween {
		public float min; 
		public float max; 
		public float speed; 
        public bool repeat; 
		public bool active; 
    }

	[SimpleType]
	public struct Velocity {
		public float x; 
		public float y; 
    }

	/**
	 *  Component bit masks
	 */
	const uint64 BACKGROUND 	= 0x0001;
	const uint64 BOUNDS 		= 0x0002;
	const uint64 BULLET 		= 0x0004;
	const uint64 ENEMY1 		= 0x0008;
	const uint64 ENEMY2 		= 0x0010;
	const uint64 ENEMY3 		= 0x0020;
	const uint64 EXPIRES 		= 0x0040;
	const uint64 HEALTH 		= 0x0080;
	const uint64 HUD 			= 0x0100;
	const uint64 INDEX 			= 0x0200;
	const uint64 LAYER 			= 0x0400;
	const uint64 POSITION 		= 0x0800;
	const uint64 SCALE 			= 0x1000;
	// const uint64 SOUND 			= 0x2000;
	const uint64 SPRITE 		= 0x4000;
	const uint64 TEXT 			= 0x8000;
	const uint64 TINT 			= 0x10000;
	const uint64 TWEEN 			= 0x20000;
	const uint64 VELOCITY 		= 0x40000;
	const uint64 ACTIVE 		= 0x8000000000000000;

	/**
	* Component names
	*/
	const string[] ComponentString = {
		"",
		"Background",
		"Bounds",
		"Bullet",
		"Enemy1",
		"Enemy2",
		"Enemy3",
		"Expires",
		"Health",
		"Hud",
		"Index",
		"Layer",
		"Position",
		"Scale",
		"Sound",
		"Sprite",
		"Text",
		"Tint",
		"Tween",
		"Velocity"
	};

	/**
	* Components
	*/
	public enum Components {
		BackgroundComponent = 1,
		BoundsComponent,
		BulletComponent,
		Enemy1Component,
		Enemy2Component,
		Enemy3Component,
		ExpiresComponent,
		HealthComponent,
		HudComponent,
		IndexComponent,
		LayerComponent,
		PositionComponent,
		ScaleComponent,
		SoundComponent,
		SpriteComponent,
		TextComponent,
		TintComponent,
		TweenComponent,
		VelocityComponent,
		COUNT = 19
    }

    
}