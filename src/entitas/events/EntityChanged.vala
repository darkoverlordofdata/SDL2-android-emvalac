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
    public delegate void OnEntityChanged(Entity* e, int index,  void* component);
    
    public class EntityChanged : Object 
    {
        public class Listener : Object 
        {
            public OnEntityChanged event;
            public Listener(OnEntityChanged event)
            {
                this.event = event;
            }
        }
        public List<Listener> listeners;
        public EntityChanged() 
        {
            listeners = new List<Listener>();
        }

        public void Add(OnEntityChanged event) 
        {
            listeners.Add(new Listener(event));
        }

        public void Remove(OnEntityChanged event)
        {
            foreach (var listener in listeners) {
                if (listener.event == event) {
                    listeners.Remove(listener);
                    return;
                }
            }
        }
        public void Clear()
        {
            listeners = new List<Listener>();
        }

        public void Dispatch(Entity* e, int index, void* component)
        {
            foreach (var listener in listeners)
            {
                listener.event(e, index, component);
            }
        }
    }
}