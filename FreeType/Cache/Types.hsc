{-# LANGUAGE DataKinds
           , DuplicateRecordFields
           , EmptyDataDecls
           , FlexibleInstances
           , ForeignFunctionInterface
           , MultiParamTypeClasses #-}
#if __GLASGOW_HASKELL__ >= 902
{-# LANGUAGE NoFieldSelectors #-}
#endif
{-# LANGUAGE TypeApplications #-}

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
                       { face_id :: FTC_FaceID
                       , width   :: FT_UInt
                       , height  :: FT_UInt
                       , pixel   :: FT_Int
                       , x_res   :: FT_UInt
                       , y_res   :: FT_UInt
                       }

instance Offset "face_id" FTC_ScalerRec where rawOffset = #{offset struct FTC_ScalerRec_, face_id}
instance Offset "width"   FTC_ScalerRec where rawOffset = #{offset struct FTC_ScalerRec_, width  }
instance Offset "height"  FTC_ScalerRec where rawOffset = #{offset struct FTC_ScalerRec_, height }
instance Offset "pixel"   FTC_ScalerRec where rawOffset = #{offset struct FTC_ScalerRec_, pixel  }
instance Offset "x_res"   FTC_ScalerRec where rawOffset = #{offset struct FTC_ScalerRec_, x_res  }
instance Offset "y_res"   FTC_ScalerRec where rawOffset = #{offset struct FTC_ScalerRec_, y_res  }

instance Storable FTC_ScalerRec where
  sizeOf _    = #size      struct FTC_ScalerRec_
  alignment _ = #alignment struct FTC_ScalerRec_

  peek ptr =
    FTC_ScalerRec
      <$> peek (offset @"face_id" ptr)
      <*> peek (offset @"width"   ptr)
      <*> peek (offset @"height"  ptr)
      <*> peek (offset @"pixel"   ptr)
      <*> peek (offset @"x_res"   ptr)
      <*> peek (offset @"y_res"   ptr)

  poke ptr val = do
    pokeField @"face_id" ptr val
    pokeField @"width"   ptr val
    pokeField @"height"  ptr val
    pokeField @"pixel"   ptr val
    pokeField @"x_res"   ptr val
    pokeField @"y_res"   ptr val



type FTC_Scaler = Ptr FTC_ScalerRec



data FTC_ImageTypeRec = FTC_ImageTypeRec
                           { face_id :: FTC_FaceID
                           , width   :: FT_UInt
                           , height  :: FT_UInt
                           , flags   :: FT_Int32
                           }

instance Offset "face_id" FTC_ImageTypeRec where rawOffset = #{offset struct FTC_ImageTypeRec_, face_id}
instance Offset "width"   FTC_ImageTypeRec where rawOffset = #{offset struct FTC_ImageTypeRec_, width  }
instance Offset "height"  FTC_ImageTypeRec where rawOffset = #{offset struct FTC_ImageTypeRec_, height }
instance Offset "flags"   FTC_ImageTypeRec where rawOffset = #{offset struct FTC_ImageTypeRec_, flags  }

instance Storable FTC_ImageTypeRec where
  sizeOf _    = #size      struct FTC_ImageTypeRec_
  alignment _ = #alignment struct FTC_ImageTypeRec_

  peek ptr =
    FTC_ImageTypeRec
      <$> peek (offset @"face_id" ptr)
      <*> peek (offset @"width"   ptr)
      <*> peek (offset @"height"  ptr)
      <*> peek (offset @"flags"   ptr)

  poke ptr val = do
    pokeField @"face_id" ptr val
    pokeField @"width"   ptr val
    pokeField @"height"  ptr val
    pokeField @"flags"   ptr val



type FTC_ImageType = Ptr FTC_ImageTypeRec


data FTC_SBitRec = FTC_SBitRec
                     { width     :: FT_Byte
                     , height    :: FT_Byte
                     , left      :: FT_Char
                     , top       :: FT_Char
                     , format    :: FT_Byte
                     , max_grays :: FT_Byte
                     , pitch     :: FT_Short
                     , xadvance  :: FT_Char
                     , yadvance  :: FT_Char
                     , buffer    :: Ptr FT_Byte
                     }

instance Offset "width"     FTC_SBitRec where rawOffset = #{offset struct FTC_SBitRec_, width    }
instance Offset "height"    FTC_SBitRec where rawOffset = #{offset struct FTC_SBitRec_, height   }
instance Offset "left"      FTC_SBitRec where rawOffset = #{offset struct FTC_SBitRec_, left     }
instance Offset "top"       FTC_SBitRec where rawOffset = #{offset struct FTC_SBitRec_, top      }
instance Offset "format"    FTC_SBitRec where rawOffset = #{offset struct FTC_SBitRec_, format   }
instance Offset "max_grays" FTC_SBitRec where rawOffset = #{offset struct FTC_SBitRec_, max_grays}
instance Offset "pitch"     FTC_SBitRec where rawOffset = #{offset struct FTC_SBitRec_, pitch    }
instance Offset "xadvance"  FTC_SBitRec where rawOffset = #{offset struct FTC_SBitRec_, xadvance }
instance Offset "yadvance"  FTC_SBitRec where rawOffset = #{offset struct FTC_SBitRec_, yadvance }
instance Offset "buffer"    FTC_SBitRec where rawOffset = #{offset struct FTC_SBitRec_, buffer   }

instance Storable FTC_SBitRec where
  sizeOf _    = #size      struct FTC_SBitRec_
  alignment _ = #alignment struct FTC_SBitRec_

  peek ptr =
    FTC_SBitRec
      <$> peek (offset @"width"     ptr)
      <*> peek (offset @"height"    ptr)
      <*> peek (offset @"left"      ptr)
      <*> peek (offset @"top"       ptr)
      <*> peek (offset @"format"    ptr)
      <*> peek (offset @"max_grays" ptr)
      <*> peek (offset @"pitch"     ptr)
      <*> peek (offset @"xadvance"  ptr)
      <*> peek (offset @"yadvance"  ptr)
      <*> peek (offset @"buffer"    ptr)

  poke ptr val = do
    pokeField @"width"     ptr val
    pokeField @"height"    ptr val
    pokeField @"left"      ptr val
    pokeField @"top"       ptr val
    pokeField @"format"    ptr val
    pokeField @"max_grays" ptr val
    pokeField @"pitch"     ptr val
    pokeField @"xadvance"  ptr val
    pokeField @"yadvance"  ptr val
    pokeField @"buffer"    ptr val
