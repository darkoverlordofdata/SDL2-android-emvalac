using Sdx.Files;

namespace Sdx {

	public enum FileType {
		Resource = 1,		/* Path to memory GResource */
		Asset,				/* Android asset folder */
		Absolute,			/* Absolute filesystem path.  */
		Relative			/* Path relative to the pwd */
		//  Parent = 0x10		/* Placeholder for the parent path  */
	}
	
	public class DataInputStream : Object {
		public string[] data; 
		public int ctr;
		public DataInputStream(string data) {
			this.data = data.Split("\n");

			ctr = 0;
		}
		public string? ReadLine() {
			return ctr<data.length ? data[ctr++] : null;
		}
	}
}
