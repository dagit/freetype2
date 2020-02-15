{-# LANGUAGE ForeignFunctionInterface #-}

module FreeType.Raw.Core.Layer where

import           FreeType.Raw.Core.Base
import           FreeType.Raw.Core.Types

import           Foreign.C.Types
import           Foreign.Ptr
import           Foreign.Storable

#include "ft2build.h"
#include FT_FREETYPE_H

data FT_LayerIterator = FT_LayerIterator
                          { liNum_layers :: FT_UInt
                          , liLayer      :: FT_UInt
                          , liP          :: Ptr FT_Byte
                          }

instance Storable FT_LayerIterator where
  sizeOf _    = #size      struct FT_LayerIterator_
  alignment _ = #alignment struct FT_LayerIterator_

  peek ptr =
    FT_LayerIterator
      <$> #{peek struct FT_LayerIterator_, num_layers} ptr
      <*> #{peek struct FT_LayerIterator_, layer     } ptr
      <*> #{peek struct FT_LayerIterator_, p         } ptr
   
  poke ptr val = do
    #{poke struct FT_LayerIterator_, num_layers} ptr $ liNum_layers val
    #{poke struct FT_LayerIterator_, layer     } ptr $ liLayer      val
    #{poke struct FT_LayerIterator_, p         } ptr $ liP          val



foreign import ccall "FT_Get_Color_Glyph_Layer"
  ft_Get_Color_Glyph_Layer :: FT_Face -> FT_UInt -> Ptr FT_UInt -> Ptr FT_UInt -> Ptr FT_LayerIterator -> IO FT_Bool
