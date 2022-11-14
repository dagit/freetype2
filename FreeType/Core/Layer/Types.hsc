{-# LANGUAGE DataKinds
           , FlexibleInstances
           , MultiParamTypeClasses #-}
#if __GLASGOW_HASKELL__ >= 902
{-# LANGUAGE NoFieldSelectors #-}
#endif
{-# LANGUAGE TypeApplications #-}

module FreeType.Core.Layer.Types where

import           FreeType.Core.Types.Types

import           Foreign.Ptr
import           Foreign.Storable
import           Foreign.Storable.Offset

#include "ft2build.h"
#include FT_FREETYPE_H

data FT_LayerIterator = FT_LayerIterator
                          { num_layers :: FT_UInt
                          , layer      :: FT_UInt
                          , p          :: Ptr FT_Byte
                          }

instance Offset "num_layers" FT_LayerIterator where rawOffset = #{offset struct FT_LayerIterator_, num_layers}
instance Offset "layer"      FT_LayerIterator where rawOffset = #{offset struct FT_LayerIterator_, layer     }
instance Offset "p"          FT_LayerIterator where rawOffset = #{offset struct FT_LayerIterator_, p         }

instance Storable FT_LayerIterator where
  sizeOf _    = #size      struct FT_LayerIterator_
  alignment _ = #alignment struct FT_LayerIterator_

  peek ptr =
    FT_LayerIterator
      <$> peek (offset @"num_layers" ptr)
      <*> peek (offset @"layer"      ptr)
      <*> peek (offset @"p"          ptr)

  poke ptr val = do
    pokeField @"num_layers" ptr val
    pokeField @"layer"      ptr val
    pokeField @"p"          ptr val
