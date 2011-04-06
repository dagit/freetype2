module Graphics.Rendering.FreeType.Internal.BitmapGlyph
( FT_BitmapGlyphRec(..)
, FT_BitmapGlyph
) where

import Foreign

import Graphics.Rendering.FreeType.Internal.PrimitiveTypes
import Graphics.Rendering.FreeType.Internal.Bitmap
import Graphics.Rendering.FreeType.Internal.Glyph

type FT_BitmapGlyph = Ptr FT_BitmapGlyphRec
data FT_BitmapGlyphRec = FT_BitmapGlyphRec
  { root   :: FT_GlyphRec_
  , left   :: FT_Int
  , top    :: FT_Int
  , bitmap :: FT_Bitmap
  }

