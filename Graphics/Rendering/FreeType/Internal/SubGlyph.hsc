{-# LANGUAGE ForeignFunctionInterface, EmptyDataDecls #-}
module Graphics.Rendering.FreeType.Internal.SubGlyph
( FT_SubGlyphRec_
, FT_SubGlyph
) where

import Foreign
import Foreign.Storable

#include <stddef.h>
#let alignment t = "%lu", (unsigned long)offsetof(struct {char x__; t (y__); }, y__)

#include "ft2build.h"
#include FT_FREETYPE_H

#include "internal/ftobjs.h"

data FT_SubGlyphRec_
type FT_SubGlyph = Ptr FT_SubGlyphRec_

instance Storable FT_SubGlyphRec_ where
  sizeOf    _ = #size struct FT_SubGlyphRec_
  alignment _ = #alignment struct FT_SubGlyphRec_
  peek = error "peek not implemented for FT_SubGlyphRec_"
  poke = error "poke not implemented for FT_SubGlyphRec_"

