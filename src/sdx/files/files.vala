
namespace Sdx.Files {

	public FileHandle GetHandle(string path, FileType type) {
		return new FileHandle(path, type);
	}

	public FileHandle Resource(string path) {
		return new FileHandle(path, FileType.Resource);
	}

	public FileHandle Asset(string path) {
		return new FileHandle(path, FileType.Asset);
	}

	public FileHandle Absolute(string path) {
		return new FileHandle(path, FileType.Absolute);
	}

	public FileHandle Relative(string path) {
		return new FileHandle(path, FileType.Relative);
	}
	public FileHandle Default(string path) {
#if (EMSCRIPTEN)
		return new FileHandle(path, FileType.Relative);
#elif (ANDROID)
		return new FileHandle(path, FileType.Asset);
#elif (NOGOBJECT)
		return new FileHandle(path, FileType.Relative);
#else
		return new FileHandle(path, FileType.Resource);
#endif		
	}
}

