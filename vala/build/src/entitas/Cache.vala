/**
 * Unordered cache 
 */
namespace entitas {
	[Compact, CCode ( /** reference counting */
		ref_function = "entitas_cache_retain", 
		unref_function = "entitas_cache_release"
	)]
	public class Cache {
		public int _retainCount = 1;
		public unowned Cache retain() {
			GLib.AtomicInt.add (ref _retainCount, 1);
			return this;
		}
		public void release() { 
			if (GLib.AtomicInt.dec_and_test (ref _retainCount)) this.free ();
		}
		public extern void free();
		

		public Entity*[] items;
		public int size;
		
		public Cache(int capacity = 4) {
			items = new Entity*[capacity];
			size = 0;
		}

		public bool isEmpty() {
			return size == 0;
		}

		public Entity* get(int index) {
			if (index < 0 || index > size) {
				stdout.printf("Can't get cache at %d\n", index);
				return null;
			}
			return items[index];
		}

		public void put(int index, Entity* entity) {
			if (index < 0 || index >= size) {
				stdout.printf("Can't put cache at %d\n", index);
				return;
			}
			items[index] = entity;
		}

		public void enque(Entity* entity) {
			if (size >= items.length) grow(items.length*2);
			items[size++] = entity;
		}

		public Entity* deque() {
			if (size <= 0) {
				stdout.printf("Unable to pop from queue\n");
				return null;
			}
			return items[--size];
		}

		public void grow(int newSize) {
			var temp = new List<Entity*>();
			foreach (var item in items)
				temp.prepend(item);

			items = new Entity*[newSize];

			var i = 0;
			foreach (var item in temp)
				items[i++] = item;
		
		}
	}
}			

