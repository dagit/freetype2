#ifndef INTERNAL_WRAPPER_H
#define INTERNAL_WRAPPER_H
#if __GLASGOW_HASKELL__ && __GLASGOW_HASKELL__ < 409
#include <Rts.h>
#endif
#include <HsFFI.h>
#if __NHC__
#undef HsChar
#define HsChar int
#endif
#include "ft2build.h"
#include FT_FREETYPE_H
#include <stddef.h>

extern FT_Error w_FT_New_Face(FT_Library *library,
                             const char *filepathname,
                             FT_Long     face_index,
                             FT_Face    *aface)
;

extern FT_Error w_FT_Set_Char_Size(FT_Face *face,
                                  FT_F26Dot6 char_width,
                                  FT_F26Dot6 char_height,
                                  FT_UInt horz_resolution,
                                  FT_UInt vert_resolution)
;

extern FT_Error w_FT_Set_Pixel_Sizes(FT_Face *face,
                                    FT_UInt  pixel_width,
                                    FT_UInt  pixel_height)
;

extern FT_UInt w_FT_Get_Char_Index(FT_Face  *face,
                                  FT_ULong  charcode)
;

extern void w_FT_Set_Transform (FT_Face   *face,
                               FT_Matrix *matrix,
                               FT_Vector *delta)
;

extern FT_Error w_FT_Load_Char(FT_Face  *face,
                              FT_ULong char_code,
                              FT_Int32 load_flags)
;

extern FT_Error w_FT_Done_Face(FT_Face *face)
;

extern FT_Error w_FT_Done_FreeType(FT_Library *library)
;

#endif
