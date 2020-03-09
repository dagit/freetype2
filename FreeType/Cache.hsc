{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE TemplateHaskell #-}

{- | Please refer to the
     [Cache Sub-System > Cache Sub-System](https://www.freetype.org/freetype2/docs/reference/ft2-cache_subsystem.html)
     chapter of the reference.

     Internal: "FreeType.Cache.Internal".
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
  , ftc_Manager_With
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

import           FreeType.Cache.Internal
import           FreeType.Cache.Types
import           FreeType.Core.Base.Types
import           FreeType.Core.Glyph.Types
import           FreeType.Core.Types.Types
import           FreeType.Exception.Internal

import           Control.Exception
import           Foreign.Marshal.Alloc
import           Foreign.Ptr
import           Foreign.Storable
import           Language.Haskell.TH.Syntax (Name)

#include "ft2build.h"
#include FT_CACHE_H

ftc_Manager_New
  :: FT_Library         -- ^ library
  -> FT_UInt            -- ^ max_faces
  -> FT_UInt            -- ^ max_sizes
  -> FT_ULong           -- ^ max_bytes
  -> FTC_Face_Requester -- ^ requester
  -> FT_Pointer         -- ^ req_data
  -> IO FTC_Manager     -- ^ manager
ftc_Manager_New =
  autoAllocaError 'ftc_Manager_New ftc_Manager_New'



-- | 'bracket' over 'ft_Manager_With' and 'ft_Manager_Done'.
--
--   The provided 'FTC_Manager' should not be used after this function terminates.
ftc_Manager_With
  :: FT_Library            -- ^ library
  -> FT_UInt               -- ^ max_faces
  -> FT_UInt               -- ^ max_sizes
  -> FT_ULong              -- ^ max_bytes
  -> FTC_Face_Requester    -- ^ requester
  -> FT_Pointer            -- ^ req_data
  -> (FTC_Manager -> IO a)
  -> IO a
ftc_Manager_With lib faces sizes bytes req data_ =
  bracket (ftc_Manager_New lib faces sizes bytes req data_) ftc_Manager_Done



foreign import ccall "FTC_Manager_Reset"
  ftc_Manager_Reset
    :: FTC_Manager -- ^ manager
    -> IO ()



foreign import ccall "FTC_Manager_Done"
  ftc_Manager_Done
    :: FTC_Manager -- ^ manager
    -> IO ()



ftc_Manager_LookupFace
  :: FTC_Manager -- ^ manager
  -> FTC_FaceID  -- ^ face_id
  -> IO FT_Face  -- ^ face
ftc_Manager_LookupFace =
  autoAllocaError 'ftc_Manager_LookupFace ftc_Manager_LookupFace'



ftc_Manager_LookupSize
  :: FTC_Manager -- ^ manager
  -> FTC_Scaler  -- ^ scaler
  -> IO FT_Size  -- ^ size
ftc_Manager_LookupSize =
  autoAllocaError 'ftc_Manager_LookupSize ftc_Manager_LookupSize'



foreign import ccall "FTC_Manager_RemoveFaceID"    
  ftc_Manager_RemoveFaceID
    :: FTC_Manager -- ^ manager
    -> FTC_FaceID  -- ^ face_id
    -> IO ()    



foreign import ccall "FTC_Node_Unref"    
  ftc_Node_Unref
    :: FTC_Node    -- ^ node
    -> FTC_Manager -- ^ manager
    -> IO ()    



ftc_ImageCache_New
  :: FTC_Manager       -- ^ manager
  -> IO FTC_ImageCache -- ^ cache
ftc_ImageCache_New =
  autoAllocaError 'ftc_ImageCache_New ftc_ImageCache_New'



anodize :: Storable a => Name -> (Ptr a -> Ptr FTC_Node -> IO FT_Error) -> IO (a, Maybe FTC_Node)
anodize name f =
  alloca $ \objPtr ->
    alloca $ \anodePtr -> do
      ftError name $ f objPtr anodePtr
      (,)
        <$> peek objPtr
        <*> do anode <- peek anodePtr
               return $ if anode == nullPtr
                          then Nothing
                          else Just anode



ftc_ImageCache_Lookup
  :: FTC_ImageCache                -- ^ cache
  -> FTC_ImageType                 -- ^ type
  -> FT_UInt                       -- ^ gindex
  -> IO (FT_Glyph, Maybe FTC_Node) -- ^ (aglyph, anode)
ftc_ImageCache_Lookup cache type_ gindex =
  anodize 'ftc_ImageCache_Lookup $ ftc_ImageCache_Lookup' cache type_ gindex



ftc_SBitCache_New
  :: FTC_Manager      -- ^ manager
  -> IO FTC_SBitCache -- ^ acache
ftc_SBitCache_New =
  autoAllocaError 'ftc_SBitCache_New ftc_SBitCache_New'



ftc_SBitCache_Lookup
  :: FTC_SBitCache                 -- ^ cache
  -> FTC_ImageType                 -- ^ type
  -> FT_UInt                       -- ^ gindex
  -> IO (FTC_SBit, Maybe FTC_Node) -- ^ (sbit, anode)
ftc_SBitCache_Lookup cache type_ gindex =
  anodize 'ftc_SBitCache_Lookup $ ftc_SBitCache_Lookup' cache type_ gindex



ftc_CMapCache_New
  :: FTC_Manager      -- ^ manager
  -> IO FTC_CMapCache -- ^ acache
ftc_CMapCache_New =
  autoAllocaError 'ftc_CMapCache_New ftc_CMapCache_New'



foreign import ccall "FTC_CMapCache_Lookup"
  ftc_CMapCache_Lookup
    :: FTC_CMapCache -- ^ cache
    -> FTC_FaceID    -- ^ face_id
    -> FT_Int        -- ^ cmap_index
    -> FT_UInt32     -- ^ char_code
    -> IO FT_UInt



ftc_ImageCache_LookupScaler
  :: FTC_ImageCache                -- ^ cache
  -> FTC_Scaler                    -- ^ scaler
  -> FT_ULong                      -- ^ load_flags
  -> FT_UInt                       -- ^ gindex
  -> IO (FT_Glyph, Maybe FTC_Node) -- ^(aglyph, anode)
ftc_ImageCache_LookupScaler cache scaler flags gindex =
  anodize 'ftc_ImageCache_LookupScaler $ ftc_ImageCache_LookupScaler' cache scaler flags gindex



ftc_SBitCache_LookupScaler
  :: FTC_SBitCache                 -- ^ cache
  -> FTC_Scaler                    -- ^ scaler
  -> FT_ULong                      -- ^ load_flags
  -> FT_UInt                       -- ^ gindex
  -> IO (FTC_SBit, Maybe FTC_Node) -- ^ (sbit, anode)
ftc_SBitCache_LookupScaler cache scaler flags gindex =
  anodize 'ftc_SBitCache_LookupScaler $ ftc_SBitCache_LookupScaler' cache scaler flags gindex
