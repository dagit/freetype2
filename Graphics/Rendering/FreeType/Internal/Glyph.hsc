{-# LANGUAGE ForeignFunctionInterface, EmptyDataDecls #-}
module Graphics.Rendering.FreeType.Internal.Glyph
( FT_GlyphRec_
, FT_Glyph
, library
, format
, advance
) where

import Foreign

import Graphics.Rendering.FreeType.Internal.PrimitiveTypes
import qualified Graphics.Rendering.FreeType.Internal.Library as L
import qualified Graphics.Rendering.FreeType.Internal.Vector  as V

#include <stddef.h>
#let alignment t = "%lu", (unsigned long)offsetof(struct {char x__; t (y__); }, y__)

#include "ft2build.h"
#include FT_FREETYPE_H

#include "freetype/ftglyph.h"

data FT_GlyphRec_
type FT_Glyph = Ptr FT_GlyphRec_

library :: FT_Glyph -> Ptr L.FT_Library
library = #ptr struct FT_GlyphRec_, library

format :: FT_Glyph -> Ptr FT_Glyph_Format
format = #ptr struct FT_GlyphRec_, format

advance :: FT_Glyph -> Ptr V.FT_Vector
advance = #ptr struct FT_GlyphRec_, advance


