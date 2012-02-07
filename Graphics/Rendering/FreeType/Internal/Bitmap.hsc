{-# LANGUAGE ForeignFunctionInterface #-}
module Graphics.Rendering.FreeType.Internal.Bitmap
( FT_Bitmap(..)
) where

import Foreign
import Foreign.C.Types

#let alignment t = "%lu", (unsigned long)offsetof(struct {char x__; t (y__); }, y__)

#include "ft2build.h"
#include FT_FREETYPE_H

data FT_Bitmap = FT_Bitmap
  { rows         :: CInt
  , width        :: CInt
  , pitch        :: CInt
  , buffer       :: Ptr CChar
  , num_grays    :: CShort
  , pixel_mode   :: CChar
  , palette_mode :: CChar
  , palette      :: Ptr ()
  }

instance Storable FT_Bitmap where
  sizeOf _    = #size FT_Bitmap
  alignment _ = #alignment FT_Bitmap
  peek ptr = do
    rows'         <- (#peek FT_Bitmap, rows) ptr
    width'        <- (#peek FT_Bitmap, width) ptr
    pitch'        <- (#peek FT_Bitmap, pitch) ptr
    buffer'       <- (#peek FT_Bitmap, buffer) ptr
    num_grays'    <- (#peek FT_Bitmap, num_grays) ptr
    pixel_mode'   <- (#peek FT_Bitmap, pixel_mode) ptr
    palette_mode' <- (#peek FT_Bitmap, palette_mode) ptr
    palette'      <- (#peek FT_Bitmap, palette) ptr
    return $ FT_Bitmap
      { rows = rows'
      , width = width'
      , pitch = pitch'
      , buffer = buffer'
      , num_grays = num_grays'
      , pixel_mode = pixel_mode'
      , palette_mode = palette_mode'
      , palette = palette'
      }
  poke ptr val = do
    (#poke FT_Bitmap, rows) ptr (rows val)
    (#poke FT_Bitmap, width) ptr (width val)
    (#poke FT_Bitmap, pitch) ptr (pitch val)
    (#poke FT_Bitmap, buffer) ptr (buffer val)
    (#poke FT_Bitmap, num_grays) ptr (num_grays val)
    (#poke FT_Bitmap, pixel_mode) ptr (pixel_mode val)
    (#poke FT_Bitmap, palette_mode) ptr (palette_mode val)
    (#poke FT_Bitmap, palette) ptr (palette val)
