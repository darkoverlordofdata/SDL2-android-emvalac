/**
 * Unordered cache 
 */
namespace util {
	[Compact, CCode ( /** reference counting */
		ref_function = "util_cache_retain", 
		unref_function = "util_cache_release"
	)]
	public class Cache<T> {
		public int _retainCount = 1;
		public unowned Cache<T> retain() {
			GLib.AtomicInt.add (ref _retainCount, 1);
			return this;
		}
		public void release() { 
			if (GLib.AtomicInt.dec_and_test (ref _retainCount)) this.free ();
		}
		public extern void free();
		

		public T[] items;
		public int size;
		
		public Cache(int capacity = 4) {
			items = new T[capacity];
			size = 0;
		}

		public bool isEmpty() {
			return size == 0;
		}

		public T get(int index) {
			if (index < 0 || index > size) {
				stdout.printf("Can't get cache at %d\n", index);
				return null;
			}
			return items[index];
		}

		public void put(int index, T entity) {
			if (index < 0 || index >= size) {
				stdout.printf("Can't put cache at %d\n", index);
				return;
			}
			items[index] = entity;
		}

		public void enque(T entity) {
			if (size >= items.length) grow(items.length*2);
			items[size++] = entity;
		}

		public T deque() {
			if (size <= 0) {
				stdout.printf("Unable to pop from queue\n");
				return null;
			}
			return items[--size];
		}

		public void grow(int newSize) {
			var temp = new List<T>();
			foreach (var item in items)
				temp.prepend(item);

			items = new T[newSize];

			var i = 0;
			foreach (var item in temp)
				items[i++] = item;
		
		}
	}
}			

