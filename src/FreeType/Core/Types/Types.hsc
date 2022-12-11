{-# LANGUAGE DataKinds
           , DuplicateRecordFields
           , FlexibleInstances
           , GeneralizedNewtypeDeriving
           , MultiParamTypeClasses #-}
#if __GLASGOW_HASKELL__ >= 902
{-# LANGUAGE NoFieldSelectors #-}
#endif
{-# LANGUAGE TypeApplications #-}

module FreeType.Core.Types.Types where

import           Data.Bits
import           Data.Int
import           Data.Word
import           Foreign.Ptr
import           Foreign.Storable
import           Foreign.Storable.Offset
import           GHC.Records

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

type FT_Error   = #type FT_Error

type FT_Fixed   = #type FT_Fixed

type FT_Pointer = Ptr ()

type FT_Pos     = #type FT_Pos



data {-# CTYPE "freetype/ftimage.h" "FT_Vector" #-} FT_Vector =
       FT_Vector
         { x :: FT_Pos
         , y :: FT_Pos
         }

instance Offset "x" FT_Vector where rawOffset = #{offset struct FT_Vector_, x}
instance Offset "y" FT_Vector where rawOffset = #{offset struct FT_Vector_, y}

instance Storable FT_Vector where
  sizeOf _    = #size      struct FT_Vector_
  alignment _ = #alignment struct FT_Vector_

  peek ptr =
    FT_Vector
      <$> peek (offset @"x" ptr)
      <*> peek (offset @"y" ptr)

  poke ptr val = do
    pokeField @"x" ptr val
    pokeField @"y" ptr val



data {-# CTYPE "freetype/ftimage.h" "FT_BBox" #-} FT_BBox =
       FT_BBox
         { xMin :: FT_Pos
         , yMin :: FT_Pos
         , xMax :: FT_Pos
         , yMax :: FT_Pos
         }

instance Offset "xMin" FT_BBox where rawOffset = #{offset struct FT_BBox_, xMin}
instance Offset "yMin" FT_BBox where rawOffset = #{offset struct FT_BBox_, yMin}
instance Offset "xMax" FT_BBox where rawOffset = #{offset struct FT_BBox_, xMax}
instance Offset "yMax" FT_BBox where rawOffset = #{offset struct FT_BBox_, yMax}

instance Storable FT_BBox where
  sizeOf    _ = #size      struct FT_BBox_
  alignment _ = #alignment struct FT_BBox_

  peek ptr =
    FT_BBox
      <$> peek (offset @"xMin" ptr)
      <*> peek (offset @"yMin" ptr)
      <*> peek (offset @"xMax" ptr)
      <*> peek (offset @"yMax" ptr)

  poke ptr val = do
    pokeField @"xMin" ptr val
    pokeField @"yMin" ptr val
    pokeField @"xMax" ptr val
    pokeField @"yMax" ptr val



data {-# CTYPE "freetype/fttypes.h" "FT_Matrix" #-} FT_Matrix =
       FT_Matrix
         { xx :: FT_Fixed
         , xy :: FT_Fixed
         , yx :: FT_Fixed
         , yy :: FT_Fixed
         }

instance Offset "xx" FT_Matrix where rawOffset = #{offset struct FT_Matrix_, xx}
instance Offset "xy" FT_Matrix where rawOffset = #{offset struct FT_Matrix_, xy}
instance Offset "yx" FT_Matrix where rawOffset = #{offset struct FT_Matrix_, yx}
instance Offset "yy" FT_Matrix where rawOffset = #{offset struct FT_Matrix_, yy}

instance Storable FT_Matrix where
  sizeOf _    = #size      struct FT_Matrix_
  alignment _ = #alignment struct FT_Matrix_

  peek ptr =
    FT_Matrix
      <$> peek (offset @"xx" ptr)
      <*> peek (offset @"xy" ptr)
      <*> peek (offset @"yx" ptr)
      <*> peek (offset @"yy" ptr)

  poke ptr val = do
    pokeField @"xx" ptr val
    pokeField @"xy" ptr val
    pokeField @"yx" ptr val
    pokeField @"yy" ptr val



type FT_FWord   = #type FT_FWord

type FT_UFWord  = #type FT_UFWord

type FT_F2Dot14 = #type FT_F2Dot14



data {-# CTYPE "freetype/ftimage.h" "FT_UnitVector" #-} FT_UnitVector =
       FT_UnitVector
         { x :: FT_F2Dot14
         , y :: FT_F2Dot14
         }

instance Offset "x" FT_UnitVector where rawOffset = #{offset struct FT_UnitVector_, x}
instance Offset "y" FT_UnitVector where rawOffset = #{offset struct FT_UnitVector_, y}

instance Storable FT_UnitVector where
  sizeOf _    = #size      struct FT_UnitVector_
  alignment _ = #alignment struct FT_UnitVector_

  peek ptr =
    FT_UnitVector
      <$> peek (offset @"x" ptr)
      <*> peek (offset @"y" ptr)

  poke ptr val = do
    pokeField @"x" ptr val
    pokeField @"y" ptr val



type FT_F26Dot6 = #type FT_F26Dot6


data {-# CTYPE "freetype/fttypes.h" "FT_Data" #-} FT_Data =
       FT_Data
         { pointer :: Ptr FT_Byte
         , length  :: FT_Int
         }

instance Offset "pointer" FT_Data where rawOffset = #{offset struct FT_Data_, pointer}
instance Offset "length"  FT_Data where rawOffset = #{offset struct FT_Data_, length }

instance Storable FT_Data where
  sizeOf _    = #size      struct FT_Data_
  alignment _ = #alignment struct FT_Data_

  peek ptr =
    FT_Data
      <$> peek (offset @"pointer" ptr)
      <*> peek (offset @"length"  ptr)

  poke ptr val = do
    pokeField @"pointer" ptr val
    pokeField @"length"  ptr val



data {-# CTYPE "freetype/fttypes.h" "FT_Generic" #-} FT_Generic =
       FT_Generic
         { data_     :: Ptr ()
         , finalizer :: FT_Generic_Finalizer
         }

instance Offset "data"      FT_Generic where rawOffset = #{offset struct FT_Generic_, data     }
instance Offset "finalizer" FT_Generic where rawOffset = #{offset struct FT_Generic_, finalizer}

instance Offset "data_" FT_Generic where
  rawOffset = rawOffset @"data" @FT_Generic

instance HasField "data" FT_Generic (Ptr ()) where
  getField = getField @"data_" @FT_Generic

instance Storable FT_Generic where
  sizeOf    _ = #size      struct FT_Generic_
  alignment _ = #alignment struct FT_Generic_

  peek ptr = do
    FT_Generic
      <$> peek (offset @"data"      ptr)
      <*> peek (offset @"finalizer" ptr)

  poke ptr val = do
    pokeField @"data"      ptr val
    pokeField @"finalizer" ptr val



type FT_Generic_Finalizer = FunPtr (Ptr () -> IO ())



data {-# CTYPE "freetype/ftimage.h" "FT_Bitmap" #-} FT_Bitmap =
       FT_Bitmap
         { rows         :: #type unsigned int
         , width        :: #type unsigned int
         , pitch        :: #type int
         , buffer       :: Ptr #type unsigned char
         , num_grays    :: #type unsigned short
         , pixel_mode   :: #type unsigned char
         , palette_mode :: #type unsigned char
         , palette      :: Ptr ()
         }

instance Offset "rows"         FT_Bitmap where rawOffset = #{offset struct FT_Bitmap_, rows        }
instance Offset "width"        FT_Bitmap where rawOffset = #{offset struct FT_Bitmap_, width       }
instance Offset "pitch"        FT_Bitmap where rawOffset = #{offset struct FT_Bitmap_, pitch       }
instance Offset "buffer"       FT_Bitmap where rawOffset = #{offset struct FT_Bitmap_, buffer      }
instance Offset "num_grays"    FT_Bitmap where rawOffset = #{offset struct FT_Bitmap_, num_grays   }
instance Offset "pixel_mode"   FT_Bitmap where rawOffset = #{offset struct FT_Bitmap_, pixel_mode  }
instance Offset "palette_mode" FT_Bitmap where rawOffset = #{offset struct FT_Bitmap_, palette_mode}
instance Offset "palette"      FT_Bitmap where rawOffset = #{offset struct FT_Bitmap_, palette     }

instance Storable FT_Bitmap where
  sizeOf _    = #size      struct FT_Bitmap_
  alignment _ = #alignment struct FT_Bitmap_

  peek ptr =
    FT_Bitmap
      <$> peek (offset @"rows"         ptr)
      <*> peek (offset @"width"        ptr)
      <*> peek (offset @"pitch"        ptr)
      <*> peek (offset @"buffer"       ptr)
      <*> peek (offset @"num_grays"    ptr)
      <*> peek (offset @"pixel_mode"   ptr)
      <*> peek (offset @"palette_mode" ptr)
      <*> peek (offset @"palette"      ptr)

  poke ptr val = do
    pokeField @"rows"         ptr val
    pokeField @"width"        ptr val
    pokeField @"pitch"        ptr val
    pokeField @"buffer"       ptr val
    pokeField @"num_grays"    ptr val
    pokeField @"pixel_mode"   ptr val
    pokeField @"palette_mode" ptr val
    pokeField @"palette"      ptr val



type FT_Glyph_Format = #type enum FT_Glyph_Format_
