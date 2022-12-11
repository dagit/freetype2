{-# LANGUAGE CApiFFI
           , CPP
           , ForeignFunctionInterface #-}

{- | Please refer to the
     [Cache Sub-System > Cache Sub-System](https://www.freetype.org/freetype2/docs/reference/ft2-cache_subsystem.html)
     chapter of the reference.
 -}

module FreeType.Cache
  ( -- ** FTC_Manager
    FTC_Manager
    -- ** FTC_FaceID
  , FTC_FaceID
    -- ** FTC_Face_Requester
  , FTC_Face_Requester
    -- ** FTC_Manager_New
  , ftc_Manager_New
    -- ** FTC_Manager_Reset
  , ftc_Manager_Reset
    -- ** FTC_Manager_Done
  , ftc_Manager_Done
    -- ** FTC_Manager_LookupFace
  , ftc_Manager_LookupFace
    -- ** FTC_Manager_LookupSize
  , ftc_Manager_LookupSize
    -- ** FTC_Manager_RemoveFaceID
  , ftc_Manager_RemoveFaceID
    -- ** FTC_Node
  , FTC_Node
    -- ** FTC_Node_Unref
  , ftc_Node_Unref
    -- ** FTC_ImageCache
  , FTC_ImageCache
    -- ** FTC_ImageCache_New
  , ftc_ImageCache_New
    -- ** FTC_ImageCache_Lookup
  , ftc_ImageCache_Lookup
    -- ** FTC_SBit
  , FTC_SBit
    -- ** FTC_SBitCache
  , FTC_SBitCache
    -- ** FTC_SBitCache_New
  , ftc_SBitCache_New
    -- ** FTC_SBitCache_Lookup
  , ftc_SBitCache_Lookup
    -- ** FTC_CMapCache
  , FTC_CMapCache
    -- ** FTC_CMapCache_New
  , ftc_CMapCache_New
    -- ** FTC_CMapCache_Lookup
  , ftc_CMapCache_Lookup
    -- ** FTC_ScalerRec
  , FTC_ScalerRec (..)
    -- ** FTC_Scaler
  , FTC_Scaler
    -- ** FTC_ImageTypeRec
  , FTC_ImageTypeRec (..)
    -- ** FTC_ImageType
  , FTC_ImageType
    -- ** FTC_ImageCache_LookupScaler
  , ftc_ImageCache_LookupScaler
    -- ** FTC_SBitRec
  , FTC_SBitRec (..)
    -- ** FTC_SBitCache_LookupScaler
  , ftc_SBitCache_LookupScaler
  ) where

import           FreeType.Cache.Types
import           FreeType.Core.Base.Types
import           FreeType.Core.Glyph.Types
import           FreeType.Core.Types.Types

import           Foreign.Ptr

#include <extra/ftinternal.h>
#include "ft2build.h"
#include FT_CACHE_H

foreign import CALLCV "freetype/ftcache.h FTC_Manager_New"
  ftc_Manager_New
    :: FT_Library         -- ^ library
    -> FT_UInt            -- ^ max_faces
    -> FT_UInt            -- ^ max_sizes
    -> FT_ULong           -- ^ max_bytes
    -> FTC_Face_Requester -- ^ requester
    -> FT_Pointer         -- ^ req_data
    -> Ptr FTC_Manager    -- ^ amanager
    -> IO FT_Error



foreign import CALLCV "freetype/ftcache.h FTC_Manager_Reset"
  ftc_Manager_Reset
    :: FTC_Manager -- ^ manager
    -> IO ()



foreign import CALLCV "freetype/ftcache.h FTC_Manager_Done"
  ftc_Manager_Done
    :: FTC_Manager -- ^ manager
    -> IO ()


foreign import CALLCV "freetype/ftcache.h FTC_Manager_LookupFace"
  ftc_Manager_LookupFace
    :: FTC_Manager -- ^ manager
    -> FTC_FaceID  -- ^ face_id
    -> Ptr FT_Face -- ^ aface
    -> IO FT_Error


foreign import CALLCV "freetype/ftcache.h FTC_Manager_LookupSize"
  ftc_Manager_LookupSize
    :: FTC_Manager -- ^ manager
    -> FTC_Scaler  -- ^ scaler
    -> Ptr FT_Size -- ^ asize
    -> IO FT_Error



foreign import CALLCV "freetype/ftcache.h FTC_Manager_RemoveFaceID"
  ftc_Manager_RemoveFaceID
    :: FTC_Manager -- ^ manager
    -> FTC_FaceID  -- ^ face_id
    -> IO ()



foreign import CALLCV "freetype/ftcache.h FTC_Node_Unref"
  ftc_Node_Unref
    :: FTC_Node    -- ^ node
    -> FTC_Manager -- ^ manager
    -> IO ()



foreign import CALLCV "freetype/ftcache.h FTC_ImageCache_New"
  ftc_ImageCache_New
    :: FTC_Manager        -- ^ manager
    -> Ptr FTC_ImageCache -- ^ acache
    -> IO FT_Error



foreign import CALLCV "freetype/ftcache.h FTC_ImageCache_Lookup"
  ftc_ImageCache_Lookup
    :: FTC_ImageCache -- ^ cache
    -> FTC_ImageType  -- ^ type
    -> FT_UInt        -- ^ gindex
    -> Ptr FT_Glyph   -- ^ aglyph
    -> Ptr FTC_Node   -- ^ anode
    -> IO FT_Error



foreign import CALLCV "freetype/ftcache.h FTC_SBitCache_New"
  ftc_SBitCache_New
    :: FTC_Manager       -- ^ manager
    -> Ptr FTC_SBitCache -- ^ acache
    -> IO FT_Error



foreign import CALLCV "freetype/ftcache.h FTC_SBitCache_Lookup"
  ftc_SBitCache_Lookup
    :: FTC_SBitCache -- ^ cache
    -> FTC_ImageType -- ^ type
    -> FT_UInt       -- ^ gindex
    -> Ptr FTC_SBit  -- ^ sbit
    -> Ptr FTC_Node  -- ^ anode
    -> IO FT_Error



foreign import CALLCV "freetype/ftcache.h FTC_CMapCache_New"
  ftc_CMapCache_New
    :: FTC_Manager       -- ^ manager
    -> Ptr FTC_CMapCache -- ^ acache
    -> IO FT_Error



foreign import CALLCV "freetype/ftcache.h FTC_CMapCache_Lookup"
  ftc_CMapCache_Lookup
    :: FTC_CMapCache -- ^ cache
    -> FTC_FaceID    -- ^ face_id
    -> FT_Int        -- ^ cmap_index
    -> FT_UInt32     -- ^ char_code
    -> IO FT_UInt



foreign import CALLCV "freetype/ftcache.h FTC_ImageCache_LookupScaler"
  ftc_ImageCache_LookupScaler
    :: FTC_ImageCache -- ^ cache
    -> FTC_Scaler     -- ^ scaler
    -> FT_ULong       -- ^ load_flags
    -> FT_UInt        -- ^ gindex
    -> Ptr FT_Glyph   -- ^ aglyph
    -> Ptr FTC_Node   -- ^ anode
    -> IO FT_Error



foreign import CALLCV "freetype/ftcache.h FTC_SBitCache_LookupScaler"
  ftc_SBitCache_LookupScaler
    :: FTC_SBitCache -- ^ cache
    -> FTC_Scaler    -- ^ scaler
    -> FT_ULong      -- ^ load_flags
    -> FT_UInt       -- ^ gindex
    -> Ptr FTC_SBit  -- ^ sbit
    -> Ptr FTC_Node  -- ^ anode
    -> IO FT_Error
