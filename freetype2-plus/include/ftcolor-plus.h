#include <ft2build.h>
#include FT_FREETYPE_H
#include FT_COLOR_H



FT_BEGIN_HEADER

  FT_EXPORT ( FT_Bool )
  FT_Get_Paint_Plus ( FT_Face         face
                    , FT_OpaquePaint* opaque_paint
                    , FT_COLR_Paint*  paint
                    );

FT_END_HEADER
