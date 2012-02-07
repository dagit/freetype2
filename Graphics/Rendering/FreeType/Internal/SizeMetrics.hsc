{-# LANGUAGE ForeignFunctionInterface #-}
module Graphics.Rendering.FreeType.Internal.SizeMetrics
( FT_Size_Metrics(..)
) where

import Foreign

import Graphics.Rendering.FreeType.Internal.PrimitiveTypes

#include <stddef.h>
#let alignment t = "%lu", (unsigned long)offsetof(struct {char x__; t (y__); }, y__)

#include "ft2build.h"
#include FT_FREETYPE_H

data FT_Size_Metrics = FT_Size_Metrics
  { x_ppem      :: FT_UShort
  , y_ppem      :: FT_UShort
  , x_scale     :: FT_Fixed
  , y_scale     :: FT_Fixed
  , ascender    :: FT_Pos
  , descender   :: FT_Pos
  , height      :: FT_Pos
  , max_advance :: FT_Pos
  }
  deriving (Read, Show, Eq)

instance Storable FT_Size_Metrics where
  sizeOf    _ = #size FT_Size_Metrics
  alignment _ = #alignment FT_Size_Metrics
  peek ptr = do
    x_ppem'      <- (#peek FT_Size_Metrics, x_ppem) ptr
    y_ppem'      <- (#peek FT_Size_Metrics, y_ppem) ptr
    x_scale'     <- (#peek FT_Size_Metrics, x_scale) ptr
    y_scale'     <- (#peek FT_Size_Metrics, y_scale) ptr
    ascender'    <- (#peek FT_Size_Metrics, ascender) ptr
    descender'   <- (#peek FT_Size_Metrics, descender) ptr
    height'      <- (#peek FT_Size_Metrics, height) ptr
    max_advance' <- (#peek FT_Size_Metrics, max_advance) ptr
    return $ FT_Size_Metrics
      { x_ppem = x_ppem'
      , y_ppem = y_ppem'
      , x_scale = x_scale'
      , y_scale = y_scale'
      , ascender = ascender'
      , descender = descender'
      , height = height'
      , max_advance = max_advance'
      }
  poke ptr val = do
    (#poke FT_Size_Metrics, x_ppem) ptr (x_ppem val)
    (#poke FT_Size_Metrics, y_ppem) ptr (y_ppem val)
    (#poke FT_Size_Metrics, x_scale) ptr (x_scale val)
    (#poke FT_Size_Metrics, y_scale) ptr (y_scale val)
    (#poke FT_Size_Metrics, ascender) ptr (ascender val)
    (#poke FT_Size_Metrics, descender) ptr (descender val)
    (#poke FT_Size_Metrics, height) ptr (height val)
    (#poke FT_Size_Metrics, max_advance) ptr (max_advance val)
