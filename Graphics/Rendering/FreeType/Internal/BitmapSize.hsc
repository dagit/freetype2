{-# LANGUAGE ForeignFunctionInterface #-}
module Graphics.Rendering.FreeType.Internal.BitmapSize
( FT_Bitmap_Size(..)
) where

import Foreign

import Graphics.Rendering.FreeType.Internal.PrimitiveTypes

#include <stddef.h>
#let alignment t = "%lu", (unsigned long)offsetof(struct {char x__; t (y__); }, y__)

#include "ft2build.h"
#include FT_FREETYPE_H

data FT_Bitmap_Size = FT_Bitmap_Size
  { height :: FT_Short
  , width  :: FT_Short
  , size   :: FT_Pos
  , x_ppem :: FT_Pos
  , y_ppem :: FT_Pos
  }
  deriving (Read, Show, Eq)

instance Storable FT_Bitmap_Size where
  sizeOf   _  = #size FT_Bitmap_Size
  alignment _ = #alignment FT_Bitmap_Size
  peek ptr = do
    height' <- (#peek FT_Bitmap_Size, height) ptr
    width'  <- (#peek FT_Bitmap_Size, width) ptr
    size'   <- (#peek FT_Bitmap_Size, size) ptr
    x_ppem' <- (#peek FT_Bitmap_Size, x_ppem) ptr
    y_ppem' <- (#peek FT_Bitmap_Size, y_ppem) ptr
    return $ FT_Bitmap_Size
      { height = height'
      , width = width'
      , size = size'
      , x_ppem = x_ppem'
      , y_ppem = y_ppem'
      }
