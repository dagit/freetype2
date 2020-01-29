{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE ForeignFunctionInterface #-}

module Graphics.FreeType.Bindings.Cache where

import           Graphics.FreeType.Bindings.Core.Base
import           Graphics.FreeType.Bindings.Core.Glyph
import           Graphics.FreeType.Bindings.Core.Types

import           Foreign.C.Types
import           Foreign.Ptr
import           Foreign.Storable

#include "ft2build.h"
#include FT_FREETYPE_H

#include "freetype/ftcache.h"

data FTC_ManagerRec
type FTC_Manager = Ptr FTC_ManagerRec



type FTC_FaceID = FT_Pointer



type FTC_Face_Requester = FunPtr (FTC_FaceID, FT_Library -> FT_Pointer -> Ptr FT_Face -> IO FT_Error)



foreign import ccall "FTC_Manager_New"
  ftc_Manager_New :: FT_Library -> FT_UInt -> FT_UInt -> FT_ULong -> FTC_Face_Requester -> FT_Pointer -> FTC_Manager -> IO FT_Error



foreign import ccall "FTC_Manager_Reset"
  ftc_Manager_Reset :: FTC_Manager -> IO ()



foreign import ccall "FTC_Manager_Done"
  ftc_Manager_Done :: FTC_Manager -> IO ()



foreign import ccall "FTC_Manager_LookupFace"
  ftc_Manager_LookupFace :: FTC_Manager -> FTC_FaceID -> Ptr FT_Face -> IO FT_Error



foreign import ccall "FTC_Manager_LookupSize"
  ftc_Manager_LookupSize :: FTC_Manager -> FTC_Scaler -> Ptr FT_Size -> IO FT_Error



foreign import ccall "FTC_Manager_RemoveFaceID"
  ftc_Manager_RemoveFaceID :: FTC_Manager -> FTC_FaceID -> IO ()



data FTC_NodeRec
type FTC_Node = Ptr FTC_NodeRec



foreign import ccall "FTC_Node_Unref"
  ftc_Node_Unref :: FTC_Node -> FTC_Manager -> IO ()



data FTC_ImageCacheRec
type FTC_ImageCache = Ptr FTC_ImageCacheRec



foreign import ccall "FTC_ImageCache_New"
  ftc_ImageCache_New :: FTC_Manager -> Ptr FTC_ImageCache -> IO FT_Error



foreign import ccall "FTC_ImageCache_Lookup"
  ftc_ImageCache_Lookup :: FTC_ImageCache -> FTC_ImageType -> FT_UInt -> Ptr FT_Glyph -> Ptr FTC_Node -> IO FT_Error



type FTC_SBit = Ptr FTC_SBitRec



data FTC_SBitCacheRec
type FTC_SBitCache = Ptr FTC_SBitCacheRec



foreign import ccall "FTC_SBitCache_New"
  ftc_SBitCache_New :: FTC_Manager -> Ptr FTC_SBitCache -> IO FT_Error



foreign import ccall "FTC_SBitCache_Lookup"
  ftc_SBitCache_Lookup :: FTC_SBitCache -> FTC_ImageType -> FT_UInt -> Ptr FTC_SBit -> Ptr FTC_Node -> IO FT_Error



data FTC_CMapCacheRec
type FTC_CMapCache = Ptr FTC_CMapCacheRec



foreign import ccall "FTC_CMapCache_New"
  ftc_CMapCache_New :: FTC_Manager -> Ptr FTC_CMapCache -> IO FT_Error



foreign import ccall "FTC_CMapCache_Lookup"
  ftc_CMapCache_Lookup :: FTC_CMapCache -> FTC_FaceID -> FT_Int -> FT_UInt32 -> IO FT_UInt



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
    #{poke struct FTC_ScalerRec_, face_id} ptr $ srFace_id val
    #{poke struct FTC_ScalerRec_, width  } ptr $ srWidth   val
    #{poke struct FTC_ScalerRec_, height } ptr $ srHeight  val
    #{poke struct FTC_ScalerRec_, pixel  } ptr $ srPixel   val
    #{poke struct FTC_ScalerRec_, x_res  } ptr $ srX_res   val
    #{poke struct FTC_ScalerRec_, y_res  } ptr $ srY_res   val



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
    #{poke struct FTC_ImageTypeRec_, face_id} ptr $ itrFace_id val
    #{poke struct FTC_ImageTypeRec_, width  } ptr $ itrWidth   val
    #{poke struct FTC_ImageTypeRec_, height } ptr $ itrHeight  val
    #{poke struct FTC_ImageTypeRec_, flags  } ptr $ itrFlags   val



type FTC_ImageType = Ptr FTC_ImageTypeRec



foreign import ccall "FTC_ImageCache_LookupScaler"
  ftc_ImageCache_LookupScaler :: FTC_ImageCache -> FTC_Scaler -> FT_ULong -> FT_UInt -> Ptr FT_Glyph -> Ptr FTC_Node -> IO FT_Error



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
    #{poke struct FTC_SBitRec_, width    } ptr $ sbrWidth     val
    #{poke struct FTC_SBitRec_, height   } ptr $ sbrHeight    val
    #{poke struct FTC_SBitRec_, left     } ptr $ sbrLeft      val
    #{poke struct FTC_SBitRec_, top      } ptr $ sbrTop       val
    #{poke struct FTC_SBitRec_, format   } ptr $ sbrFormat    val
    #{poke struct FTC_SBitRec_, max_grays} ptr $ sbrMax_grays val
    #{poke struct FTC_SBitRec_, pitch    } ptr $ sbrPitch     val
    #{poke struct FTC_SBitRec_, xadvance } ptr $ sbrXadvance  val
    #{poke struct FTC_SBitRec_, yadvance } ptr $ sbrYadvance  val
    #{poke struct FTC_SBitRec_, buffer   } ptr $ sbrBuffer    val



foreign import ccall "FTC_SBitCache_LookupScaler" 
  ftc_SBitCache_LookupScaler :: FTC_SBitCache -> FTC_Scaler -> FT_ULong -> FT_UInt -> Ptr FTC_SBit -> Ptr FTC_Node -> IO FT_Error 
