/**
 * Entity Factory
 */
using entitas;
using systems;
using GLib.Math;

const double TAU = 2.0 * Math.PI; 

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

	public static sdx.graphics.TextureAtlas atlas;
	public Factory() {
		base();		
		atlas = new sdx.graphics.TextureAtlas(sdx.files.@default("assets/assets.atlas"));
		setPool(256, Pool.Count, {
			Buffer(Pool.BACKGROUND,	  1, createBackground),
			Buffer(Pool.PLAYER, 	  1, createPlayer),
			Buffer(Pool.BULLET, 	 20, createBullet),
			Buffer(Pool.ENEMY1, 	 15, createEnemy1),
			Buffer(Pool.ENEMY2,  	  5, createEnemy2),
			Buffer(Pool.ENEMY3,  	  4, createEnemy3),
			Buffer(Pool.EXPLOSION, 	 10, createExplosion),
			Buffer(Pool.BANG,      	 12, createBang),
			Buffer(Pool.PARTICLE,  	100, createParticle)
		});
	}

	/**
	 * The stuff that all entities have
	 */
	public Entity* createBase(string name, int pool, float scale = sdx.pixelFactor, bool active = false, bool centered = true) {
		return createEntity(name, pool, active)
			.setTransform(atlas.createSprite(name).setScale(scale, scale).setCentered(centered))
			.addLayer(pool);
	}

	/** 
	 *	factory methods:
	 */
	public Entity* createBackground() {
		return createBase("background", Pool.BACKGROUND, 2*sdx.pixelFactor, true, false)
			.setBackground(true);
	}

	public Entity* createPlayer() {
		return createBase("spaceshipspr", Pool.PLAYER, sdx.pixelFactor, true)
			.setPlayer(true);
	}

	public Entity* createBullet() {
		return createBase("bullet", Pool.BULLET)
			// .addSound(new audio.Sound(Sdx.files.resource("sounds/pew.wav")))
			.addTint(0xd2, 0xfa, 0, 0xfa)
			.addHealth(2, 2)
			.addVelocity(0, -800*sdx.pixelFactor)
			.setBullet(true);
	}

	public Entity* createEnemy1() {
		return createBase("enemy1", Pool.ENEMY1)
			.addHealth(10, 10)
			.addVelocity(0, 40)
			.addText("100%", new sdx.graphics.Sprite.TextSprite("100%", sdx.smallFont, sdx.Color.LimeGreen))
			.setEnemy1(true);
	}

	public Entity* createEnemy2() {
		return createBase("enemy2", Pool.ENEMY2)
			.addHealth(20, 20)
			.addVelocity(0, 30)
			.addText("100%", new sdx.graphics.Sprite.TextSprite("100%", sdx.smallFont, sdx.Color.LimeGreen))
			.setEnemy2(true);
	}

	public Entity* createEnemy3() {
		return createBase("enemy3", Pool.ENEMY3)
			.addHealth(60, 60)
			.addVelocity(0, 20)
			.addText("100%", new sdx.graphics.Sprite.TextSprite("100%", sdx.smallFont, sdx.Color.LimeGreen))
			.setEnemy3(true);
	}

	public Entity* createExplosion() {
		return createBase("explosion", Pool.EXPLOSION, 0.6f)
			// .addSound(new audio.Sound(Sdx.files.resource("sounds/asplode.wav")))
			.addTint(0xd2, 0xfa, 0xd2, 0x7f)
			.addExpires(0.2f)
			.addTween(0.006f, 0.6f, -3f, false, true);
	}

	public Entity* createBang() {
		return createBase("explosion", Pool.BANG, 0.1f)
			// .addSound(new audio.Sound(Sdx.files.resource("sounds/smallasplode.wav")))
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
		if (cache[Pool.BACKGROUND].isEmpty()) {
			cache[Pool.BACKGROUND].enque(createBackground());
			stdout.printf("out of background\n");
		}
		DisplaySystem.add(cache[Pool.BACKGROUND].deque());
	}
		
	public void addPlayer(int x, int y) {
		if (cache[Pool.PLAYER].isEmpty()) {
			cache[Pool.PLAYER].enque(createPlayer());
			stdout.printf("out of player\n");
		}
		DisplaySystem.add(cache[Pool.PLAYER].deque());
	}

	public void addBullet(int x, int y) {
		if (cache[Pool.BULLET].isEmpty()) {
			cache[Pool.BULLET].enque(createBullet());
			stdout.printf("out of bullets\n");
		}
		DisplaySystem.add(cache[Pool.BULLET].deque()
			.setPosition(x, y)
			.setActive(true));
	}

	public void addEnemy1(int x, int y) {
		if (cache[Pool.ENEMY1].isEmpty()) {
			cache[Pool.ENEMY1].enque(createEnemy1());
			stdout.printf("out of enemy1\n");
		}
		DisplaySystem.add(cache[Pool.ENEMY1].deque()
			.setPosition(x, y)
			.setHealth(10, 10)
			.setActive(true));
	}

	public void addEnemy2(int x, int y) {
		if (cache[Pool.ENEMY2].isEmpty()) {
			cache[Pool.ENEMY2].enque(createEnemy2());
			stdout.printf("out of enemy2\n");
		}
		DisplaySystem.add(cache[Pool.ENEMY2].deque()
			.setPosition(x, y)
			.setHealth(20, 20) 
			.setActive(true));
	}

	public void addEnemy3(int x, int y) {
		if (cache[Pool.ENEMY3].isEmpty()) {
			cache[Pool.ENEMY3].enque(createEnemy3());
			stdout.printf("out of enemy3\n");
		}
		DisplaySystem.add(cache[Pool.ENEMY3].deque()
			.setPosition(x, y)
			.setHealth(60, 60)
			.setActive(true));
	}

	public void addExplosion(int x, int y) {
		if (cache[Pool.EXPLOSION].isEmpty()) {
			cache[Pool.EXPLOSION].enque(createExplosion());
			stdout.printf("out of explosions\n");
		}
		var entity = cache[Pool.EXPLOSION].deque();
		DisplaySystem.add(entity
			.setBounds(x, y, (int)entity.transform.aabb.w, (int)entity.transform.aabb.h)
			.setTween(0.006f, 0.6f, -3f, false, true)
			.setPosition(x, y)
			.setScale(0.6f*sdx.pixelFactor, 0.6f*sdx.pixelFactor)
			.setExpires(0.2f)
			.setActive(true));
	}

	public void addBang(int x, int y) {
		if (cache[Pool.BANG].isEmpty()) {
			cache[Pool.BANG].enque(createBang());
			stdout.printf("out of bang\n");
		}
		var entity = cache[Pool.BANG].deque();
		DisplaySystem.add(entity
			.setBounds(x, y, (int)entity.transform.aabb.w, (int)entity.transform.aabb.h)
			.setTween(0.003f, 0.3f, -3f, false, true)
			.setPosition(x, y)
			.setScale(0.3f*sdx.pixelFactor, 0.3f*sdx.pixelFactor)
			.setExpires(0.2f)
			.setActive(true));
	}

	public void addParticle(int x, int y) {
		if (cache[Pool.PARTICLE].isEmpty()) {
			cache[Pool.PARTICLE].enque(createParticle());
			stdout.printf("out of particles\n");
		}
		var radians = sdx.getRandom() * TAU;
		var magnitude = sdx.getRandom() * 200;
		var velocityX = magnitude * Math.cos(radians);
		var velocityY = magnitude * Math.sin(radians);
		var scale = (float)sdx.getRandom();
		var entity = cache[Pool.PARTICLE].deque();
		DisplaySystem.add(entity
			.setBounds(x, y, (int)entity.transform.aabb.w, (int)entity.transform.aabb.h)
			.setPosition(x, y)
			.setScale(scale*sdx.pixelFactor, scale*sdx.pixelFactor)
			.setVelocity((float)velocityX, (float)velocityY)
			.setExpires(0.75f)
			.setActive(true));
	}
}
