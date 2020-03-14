{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE TemplateHaskell #-}

module FreeType.Core.Mac.Internal where
{-
#ifdef darwin_HOST_OS
  ( -- ** FT_New_Face_From_FOND
    ft_New_Face_From_FOND'
    -- ** FT_GetFile_From_Mac_Name
  , ft_GetFile_From_Mac_Name'
    -- ** FT_GetFile_From_Mac_ATS_Name
  , ft_GetFile_From_Mac_ATS_Name'
    -- ** FT_GetFilePath_From_Mac_ATS_Name
  , ft_GetFilePath_From_Mac_ATS_Name'
    -- ** FT_New_Face_From_FSSpec
  , ft_New_Face_From_FSSpec'
    -- ** FT_New_Face_From_FSRef
  , ft_New_Face_From_FSRef'
  ) where

import           FreeType.Core.Base.Types
import           FreeType.Core.Mac.Types
import           FreeType.Core.Types.Types

import           Data.Word
import           Foreign.C.Types
import           Foreign.Ptr

#include <CoreServices/CoreServices.h>
#include "ft2build.h"
#include FT_FREETYPE_H
#include FT_MAC_H

foreign import ccall "FT_New_Face_From_FOND"
  ft_New_Face_From_FOND'
    :: FT_Library  -- ^ library
    -> Handle      -- ^ fond
    -> FT_Long     -- ^ face_index
    -> Ptr FT_Face -- ^ aface
    -> IO FT_Error



foreign import ccall "FT_GetFile_From_Mac_Name"
  ft_GetFile_From_Mac_Name'
    :: Ptr CChar   -- ^ fontName
    -> Ptr FSSpec  -- ^ pathSpec
    -> Ptr FT_Long -- ^ face_index
    -> IO FT_Error



foreign import ccall "FT_GetFile_From_Mac_ATS_Name"
  ft_GetFile_From_Mac_ATS_Name'
    :: Ptr CChar   -- ^ fontName
    -> Ptr FSSpec  -- ^ pathSpec
    -> Ptr FT_Long -- ^ face_index
    -> IO FT_Error



foreign import ccall "FT_GetFilePath_From_Mac_ATS_Name"
  ft_GetFilePath_From_Mac_ATS_Name'
    :: Ptr CChar   -- ^ fontName
    -> Ptr Word8   -- ^ path
    -> Word32      -- ^ maxPathSize
    -> Ptr FT_Long -- ^ face_index
    -> IO FT_Error



foreign import ccall "FT_New_Face_From_FSSpec"
  ft_New_Face_From_FSSpec'
    :: FT_Library  -- ^ library
    -> Ptr FSSpec  -- ^ spec
    -> FT_Long     -- ^ face_index
    -> Ptr FT_Face -- ^ aface
    -> IO FT_Error



foreign import ccall "FT_New_Face_From_FSRef"
  ft_New_Face_From_FSRef'
    :: FT_Library  -- ^ library
    -> Ptr FSRef   -- ^ ref
    -> FT_Long     -- ^ face_index
    -> Ptr FT_Face -- ^ aface
    -> IO FT_Error
#endif
-}
