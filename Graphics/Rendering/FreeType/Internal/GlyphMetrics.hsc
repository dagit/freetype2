module Graphics.Rendering.FreeType.Internal.GlyphMetrics
  {-# DEPRECATED "freetype2 bindings were rewritten from scratch. Please switch to FreeType.Raw" #-}
  ( FT_Glyph_Metrics (FT_Glyph_Metrics)
  , module Graphics.Rendering.FreeType.Internal.GlyphMetrics
  ) where

import           FreeType.Raw.Core.Base

import           Graphics.Rendering.FreeType.Internal.PrimitiveTypes



width :: FT_Glyph_Metrics -> FT_Pos
width = gmWidth

height :: FT_Glyph_Metrics -> FT_Pos
height = gmHeight

horiBearingX :: FT_Glyph_Metrics -> FT_Pos
horiBearingX = gmHoriBearingX

horiBearingY :: FT_Glyph_Metrics -> FT_Pos
horiBearingY = gmHoriBearingY

horiAdvance :: FT_Glyph_Metrics -> FT_Pos
horiAdvance = gmHoriAdvance

vertBearingX :: FT_Glyph_Metrics -> FT_Pos
vertBearingX = gmVertBearingX

vertBearingY :: FT_Glyph_Metrics -> FT_Pos
vertBearingY = gmVertBearingY

vertAdvance :: FT_Glyph_Metrics -> FT_Pos
vertAdvance = gmVertAdvance

