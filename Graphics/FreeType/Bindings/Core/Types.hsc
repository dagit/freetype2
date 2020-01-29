{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE PatternSynonyms #-}

module Graphics.FreeType.Bindings.Core.Types where

import           Prelude hiding (length)

import           Foreign
import           Foreign.C.Types

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

instance Storable FT_Vector where
  sizeOf _    = #size      struct FT_Vector_
  alignment _ = #alignment struct FT_Vector_

  peek ptr =
    FT_Vector
      <$> #{peek struct FT_Vector_, x} ptr
      <*> #{peek struct FT_Vector_, y} ptr

  poke ptr val = do
    #{poke struct FT_Vector_, x} ptr $ vX val
    #{poke struct FT_Vector_, y} ptr $ vY val



data FT_BBox = FT_BBox
                 { bbXMin :: FT_Pos
                 , bbYMin :: FT_Pos
                 , bbXMax :: FT_Pos
                 , bbYMax :: FT_Pos
                 }
               deriving (Show, Eq)

instance Storable FT_BBox where
  sizeOf    _ = #size      struct FT_BBox_
  alignment _ = #alignment struct FT_BBox_

  peek ptr =
    FT_BBox
      <$> #{peek struct FT_BBox_, xMin} ptr
      <*> #{peek struct FT_BBox_, yMin} ptr
      <*> #{peek struct FT_BBox_, xMax} ptr
      <*> #{peek struct FT_BBox_, yMax} ptr

  poke ptr val = do
    #{poke struct FT_BBox_, xMin} ptr $ bbXMin val
    #{poke struct FT_BBox_, yMin} ptr $ bbYMin val
    #{poke struct FT_BBox_, xMax} ptr $ bbXMax val
    #{poke struct FT_BBox_, yMax} ptr $ bbYMax val



data FT_Matrix = FT_Matrix
                   { mXx :: FT_Fixed
                   , mXy :: FT_Fixed
                   , mYx :: FT_Fixed
                   , mYy :: FT_Fixed
                   }
                 deriving (Show, Eq)

instance Storable FT_Matrix where
  sizeOf _    = #size      struct FT_Matrix_
  alignment _ = #alignment struct FT_Matrix_

  peek ptr =
    FT_Matrix
      <$> #{peek struct FT_Matrix_, xx} ptr
      <*> #{peek struct FT_Matrix_, xy} ptr
      <*> #{peek struct FT_Matrix_, yx} ptr
      <*> #{peek struct FT_Matrix_, yy} ptr

  poke ptr val = do
    #{poke struct FT_Matrix_, xx} ptr $ mXx val
    #{poke struct FT_Matrix_, xy} ptr $ mXy val
    #{poke struct FT_Matrix_, yx} ptr $ mYx val
    #{poke struct FT_Matrix_, yy} ptr $ mYy val



type FT_FWord   = CShort

type FT_UFWord  = CUShort

type FT_F2Dot14 = CShort



data FT_UnitVector = FT_UnitVector
                       { uvX :: FT_F2Dot14
                       , uvY :: FT_F2Dot14
                       }
                     deriving (Show, Eq)

instance Storable FT_UnitVector where
  sizeOf _    = #size      struct FT_UnitVector_
  alignment _ = #alignment struct FT_UnitVector_

  peek ptr =
    FT_UnitVector
      <$> #{peek struct FT_UnitVector_, x} ptr
      <*> #{peek struct FT_UnitVector_, y} ptr

  poke ptr val = do
    #{poke struct FT_UnitVector_, x} ptr $ uvX val
    #{poke struct FT_UnitVector_, y} ptr $ uvY val



type FT_F26Dot6 = CLong



data FT_Data = FT_Data
                 { dPointer :: Ptr FT_Byte
                 , dLength  :: FT_Int
                 }
               deriving (Show, Eq)

instance Storable FT_Data where
  sizeOf _    = #size      struct FT_Data_
  alignment _ = #alignment struct FT_Data_

  peek ptr =
    FT_Data
      <$> #{peek struct FT_Data_, pointer} ptr
      <*> #{peek struct FT_Data_, length } ptr

  poke ptr val = do
    #{poke struct FT_Data_, pointer} ptr $ dPointer val
    #{poke struct FT_Data_, length } ptr $ dLength  val



data FT_Generic = FT_Generic
                    { gData      :: Ptr ()
                    , gFinalizer :: FT_Generic_Finalizer
                    }

instance Storable FT_Generic where
  sizeOf    _ = #size      struct FT_Generic_
  alignment _ = #alignment struct FT_Generic_

  peek ptr = do
    FT_Generic
      <$> #{peek struct FT_Generic_, data     } ptr
      <*> #{peek struct FT_Generic_, finalizer} ptr

  poke ptr val = do
    #{poke struct FT_Generic_, data     } ptr $ gData      val
    #{poke struct FT_Generic_, finalizer} ptr $ gFinalizer val

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

instance Storable FT_Bitmap where
  sizeOf _    = #size      struct FT_Bitmap_
  alignment _ = #alignment struct FT_Bitmap_

  peek ptr =
    FT_Bitmap
      <$> #{peek struct FT_Bitmap_, rows        } ptr
      <*> #{peek struct FT_Bitmap_, width       } ptr
      <*> #{peek struct FT_Bitmap_, pitch       } ptr
      <*> #{peek struct FT_Bitmap_, buffer      } ptr
      <*> #{peek struct FT_Bitmap_, num_grays   } ptr
      <*> #{peek struct FT_Bitmap_, pixel_mode  } ptr
      <*> #{peek struct FT_Bitmap_, palette_mode} ptr
      <*> #{peek struct FT_Bitmap_, palette     } ptr

  poke ptr val = do
    #{poke struct FT_Bitmap_, rows        } ptr $ bRows         val
    #{poke struct FT_Bitmap_, width       } ptr $ bWidth        val
    #{poke struct FT_Bitmap_, pitch       } ptr $ bPitch        val
    #{poke struct FT_Bitmap_, buffer      } ptr $ bBuffer       val
    #{poke struct FT_Bitmap_, num_grays   } ptr $ bNum_grays    val
    #{poke struct FT_Bitmap_, pixel_mode  } ptr $ bPixel_mode   val
    #{poke struct FT_Bitmap_, palette_mode} ptr $ bPalette_mode val
    #{poke struct FT_Bitmap_, palette     } ptr $ bPalette      val



pattern FT_PIXEL_MODE_NONE
      , FT_PIXEL_MODE_MONO
      , FT_PIXEL_MODE_GRAY
      , FT_PIXEL_MODE_GRAY2
      , FT_PIXEL_MODE_GRAY4
      , FT_PIXEL_MODE_LCD
      , FT_PIXEL_MODE_LCD_V
      , FT_PIXEL_MODE_BGRA
     :: FT_UInt
pattern FT_PIXEL_MODE_NONE  = #const FT_PIXEL_MODE_NONE
pattern FT_PIXEL_MODE_MONO  = #const FT_PIXEL_MODE_MONO
pattern FT_PIXEL_MODE_GRAY  = #const FT_PIXEL_MODE_GRAY
pattern FT_PIXEL_MODE_GRAY2 = #const FT_PIXEL_MODE_GRAY2
pattern FT_PIXEL_MODE_GRAY4 = #const FT_PIXEL_MODE_GRAY4
pattern FT_PIXEL_MODE_LCD   = #const FT_PIXEL_MODE_LCD
pattern FT_PIXEL_MODE_LCD_V = #const FT_PIXEL_MODE_LCD_V
pattern FT_PIXEL_MODE_BGRA  = #const FT_PIXEL_MODE_BGRA



type FT_Glyph_Format = FT_UInt

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
