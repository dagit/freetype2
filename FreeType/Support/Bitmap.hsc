{-# LANGUAGE ForeignFunctionInterface #-}

module FreeType.Support.Bitmap where

import           FreeType.Core.Base
--import           FreeType.Core.Color
import           FreeType.Core.Types

import           Foreign.C.Types
import           Foreign.Ptr

#include "ft2build.h"
#include FT_FREETYPE_H

foreign import ccall "FT_Bitmap_Init"
  ft_Bitmap_Init :: Ptr FT_Bitmap -> IO ()



foreign import ccall "FT_Bitmap_Copy"
  ft_Bitmap_Copy :: FT_Library -> Ptr FT_Bitmap -> Ptr FT_Bitmap -> IO FT_Error



foreign import ccall "FT_Bitmap_Embolden"
  ft_Bitmap_Embolden :: FT_Library -> Ptr FT_Bitmap -> Ptr FT_Pos -> Ptr FT_Pos -> IO FT_Error



foreign import ccall "FT_Bitmap_Convert"
  ft_Bitmap_Convert :: FT_Library -> Ptr FT_Bitmap -> Ptr FT_Bitmap -> FT_Int -> IO FT_Error


{-# WARNING ft_Bitmap_Blend "Not implemented, requires a function rewrite on the other side" #-}
ft_Bitmap_Blend :: IO ()
ft_Bitmap_Blend = return ()
{-
foreign import ccall "FT_Bitmap_Blend"
  ft_Bitmap_Blend :: FT_Library -> Ptr FT_Bitmap -> FT_Vector -> Ptr FT_Bitmap -> Ptr FT_Vector -> FT_Color -> IO FT_Error
-}


foreign import ccall "FT_GlyphSlot_Own_Bitmap"
  ft_GlyphSlot_Own_Bitmap :: FT_GlyphSlot -> IO FT_Error



foreign import ccall "FT_Bitmap_Done"
  ft_Bitmap_Done :: FT_Library -> Ptr FT_Bitmap -> IO FT_Error
