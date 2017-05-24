using entitas;
namespace systems {
	/**
	* game systems
	*/
	[Compact, CCode ( /** reference counting */
		ref_function = "systems_animation_system_retain", 
		unref_function = "systems_animation_system_release"
	)]
	public class AnimationSystem {
		public int _retainCount = 1;
		public unowned AnimationSystem retain() {
			GLib.AtomicInt.add (ref _retainCount, 1);
			return this;
		}
		public void release() { 
			if (GLib.AtomicInt.dec_and_test (ref _retainCount)) this.free ();
		}
		public extern void free();
		
		public ISystem _ISystem { get { return { initialize, execute }; } }

		public Game game;
		public Factory world;
		public Group tweens;

		public AnimationSystem(Game game, Factory world) {
			this.game = game;
			this.world = world;
		}

		public void initialize(){
			tweens = world.getGroup(Matcher.AllOf({Components.TweenComponent}));
		}


		/**
		* physics system
		* model movement
		*/
		public void execute(double delta) {

			foreach (var entity in tweens.entities) {
				if (entity.isActive()) {
					var x = entity.scale.x + (entity.tween.speed * delta);
					var y = entity.scale.y + (entity.tween.speed * delta);
					var active = entity.tween.active;

					if (x > entity.tween.max) {
						x = entity.tween.max;
						y = entity.tween.max;
						active = false;
					} else if (x < entity.tween.min) {
						x = entity.tween.min;
						y = entity.tween.min;
						active = false;
					}
					
					entity.scale.x = x; 
					entity.scale.y = y;
					entity.tween.active = active;
				}
			}
		}
	}
} 




