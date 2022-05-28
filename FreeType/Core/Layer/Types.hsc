{-# LANGUAGE DataKinds
           , MultiParamTypeClasses
           , TypeApplications #-}

module FreeType.Core.Layer.Types where

import           FreeType.Core.Types.Types

import           Foreign.Ptr
import           Foreign.Storable
import           Foreign.Storable.Offset

#include "ft2build.h"
#include FT_FREETYPE_H

data FT_LayerIterator = FT_LayerIterator
                          { liNum_layers :: FT_UInt
                          , liLayer      :: FT_UInt
                          , liP          :: Ptr FT_Byte
                          }

instance Offset "liNum_layers" FT_LayerIterator where rawOffset = #{offset struct FT_LayerIterator_, num_layers}
instance Offset "liLayer"      FT_LayerIterator where rawOffset = #{offset struct FT_LayerIterator_, layer     }
instance Offset "liP"          FT_LayerIterator where rawOffset = #{offset struct FT_LayerIterator_, p         }

instance Storable FT_LayerIterator where
  sizeOf _    = #size      struct FT_LayerIterator_
  alignment _ = #alignment struct FT_LayerIterator_

  peek ptr =
    FT_LayerIterator
      <$> peek (offset @"liNum_layers" ptr)
      <*> peek (offset @"liLayer"      ptr)
      <*> peek (offset @"liP"          ptr)

  poke ptr val = do
    pokeField @"liNum_layers" ptr val
    pokeField @"liLayer"      ptr val
    pokeField @"liP"          ptr val
