using entitas;
namespace systems {
	/**
	* game systems
	*/
	public class CollisionSystem : System {
		public CollisionSystem(Game game, Factory world) {

			var bullets = world.getGroup(Matcher.AllOf({ Components.BulletComponent }));
			var enemies = world.getGroup(Matcher.AnyOf({
				Components.Enemy1Component, 
				Components.Enemy2Component, 
				Components.Enemy3Component
			}));

			/**
			* physics system
			* model movement
			*/
			execute = (delta) => {
				foreach (var enemy in enemies.entities) {
					if (enemy.isActive()) {
						foreach (var bullet in bullets.entities) {
							if (bullet.isActive()) {
								if (bullet.transform.aabb.is_intersecting(enemy.transform.aabb)) {
									var x = (int)((float)bullet.transform.position.x);
									var y = (int)((float)bullet.transform.position.y);
									world.addBang(x, y);
									world.deleteEntity(bullet);
									for (var i=0; i<3; i++) 
										world.addParticle(x, y);
									if (enemy.health != null) {
										var current = enemy.health.current - 2;
										if (current < 0) {
											world.addExplosion(x, y);
											world.deleteEntity(enemy);
										} else {
											enemy.health.current = current;
										}
									} 
									return;
								}
							}
						}
					}
				}
			};
		}
	}
}			
