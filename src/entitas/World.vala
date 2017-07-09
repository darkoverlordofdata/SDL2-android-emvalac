/*******************************************************************************
 *# MIT License
 *
 * Copyright (c) 2015-2017 Bruce Davidson &lt;darkoverlordofdata@gmail.com&gt;
 *
 * Permission is hereby granted, free of charge, to any person obtaining
 * a copy of this software and associated documentation files (the
 * 'Software'), to deal in the Software without restriction, including
 * without limitation the rights to use, copy, modify, merge, publish,
 * distribute, sublicense, and/or sell copies of the Software, and to
 * permit persons to whom the Software is furnished to do so, subject to
 * the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
 * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
 * IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
 * CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
 * TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
 * SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
namespace Entitas 
{	
	public class World : Object 
	{
        /**
         * The world singleton instance
         * @type World
         * @name entitas.World#instance */
		public static World instance;
		public int id = 0;
		public Entity[] pool;
		public ISystem[] systems;
		public EntityCache[] cache;
		public List<Group> groups;

        /**
         * Subscribe to IEntity Created Event
         * @type Entitas.WorldChanged */
		public WorldChanged onEntityCreated;

        /**
         * Subscribe to IEntity Will Be Destroyed Event
         * @type Entitas.WorldChanged */
		public WorldChanged onEntityWillBeDestroyed;

        /**
         * Subscribe to IEntity Destroyed Event
         * @type Entitas.WorldChanged */
		public WorldChanged onEntityDestroyed;

        /**
         * Subscribe to Group Created Event
         * @type Entitas.GroupsChanged */
		public GroupsChanged onGroupCreated;

		public World() 
		{
			instance = this;
			systems = new ISystem[0];
            onGroupCreated = new GroupsChanged();
            onEntityCreated = new WorldChanged();
            onEntityDestroyed = new WorldChanged();
            onEntityWillBeDestroyed = new WorldChanged();
		}

		public static void OnComponentAdded(Entity* entity, Components index, void* component) 
		{
			instance.ComponentAddedOrRemoved(entity, index, component);
		}

		public static void OnComponentRemoved(Entity* entity, Components index, void* component) 
		{
			instance.ComponentAddedOrRemoved(entity, index, component);
		}

		public void SetPool(int size, int count, Buffer[] buffers) 
		{
			pool = new Entity[size];
			cache = new EntityCache[count];
			for (var i=0;  i < buffers.length; i++) 
			{
				var iPool = buffers[i].pool;
				var iSize = buffers[i].size;
				cache[iPool] = new EntityCache(); //iSize) 
				for (var k=0;  k < iSize; k++) 
				{
					cache[iPool].Enque(buffers[i].Factory());
				}
			}
		}
				
        /**
         * add System
         * @param entitas.ISystem|Function
         * @returns entitas.ISystem
         */
		public World AddSystem(System system) 
		{
			// make a local copy of the array
			// so we can copy and concat

			var sy = systems;
			sy += system.ISystem;
			systems = sy;
			return this;
		}

        /**
         * Initialize Systems
         */
		public void Initialize() 
		{
			foreach (var system in systems)
				system.Initialize();
		}

        /**
         * Execute Systems
         */
		public void Execute(float delta) 
		{
			foreach (var system in systems)
				system.Execute(delta);
		}

        /**
         * @param entitas.IEntity entity
         * @param number index
         * @param entitas.IComponent component
         */
		public void ComponentAddedOrRemoved(Entity* entity, Components index, void* component) 
		{
			foreach (var group in groups)
				group.HandleEntity(entity, index, component);
		}

        /**
         * Destroy an entity
         * @param entitas.IEntity entity
         */
		public void DeleteEntity(Entity* entity) 
		{
            onEntityWillBeDestroyed.Dispatch(this, entity);
			entity.Destroy();
            onEntityDestroyed.Dispatch(this, entity);
			cache[entity.pool].Enque(entity);

			//EntityRemoved(entity);
		}

        /**
         * Create a new entity
         * @param string name
         * @returns entitas.IEntity
         */
		public Entity* CreateEntity(string name, int pool, bool active) 
		{
			var id = this.id++;
			return (this.pool[id]
				.SetId(id)
				.SetName(name)
				.SetPool(pool)
				.SetActive(active));
		}

       /**
         * Gets all of the entities that match
         *
         * @param entias.IMatcher matcher
         * @returns entitas.Group
         */
 		public Group GetGroup(Matcher matcher) 
		{
			if (groups.Length() > matcher.id ) 
			{
				return groups.Item(matcher.id).data;
			} 
			else 
			{
				//  groups.prepend(new Group(matcher));
				groups.Insert(new Group(matcher));
				for (var i = 0; i < this.id-1; i++) 
					groups.Head.data.HandleEntitySilently(&pool[i]);
                onGroupCreated.Dispatch(this, groups.Head.data);
				return groups.Head.data;
			}
		}
	}
}


