{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE PatternSynonyms #-}

module FreeType.Core.Types.Types
  ( module FreeType.Core.Types.Types
  , FT_Error
  ) where

import           FreeType.Exception.Types (FT_Error)

import           Prelude hiding (length)

import           Data.Function ((&))
import           Foreign

#include "ft2build.h"
#include FT_FREETYPE_H
#include FT_IMAGE_H

type FT_Byte    = #type FT_Byte

type FT_Bytes   = Ptr FT_Byte

type FT_Char    = #type FT_Char

type FT_Int     = #type FT_Int

type FT_UInt    = #type FT_UInt

type FT_Int16   = #type FT_Int16

type FT_UInt16  = #type FT_UInt16

type FT_Int32   = #type FT_Int32

type FT_UInt32  = #type FT_UInt32

type FT_Int64   = #type FT_Int64

type FT_UInt64  = #type FT_UInt64

type FT_Short   = #type FT_Short

type FT_UShort  = #type FT_UShort

type FT_Long    = #type FT_Long

type FT_ULong   = #type FT_ULong

type FT_Bool    = #type FT_Bool

type FT_Offset  = #type FT_Offset

type FT_PtrDist = #type FT_PtrDist

type FT_String  = #type FT_String

type FT_Tag     = FT_UInt32

type FT_Fixed   = #type FT_Fixed

type FT_Pointer = Ptr ()

type FT_Pos     = #type FT_Pos



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
    #{poke struct FT_Vector_, x} ptr $ val & vX
    #{poke struct FT_Vector_, y} ptr $ val & vY



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
    #{poke struct FT_BBox_, xMin} ptr $ val & bbXMin
    #{poke struct FT_BBox_, yMin} ptr $ val & bbYMin
    #{poke struct FT_BBox_, xMax} ptr $ val & bbXMax
    #{poke struct FT_BBox_, yMax} ptr $ val & bbYMax



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
    #{poke struct FT_Matrix_, xx} ptr $ val & mXx
    #{poke struct FT_Matrix_, xy} ptr $ val & mXy
    #{poke struct FT_Matrix_, yx} ptr $ val & mYx
    #{poke struct FT_Matrix_, yy} ptr $ val & mYy



type FT_FWord   = #type FT_FWord

type FT_UFWord  = #type FT_UFWord

type FT_F2Dot14 = #type FT_F2Dot14



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
    #{poke struct FT_UnitVector_, x} ptr $ val & uvX
    #{poke struct FT_UnitVector_, y} ptr $ val & uvY


type FT_F26Dot6 = #type FT_F26Dot6



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
    #{poke struct FT_Data_, pointer} ptr $ val & dPointer
    #{poke struct FT_Data_, length } ptr $ val & dLength



pattern FT_MAKE_TAG :: Char -> Char -> Char -> Char -> FT_Tag    
pattern FT_MAKE_TAG <- _    
  where    
    FT_MAKE_TAG a b c d =    
      fromIntegral $  (fromEnum a `shiftL` 24)    
                  .|. (fromEnum b `shiftL` 16)    
                  .|. (fromEnum c `shiftL`  8)    
                  .|. (fromEnum d)



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
    #{poke struct FT_Generic_, data     } ptr $ val & gData
    #{poke struct FT_Generic_, finalizer} ptr $ val & gFinalizer



type FT_Generic_Finalizer = FunPtr (Ptr () -> IO ())



data FT_Bitmap = FT_Bitmap
                   { bRows         :: #type unsigned int
                   , bWidth        :: #type unsigned int
                   , bPitch        :: #type int
                   , bBuffer       :: Ptr #type unsigned char
                   , bNum_grays    :: #type unsigned short
                   , bPixel_mode   :: #type unsigned char
                   , bPalette_mode :: #type unsigned char
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
    #{poke struct FT_Bitmap_, rows        } ptr $ val & bRows
    #{poke struct FT_Bitmap_, width       } ptr $ val & bWidth
    #{poke struct FT_Bitmap_, pitch       } ptr $ val & bPitch
    #{poke struct FT_Bitmap_, buffer      } ptr $ val & bBuffer
    #{poke struct FT_Bitmap_, num_grays   } ptr $ val & bNum_grays
    #{poke struct FT_Bitmap_, pixel_mode  } ptr $ val & bPixel_mode
    #{poke struct FT_Bitmap_, palette_mode} ptr $ val & bPalette_mode
    #{poke struct FT_Bitmap_, palette     } ptr $ val & bPalette



type FT_Glyph_Format = #type enum FT_Glyph_Format_
