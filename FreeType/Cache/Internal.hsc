{-# LANGUAGE ForeignFunctionInterface #-}

module FreeType.Cache.Internal
  ( FTC_ManagerRec
  , FTC_NodeRec
  , FTC_ImageCacheRec
  , FTC_SBitCacheRec
  , FTC_CMapCacheRec
  -- ** FTC_Manager_New
  , ftc_Manager_New'
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
  ftc_Manager_New'
    :: FT_Library         -- ^ library
    -> FT_UInt            -- ^ max_faces
    -> FT_UInt            -- ^ max_sizes
    -> FT_ULong           -- ^ max_bytes
    -> FTC_Face_Requester -- ^ requester
    -> FT_Pointer         -- ^ req_data
    -> Ptr FTC_Manager    -- ^ amanager
    -> IO FT_Error



foreign import ccall "FTC_Manager_LookupFace"
  ftc_Manager_LookupFace'
    :: FTC_Manager -- ^ manager
    -> FTC_FaceID  -- ^ face_id
    -> Ptr FT_Face -- ^ aface
    -> IO FT_Error


foreign import ccall "FTC_Manager_LookupSize"
  ftc_Manager_LookupSize'
    :: FTC_Manager -- ^ manager
    -> FTC_Scaler  -- ^ scaler
    -> Ptr FT_Size -- ^ asize
    -> IO FT_Error



foreign import ccall "FTC_ImageCache_New"
  ftc_ImageCache_New'
    :: FTC_Manager        -- ^ manager
    -> Ptr FTC_ImageCache -- ^ acache
    -> IO FT_Error



foreign import ccall "FTC_ImageCache_Lookup"
  ftc_ImageCache_Lookup'
    :: FTC_ImageCache -- ^ cache
    -> FTC_ImageType  -- ^ type
    -> FT_UInt        -- ^ gindex
    -> Ptr FT_Glyph   -- ^ aglyph
    -> Ptr FTC_Node   -- ^ anode
    -> IO FT_Error



foreign import ccall "FTC_SBitCache_New"
  ftc_SBitCache_New'
    :: FTC_Manager       -- ^ manager
    -> Ptr FTC_SBitCache -- ^ acache
    -> IO FT_Error



foreign import ccall "FTC_SBitCache_Lookup"
  ftc_SBitCache_Lookup'
    :: FTC_SBitCache -- ^ cache
    -> FTC_ImageType -- ^ type
    -> FT_UInt       -- ^ gindex
    -> Ptr FTC_SBit  -- ^ sbit
    -> Ptr FTC_Node  -- ^ anode
    -> IO FT_Error



foreign import ccall "FTC_CMapCache_New"
  ftc_CMapCache_New'
    :: FTC_Manager       -- ^ manager
    -> Ptr FTC_CMapCache -- ^ acache
    -> IO FT_Error



foreign import ccall "FTC_ImageCache_LookupScaler"
  ftc_ImageCache_LookupScaler'
    :: FTC_ImageCache -- ^ cache
    -> FTC_Scaler     -- ^ scaler
    -> FT_ULong       -- ^ load_flags
    -> FT_UInt        -- ^ gindex
    -> Ptr FT_Glyph   -- ^ aglyph
    -> Ptr FTC_Node   -- ^ anode
    -> IO FT_Error



foreign import ccall "FTC_SBitCache_LookupScaler"
  ftc_SBitCache_LookupScaler'
    :: FTC_SBitCache -- ^ cache
    -> FTC_Scaler    -- ^ scaler
    -> FT_ULong      -- ^ load_flags
    -> FT_UInt       -- ^ gindex
    -> Ptr FTC_SBit  -- ^ sbit
    -> Ptr FTC_Node  -- ^ anode
    -> IO FT_Error
