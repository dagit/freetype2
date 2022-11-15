#include <ft2build.h>
#include <freetype/internal/ftdebug.h>

#include <freetype/ftcolor.h>




  FT_EXPORT_DEF ( FT_Bool )
  FT_Get_Paint_Plus ( FT_Face         face                           
                    , FT_OpaquePaint* opaque_paint
                    , FT_COLR_Paint*  paint
                    )
  {
    if ( !opaque_paint )
      return 0;
    else
      return FT_Get_Paint ( face, *opaque_paint, paint );
  }
