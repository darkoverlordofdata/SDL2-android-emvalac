/**
 * Comoponents
 * 
 * 
 */
namespace Entitas 
{ 
	public struct Transform 
	{
		public Sdx.Math.Vector2? scale;
		public Sdx.Math.Vector2? position;
		public SDL.Video.Rect? aabb;
 		public Sdx.Graphics.Sprite? sprite;

		public Transform(Sdx.Graphics.Sprite sprite) 
		{
			this.sprite = sprite;
			position = { 0, 0 };
			scale = { sprite.scale.x, sprite.scale.y };
			aabb = { 0, 0, sprite.width, sprite.height };
		}
	}

	[SimpleType, Immutable]
	public struct Background 
	{
		public bool active;
    }
    
	[SimpleType, Immutable]
	public struct Bullet 
	{
		public bool active;
    }

	[SimpleType, Immutable]
	public struct Enemy1 
	{
		public bool active;
    }

	[SimpleType, Immutable]
	public struct Enemy2 
	{
		public bool active;
    }

	[SimpleType, Immutable]
	public struct Enemy3 
	{
		public bool active;
    }

	[SimpleType]
	public struct Expires 
	{
		public float value; 
    }

	[SimpleType]
	public struct Health 
	{
		public float current; 
		public float maximum; 
    }

	[SimpleType, Immutable]
	public struct Hud 
	{
		public bool active;
    }

	[SimpleType]
	public struct Layer 
	{
		public int value; 
    }

	[SimpleType, Immutable]
	public struct Player 
	{
		public bool active;
    }

	[SimpleType, Immutable]
	public struct Show 
	{
		public bool active;
    }
    
	public struct Sound 
	{
		public Sdx.Audio.Sound sound;
    } 

	public struct Text 
	{
        public string text;
 		public Sdx.Graphics.Sprite.TextSprite sprite;
        
    }

	[SimpleType]
	public struct Tint 
	{
        public int r;
        public int g;
        public int b;
        public int a;
    }

	[SimpleType]
	public struct Tween 
	{
		public float min; 
		public float max; 
		public float speed; 
        public bool repeat; 
		public bool active; 
    }

	[SimpleType]
	public struct Velocity 
	{
		public float x; 
		public float y; 
    }

	/**
	 *  Component bit masks
	 */
	const uint64 UNKNOWN		= 0x00000;
	const uint64 BACKGROUND 	= 0x00001;
	const uint64 BULLET 		= 0x00002;
	const uint64 ENEMY1 		= 0x00004;
	const uint64 ENEMY2 		= 0x00008;
	const uint64 ENEMY3 		= 0x00010;
	const uint64 EXPIRES 		= 0x00020;
	const uint64 HEALTH 		= 0x00040;
	const uint64 HUD 			= 0x00080;
	const uint64 LAYER 			= 0x00100;
	const uint64 PLAYER 		= 0x00200;
	const uint64 SHOW 			= 0x00400;
	const uint64 SOUND 			= 0x00800;
	const uint64 TEXT 			= 0x01000;
	const uint64 TINT 			= 0x02000;
	const uint64 TWEEN 			= 0x04000;
	const uint64 VELOCITY 		= 0x08000;
	const uint64 ACTIVE 		= 0x8000000000000000;

	/**
	* Component names
	*/
	const string[] ComponentString = 
	{
		"Unknown",
		"Background",
		"Bullet",
		"Enemy1",
		"Enemy2",
		"Enemy3",
		"Expires",
		"Health",
		"Hud",
		"Layer",
		"Player",
		"Show",
		"Sound",
		"Text",
		"Tint",
		"Tween",
		"Velocity"
	};

	/**
	* Components
	*/
	public enum Components 
	{
		UnknownComponent,
		BackgroundComponent,
		BulletComponent,
		Enemy1Component,
		Enemy2Component,
		Enemy3Component,
		ExpiresComponent,
		HealthComponent,
		HudComponent,
		LayerComponent,
		PlayerComponent,
		ShowComponent,
		SoundComponent,
		TextComponent,
		TintComponent,
		TweenComponent,
		VelocityComponent
    }
}
