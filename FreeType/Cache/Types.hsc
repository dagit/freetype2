{-# LANGUAGE DataKinds
           , EmptyDataDecls
           , FlexibleInstances
           , ForeignFunctionInterface
           , MultiParamTypeClasses
           , TypeApplications #-}

{-# OPTIONS_HADDOCK hide #-}

module FreeType.Cache.Types where

import           FreeType.Core.Base.Types
import           FreeType.Core.Types.Types

import           Foreign.Ptr
import           Foreign.Storable
import           Foreign.Storable.Offset

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

instance Offset "srFace_id" FTC_ScalerRec where rawOffset = #{offset struct FTC_ScalerRec_, face_id}
instance Offset "srWidth"   FTC_ScalerRec where rawOffset = #{offset struct FTC_ScalerRec_, width  }
instance Offset "srHeight"  FTC_ScalerRec where rawOffset = #{offset struct FTC_ScalerRec_, height }
instance Offset "srPixel"   FTC_ScalerRec where rawOffset = #{offset struct FTC_ScalerRec_, pixel  }
instance Offset "srX_res"   FTC_ScalerRec where rawOffset = #{offset struct FTC_ScalerRec_, x_res  }
instance Offset "srY_res"   FTC_ScalerRec where rawOffset = #{offset struct FTC_ScalerRec_, y_res  }

instance Storable FTC_ScalerRec where
  sizeOf _    = #size      struct FTC_ScalerRec_
  alignment _ = #alignment struct FTC_ScalerRec_

  peek ptr =
    FTC_ScalerRec
      <$> peek (offset @"srFace_id" ptr)
      <*> peek (offset @"srWidth"   ptr)
      <*> peek (offset @"srHeight"  ptr)
      <*> peek (offset @"srPixel"   ptr)
      <*> peek (offset @"srX_res"   ptr)
      <*> peek (offset @"srY_res"   ptr)

  poke ptr val = do
    pokeField @"srFace_id" ptr val
    pokeField @"srWidth"   ptr val
    pokeField @"srHeight"  ptr val
    pokeField @"srPixel"   ptr val
    pokeField @"srX_res"   ptr val
    pokeField @"srY_res"   ptr val



type FTC_Scaler = Ptr FTC_ScalerRec



data FTC_ImageTypeRec = FTC_ImageTypeRec
                           { itrFace_id :: FTC_FaceID
                           , itrWidth   :: FT_UInt
                           , itrHeight  :: FT_UInt
                           , itrFlags   :: FT_Int32
                           }

instance Offset "itrFace_id" FTC_ImageTypeRec where rawOffset = #{offset struct FTC_ImageTypeRec_, face_id}
instance Offset "itrWidth"   FTC_ImageTypeRec where rawOffset = #{offset struct FTC_ImageTypeRec_, width  }
instance Offset "itrHeight"  FTC_ImageTypeRec where rawOffset = #{offset struct FTC_ImageTypeRec_, height }
instance Offset "itrFlags"   FTC_ImageTypeRec where rawOffset = #{offset struct FTC_ImageTypeRec_, flags  }

instance Storable FTC_ImageTypeRec where
  sizeOf _    = #size      struct FTC_ImageTypeRec_
  alignment _ = #alignment struct FTC_ImageTypeRec_

  peek ptr =
    FTC_ImageTypeRec
      <$> peek (offset @"itrFace_id" ptr)
      <*> peek (offset @"itrWidth"   ptr)
      <*> peek (offset @"itrHeight"  ptr)
      <*> peek (offset @"itrFlags"   ptr)

  poke ptr val = do
    pokeField @"itrFace_id" ptr val
    pokeField @"itrWidth"   ptr val
    pokeField @"itrHeight"  ptr val
    pokeField @"itrFlags"   ptr val



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

instance Offset "sbrWidth"     FTC_SBitRec where rawOffset = #{offset struct FTC_SBitRec_, width    }
instance Offset "sbrHeight"    FTC_SBitRec where rawOffset = #{offset struct FTC_SBitRec_, height   }
instance Offset "sbrLeft"      FTC_SBitRec where rawOffset = #{offset struct FTC_SBitRec_, left     }
instance Offset "sbrTop"       FTC_SBitRec where rawOffset = #{offset struct FTC_SBitRec_, top      }
instance Offset "sbrFormat"    FTC_SBitRec where rawOffset = #{offset struct FTC_SBitRec_, format   }
instance Offset "sbrMax_grays" FTC_SBitRec where rawOffset = #{offset struct FTC_SBitRec_, max_grays}
instance Offset "sbrPitch"     FTC_SBitRec where rawOffset = #{offset struct FTC_SBitRec_, pitch    }
instance Offset "sbrXadvance"  FTC_SBitRec where rawOffset = #{offset struct FTC_SBitRec_, xadvance }
instance Offset "sbrYadvance"  FTC_SBitRec where rawOffset = #{offset struct FTC_SBitRec_, yadvance }
instance Offset "sbrBuffer"    FTC_SBitRec where rawOffset = #{offset struct FTC_SBitRec_, buffer   }

instance Storable FTC_SBitRec where
  sizeOf _    = #size      struct FTC_SBitRec_
  alignment _ = #alignment struct FTC_SBitRec_

  peek ptr =
    FTC_SBitRec
      <$> peek (offset @"sbrWidth"     ptr)
      <*> peek (offset @"sbrHeight"    ptr)
      <*> peek (offset @"sbrLeft"      ptr)
      <*> peek (offset @"sbrTop"       ptr)
      <*> peek (offset @"sbrFormat"    ptr)
      <*> peek (offset @"sbrMax_grays" ptr)
      <*> peek (offset @"sbrPitch"     ptr)
      <*> peek (offset @"sbrXadvance"  ptr)
      <*> peek (offset @"sbrYadvance"  ptr)
      <*> peek (offset @"sbrBuffer"    ptr)

  poke ptr val = do
    pokeField @"sbrWidth"     ptr val
    pokeField @"sbrHeight"    ptr val
    pokeField @"sbrLeft"      ptr val
    pokeField @"sbrTop"       ptr val
    pokeField @"sbrFormat"    ptr val
    pokeField @"sbrMax_grays" ptr val
    pokeField @"sbrPitch"     ptr val
    pokeField @"sbrXadvance"  ptr val
    pokeField @"sbrYadvance"  ptr val
    pokeField @"sbrBuffer"    ptr val
