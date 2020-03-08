{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE TemplateHaskell #-}

module FreeType.Cache
  ( -- ** FTC_Manager
    FTC_Manager
  , FTC_ManagerRec
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
  , FTC_NodeRec
    -- ** FTC_Node_Unref
  , ftc_Node_Unref
    -- ** FTC_ImageCache
  , FTC_ImageCache
  , FTC_ImageCacheRec
    -- ** FTC_ImageCache_New
  , ftc_ImageCache_New
    -- ** FTC_ImageCache_Lookup
  , ftc_ImageCache_Lookup
    -- ** FTC_SBit
  , FTC_SBit
    -- ** FTC_SBitCache
  , FTC_SBitCache
  , FTC_SBitCacheRec
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
  -> IO FTC_Manager
ftc_Manager_New =
  autoAllocaError 'ftc_Manager_New ftc_Manager_New'



foreign import ccall "FTC_Manager_Reset"
  ftc_Manager_Reset :: FTC_Manager -> IO ()



foreign import ccall "FTC_Manager_Done"
  ftc_Manager_Done :: FTC_Manager -> IO ()



ftc_Manager_LookupFace :: FTC_Manager -> FTC_FaceID -> IO FT_Face
ftc_Manager_LookupFace =
  autoAllocaError 'ftc_Manager_LookupFace ftc_Manager_LookupFace'



ftc_Manager_LookupSize :: FTC_Manager -> FTC_Scaler -> IO FT_Size
ftc_Manager_LookupSize =
  autoAllocaError 'ftc_Manager_LookupSize ftc_Manager_LookupSize'



foreign import ccall "FTC_Manager_RemoveFaceID"    
  ftc_Manager_RemoveFaceID :: FTC_Manager -> FTC_FaceID -> IO ()    



foreign import ccall "FTC_Node_Unref"    
  ftc_Node_Unref :: FTC_Node -> FTC_Manager -> IO ()    



ftc_ImageCache_New :: FTC_Manager -> IO FTC_ImageCache
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



ftc_SBitCache_New :: FTC_Manager -> IO FTC_SBitCache
ftc_SBitCache_New =
  autoAllocaError 'ftc_SBitCache_New ftc_SBitCache_New'



ftc_SBitCache_Lookup
  :: FTC_SBitCache                 -- ^ cache
  -> FTC_ImageType                 -- ^ type
  -> FT_UInt                       -- ^ gindex
  -> IO (FTC_SBit, Maybe FTC_Node) -- ^ (sbit, anode)
ftc_SBitCache_Lookup cache type_ gindex =
  anodize 'ftc_SBitCache_Lookup $ ftc_SBitCache_Lookup' cache type_ gindex



ftc_CMapCache_New :: FTC_Manager -> IO FTC_CMapCache
ftc_CMapCache_New =
  autoAllocaError 'ftc_CMapCache_New ftc_CMapCache_New'



foreign import ccall "FTC_CMapCache_Lookup"
  ftc_CMapCache_Lookup :: FTC_CMapCache -> FTC_FaceID -> FT_Int -> FT_UInt32 -> IO FT_UInt



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
