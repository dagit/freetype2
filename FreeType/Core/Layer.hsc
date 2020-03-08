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
  ft_Get_Color_Glyph_Layer
    :: FT_Face              -- ^ face
    -> FT_UInt              -- ^ base_glyph
    -> Ptr FT_UInt          -- ^ aglyph_index
    -> Ptr FT_UInt          -- ^ acolor_index
    -> Ptr FT_LayerIterator -- ^ iterator
    -> IO FT_Bool
