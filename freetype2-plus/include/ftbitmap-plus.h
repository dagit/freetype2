#include <ft2build.h>
#include FT_FREETYPE_H
#include FT_BITMAP_H



FT_BEGIN_HEADER

  FT_EXPORT ( FT_Error )
  FT_Bitmap_Blend_Plus ( FT_Library        library
                       , const FT_Bitmap*  source
                       , const FT_Vector  *source_offset
                       , FT_Bitmap*        target
                       , FT_Vector        *atarget_offset
                       , FT_Color         *color
                       );

FT_END_HEADER
