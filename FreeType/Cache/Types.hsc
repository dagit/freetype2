{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE ForeignFunctionInterface #-}
{-# OPTIONS_HADDOCK hide #-}

module FreeType.Cache.Types where

import           FreeType.Core.Base.Types
import           FreeType.Core.Types.Types

import           Data.Function ((&))
import           Foreign.Ptr
import           Foreign.Storable

#include "ft2build.h"
#include FT_CACHE_H

data FTC_ManagerRec
type FTC_Manager = Ptr FTC_ManagerRec



type FTC_FaceID = FT_Pointer



type FTC_Face_Requester = FunPtr (FTC_FaceID -> FT_Library -> FT_Pointer -> Ptr FT_Face -> IO FT_Error)



data FTC_NodeRec
type FTC_Node = Ptr FTC_NodeRec



data FTC_ImageCacheRec
type FTC_ImageCache = Ptr FTC_ImageCacheRec



type FTC_SBit = Ptr FTC_SBitRec



data FTC_SBitCacheRec
type FTC_SBitCache = Ptr FTC_SBitCacheRec



data FTC_CMapCacheRec
type FTC_CMapCache = Ptr FTC_CMapCacheRec



data FTC_ScalerRec = FTC_ScalerRec
                       { srFace_id :: FTC_FaceID
                       , srWidth   :: FT_UInt
                       , srHeight  :: FT_UInt
                       , srPixel   :: FT_Int
                       , srX_res   :: FT_UInt
                       , srY_res   :: FT_UInt
                       }

instance Storable FTC_ScalerRec where
  sizeOf _    = #size      struct FTC_ScalerRec_
  alignment _ = #alignment struct FTC_ScalerRec_

  peek ptr =
    FTC_ScalerRec
      <$> #{peek struct FTC_ScalerRec_, face_id} ptr
      <*> #{peek struct FTC_ScalerRec_, width  } ptr
      <*> #{peek struct FTC_ScalerRec_, height } ptr
      <*> #{peek struct FTC_ScalerRec_, pixel  } ptr
      <*> #{peek struct FTC_ScalerRec_, x_res  } ptr
      <*> #{peek struct FTC_ScalerRec_, y_res  } ptr

  poke ptr val = do
    #{poke struct FTC_ScalerRec_, face_id} ptr $ val & srFace_id
    #{poke struct FTC_ScalerRec_, width  } ptr $ val & srWidth
    #{poke struct FTC_ScalerRec_, height } ptr $ val & srHeight
    #{poke struct FTC_ScalerRec_, pixel  } ptr $ val & srPixel
    #{poke struct FTC_ScalerRec_, x_res  } ptr $ val & srX_res
    #{poke struct FTC_ScalerRec_, y_res  } ptr $ val & srY_res



type FTC_Scaler = Ptr FTC_ScalerRec



data FTC_ImageTypeRec = FTC_ImageTypeRec
                           { itrFace_id :: FTC_FaceID
                           , itrWidth   :: FT_UInt
                           , itrHeight  :: FT_UInt
                           , itrFlags   :: FT_Int32
                           }

instance Storable FTC_ImageTypeRec where
  sizeOf _    = #size      struct FTC_ImageTypeRec_
  alignment _ = #alignment struct FTC_ImageTypeRec_

  peek ptr =
    FTC_ImageTypeRec
      <$> #{peek struct FTC_ImageTypeRec_, face_id} ptr
      <*> #{peek struct FTC_ImageTypeRec_, width  } ptr
      <*> #{peek struct FTC_ImageTypeRec_, height } ptr
      <*> #{peek struct FTC_ImageTypeRec_, flags  } ptr

  poke ptr val = do
    #{poke struct FTC_ImageTypeRec_, face_id} ptr $ val & itrFace_id
    #{poke struct FTC_ImageTypeRec_, width  } ptr $ val & itrWidth
    #{poke struct FTC_ImageTypeRec_, height } ptr $ val & itrHeight
    #{poke struct FTC_ImageTypeRec_, flags  } ptr $ val & itrFlags


type FTC_ImageType = Ptr FTC_ImageTypeRec


data FTC_SBitRec = FTC_SBitRec
                     { sbrWidth     :: FT_Byte
                     , sbrHeight    :: FT_Byte
                     , sbrLeft      :: FT_Char
                     , sbrTop       :: FT_Char
                     , sbrFormat    :: FT_Byte
                     , sbrMax_grays :: FT_Byte
                     , sbrPitch     :: FT_Short
                     , sbrXadvance  :: FT_Char
                     , sbrYadvance  :: FT_Char
                     , sbrBuffer    :: Ptr FT_Byte
                     }

instance Storable FTC_SBitRec where
  sizeOf _    = #size      struct FTC_SBitRec_
  alignment _ = #alignment struct FTC_SBitRec_

  peek ptr =
    FTC_SBitRec
      <$> #{peek struct FTC_SBitRec_, width    } ptr
      <*> #{peek struct FTC_SBitRec_, height   } ptr
      <*> #{peek struct FTC_SBitRec_, left     } ptr
      <*> #{peek struct FTC_SBitRec_, top      } ptr
      <*> #{peek struct FTC_SBitRec_, format   } ptr
      <*> #{peek struct FTC_SBitRec_, max_grays} ptr
      <*> #{peek struct FTC_SBitRec_, pitch    } ptr
      <*> #{peek struct FTC_SBitRec_, xadvance } ptr
      <*> #{peek struct FTC_SBitRec_, yadvance } ptr
      <*> #{peek struct FTC_SBitRec_, buffer   } ptr

  poke ptr val = do
    #{poke struct FTC_SBitRec_, width    } ptr $ val & sbrWidth
    #{poke struct FTC_SBitRec_, height   } ptr $ val & sbrHeight
    #{poke struct FTC_SBitRec_, left     } ptr $ val & sbrLeft
    #{poke struct FTC_SBitRec_, top      } ptr $ val & sbrTop
    #{poke struct FTC_SBitRec_, format   } ptr $ val & sbrFormat
    #{poke struct FTC_SBitRec_, max_grays} ptr $ val & sbrMax_grays
    #{poke struct FTC_SBitRec_, pitch    } ptr $ val & sbrPitch
    #{poke struct FTC_SBitRec_, xadvance } ptr $ val & sbrXadvance
    #{poke struct FTC_SBitRec_, yadvance } ptr $ val & sbrYadvance
    #{poke struct FTC_SBitRec_, buffer   } ptr $ val & sbrBuffer
