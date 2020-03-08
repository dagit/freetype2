{-# LANGUAGE ForeignFunctionInterface #-}

module FreeType.Cache.Internal
  ( -- ** FTC_Manager_New
    ftc_Manager_New'
    -- ** FTC_Manager_LookupFace
  , ftc_Manager_LookupFace'
    -- ** FTC_Manager_LookupSize
  , ftc_Manager_LookupSize'
    -- ** FTC_ImageCache_New
  , ftc_ImageCache_New'
    -- ** FTC_ImageCache_Lookup
  , ftc_ImageCache_Lookup'
    -- ** FTC_SBitCache_New
  , ftc_SBitCache_New'
    -- ** FTC_SBitCache_Lookup
  , ftc_SBitCache_Lookup'
    -- ** FTC_CMapCache_New
  , ftc_CMapCache_New'
    -- ** FTC_ImageCache_LookupScaler
  , ftc_ImageCache_LookupScaler'
    -- ** FTC_SBitCache_LookupScaler
  , ftc_SBitCache_LookupScaler'
  ) where

import           FreeType.Core.Base.Types
import           FreeType.Cache.Types
import           FreeType.Core.Glyph.Types
import           FreeType.Core.Types.Types

import           Foreign.Ptr

#include "ft2build.h"
#include FT_CACHE_H

foreign import ccall "FTC_Manager_New"
  ftc_Manager_New' :: FT_Library -> FT_UInt -> FT_UInt -> FT_ULong -> FTC_Face_Requester -> FT_Pointer -> Ptr FTC_Manager -> IO FT_Error



foreign import ccall "FTC_Manager_LookupFace"
  ftc_Manager_LookupFace' :: FTC_Manager -> FTC_FaceID -> Ptr FT_Face -> IO FT_Error


foreign import ccall "FTC_Manager_LookupSize"
  ftc_Manager_LookupSize' :: FTC_Manager -> FTC_Scaler -> Ptr FT_Size -> IO FT_Error



foreign import ccall "FTC_ImageCache_New"
  ftc_ImageCache_New' :: FTC_Manager -> Ptr FTC_ImageCache -> IO FT_Error



foreign import ccall "FTC_ImageCache_Lookup"
  ftc_ImageCache_Lookup' :: FTC_ImageCache -> FTC_ImageType -> FT_UInt -> Ptr FT_Glyph -> Ptr FTC_Node -> IO FT_Error



foreign import ccall "FTC_SBitCache_New"
  ftc_SBitCache_New' :: FTC_Manager -> Ptr FTC_SBitCache -> IO FT_Error



foreign import ccall "FTC_SBitCache_Lookup"
  ftc_SBitCache_Lookup' :: FTC_SBitCache -> FTC_ImageType -> FT_UInt -> Ptr FTC_SBit -> Ptr FTC_Node -> IO FT_Error



foreign import ccall "FTC_CMapCache_New"
  ftc_CMapCache_New' :: FTC_Manager -> Ptr FTC_CMapCache -> IO FT_Error



foreign import ccall "FTC_ImageCache_LookupScaler"
  ftc_ImageCache_LookupScaler' :: FTC_ImageCache -> FTC_Scaler -> FT_ULong -> FT_UInt -> Ptr FT_Glyph -> Ptr FTC_Node -> IO FT_Error



foreign import ccall "FTC_SBitCache_LookupScaler"
  ftc_SBitCache_LookupScaler' :: FTC_SBitCache -> FTC_Scaler -> FT_ULong -> FT_UInt -> Ptr FTC_SBit -> Ptr FTC_Node -> IO FT_Error
