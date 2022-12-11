#include <ft2build.h>
#include <freetype/internal/ftdebug.h>

#include <freetype/ftcolor.h>



#ifdef TT_CONFIG_OPTION_COLOR_LAYERS

  FT_EXPORT_DEF ( FT_Error )
  FT_Palette_Set_Foreground_Color_ptr ( FT_Face   face
                                      , FT_Color *foreground_color
                                      )
  {
    if ( !foreground_color )
      return FT_THROW ( Invalid_Argument );
    else
      return FT_Palette_Set_Foreground_Color ( face, *foreground_color );
  }

#endif
