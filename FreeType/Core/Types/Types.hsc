{-# LANGUAGE DataKinds
           , FlexibleInstances
           , MultiParamTypeClasses
           , PatternSynonyms
           , TypeApplications #-}

module FreeType.Core.Types.Types
  ( module FreeType.Core.Types.Types
  , FT_Error
  ) where

import           FreeType.Exception.Types (FT_Error)

import           Data.Bits
import           Data.Int
import           Data.Word
import           Foreign.Ptr
import           Foreign.Storable
import           Foreign.Storable.Offset

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
#ifndef mingw32_HOST_OS
type FT_Int64   = #type FT_Int64

type FT_UInt64  = #type FT_UInt64
#else
type FT_Int64   = Int64

type FT_UInt64  = Word64
#endif
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

instance Offset "vX" FT_Vector where rawOffset = #{offset struct FT_Vector_, x}
instance Offset "vY" FT_Vector where rawOffset = #{offset struct FT_Vector_, y}

instance Storable FT_Vector where
  sizeOf _    = #size      struct FT_Vector_
  alignment _ = #alignment struct FT_Vector_

  peek ptr =
    FT_Vector
      <$> peek (offset @"vX" ptr)
      <*> peek (offset @"vY" ptr)

  poke ptr val = do
    pokeField @"vX" ptr val
    pokeField @"vY" ptr val



data FT_BBox = FT_BBox
                 { bbXMin :: FT_Pos
                 , bbYMin :: FT_Pos
                 , bbXMax :: FT_Pos
                 , bbYMax :: FT_Pos
                 }

instance Offset "bbXMin" FT_BBox where rawOffset = #{offset struct FT_BBox_, xMin}
instance Offset "bbYMin" FT_BBox where rawOffset = #{offset struct FT_BBox_, yMin}
instance Offset "bbXMax" FT_BBox where rawOffset = #{offset struct FT_BBox_, xMax}
instance Offset "bbYMax" FT_BBox where rawOffset = #{offset struct FT_BBox_, yMax}

instance Storable FT_BBox where
  sizeOf    _ = #size      struct FT_BBox_
  alignment _ = #alignment struct FT_BBox_

  peek ptr =
    FT_BBox
      <$> peek (offset @"bbXMin" ptr)
      <*> peek (offset @"bbYMin" ptr)
      <*> peek (offset @"bbXMax" ptr)
      <*> peek (offset @"bbYMax" ptr)

  poke ptr val = do
    pokeField @"bbXMin" ptr val
    pokeField @"bbYMin" ptr val
    pokeField @"bbXMax" ptr val
    pokeField @"bbYMax" ptr val



data FT_Matrix = FT_Matrix
                   { mXx :: FT_Fixed
                   , mXy :: FT_Fixed
                   , mYx :: FT_Fixed
                   , mYy :: FT_Fixed
                   }

instance Offset "mXx" FT_Matrix where rawOffset = #{offset struct FT_Matrix_, xx}
instance Offset "mXy" FT_Matrix where rawOffset = #{offset struct FT_Matrix_, xy}
instance Offset "mYx" FT_Matrix where rawOffset = #{offset struct FT_Matrix_, yx}
instance Offset "mYy" FT_Matrix where rawOffset = #{offset struct FT_Matrix_, yy}

instance Storable FT_Matrix where
  sizeOf _    = #size      struct FT_Matrix_
  alignment _ = #alignment struct FT_Matrix_

  peek ptr =
    FT_Matrix
      <$> peek (offset @"mXx" ptr)
      <*> peek (offset @"mXy" ptr)
      <*> peek (offset @"mYx" ptr)
      <*> peek (offset @"mYy" ptr)

  poke ptr val = do
    pokeField @"mXx" ptr val
    pokeField @"mXy" ptr val
    pokeField @"mYx" ptr val
    pokeField @"mYy" ptr val



type FT_FWord   = #type FT_FWord

type FT_UFWord  = #type FT_UFWord

type FT_F2Dot14 = #type FT_F2Dot14



data FT_UnitVector = FT_UnitVector
                       { uvX :: FT_F2Dot14
                       , uvY :: FT_F2Dot14
                       }

instance Offset "uvX" FT_UnitVector where rawOffset = #{offset struct FT_UnitVector_, x}
instance Offset "uvY" FT_UnitVector where rawOffset = #{offset struct FT_UnitVector_, y}

instance Storable FT_UnitVector where
  sizeOf _    = #size      struct FT_UnitVector_
  alignment _ = #alignment struct FT_UnitVector_

  peek ptr =
    FT_UnitVector
      <$> peek (offset @"uvX" ptr)
      <*> peek (offset @"uvY" ptr)

  poke ptr val = do
    pokeField @"uvX" ptr val
    pokeField @"uvY" ptr val



type FT_F26Dot6 = #type FT_F26Dot6



data FT_Data = FT_Data
                 { dPointer :: Ptr FT_Byte
                 , dLength  :: FT_Int
                 }

instance Offset "dPointer" FT_Data where rawOffset = #{offset struct FT_Data_, pointer}
instance Offset "dLength"  FT_Data where rawOffset = #{offset struct FT_Data_, length }

instance Storable FT_Data where
  sizeOf _    = #size      struct FT_Data_
  alignment _ = #alignment struct FT_Data_

  peek ptr =
    FT_Data
      <$> peek (offset @"dPointer" ptr)
      <*> peek (offset @"dLength"  ptr)

  poke ptr val = do
    pokeField @"dPointer" ptr val
    pokeField @"dLength"  ptr val



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

instance Offset "gData"      FT_Generic where rawOffset = #{offset struct FT_Generic_, data     }
instance Offset "gFinalizer" FT_Generic where rawOffset = #{offset struct FT_Generic_, finalizer}

instance Storable FT_Generic where
  sizeOf    _ = #size      struct FT_Generic_
  alignment _ = #alignment struct FT_Generic_

  peek ptr = do
    FT_Generic
      <$> peek (offset @"gData"      ptr)
      <*> peek (offset @"gFinalizer" ptr)

  poke ptr val = do
    pokeField @"gData"      ptr val
    pokeField @"gFinalizer" ptr val



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

instance Offset "bRows"         FT_Bitmap where rawOffset = #{offset struct FT_Bitmap_, rows        }
instance Offset "bWidth"        FT_Bitmap where rawOffset = #{offset struct FT_Bitmap_, width       }
instance Offset "bPitch"        FT_Bitmap where rawOffset = #{offset struct FT_Bitmap_, pitch       }
instance Offset "bBuffer"       FT_Bitmap where rawOffset = #{offset struct FT_Bitmap_, buffer      }
instance Offset "bNum_grays"    FT_Bitmap where rawOffset = #{offset struct FT_Bitmap_, num_grays   }
instance Offset "bPixel_mode"   FT_Bitmap where rawOffset = #{offset struct FT_Bitmap_, pixel_mode  }
instance Offset "bPalette_mode" FT_Bitmap where rawOffset = #{offset struct FT_Bitmap_, palette_mode}
instance Offset "bPalette"      FT_Bitmap where rawOffset = #{offset struct FT_Bitmap_, palette     }

instance Storable FT_Bitmap where
  sizeOf _    = #size      struct FT_Bitmap_
  alignment _ = #alignment struct FT_Bitmap_

  peek ptr =
    FT_Bitmap
      <$> peek (offset @"bRows"         ptr)
      <*> peek (offset @"bWidth"        ptr)
      <*> peek (offset @"bPitch"        ptr)
      <*> peek (offset @"bBuffer"       ptr)
      <*> peek (offset @"bNum_grays"    ptr)
      <*> peek (offset @"bPixel_mode"   ptr)
      <*> peek (offset @"bPalette_mode" ptr)
      <*> peek (offset @"bPalette"      ptr)

  poke ptr val = do
    pokeField @"bRows"         ptr val
    pokeField @"bWidth"        ptr val
    pokeField @"bPitch"        ptr val
    pokeField @"bBuffer"       ptr val
    pokeField @"bNum_grays"    ptr val
    pokeField @"bPixel_mode"   ptr val
    pokeField @"bPalette_mode" ptr val
    pokeField @"bPalette"      ptr val



type FT_Glyph_Format = #type enum FT_Glyph_Format_
