namespace Entitas {

	public class Group : Object {
		public Matcher matcher;
		public List<Entity*> entities;
		
		public Group(Matcher matcher) {
			this.matcher = matcher;
		}

		/** Add entity to group */
		public void HandleEntitySilently(Entity* entity) {
			if (matcher.Matches(entity)) 
				entities.Insert(entity);
			else 
				entities.Remove(entity);
		}

		/** Add entity to group and raise events */
		public void HandleEntity(Entity* entity, Components index) {
			if (matcher.Matches(entity))
				entities.Insert(entity);
			else
				entities.Remove(entity);
		} 


		public bool ContainsEntity(Entity* entity) {
			return entities.Find(entity) != null;
		}

		public Entity* GetSingleEntity() { 
			var c = entities.Length();
			if (c == 1) {
				return (Entity*)entities.Head.data;
			} else if (c == 0) {
				return null;
			} else {
				throw new Exception.SingleEntity(matcher.ToString());
			}
		}
	}
}
						
