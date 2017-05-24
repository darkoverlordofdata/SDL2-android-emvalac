namespace util {

	/**
	 * Not a replacement for string type
     *
     * String holds on to a char buffer for strings
     * returned from Posix calls so that their memory
     * will not be reclaimed.
     * @see utils.File 
	 * 
	 */
	[Compact, CCode ( /** reference counting */
		ref_function = "util_string_retain", 
		unref_function = "util_string_release"
	)]
	public class String {
		public int _retainCount = 1;
		public unowned String retain() {
			GLib.AtomicInt.add (ref _retainCount, 1);
			return this;
		}
		public void release() { 
			if (GLib.AtomicInt.dec_and_test (ref _retainCount)) this.free ();
		}
		public extern void free();
		

		public char[] buf;

		public String(string str) {
			buf = new char[str.length];
			for (var i=0 ; i<str.length; i++) 
				buf[i] = str[i];
		}
		
		public string to_string() {
			return (string)buf;
		}

	}

}