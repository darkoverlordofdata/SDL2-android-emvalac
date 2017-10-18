/** updated by adriac */
/* utils.c generated by valac 0.34.9, the Vala compiler
 * generated from utils.vala, do not modify */

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

#include <glib.h>
#include <glib-object.h>


#define SDX_UTILS_TYPE_ALIGN (sdx_utils_align_get_type ())

typedef enum  {
	SDX_UTILS_ALIGN_Center = 1 << 0,
	SDX_UTILS_ALIGN_Top = 1 << 1,
	SDX_UTILS_ALIGN_Bottom = 1 << 2,
	SDX_UTILS_ALIGN_Left = 1 << 3,
	SDX_UTILS_ALIGN_Right = 1 << 4,
	SDX_UTILS_ALIGN_TopLeft = SDX_UTILS_ALIGN_Top | SDX_UTILS_ALIGN_Left,
	SDX_UTILS_ALIGN_TopRight = SDX_UTILS_ALIGN_Top | SDX_UTILS_ALIGN_Right,
	SDX_UTILS_ALIGN_BottomLeft = SDX_UTILS_ALIGN_Bottom | SDX_UTILS_ALIGN_Left,
	SDX_UTILS_ALIGN_BottomRight = SDX_UTILS_ALIGN_Bottom | SDX_UTILS_ALIGN_Right
} SdxUtilsAlign;



GType sdx_utils_align_get_type (void) G_GNUC_CONST;


GType sdx_utils_align_get_type (void) {
	static volatile gsize sdx_utils_align_type_id__volatile = 0;
	if (g_once_init_enter (&sdx_utils_align_type_id__volatile)) {
		static const GEnumValue values[] = {{SDX_UTILS_ALIGN_Center, "SDX_UTILS_ALIGN_Center", "center"}, {SDX_UTILS_ALIGN_Top, "SDX_UTILS_ALIGN_Top", "top"}, {SDX_UTILS_ALIGN_Bottom, "SDX_UTILS_ALIGN_Bottom", "bottom"}, {SDX_UTILS_ALIGN_Left, "SDX_UTILS_ALIGN_Left", "left"}, {SDX_UTILS_ALIGN_Right, "SDX_UTILS_ALIGN_Right", "right"}, {SDX_UTILS_ALIGN_TopLeft, "SDX_UTILS_ALIGN_TopLeft", "topleft"}, {SDX_UTILS_ALIGN_TopRight, "SDX_UTILS_ALIGN_TopRight", "topright"}, {SDX_UTILS_ALIGN_BottomLeft, "SDX_UTILS_ALIGN_BottomLeft", "bottomleft"}, {SDX_UTILS_ALIGN_BottomRight, "SDX_UTILS_ALIGN_BottomRight", "bottomright"}, {0, NULL, NULL}};
		GType sdx_utils_align_type_id;
		sdx_utils_align_type_id = g_enum_register_static ("SdxUtilsAlign", values);
		g_once_init_leave (&sdx_utils_align_type_id__volatile, sdx_utils_align_type_id);
	}
	return sdx_utils_align_type_id__volatile;
}


