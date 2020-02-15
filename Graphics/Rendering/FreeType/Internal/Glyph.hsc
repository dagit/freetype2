module Graphics.Rendering.FreeType.Internal.Glyph
  {-# DEPRECATED "freetype2 bindings were rewritten from scratch. Please switch to FreeType.Raw" #-}
  ( FT_GlyphRec_
  , FT_Glyph
  , library
  , format
  , advance
  ) where

import           FreeType.Raw.Core.Glyph (FT_GlyphRec, FT_Glyph)

import           Graphics.Rendering.FreeType.Internal.PrimitiveTypes
import qualified Graphics.Rendering.FreeType.Internal.Library as L
import qualified Graphics.Rendering.FreeType.Internal.Vector  as V

import           Foreign.Ptr

#include "ft2build.h"
#include FT_FREETYPE_H

#include "freetype/ftglyph.h"

type FT_GlyphRec_ = FT_GlyphRec

library :: FT_Glyph -> Ptr L.FT_Library
library = #ptr struct FT_GlyphRec_, library

format :: FT_Glyph -> Ptr FT_Glyph_Format
format = #ptr struct FT_GlyphRec_, format

advance :: FT_Glyph -> Ptr V.FT_Vector
advance = #ptr struct FT_GlyphRec_, advance


