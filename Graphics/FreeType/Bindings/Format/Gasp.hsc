{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}

module Graphics.FreeType.Bindings.Format.Gasp where

import           Graphics.FreeType.Bindings.Core.Base
import           Graphics.FreeType.Bindings.Core.Types

import           Foreign.C.Types

#include "ft2build.h"
#include FT_FREETYPE_H

#include FT_GASP_H

pattern FT_GASP_NO_TABLE
      , FT_GASP_DO_GRIDFIT
      , FT_GASP_DO_GRAY
      , FT_GASP_SYMMETRIC_GRIDFIT
      , FT_GASP_SYMMETRIC_SMOOTHING
     :: FT_Int
pattern FT_GASP_NO_TABLE            = #const FT_GASP_NO_TABLE
pattern FT_GASP_DO_GRIDFIT          = #const FT_GASP_DO_GRIDFIT
pattern FT_GASP_DO_GRAY             = #const FT_GASP_DO_GRAY
pattern FT_GASP_SYMMETRIC_GRIDFIT   = #const FT_GASP_SYMMETRIC_GRIDFIT
pattern FT_GASP_SYMMETRIC_SMOOTHING = #const FT_GASP_SYMMETRIC_SMOOTHING



foreign import ccall "FT_Get_Gasp"
  ft_Get_Gasp :: FT_Face -> FT_UInt -> IO FT_Int
