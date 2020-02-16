{-# LANGUAGE ForeignFunctionInterface #-}
{-# OPTIONS_HADDOCK hide #-}

module FreeType.Raw.Core.Layer.Internal where

import           FreeType.Raw.Core.Base.Internal
import           FreeType.Raw.Core.Types.Internal

import           Foreign.C.Types
import           Foreign.Ptr

#include "ft2build.h"
#include FT_FREETYPE_H

data FT_LayerIterator = FT_LayerIterator
                          { liNum_layers :: FT_UInt
                          , liLayer      :: FT_UInt
                          , liP          :: Ptr FT_Byte
                          }



foreign import ccall "FT_Get_Color_Glyph_Layer"
  ft_Get_Color_Glyph_Layer :: FT_Face -> FT_UInt -> Ptr FT_UInt -> Ptr FT_UInt -> Ptr FT_LayerIterator -> IO FT_Bool
