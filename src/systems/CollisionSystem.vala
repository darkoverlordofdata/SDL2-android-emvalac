using Entitas;
namespace Systems {
	/**
	* game systems
	*/
	public class CollisionSystem : System {
		public CollisionSystem(Game game, Factory world) {
			var bullets = world.getGroup(Matcher.allOf({ Components.BulletComponent }));
			var enemies = world.getGroup(Matcher.anyOf({
					Components.Enemy1Component, 
					Components.Enemy2Component, 
					Components.Enemy3Component
			}));

			/**
			* physics system
			* model movement
			*/
			update = (delta) => {
				enemies.entities.forEach(enemy => {
					if (enemy.isActive()) {
						bullets.entities.forEach(bullet => {
							if (bullet.isActive()) {
								if (bullet.transform.aabb.HasIntersection(enemy.transform.aabb)) {
									var x = (int)((float)bullet.transform.position.x);
									var y = (int)((float)bullet.transform.position.y);
									world.addBang(x, y);
									world.deleteEntity(bullet.setShow(false));
									for (var i=0; i<3; i++) 
										world.addParticle(x, y);
									if (enemy.health != null) {
										var current = enemy.health.current - 2;
										if (current < 0) {
											world.addExplosion(x, y);
											world.deleteEntity(enemy.setShow(false));
										} 
										else {
											enemy.health.current = current;
										}
									} 
									return;
								}
							}
						});
					}
				});
			};
		}
	}
}			
