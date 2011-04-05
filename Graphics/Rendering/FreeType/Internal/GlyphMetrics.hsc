{-# LANGUAGE ForeignFunctionInterface #-}
module Graphics.Rendering.FreeType.Internal.GlyphMetrics
( FT_Glyph_Metrics(..)
) where

import Foreign
import Foreign.Storable

import Graphics.Rendering.FreeType.Internal.PrimitiveTypes

#include <stddef.h>
#let alignment t = "%lu", (unsigned long)offsetof(struct {char x__; t (y__); }, y__)

#include "ft2build.h"
#include FT_FREETYPE_H

data FT_Glyph_Metrics = FT_Glyph_Metrics
  { width        :: FT_Pos
  , height       :: FT_Pos
  , horiBearingX :: FT_Pos
  , horiBearingY :: FT_Pos
  , horiAdvance  :: FT_Pos
  , vertBearingX :: FT_Pos
  , vertBearingY :: FT_Pos
  , vertAdvance  :: FT_Pos
  }
  deriving (Read, Show, Eq)

instance Storable FT_Glyph_Metrics where
  sizeOf    _ = #size FT_Glyph_Metrics
  alignment _ = #alignment FT_Glyph_Metrics
  peek ptr = do
    width'  <- (#peek FT_Glyph_Metrics, width) ptr
    height' <- (#peek FT_Glyph_Metrics, height) ptr
    horiBearingX' <- (#peek FT_Glyph_Metrics, horiBearingX) ptr
    horiBearingY' <- (#peek FT_Glyph_Metrics, horiBearingY) ptr
    horiAdvance'  <- (#peek FT_Glyph_Metrics, horiAdvance) ptr
    vertBearingX' <- (#peek FT_Glyph_Metrics, vertBearingX) ptr
    vertBearingY' <- (#peek FT_Glyph_Metrics, vertBearingY) ptr
    vertAdvance'  <- (#peek FT_Glyph_Metrics, vertAdvance) ptr
    return $ FT_Glyph_Metrics
      { width = width'
      , height = height'
      , horiBearingX = horiBearingX'
      , horiBearingY = horiBearingY'
      , horiAdvance  = horiAdvance'
      , vertBearingX = vertBearingX'
      , vertBearingY = vertBearingY'
      , vertAdvance  = vertAdvance'
      }
  poke ptr val = do
    (#poke FT_Glyph_Metrics, width) ptr (width val)
    (#poke FT_Glyph_Metrics, height) ptr (height val)
    (#poke FT_Glyph_Metrics, horiBearingX) ptr (horiBearingX val)
    (#poke FT_Glyph_Metrics, horiBearingY) ptr (horiBearingY val)
    (#poke FT_Glyph_Metrics, horiAdvance) ptr (horiAdvance val)
    (#poke FT_Glyph_Metrics, vertBearingX) ptr (vertBearingX val)
    (#poke FT_Glyph_Metrics, vertBearingY) ptr (vertBearingY val)
    (#poke FT_Glyph_Metrics, vertAdvance) ptr (vertAdvance val)
