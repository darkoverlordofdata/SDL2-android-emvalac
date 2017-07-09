/**
 * Entity Factory
 */
using Entitas;
using Systems;
using GLib.Math;

const double TAU = 2.0 * Math.PI; 

/* entity types - each gets a pool partition  */
enum Pool 
{
	BACKGROUND,
	ENEMY1,
	ENEMY2,
	ENEMY3,
	PLAYER,
	BULLET,
	EXPLOSION,
	BANG,
	PARTICLE,
	HUD,
	Count
}


/**
 * fabricate specialized entities
 */
public class Factory : World 
{

	public static Sdx.Graphics.TextureAtlas atlas;
	public Factory() 
	{
		base();		
		atlas = new Sdx.Graphics.TextureAtlas(Sdx.Files.Default("assets/assets.atlas"));

		SetPool(256, Pool.Count, 
			{
				Buffer(Pool.BACKGROUND,	  1, CreateBackground),
				Buffer(Pool.PLAYER, 	  1, CreatePlayer),
				Buffer(Pool.BULLET, 	 20, CreateBullet),
				Buffer(Pool.ENEMY1, 	 15, CreateEnemy1),
				Buffer(Pool.ENEMY2,  	  5, CreateEnemy2),
				Buffer(Pool.ENEMY3,  	  4, CreateEnemy3),
				Buffer(Pool.EXPLOSION, 	 10, CreateExplosion),
				Buffer(Pool.BANG,      	 12, CreateBang),
				Buffer(Pool.PARTICLE,  	100, CreateParticle)
			}
		);
	}

	/**
	 * The stuff that all entities have
	 */
	public Entity* CreateBase(string name, int pool, float scale = Sdx.pixelFactor, bool active = false, bool centered = true) 
	{
		return CreateEntity(name, pool, active)
			.SetTransform(atlas.CreateSprite(name).SetScale(scale, scale).SetCentered(centered))
			.AddLayer(pool);
	}

	/** 
	 *	factory methods:
	 */
	public Entity* CreateBackground() 
	{
		return CreateBase("background", Pool.BACKGROUND, 2*Sdx.pixelFactor, true, false)
			.SetBackground(true);
	}

	public Entity* CreatePlayer() 
	{
		return CreateBase("spaceshipspr", Pool.PLAYER, Sdx.pixelFactor, true)
			.SetPlayer(true);
	}

	public Entity* CreateBullet() 
	{
		return CreateBase("bullet", Pool.BULLET)
			// .addSound(new audio.Sound(Sdx.files.resource("sounds/pew.wav")))
			.AddTint(0xd2, 0xfa, 0, 0xfa)
			.AddHealth(2, 2)
			.AddVelocity(0, -800*Sdx.pixelFactor)
			.SetBullet(true);
	}

	public Entity* CreateEnemy1() 
	{
		return CreateBase("enemy1", Pool.ENEMY1)
			.AddHealth(10, 10)
			.AddVelocity(0, 40)
			.AddText("100%", new Sdx.Graphics.Sprite.TextSprite("100%", Sdx.smallFont, Sdx.Color.LimeGreen))
			.SetEnemy1(true);
	}

	public Entity* CreateEnemy2() 
	{
		return CreateBase("enemy2", Pool.ENEMY2)
			.AddHealth(20, 20)
			.AddVelocity(0, 30)
			.AddText("100%", new Sdx.Graphics.Sprite.TextSprite("100%", Sdx.smallFont, Sdx.Color.LimeGreen))
			.SetEnemy2(true);
	}

	public Entity* CreateEnemy3() 
	{
		return CreateBase("enemy3", Pool.ENEMY3)
			.AddHealth(60, 60)
			.AddVelocity(0, 20)
			.AddText("100%", new Sdx.Graphics.Sprite.TextSprite("100%", Sdx.smallFont, Sdx.Color.LimeGreen))
			.SetEnemy3(true);
	}

	public Entity* CreateExplosion() 
	{
		return CreateBase("explosion", Pool.EXPLOSION, 0.6f)
			// .addSound(new audio.Sound(Sdx.files.resource("sounds/asplode.wav")))
			.AddTint(0xd2, 0xfa, 0xd2, 0x7f)
			.AddExpires(0.2f)
			.AddTween(0.006f, 0.6f, -3f, false, true);
	}

	public Entity* CreateBang() 
	{
		return CreateBase("explosion", Pool.BANG, 0.1f)
			// .addSound(new audio.Sound(Sdx.files.resource("sounds/smallasplode.wav")))
			.AddTint(0xd2, 0xfa, 0xd2, 0x9f)
			.AddExpires(0.2f)
			.AddTween(0.001f, 0.1f, -3f, false, true);
	}

	public Entity* CreateParticle() 
	{
		return CreateBase("star", Pool.PARTICLE)
			.AddTint(0xd2, 0xfa, 0xd2, 0xfa)
			.AddExpires(0.75f)
			.AddVelocity(0, 0);
	}

	/**
	 * Get entity from the pool and
	 * put it on the screen at (x,y)
	 */
	public void AddBackground(int x, int y) 
	{
		if (cache[Pool.BACKGROUND].IsEmpty()) 
		{
			cache[Pool.BACKGROUND].Enque(CreateBackground());
			Sdx.Log("out of background\n");
		}
		cache[Pool.BACKGROUND].Deque()
			.SetShow(true);
	}
		
	public void AddPlayer(int x, int y) 
	{
		if (cache[Pool.PLAYER].IsEmpty()) 
		{
			cache[Pool.PLAYER].Enque(CreatePlayer());
			Sdx.Log("out of player\n");
		}
		cache[Pool.PLAYER].Deque()
			.SetShow(true);
	}

	public void AddBullet(int x, int y) 
	{
		if (cache[Pool.BULLET].IsEmpty()) 
		{
			cache[Pool.BULLET].Enque(CreateBullet());
			Sdx.Log("out of bullets\n");
		}
		cache[Pool.BULLET].Deque()
			.SetShow(true)
			.SetPosition(x, y)
			.SetActive(true);
	}

	public void AddEnemy1(int x, int y) 
	{
		if (cache[Pool.ENEMY1].IsEmpty()) 
		{
			cache[Pool.ENEMY1].Enque(CreateEnemy1());
			Sdx.Log("out of enemy1\n");
		}
		cache[Pool.ENEMY1].Deque()
			.SetShow(true)
			.SetPosition(x, y)
			.SetHealth(10, 10)
			.SetActive(true);
	}

	public void AddEnemy2(int x, int y) 
	{
		if (cache[Pool.ENEMY2].IsEmpty()) 
		{
			cache[Pool.ENEMY2].Enque(CreateEnemy2());
			Sdx.Log("out of enemy2\n");
		}
		cache[Pool.ENEMY2].Deque()
			.SetShow(true)
			.SetPosition(x, y)
			.SetHealth(20, 20) 
			.SetActive(true);
	}

	public void AddEnemy3(int x, int y) 
	{
		if (cache[Pool.ENEMY3].IsEmpty()) 
		{
			cache[Pool.ENEMY3].Enque(CreateEnemy3());
			Sdx.Log("out of enemy3\n");
		}
		cache[Pool.ENEMY3].Deque()
			.SetShow(true)
			.SetPosition(x, y)
			.SetHealth(60, 60)
			.SetActive(true);
	}

	public void AddExplosion(int x, int y) 
	{
		if (cache[Pool.EXPLOSION].IsEmpty()) 
		{
			cache[Pool.EXPLOSION].Enque(CreateExplosion());
			Sdx.Log("out of explosions\n");
		}
		var entity = cache[Pool.EXPLOSION].Deque();
		entity
			.SetShow(true)
			.SetBounds(x, y, (int)entity.transform.aabb.w, (int)entity.transform.aabb.h)
			.SetTween(0.006f, 0.6f, -3f, false, true)
			.SetPosition(x, y)
			.SetScale(0.6f*Sdx.pixelFactor, 0.6f*Sdx.pixelFactor)
			.SetExpires(0.2f)
			.SetActive(true);
	}

	public void AddBang(int x, int y) 
	{
		if (cache[Pool.BANG].IsEmpty()) 
		{
			cache[Pool.BANG].Enque(CreateBang());
			Sdx.Log("out of bang\n");
		}
		var entity = cache[Pool.BANG].Deque();
		entity
			.SetShow(true)
			.SetBounds(x, y, (int)entity.transform.aabb.w, (int)entity.transform.aabb.h)
			.SetTween(0.003f, 0.3f, -3f, false, true)
			.SetPosition(x, y)
			.SetScale(0.3f*Sdx.pixelFactor, 0.3f*Sdx.pixelFactor)
			.SetExpires(0.2f)
			.SetActive(true);
	}

	public void AddParticle(int x, int y) 
	{
		if (cache[Pool.PARTICLE].IsEmpty()) 
		{
			cache[Pool.PARTICLE].Enque(CreateParticle());
			Sdx.Log("out of particles\n");
		}
		var radians = Sdx.GetRandom() * TAU;
		var magnitude = Sdx.GetRandom() * 200;
		var velocityX = magnitude * Math.cos(radians);
		var velocityY = magnitude * Math.sin(radians);
		var scale = (float)Sdx.GetRandom();
		var entity = cache[Pool.PARTICLE].Deque();
		entity
			.SetShow(true)
			.SetBounds(x, y, (int)entity.transform.aabb.w, (int)entity.transform.aabb.h)
			.SetPosition(x, y)
			.SetScale(scale*Sdx.pixelFactor, scale*Sdx.pixelFactor)
			.SetVelocity((float)velocityX, (float)velocityY)
			.SetExpires(0.75f)
			.SetActive(true);
	}
}
