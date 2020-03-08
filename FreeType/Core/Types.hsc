{-# LANGUAGE PatternSynonyms #-}

{- | Please refer to the
     [Core API > Basic Data Types](https://www.freetype.org/freetype2/docs/reference/ft2-basic_types.html)
     chapter of the reference.
 -}

module FreeType.Core.Types
  ( -- ** FT_Byte
    FT_Byte
    -- ** FT_Bytes
  , FT_Bytes
    -- ** FT_Char
  , FT_Char
    -- ** FT_Int
  , FT_Int
    -- ** FT_UInt
  , FT_UInt
    -- ** FT_Int16
  , FT_Int16
    -- ** FT_UInt16
  , FT_UInt16
    -- ** FT_Int32
  , FT_Int32
    -- ** FT_UInt32
  , FT_UInt32
    -- ** FT_Int64
  , FT_Int64
    -- ** FT_UInt64
  , FT_UInt64
    -- ** FT_Short
  , FT_Short
    -- ** FT_UShort
  , FT_UShort
    -- ** FT_Long
  , FT_Long
    -- ** FT_ULong
  , FT_ULong
    -- ** FT_Bool
  , FT_Bool
    -- ** FT_Offset
  , FT_Offset
    -- ** FT_PtrDist
  , FT_PtrDist
    -- ** FT_String
  , FT_String
    -- ** FT_Tag
  , FT_Tag
    -- ** FT_Error
  , FT_Error
    -- ** FT_Fixed
  , FT_Fixed
    -- ** FT_Pointer
  , FT_Pointer
    -- ** FT_Pos
  , FT_Pos
    -- ** FT_Vector
  , FT_Vector (..)
    -- ** FT_BBox
  , FT_BBox (..)
    -- ** FT_Matrix
  , FT_Matrix (..)
    -- ** FT_FWord
  , FT_FWord
    -- ** FT_UFWord
  , FT_UFWord
    -- ** FT_F2Dot14
  , FT_F2Dot14
    -- ** FT_UnitVector
  , FT_UnitVector (..)
    -- ** FT_F26Dot6
  , FT_F26Dot6
    -- ** FT_Data
  , FT_Data (..)
    -- ** FT_MAKE_TAG
  , pattern FT_MAKE_TAG
    -- ** FT_Generic
  , FT_Generic (..)
    -- ** FT_Generic_Finalizer
  , FT_Generic_Finalizer
    -- ** FT_Bitmap
  , FT_Bitmap (..)
    -- ** FT_Pixel_Mode
  , pattern FT_PIXEL_MODE_NONE
  , pattern FT_PIXEL_MODE_MONO
  , pattern FT_PIXEL_MODE_GRAY
  , pattern FT_PIXEL_MODE_GRAY2
  , pattern FT_PIXEL_MODE_GRAY4
  , pattern FT_PIXEL_MODE_LCD
  , pattern FT_PIXEL_MODE_LCD_V
  , pattern FT_PIXEL_MODE_BGRA
    -- ** FT_Glyph_Format
  , FT_Glyph_Format
  , pattern FT_GLYPH_FORMAT_NONE
  , pattern FT_GLYPH_FORMAT_COMPOSITE
  , pattern FT_GLYPH_FORMAT_BITMAP
  , pattern FT_GLYPH_FORMAT_OUTLINE
  , pattern FT_GLYPH_FORMAT_PLOTTER
    -- ** FT_IMAGE_TAG
    -- | [FT_IMAGE_TAG](https://www.freetype.org/freetype2/docs/reference/ft2-basic_types.html#ft_image_tag)
    --   is simply 'FT_MAKE_TAG' combined with a variable assignment.
  ) where

import           FreeType.Core.Types.Types

import           Data.Word

#include "ft2build.h"
#include FT_IMAGE_H


pattern FT_PIXEL_MODE_NONE
      , FT_PIXEL_MODE_MONO
      , FT_PIXEL_MODE_GRAY
      , FT_PIXEL_MODE_GRAY2
      , FT_PIXEL_MODE_GRAY4
      , FT_PIXEL_MODE_LCD
      , FT_PIXEL_MODE_LCD_V
      , FT_PIXEL_MODE_BGRA
     :: #type enum FT_Pixel_Mode_
pattern FT_PIXEL_MODE_NONE  = #const FT_PIXEL_MODE_NONE
pattern FT_PIXEL_MODE_MONO  = #const FT_PIXEL_MODE_MONO
pattern FT_PIXEL_MODE_GRAY  = #const FT_PIXEL_MODE_GRAY
pattern FT_PIXEL_MODE_GRAY2 = #const FT_PIXEL_MODE_GRAY2
pattern FT_PIXEL_MODE_GRAY4 = #const FT_PIXEL_MODE_GRAY4
pattern FT_PIXEL_MODE_LCD   = #const FT_PIXEL_MODE_LCD
pattern FT_PIXEL_MODE_LCD_V = #const FT_PIXEL_MODE_LCD_V
pattern FT_PIXEL_MODE_BGRA  = #const FT_PIXEL_MODE_BGRA



pattern FT_GLYPH_FORMAT_NONE
      , FT_GLYPH_FORMAT_COMPOSITE
      , FT_GLYPH_FORMAT_BITMAP
      , FT_GLYPH_FORMAT_OUTLINE
      , FT_GLYPH_FORMAT_PLOTTER
     :: FT_Glyph_Format
pattern FT_GLYPH_FORMAT_NONE      = #const FT_GLYPH_FORMAT_NONE
pattern FT_GLYPH_FORMAT_COMPOSITE = #const FT_GLYPH_FORMAT_COMPOSITE
pattern FT_GLYPH_FORMAT_BITMAP    = #const FT_GLYPH_FORMAT_BITMAP
pattern FT_GLYPH_FORMAT_OUTLINE   = #const FT_GLYPH_FORMAT_OUTLINE
pattern FT_GLYPH_FORMAT_PLOTTER   = #const FT_GLYPH_FORMAT_PLOTTER
