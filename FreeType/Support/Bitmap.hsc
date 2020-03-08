{-# LANGUAGE TemplateHaskell #-}

module FreeType.Support.Bitmap
  ( -- ** FT_Bitmap_Init
    ft_Bitmap_Init
    -- ** FT_Bitmap_Copy
  , ft_Bitmap_Copy
    -- ** FT_Bitmap_Embolden
  , ft_Bitmap_Embolden
    -- ** FT_Bitmap_Convert
  , ft_Bitmap_Convert
    -- ** FT_Bitmap_Blend
--, ft_Bitmap_Blend
    -- ** FT_GlyphSlot_Own_Bitmap
  , ft_GlyphSlot_Own_Bitmap
    -- ** FT_Bitmap_Done
  , ft_Bitmap_Done
  ) where

import           FreeType.Core.Base.Types
--import           FreeType.Core.Color.Types
import           FreeType.Core.Types.Types
import           FreeType.Exception.Internal
import           FreeType.Support.Bitmap.Internal

import           Foreign.Marshal.Alloc
import           Foreign.Ptr

#include "ft2build.h"
#include FT_FREETYPE_H

ft_Bitmap_Init :: IO (Ptr FT_Bitmap) -- ^ bitmap
ft_Bitmap_Init =
  alloca $ \bitmapPtr -> do
    ft_Bitmap_Init' bitmapPtr
    return bitmapPtr



ft_Bitmap_Copy
  :: FT_Library    -- ^ library
  -> Ptr FT_Bitmap -- ^ source
  -> Ptr FT_Bitmap -- ^ target
  -> IO ()
ft_Bitmap_Copy =
  autoError 'ft_Bitmap_Copy ft_Bitmap_Copy'



ft_Bitmap_Embolden
  :: FT_Library    -- ^ library
  -> Ptr FT_Bitmap -- ^ bitmap
  -> FT_Pos        -- ^ xStrength
  -> FT_Pos        -- ^ yStrength
  -> IO ()
ft_Bitmap_Embolden =
  autoError 'ft_Bitmap_Embolden ft_Bitmap_Embolden'



ft_Bitmap_Convert
  :: FT_Library    -- ^ library
  -> Ptr FT_Bitmap -- ^ source
  -> Ptr FT_Bitmap -- ^ target
  -> FT_Int        -- ^ alignment
  -> IO ()
ft_Bitmap_Convert =
  autoError 'ft_Bitmap_Convert ft_Bitmap_Convert'



ft_GlyphSlot_Own_Bitmap
  :: FT_GlyphSlot -- ^ slot
  -> IO ()
ft_GlyphSlot_Own_Bitmap =
  autoError 'ft_GlyphSlot_Own_Bitmap ft_GlyphSlot_Own_Bitmap'



ft_Bitmap_Done
  :: FT_Library    -- ^ library
  -> Ptr FT_Bitmap -- ^ bitmap
  -> IO ()
ft_Bitmap_Done =
  autoError 'ft_Bitmap_Done ft_Bitmap_Done'
