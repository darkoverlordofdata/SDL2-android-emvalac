/**
 * Unordered cache 
 */
namespace Entitas {

	public class EntityCache : Object {

		public Entity*[] items;
		public int size;
		
		public EntityCache(int capacity = 4) {
			items = new Entity*[capacity];
			size = 0;
		}

		public bool IsEmpty() {
			return size == 0;
		}

		public Entity* Get(int index) {
			if (index < 0 || index > size) {
				stdout.printf("Can't get cache at %d\n", index);
				return null;
			}
			return items[index];
		}

		public void Put(int index, Entity* entity) {
			if (index < 0 || index >= size) {
				stdout.printf("Can't put cache at %d\n", index);
				return;
			}
			items[index] = entity;
		}

		public void Enque(Entity* entity) {
			if (size >= items.length) Grow(items.length*2);
			items[size++] = entity;
		}

		public Entity* Deque() {
			if (size <= 0) {
				stdout.printf("Unable to pop from queue\n");
				return null;
			}
			return items[--size];
		}

		public void Grow(int newSize) {
			var temp = new List<Entity*>();
			foreach (var item in items)
				temp.Insert(item);

			items = new Entity*[newSize];

			var i = 0;
			foreach (var item in temp)
				items[i++] = item;
		
		}
	}
}			

