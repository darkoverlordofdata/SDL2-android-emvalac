namespace Entitas {
	
	public class World : Object {
		public static World instance;
		public List<Group> groups;
		public Entity[] pool;
		public EntityCache[] cache;
		public int id = 0;
		public ISystem?[] systems = new ISystem?[100];
		public int count = 0;
		public EntityRemovedListener EntityRemoved;

		public World() {
			instance = this;
		}

		public static void OnComponentAdded(Entity* e, Components c) {
			instance.ComponentAddedOrRemoved(e, c);
		}

		public static void OnComponentRemoved(Entity* e, Components c) {
			instance.ComponentAddedOrRemoved(e, c);
		}

		public void SetPool(int size, int count, Buffer[] buffers) {
			pool = new Entity[size];
			cache = new EntityCache[count];
			for (var i=0;  i < buffers.length; i++) {
				var iPool = buffers[i].pool;
				var iSize = buffers[i].size;
				cache[iPool] = new EntityCache(); //iSize) 
				for (var k=0;  k < iSize; k++) {
					cache[iPool].Enque(buffers[i].Factory());
				}
			}
		}
				
		public World AddSystem(System system) {
			systems[count++] = system._ISystem;
			return this;
		}
		public void Initialize() {
			for (var i=0; i < count; i++)
				systems[i].Initialize();
		}

		public void Execute(float delta) {
			for (var i=0; i < count; i++)
				systems[i].Execute(delta);
		}

		public void SetEntityRemovedListener(EntityRemovedListener removed) {
			EntityRemoved = removed;
		}

		public void ComponentAddedOrRemoved(Entity* entity, Components component) {
			foreach (var group in groups)
				group.HandleEntity(entity, component);
		}

		/**
		* send antity back to it's pool
		*/		
		public void DeleteEntity(Entity* entity) {
			entity.SetActive(false);
			cache[entity.pool].Enque(entity);
			EntityRemoved(entity);
		}

		/**
		* create an entity from the pool
		*/
		public Entity* CreateEntity(string name, int pool, bool active) {
			var id = this.id++;
			return (this.pool[id]
				.SetId(id)
				.SetName(name)
				.SetPool(pool)
				.SetActive(active));
		}

		public Group GetGroup(Matcher matcher) {
			if (groups.Length() > matcher.id ) {
				return groups.Item(matcher.id).data;
			} else {
				//  groups.prepend(new Group(matcher));
				groups.Insert(new Group(matcher));
				for (var i = 0; i < this.id-1; i++) 
					groups.Head.data.HandleEntitySilently(&pool[i]);
				return groups.Head.data;
			}
		}
	}
}


