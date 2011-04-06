{-# LANGUAGE ForeignFunctionInterface #-}
module Graphics.Rendering.FreeType.Internal.OutlineGlyph
( FT_OutlineGlyphRec(..)
, FT_OutlineGlyph
) where

import Foreign

import Graphics.Rendering.FreeType.Internal.Glyph
import Graphics.Rendering.FreeType.Internal.Outline

#include <stddef.h>
#let alignment t = "%lu", (unsigned long)offsetof(struct {char x__; t (y__); }, y__)

#include "ft2build.h"
#include FT_FREETYPE_H

#include "freetype/ftglyph.h"

type FT_OutlineGlyph = Ptr FT_OutlineGlyphRec
data FT_OutlineGlyphRec = FT_OutlineGlyphRec
  { root    :: FT_GlyphRec_
  , outline :: FT_Outline
  }
