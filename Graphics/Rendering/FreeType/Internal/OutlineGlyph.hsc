module Graphics.Rendering.FreeType.Internal.OutlineGlyph
  {-# DEPRECATED "freetype2 bindings were rewritten from scratch. Please switch to Graphics.FreeType.Bindings" #-}
  ( FT_OutlineGlyph
  , root
  , outline
  , cast
  ) where

import Foreign

import Graphics.Rendering.FreeType.Internal.Glyph
import Graphics.Rendering.FreeType.Internal.Outline

#include "ft2build.h"
#include FT_GLYPH_H

newtype FT_OutlineGlyph = FT_OutlineGlyph FT_Glyph

root :: FT_OutlineGlyph -> FT_Glyph
root (FT_OutlineGlyph ptr) = ptr

outline :: FT_OutlineGlyph -> Ptr FT_Outline
outline (FT_OutlineGlyph ptr) = (#ptr struct FT_OutlineGlyphRec_, outline) ptr

cast :: FT_Glyph -> FT_OutlineGlyph
cast = FT_OutlineGlyph
