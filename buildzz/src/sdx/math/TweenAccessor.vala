/* ******************************************************************************
 * Copyright 2017 darkoverlordofdata.
 * 
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *   http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 ******************************************************************************/
namespace  Sdx.Math 
{
    
    /**
     * Gets one or many values from the target object associated to the
     * given tween type. It is used by the Tween Engine to determine starting
     * values.
     *
     * @param target The target object of the tween.
     * @param tweenType An integer representing the tween type.
     * @param returnValues An array which should be modified by this method.
     * @return The count of modified slots from the returnValues array.
     */
    public delegate int TweenAccessorGetValues(void* target, int tweenType, ref float[] returnValues);
    /**
     * This method is called by the Tween Engine each time a running tween
     * associated with the current target object has been updated.
     *
     * @param target The target object of the tween.
     * @param tweenType An integer representing the tween type.
     * @param newValues The new values determined by the Tween Engine.
     */
    public delegate void TweenAccessorSetValues(void* target, int tweenType, ref float[] newValues);
    [Compact, CCode ( /** reference counting */
    	ref_function = "sdx_math_tween_accessor_retain", 
    	unref_function = "sdx_math_tween_accessor_release"
    )]
    public class TweenAccessor {
    	public int ref_count = 1;
    	public unowned TweenAccessor retain() {
    		GLib.AtomicInt.add (ref ref_count, 1);
    		return this;
    	}
    	public void release() { 
    		if (GLib.AtomicInt.dec_and_test (ref ref_count)) this.free ();
    	}
    	public extern void free();
		
        public TweenAccessorGetValues GetValues = (target, type, ref values) => 
        {
            return 0;
        };

        public TweenAccessorSetValues SetValues = (target, type, ref values) => {};

        
    }

}