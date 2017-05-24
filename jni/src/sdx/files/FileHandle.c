/* FileHandle.c generated by valac 0.34.8, the Vala compiler
 * generated from FileHandle.vala, do not modify */


#include <glib.h>
#include <glib-object.h>
#include <stdlib.h>
#include <string.h>

typedef struct _sdxfilesFileHandle sdxfilesFileHandle;
typedef struct _utilFile utilFile;

#define SDX_TYPE_FILE_TYPE (sdx_file_type_get_type ())
void util_file_release (utilFile* self);
void util_file_free (utilFile* self);
utilFile* util_file_retain (utilFile* self);
#define _util_file_release0(var) ((var == NULL) ? NULL : (var = (util_file_release (var), NULL)))
#define _g_free0(var) (var = (g_free (var), NULL))

typedef enum  {
	SDX_FILE_TYPE_Internal,
	SDX_FILE_TYPE_Resource,
	SDX_FILE_TYPE_External,
	SDX_FILE_TYPE_Absolute,
	SDX_FILE_TYPE_Local
} sdxFileType;

struct _sdxfilesFileHandle {
	gint _retainCount;
	utilFile* file;
	gchar* path;
	sdxFileType type;
};



void sdx_files_file_handle_free (sdxfilesFileHandle* self);
void util_file_free (utilFile* self);
GType sdx_file_type_get_type (void) G_GNUC_CONST;
static void sdx_files_file_handle_instance_init (sdxfilesFileHandle * self);
sdxfilesFileHandle* sdx_files_file_handle_retain (sdxfilesFileHandle* self);
void sdx_files_file_handle_release (sdxfilesFileHandle* self);
void sdx_files_file_handle_free (sdxfilesFileHandle* self);
sdxfilesFileHandle* sdx_files_file_handle_new (const gchar* path, sdxFileType type);
utilFile* util_file_new (const gchar* path);


sdxfilesFileHandle* sdx_files_file_handle_retain (sdxfilesFileHandle* self) {
	sdxfilesFileHandle* result = NULL;
	g_return_val_if_fail (self != NULL, NULL);
	g_atomic_int_add ((volatile gint *) (&self->_retainCount), 1);
	result = self;
	return result;
}


void sdx_files_file_handle_release (sdxfilesFileHandle* self) {
	gboolean _tmp0_ = FALSE;
	g_return_if_fail (self != NULL);
	_tmp0_ = g_atomic_int_dec_and_test ((volatile gint *) (&self->_retainCount));
	if (_tmp0_) {
		sdx_files_file_handle_free (self);
	}
}


sdxfilesFileHandle* sdx_files_file_handle_new (const gchar* path, sdxFileType type) {
	sdxfilesFileHandle* self;
	const gchar* _tmp0_ = NULL;
	gchar* _tmp1_ = NULL;
	sdxFileType _tmp2_ = 0;
	const gchar* _tmp3_ = NULL;
	utilFile* _tmp4_ = NULL;
	g_return_val_if_fail (path != NULL, NULL);
	self = g_slice_new0 (sdxfilesFileHandle);
	sdx_files_file_handle_instance_init (self);
	_tmp0_ = path;
	_tmp1_ = g_strdup (_tmp0_);
	_g_free0 (self->path);
	self->path = _tmp1_;
	_tmp2_ = type;
	self->type = _tmp2_;
	_tmp3_ = path;
	_tmp4_ = util_file_new (_tmp3_);
	_util_file_release0 (self->file);
	self->file = _tmp4_;
	return self;
}


static void sdx_files_file_handle_instance_init (sdxfilesFileHandle * self) {
	self->_retainCount = 1;
}


void sdx_files_file_handle_free (sdxfilesFileHandle* self) {
	_util_file_release0 (self->file);
	_g_free0 (self->path);
	g_slice_free (sdxfilesFileHandle, self);
}



