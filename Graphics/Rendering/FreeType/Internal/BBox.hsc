{-# LANGUAGE ForeignFunctionInterface #-}
module Graphics.Rendering.FreeType.Internal.BBox
( FT_BBox(..)
) where

import Foreign

import Graphics.Rendering.FreeType.Internal.PrimitiveTypes

#include <stddef.h>
#let alignment t = "%lu", (unsigned long)offsetof(struct {char x__; t (y__); }, y__)

#include "ft2build.h"
#include FT_FREETYPE_H

#include "freetype/ftimage.h"

data FT_BBox = FT_BBox
  { xMin :: FT_Pos
  , yMin :: FT_Pos
  , xMax :: FT_Pos
  , yMax :: FT_Pos
  }
  deriving (Read, Show, Eq)

instance Storable FT_BBox where
  sizeOf    _ = #size FT_BBox
  alignment _ = #alignment FT_BBox
  peek ptr = do
    xMin' <- (#peek FT_BBox, xMin) ptr
    yMin' <- (#peek FT_BBox, yMin) ptr
    xMax' <- (#peek FT_BBox, xMax) ptr
    yMax' <- (#peek FT_BBox, yMax) ptr
    return $ FT_BBox
      { xMin = xMin'
      , yMin = yMin'
      , xMax = xMax'
      , yMax = yMax'
      }
  poke ptr val = do
    (#poke FT_BBox, xMin) ptr (xMin val)
    (#poke FT_BBox, yMin) ptr (yMin val)
    (#poke FT_BBox, xMax) ptr (xMax val)
    (#poke FT_BBox, yMax) ptr (yMax val)

