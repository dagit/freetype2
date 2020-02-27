module Graphics.Rendering.FreeType.Internal.BitmapSize
  {-# DEPRECATED "freetype2 bindings were rewritten from scratch. Please switch to FreeType" #-}
  ( FT_Bitmap_Size (FT_Bitmap_Size)
  , module Graphics.Rendering.FreeType.Internal.BitmapSize
  ) where

import           FreeType.Core.Base

import           Graphics.Rendering.FreeType.Internal.PrimitiveTypes



height :: FT_Bitmap_Size -> FT_Short
height = bsHeight

width  :: FT_Bitmap_Size -> FT_Short
width = bsWidth

size :: FT_Bitmap_Size -> FT_Pos
size = bsSize

x_ppem :: FT_Bitmap_Size -> FT_Pos
x_ppem = bsX_ppem

y_ppem :: FT_Bitmap_Size -> FT_Pos
y_ppem = bsY_ppem
