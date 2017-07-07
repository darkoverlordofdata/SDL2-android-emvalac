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

	public class EntityCache : Object 
	{

		public Entity*[] items;
		public int size;
		
		public EntityCache(int capacity = 4) 
		{
			items = new Entity*[capacity];
			size = 0;
		}

		public bool IsEmpty() 
		{
			return size == 0;
		}

		public Entity* Get(int index) 
		{
			if (index < 0 || index > size) 
			{
				stdout.printf("Can't get cache at %d\n", index);
				return null;
			}
			return items[index];
		}

		public void Put(int index, Entity* entity) 
		{
			if (index < 0 || index >= size) 
			{
				stdout.printf("Can't put cache at %d\n", index);
				return;
			}
			items[index] = entity;
		}

		public void Enque(Entity* entity) 
		{
			if (size >= items.length) Grow(items.length*2);
			items[size++] = entity;
		}

		public Entity* Deque() 
		{
			if (size <= 0) 
			{
				stdout.printf("Unable to pop from queue\n");
				return null;
			}
			return items[--size];
		}

		public void Grow(int newSize) 
		{
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

