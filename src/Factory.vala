/**
 * Entity Factory
 */
using Sdx;
using Entitas;
using Systems;
using GLib.Math;

const double TAU = 2.0 * GLib.Math.PI; 

/** Allocations for entity pools */
const int COUNT_BACKGROUND 	=   1;
const int COUNT_PLAYER 		=   1;
const int COUNT_BULLET 		=  20;
const int COUNT_ENEMY1 		=  15;
const int COUNT_ENEMY2 		=   5;
const int COUNT_ENEMY3 		=   4;
const int COUNT_EXPLOSION 	=  10;
const int COUNT_BANG 		=  12;
const int COUNT_PARTICLE 	= 100;

const int COUNT_ALL 
		= COUNT_BACKGROUND
		+ COUNT_PLAYER
		+ COUNT_BULLET
		+ COUNT_ENEMY1
		+ COUNT_ENEMY2
		+ COUNT_ENEMY3
		+ COUNT_EXPLOSION
		+ COUNT_BANG
		+ COUNT_PARTICLE;

/* entity types - each gets a pool partition  */
enum Pool {
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
public class Factory : World {

	//public static Sdx.Graphics.TextureAtlas atlas;
	public Factory() {
		base();		
		//atlas = new Sdx.Graphics.TextureAtlas(Sdx.Files.Default("assets/assets.atlas"));
		setPool(COUNT_ALL, Pool.Count, 
			{
				Buffer(Pool.BACKGROUND,	COUNT_BACKGROUND,	createBackground),
				Buffer(Pool.PLAYER, 	COUNT_PLAYER, 		createPlayer),
				Buffer(Pool.BULLET, 	COUNT_BULLET, 		createBullet),
				Buffer(Pool.ENEMY1, 	COUNT_ENEMY1, 		createEnemy1),
				Buffer(Pool.ENEMY2,  	COUNT_ENEMY2, 		createEnemy2),
				Buffer(Pool.ENEMY3,  	COUNT_ENEMY3, 		createEnemy3),
				Buffer(Pool.EXPLOSION, 	COUNT_EXPLOSION, 	createExplosion),
				Buffer(Pool.BANG,      	COUNT_BANG, 		createBang),
				Buffer(Pool.PARTICLE,  	COUNT_PARTICLE, 	createParticle)
			}
		);
	}
	/**
	 * The stuff that all entities have
	 */
<<<<<<< HEAD
	public Entity* createBase(string name, int pool, float scale = Sdx.pixelFactor, bool active = false, bool centered = true) {
		return createEntity(name, pool, active)
			.setTransform(Sdx.atlas.createSprite(name).setScale(scale, scale).setCentered(centered))
=======
	public Entity* createBase(string name, int pool, float scale = pixelFactor, bool active = false, bool centered = true) {
		return createEntity(name, pool, active)
			.setTransform(atlas.createSprite(name).setScale(scale, scale).setCentered(centered))
>>>>>>> 567011efbfecd90ad3cb72df824157cddf1aca1c
			.addLayer(pool);
	}

	/** 
	 *	factory methods:
	 */
	public Entity* createBackground() {
<<<<<<< HEAD
		return createBase("background", Pool.BACKGROUND, 2*Sdx.pixelFactor, true, false)
=======
		return createBase("background", Pool.BACKGROUND, 2*pixelFactor, true, false)
>>>>>>> 567011efbfecd90ad3cb72df824157cddf1aca1c
			.setBackground(true);
	}

	public Entity* createPlayer() {
<<<<<<< HEAD
		return createBase("spaceshipspr", Pool.PLAYER, Sdx.pixelFactor, true)
=======
		return createBase("spaceshipspr", Pool.PLAYER, pixelFactor, true)
>>>>>>> 567011efbfecd90ad3cb72df824157cddf1aca1c
			.setPlayer(true);
	}

	public Entity* createBullet() {
		return createBase("bullet", Pool.BULLET)
<<<<<<< HEAD
			.addSound(new Sdx.Audio.Sound(Sdx.Files.resource("assets/sounds/pew.wav")))
			.addTint(0xd2, 0xfa, 0, 0xfa)
			.addHealth(2, 2)
			.addVelocity(0, -800*Sdx.pixelFactor)
=======
			.addSound(new Audio.Sound(Files.resource("assets/sounds/pew.wav")))
			.addTint(0xd2, 0xfa, 0, 0xfa)
			.addHealth(2, 2)
			.addVelocity(0, -800*pixelFactor)
>>>>>>> 567011efbfecd90ad3cb72df824157cddf1aca1c
			.setBullet(true);
	}

	public Entity* createEnemy1() {
		return createBase("enemy1", Pool.ENEMY1)
			.addHealth(10, 10)
			.addVelocity(0, 40)
<<<<<<< HEAD
			.addText("100%", new Sdx.Graphics.Sprite.TextSprite("100%", Sdx.smallFont, Sdx.Color.LimeGreen))
=======
			.addText("100%", new Graphics.Sprite.TextSprite("100%", smallFont, Color.LimeGreen))
>>>>>>> 567011efbfecd90ad3cb72df824157cddf1aca1c
			.setEnemy1(true);
	}

	public Entity* createEnemy2() {
		return createBase("enemy2", Pool.ENEMY2)
			.addHealth(20, 20)
			.addVelocity(0, 30)
<<<<<<< HEAD
			.addText("100%", new Sdx.Graphics.Sprite.TextSprite("100%", Sdx.smallFont, Sdx.Color.LimeGreen))
=======
			.addText("100%", new Graphics.Sprite.TextSprite("100%", smallFont, Color.LimeGreen))
>>>>>>> 567011efbfecd90ad3cb72df824157cddf1aca1c
			.setEnemy2(true);
	}

	public Entity* createEnemy3() {
		return createBase("enemy3", Pool.ENEMY3)
			.addHealth(60, 60)
			.addVelocity(0, 20)
<<<<<<< HEAD
			.addText("100%", new Sdx.Graphics.Sprite.TextSprite("100%", Sdx.smallFont, Sdx.Color.LimeGreen))
=======
			.addText("100%", new Graphics.Sprite.TextSprite("100%", smallFont, Color.LimeGreen))
>>>>>>> 567011efbfecd90ad3cb72df824157cddf1aca1c
			.setEnemy3(true);
	}

	public Entity* createExplosion() {
		return createBase("explosion", Pool.EXPLOSION, 0.6f)
<<<<<<< HEAD
			.addSound(new Sdx.Audio.Sound(Sdx.Files.resource("assets/sounds/asplode.wav")))
=======
			.addSound(new Audio.Sound(Files.resource("assets/sounds/asplode.wav")))
>>>>>>> 567011efbfecd90ad3cb72df824157cddf1aca1c
			.addTint(0xd2, 0xfa, 0xd2, 0x7f)
			.addExpires(0.2f)
			.addTween(0.006f, 0.6f, -3f, false, true);
	}

	public Entity* createBang() {
		return createBase("explosion", Pool.BANG, 0.1f)
<<<<<<< HEAD
			.addSound(new Sdx.Audio.Sound(Sdx.Files.resource("assets/sounds/smallasplode.wav")))
=======
			.addSound(new Audio.Sound(Files.resource("assets/sounds/smallasplode.wav")))
>>>>>>> 567011efbfecd90ad3cb72df824157cddf1aca1c
			.addTint(0xd2, 0xfa, 0xd2, 0x9f)
			.addExpires(0.2f)
			.addTween(0.001f, 0.1f, -3f, false, true);
	}

	public Entity* createParticle() {
		return createBase("star", Pool.PARTICLE)
			.addTint(0xd2, 0xfa, 0xd2, 0xfa)
			.addExpires(0.75f)
			.addVelocity(0, 0);
	}
	/**
	 * Get entity from the pool and
	 * put it on the screen at (x,y)
	 */
	public void addBackground(int x, int y) {
		if (cache[Pool.BACKGROUND].IsEmpty()) 
			cache[Pool.BACKGROUND].Push(createBackground());

		var entity = cache[Pool.BACKGROUND].Pop();
		entity.setShow(true);
	}
		
	public void addPlayer(int x, int y) {
		if (cache[Pool.PLAYER].IsEmpty()) 
			cache[Pool.PLAYER].Push(createPlayer());
			
		var entity = cache[Pool.PLAYER].Pop();
		entity.setShow(true);
	}

	public void addBullet(int x, int y) {
		if (cache[Pool.BULLET].IsEmpty()) 
			cache[Pool.BULLET].Push(createBullet());
			
		var entity = cache[Pool.BULLET].Pop();
		entity.setShow(true)
			.setPosition(x, y)
			.setActive(true);
	}

	public void addEnemy(int enemy, int x, int y) {
		switch (enemy) {
			case 1: addEnemy1(x, y); return;
			case 2: addEnemy2(x, y); return;
			case 3: addEnemy3(x, y); return;
		}
	}

	public void addEnemy1(int x, int y) {
		if (cache[Pool.ENEMY1].IsEmpty()) 
			cache[Pool.ENEMY1].Push(createEnemy1());

		var entity = cache[Pool.ENEMY1].Pop();
		entity.setShow(true)
			.setPosition(x, y)
			.setHealth(10, 10)
			.setActive(true);
	}

	public void addEnemy2(int x, int y) {
		if (cache[Pool.ENEMY2].IsEmpty()) 
			cache[Pool.ENEMY2].Push(createEnemy2());
			
		var entity = cache[Pool.ENEMY2].Pop();
		entity.setShow(true)
			.setPosition(x, y)
			.setHealth(20, 20) 
			.setActive(true);
	}

	public void addEnemy3(int x, int y) {
		if (cache[Pool.ENEMY3].IsEmpty()) 
			cache[Pool.ENEMY3].Push(createEnemy3());
			
		var entity = cache[Pool.ENEMY3].Pop();
		entity.setShow(true)
			.setPosition(x, y)
			.setHealth(60, 60)
			.setActive(true);
	}

	public void addExplosion(int x, int y) 
	{
		if (cache[Pool.EXPLOSION].IsEmpty()) 
			cache[Pool.EXPLOSION].Push(createExplosion());
			
		var entity = cache[Pool.EXPLOSION].Pop();
		entity
			.setShow(true)
			.setBounds(x, y, (int)entity.transform.aabb.w, (int)entity.transform.aabb.h)
			.setTween(0.006f, 0.6f, -3f, false, true)
			.setPosition(x, y)
<<<<<<< HEAD
			.setScale(0.6f*Sdx.pixelFactor, 0.6f*Sdx.pixelFactor)
=======
			.setScale(0.6f*pixelFactor, 0.6f*pixelFactor)
>>>>>>> 567011efbfecd90ad3cb72df824157cddf1aca1c
			.setExpires(0.2f)
			.setActive(true);
	}

	public void addBang(int x, int y) 
	{
		if (cache[Pool.BANG].IsEmpty()) 
			cache[Pool.BANG].Push(createBang());
			
		var entity = cache[Pool.BANG].Pop();
		entity
			.setShow(true)
			.setBounds(x, y, (int)entity.transform.aabb.w, (int)entity.transform.aabb.h)
			.setTween(0.003f, 0.3f, -3f, false, true)
			.setPosition(x, y)
<<<<<<< HEAD
			.setScale(0.3f*Sdx.pixelFactor, 0.3f*Sdx.pixelFactor)
=======
			.setScale(0.3f*pixelFactor, 0.3f*pixelFactor)
>>>>>>> 567011efbfecd90ad3cb72df824157cddf1aca1c
			.setExpires(0.2f)
			.setActive(true);
	}

	public void addParticle(int x, int y) 
	{
		if (cache[Pool.PARTICLE].IsEmpty()) 
			cache[Pool.PARTICLE].Push(createParticle());
			
<<<<<<< HEAD
		var radians = Sdx.getRandom() * TAU;
		var magnitude = Sdx.getRandom() * 200;
		var velocityX = magnitude * Math.cos(radians);
		var velocityY = magnitude * Math.sin(radians);
		var scale = (float)Sdx.getRandom();
=======
		var radians = getRandom() * TAU;
		var magnitude = getRandom() * 200;
		var velocityX = magnitude * GLib.Math.cos(radians);
		var velocityY = magnitude * GLib.Math.sin(radians);
		var scale = (float)getRandom();
>>>>>>> 567011efbfecd90ad3cb72df824157cddf1aca1c
		var entity = cache[Pool.PARTICLE].Pop();
		entity
			.setShow(true)
			.setBounds(x, y, (int)entity.transform.aabb.w, (int)entity.transform.aabb.h)
			.setPosition(x, y)
<<<<<<< HEAD
			.setScale(scale*Sdx.pixelFactor, scale*Sdx.pixelFactor)
=======
			.setScale(scale*pixelFactor, scale*pixelFactor)
>>>>>>> 567011efbfecd90ad3cb72df824157cddf1aca1c
			.setVelocity((float)velocityX, (float)velocityY)
			.setExpires(0.75f)
			.setActive(true);
	}
}
