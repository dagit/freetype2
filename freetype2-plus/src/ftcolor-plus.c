#include <ft2build.h>
#include FT_INTERNAL_DEBUG_H

#include FT_COLOR_H



#ifdef TT_CONFIG_OPTION_COLOR_LAYERS

  FT_EXPORT_DEF ( FT_Error )
  FT_Palette_Set_Foreground_Color_Plus ( FT_Face   face
                                       , FT_Color *foreground_color
                                       )
  {
    if ( !foreground_color )
      return FT_THROW ( Invalid_Argument );
    else
      return FT_Palette_Set_Foreground_Color ( face, *foreground_color );
  }

#endif
