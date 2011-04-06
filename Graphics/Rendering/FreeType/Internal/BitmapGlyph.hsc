{-# LANGUAGE ForeignFunctionInterface #-}
module Graphics.Rendering.FreeType.Internal.BitmapGlyph
( FT_BitmapGlyphRec(..)
, FT_BitmapGlyph
) where

import Foreign
import Foreign.Storable

import Graphics.Rendering.FreeType.Internal.PrimitiveTypes
import Graphics.Rendering.FreeType.Internal.Bitmap
import Graphics.Rendering.FreeType.Internal.Glyph

#include <stddef.h>
#let alignment t = "%lu", (unsigned long)offsetof(struct {char x__; t (y__); }, y__)

#include "ft2build.h"
#include FT_FREETYPE_H

#include "freetype/ftglyph.h"

type FT_BitmapGlyph = Ptr FT_BitmapGlyphRec
data FT_BitmapGlyphRec = FT_BitmapGlyphRec
  { root   :: FT_GlyphRec_
  , left   :: FT_Int
  , top    :: FT_Int
  , bitmap :: FT_Bitmap
  }

instance Storable FT_BitmapGlyphRec where
  sizeOf    _ = #size FT_BitmapGlyphRec
  alignment _ = #alignment FT_BitmapGlyphRec
  peek = error "peek not implemented for FT_BitmapGlyph"
  poke = error "poke not implemented for FT_BitmapGlyph"

