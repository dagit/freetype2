{-# LANGUAGE ForeignFunctionInterface, EmptyDataDecls #-}
module Graphics.Rendering.FreeType.Internal.Matrix
( FT_Matrix(..)
) where

import Foreign
import Foreign.Storable

import Graphics.Rendering.FreeType.Internal.PrimitiveTypes

#include "ft2build.h"
#include FT_FREETYPE_H

#include "internal/ftobjs.h"

data FT_Matrix = FT_Matrix
  { xx, xy :: FT_Fixed
  , yx, yy :: FT_Fixed
  }
  deriving (Read, Show, Eq)

instance Storable FT_Matrix where
  sizeOf _    = #size FT_Matrix
  alignment _ = alignment (undefined :: FT_Fixed)
  peek ptr = do
    xx' <- (#peek FT_Matrix, xx) ptr
    xy' <- (#peek FT_Matrix, xy) ptr
    yx' <- (#peek FT_Matrix, yx) ptr
    yy' <- (#peek FT_Matrix, yy) ptr
    return $! FT_Matrix xx' xy' yx' yy'
  poke ptr val = do
    (#poke FT_Matrix, xx) ptr (xx val)
    (#poke FT_Matrix, xy) ptr (xy val)
    (#poke FT_Matrix, yx) ptr (yx val)
    (#poke FT_Matrix, yy) ptr (yy val)
