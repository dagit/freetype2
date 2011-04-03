{-# LANGUAGE ForeignFunctionInterface #-}
module Graphics.Rendering.FreeType.Internal.Vector
( FT_Vector(..)
) where

import Foreign.Storable

import Graphics.Rendering.FreeType.Internal.PrimitiveTypes

#include "ft2build.h"
#include FT_FREETYPE_H

data FT_Vector = FT_Vector
  { x :: FT_Pos
  , y :: FT_Pos
  }
  deriving (Read, Show, Eq)

instance Storable FT_Vector where
  sizeOf _    = #size FT_Vector
  alignment _ = alignment (undefined :: FT_Pos)
  peek ptr = do
    x' <- (#peek FT_Vector, x) ptr
    y' <- (#peek FT_Vector, y) ptr
    return $! FT_Vector x' y'
  poke ptr val = do
    (#poke FT_Vector, x) ptr (x val)
    (#poke FT_Vector, y) ptr (y val)
