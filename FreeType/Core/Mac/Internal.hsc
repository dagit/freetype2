{-# LANGUAGE TemplateHaskell #-}

module FreeType.Core.Mac.Internal
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
import           FreeType.Error.Values

import           Data.Word
import           Foreign.C.Types
import           Foreign.Ptr

#include "ft2build.h"
#include FT_FREETYPE_H

#ifdef darwin_HOST_OS
foreign import ccall "FT_New_Face_From_FOND"
  ft_New_Face_From_FOND' :: FT_Library -> Handle -> FT_Long -> Ptr FT_Face -> IO FT_Error
#else
ft_New_Face_From_FOND' :: FT_Library -> Handle -> FT_Long -> Ptr FT_Face -> IO FT_Error
ft_New_Face_From_FOND' _ _ _ _ = return FT_Err_Unimplemented_Feature
#endif



#ifdef darwin_HOST_OS
foreign import ccall "FT_GetFile_From_Mac_Name"
  ft_GetFile_From_Mac_Name' :: Ptr CChar -> Ptr FSSpec -> Ptr FT_Long -> IO FT_Error
#else
ft_GetFile_From_Mac_Name' :: Ptr CChar -> Ptr FSSpec -> Ptr FT_Long -> IO FT_Error
ft_GetFile_From_Mac_Name' _ _ _  = return FT_Err_Unimplemented_Feature
#endif



#ifdef darwin_HOST_OS
foreign import ccall "FT_GetFile_From_Mac_ATS_Name"
  ft_GetFile_From_Mac_ATS_Name' :: Ptr CChar -> Ptr FSSpec -> Ptr FT_Long -> IO FT_Error
#else
ft_GetFile_From_Mac_ATS_Name' :: Ptr CChar -> Ptr FSSpec -> Ptr FT_Long -> IO FT_Error
ft_GetFile_From_Mac_ATS_Name' _ _ _ = return FT_Err_Unimplemented_Feature
#endif



#ifdef darwin_HOST_OS
foreign import ccall "FT_GetFilePath_From_Mac_ATS_Name"
  ft_GetFilePath_From_Mac_ATS_Name' :: Ptr CChar -> Ptr Word8 -> Word32 -> Ptr FT_Long -> IO FT_Error
#else
ft_GetFilePath_From_Mac_ATS_Name' :: Ptr CChar -> Ptr Word8 -> Word32 -> Ptr FT_Long -> IO FT_Error
ft_GetFilePath_From_Mac_ATS_Name' _ _ _ _ = return FT_Err_Unimplemented_Feature
#endif



#ifdef darwin_HOST_OS
foreign import ccall "FT_New_Face_From_FSSpec"
  ft_New_Face_From_FSSpec' :: FT_Library -> Ptr FSSpec -> FT_Long -> Ptr FT_Face -> IO FT_Error
#else
ft_New_Face_From_FSSpec' :: FT_Library -> Ptr FSSpec -> FT_Long -> Ptr FT_Face -> IO FT_Error
ft_New_Face_From_FSSpec' _ _ _ _ = return FT_Err_Unimplemented_Feature
#endif



#ifdef darwin_HOST_OS
foreign import ccall "FT_New_Face_From_FSRef"
  ft_New_Face_From_FSRef' :: FT_Library -> Ptr FSRef -> FT_Long -> Ptr FT_Face -> IO FT_Error
#else
ft_New_Face_From_FSRef' :: FT_Library -> Ptr FSRef -> FT_Long -> Ptr FT_Face -> IO FT_Error
ft_New_Face_From_FSRef' _ _ _ _ = return FT_Err_Unimplemented_Feature
#endif
