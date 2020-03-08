{-# LANGUAGE ForeignFunctionInterface #-}

module FreeType.Core.Layer
  ( -- ** FT_LayerIterator
    FT_LayerIterator (..)
    -- ** FT_Get_Color_Glyph_Layer
  , ft_Get_Color_Glyph_Layer
  ) where

import           FreeType.Core.Base.Types
import           FreeType.Core.Layer.Types
import           FreeType.Core.Types.Types

import           Foreign.Ptr

#include "ft2build.h"
#include FT_FREETYPE_H

foreign import ccall "FT_Get_Color_Glyph_Layer"
  ft_Get_Color_Glyph_Layer :: FT_Face -> FT_UInt -> Ptr FT_UInt -> Ptr FT_UInt -> Ptr FT_LayerIterator -> IO FT_Bool
