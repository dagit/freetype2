{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE PatternSynonyms #-}
{-# OPTIONS_HADDOCK hide #-}

module FreeType.Raw.Core.Types.Internal where

import           Prelude hiding (length)

import           Foreign
import           Foreign.C.Types

import           Lens.Micro.TH

#include "ft2build.h"
#include FT_FREETYPE_H

type FT_Byte    = CUChar

type FT_Bytes   = Ptr FT_Byte

type FT_Char    = CChar

type FT_Int     = CInt

type FT_UInt    = CUInt

type FT_Int16   = CShort

type FT_UInt16  = CUShort

type FT_Int32   = Int32

type FT_UInt32  = Word32

type FT_Short   = CShort

type FT_UShort  = CUShort

type FT_Long    = CLong

type FT_ULong   = CULong

type FT_Bool    = CUChar

type FT_Offset  = CSize

type FT_PtrDist = CPtrdiff

type FT_String  = CChar

type FT_Tag     = FT_UInt32

type FT_Error   = CInt

type FT_Fixed   = CLong

type FT_Pointer = Ptr ()

type FT_Pos     = CLong



data FT_Vector = FT_Vector
                   { vX :: FT_Pos
                   , vY :: FT_Pos
                   }
                 deriving (Show, Eq)
makeFields ''FT_Vector



data FT_BBox = FT_BBox
                 { bbXMin :: FT_Pos
                 , bbYMin :: FT_Pos
                 , bbXMax :: FT_Pos
                 , bbYMax :: FT_Pos
                 }
               deriving (Show, Eq)



data FT_Matrix = FT_Matrix
                   { mXx :: FT_Fixed
                   , mXy :: FT_Fixed
                   , mYx :: FT_Fixed
                   , mYy :: FT_Fixed
                   }
                 deriving (Show, Eq)



type FT_FWord   = CShort

type FT_UFWord  = CUShort

type FT_F2Dot14 = CShort



data FT_UnitVector = FT_UnitVector
                       { uvX :: FT_F2Dot14
                       , uvY :: FT_F2Dot14
                       }
                     deriving (Show, Eq)



type FT_F26Dot6 = CLong



data FT_Data = FT_Data
                 { dPointer :: Ptr FT_Byte
                 , dLength  :: FT_Int
                 }
               deriving (Show, Eq)



data FT_Generic = FT_Generic
                    { gData      :: Ptr ()
                    , gFinalizer :: FT_Generic_Finalizer
                    }



type FT_Generic_Finalizer = FunPtr (Ptr () -> IO ())



data FT_Bitmap = FT_Bitmap
                   { bRows         :: CInt
                   , bWidth        :: CInt
                   , bPitch        :: CInt
                   , bBuffer       :: Ptr CChar
                   , bNum_grays    :: CShort
                   , bPixel_mode   :: CChar
                   , bPalette_mode :: CChar
                   , bPalette      :: Ptr ()
                   }
                 deriving (Show, Eq)



pattern FT_PIXEL_MODE_NONE
      , FT_PIXEL_MODE_MONO
      , FT_PIXEL_MODE_GRAY
      , FT_PIXEL_MODE_GRAY2
      , FT_PIXEL_MODE_GRAY4
      , FT_PIXEL_MODE_LCD
      , FT_PIXEL_MODE_LCD_V
      , FT_PIXEL_MODE_BGRA
     :: CInt
pattern FT_PIXEL_MODE_NONE  = #const FT_PIXEL_MODE_NONE
pattern FT_PIXEL_MODE_MONO  = #const FT_PIXEL_MODE_MONO
pattern FT_PIXEL_MODE_GRAY  = #const FT_PIXEL_MODE_GRAY
pattern FT_PIXEL_MODE_GRAY2 = #const FT_PIXEL_MODE_GRAY2
pattern FT_PIXEL_MODE_GRAY4 = #const FT_PIXEL_MODE_GRAY4
pattern FT_PIXEL_MODE_LCD   = #const FT_PIXEL_MODE_LCD
pattern FT_PIXEL_MODE_LCD_V = #const FT_PIXEL_MODE_LCD_V
pattern FT_PIXEL_MODE_BGRA  = #const FT_PIXEL_MODE_BGRA



type FT_Glyph_Format = CInt

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
