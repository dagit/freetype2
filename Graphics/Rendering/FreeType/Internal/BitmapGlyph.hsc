{-# LANGUAGE ForeignFunctionInterface #-}
module Graphics.Rendering.FreeType.Internal.BitmapGlyph
( FT_BitmapGlyph
, root
, left
, top
, bitmap
, cast
) where

import Foreign

#include "ft2build.h"
#include FT_FREETYPE_H
#include "freetype/ftglyph.h"

import Graphics.Rendering.FreeType.Internal.PrimitiveTypes
import Graphics.Rendering.FreeType.Internal.Bitmap
import Graphics.Rendering.FreeType.Internal.Glyph

newtype FT_BitmapGlyph = FT_BitmapGlyph FT_Glyph

root :: FT_BitmapGlyph -> FT_Glyph
root (FT_BitmapGlyph ptr) = ptr

left :: FT_BitmapGlyph -> Ptr FT_Int
left (FT_BitmapGlyph ptr) = (#ptr struct FT_BitmapGlyphRec_, left) ptr

top :: FT_BitmapGlyph -> Ptr FT_Int
top (FT_BitmapGlyph ptr) = (#ptr struct FT_BitmapGlyphRec_, top) ptr

bitmap :: FT_BitmapGlyph -> Ptr FT_Bitmap
bitmap (FT_BitmapGlyph ptr) = (#ptr struct FT_BitmapGlyphRec_, bitmap) ptr

cast :: FT_Glyph -> FT_BitmapGlyph
cast = FT_BitmapGlyph
