{-# OPTIONS_GHC -fno-warn-orphans #-}

module FreeType.Raw.Core.Layer
  ( module FreeType.Raw.Core.Layer.Internal
  ) where

import           FreeType.Raw.Core.Layer.Internal
import           FreeType.Lens

import           Foreign.Storable
import           Lens.Micro ((^.))

#include "ft2build.h"
#include FT_FREETYPE_H

instance Storable FT_LayerIterator where
  sizeOf _    = #size      struct FT_LayerIterator_
  alignment _ = #alignment struct FT_LayerIterator_

  peek ptr =
    FT_LayerIterator
      <$> #{peek struct FT_LayerIterator_, num_layers} ptr
      <*> #{peek struct FT_LayerIterator_, layer     } ptr
      <*> #{peek struct FT_LayerIterator_, p         } ptr

  poke ptr val = do
    #{poke struct FT_LayerIterator_, num_layers} ptr $ val^.num_layers
    #{poke struct FT_LayerIterator_, layer     } ptr $ val^.layer
    #{poke struct FT_LayerIterator_, p         } ptr $ val^.p
