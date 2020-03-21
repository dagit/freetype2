{-# LANGUAGE ForeignFunctionInterface #-}

module FreeType.Support.Bitmap.Internal
  ( -- ** FT_Bitmap_Init
    ft_Bitmap_Init'
    -- ** FT_Bitmap_Copy
  , ft_Bitmap_Copy'
    -- ** FT_Bitmap_Embolden
  , ft_Bitmap_Embolden'
    -- ** FT_Bitmap_Convert
  , ft_Bitmap_Convert'
    -- ** FT_Bitmap_Blend
  , ft_Bitmap_Blend'
    -- ** FT_GlyphSlot_Own_Bitmap
  , ft_GlyphSlot_Own_Bitmap'
    -- ** FT_Bitmap_Done
  , ft_Bitmap_Done'
  ) where

import           FreeType.Core.Base
import           FreeType.Core.Color
import           FreeType.Core.Types.Types

import           Foreign.Ptr

#include "ft2build.h"
#include FT_BITMAP_H
#include "ftbitmap-plus.h"

foreign import ccall "FT_Bitmap_Init"
  ft_Bitmap_Init'
    :: Ptr FT_Bitmap -- ^ bitmap
    -> IO ()



foreign import ccall "FT_Bitmap_Copy"
  ft_Bitmap_Copy'
    :: FT_Library    -- ^ library
    -> Ptr FT_Bitmap -- ^ source
    -> Ptr FT_Bitmap -- ^ target
    -> IO FT_Error



foreign import ccall "FT_Bitmap_Embolden"
  ft_Bitmap_Embolden'
    :: FT_Library    -- ^ library
    -> Ptr FT_Bitmap -- ^ bitmap
    -> FT_Pos        -- ^ xStrength
    -> FT_Pos        -- ^ yStrength
    -> IO FT_Error



foreign import ccall "FT_Bitmap_Convert"
  ft_Bitmap_Convert'
    :: FT_Library    -- ^ library
    -> Ptr FT_Bitmap -- ^ source
    -> Ptr FT_Bitmap -- ^ target
    -> FT_Int        -- ^ alignment
    -> IO FT_Error



foreign import ccall "FT_Bitmap_Blend_Plus"
  ft_Bitmap_Blend'
    :: FT_Library    -- ^ library
    -> Ptr FT_Bitmap -- ^ source
    -> Ptr FT_Vector -- ^ source_offset
    -> Ptr FT_Bitmap -- ^ target
    -> Ptr FT_Vector -- ^ atarget_offset
    -> Ptr FT_Color  -- ^ color
    -> IO FT_Error



foreign import ccall "FT_GlyphSlot_Own_Bitmap"
  ft_GlyphSlot_Own_Bitmap'
    :: FT_GlyphSlot -- ^ slot
    -> IO FT_Error



foreign import ccall "FT_Bitmap_Done"
  ft_Bitmap_Done'
    :: FT_Library    -- ^ library
    -> Ptr FT_Bitmap -- ^ bitmap
    -> IO FT_Error
