using Entitas;
namespace Systems {
	/**
	* game systems
	*/
	public class CollisionSystem : System {
		public CollisionSystem(Game game, Factory world) {

			var bullets = world.GetGroup(Matcher.AllOf({ Components.BulletComponent }));
			var enemies = world.GetGroup(Matcher.AnyOf({
				Components.Enemy1Component, 
				Components.Enemy2Component, 
				Components.Enemy3Component
			}));

			/**
			* physics system
			* model movement
			*/
			Execute = (delta) => {
				foreach (var enemy in enemies.entities) {
					if (enemy.IsActive()) {
						foreach (var bullet in bullets.entities) {
							if (bullet.IsActive()) {
								if (bullet.transform.aabb.HasIntersection(enemy.transform.aabb)) {
									var x = (int)((float)bullet.transform.position.x);
									var y = (int)((float)bullet.transform.position.y);
									world.AddBang(x, y);
									world.DeleteEntity(bullet);
									for (var i=0; i<3; i++) 
										world.AddParticle(x, y);
									if (enemy.health != null) {
										var current = enemy.health.current - 2;
										if (current < 0) {
											world.AddExplosion(x, y);
											world.DeleteEntity(enemy);
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
