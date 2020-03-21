#include <ft2build.h>
#include FT_INTERNAL_DEBUG_H

#include FT_BITMAP_H



  FT_EXPORT_DEF ( FT_Error )
  FT_Bitmap_Blend_Plus ( FT_Library        library
                       , const FT_Bitmap*  source_
                       , const FT_Vector  *source_offset_
                       , FT_Bitmap*        target
                       , FT_Vector        *atarget_offset
                       , FT_Color         *color
                       )
  {
    if ( !source_offset_ || !color )
      return FT_THROW ( Invalid_Argument );
    else
      return FT_Bitmap_Blend ( library, source_, *source_offset_, target, atarget_offset, *color );
  }
