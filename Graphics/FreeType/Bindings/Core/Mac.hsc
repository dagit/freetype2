{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}

module Graphics.FreeType.Bindings.Core.Mac where

import           Graphics.FreeType.Bindings.Core.Base
import           Graphics.FreeType.Bindings.Core.Types

import           Foreign.C.Types
import           Foreign.Ptr

#include "ft2build.h"
#include FT_FREETYPE_H

type Handle = Ptr ()

foreign import ccall "FT_New_Face_From_FOND"
  ft_New_Face_From_FOND :: FT_Library -> Handle -> FT_Long -> Ptr FT_Face -> IO FT_Error



data FSSpec

foreign import ccall "FT_GetFile_From_Mac_Name"
  ft_GetFile_From_Mac_Name :: Ptr CChar -> Ptr FSSpec -> Ptr FT_Long -> IO FT_Error



foreign import ccall "FT_Palette_From_Mac_ATS_Name"
  ft_GetFile_From_Mac_ATS_Name :: Ptr CChar -> Ptr FSSpec -> Ptr FT_Long -> IO FT_Error



foreign import ccall "FT_GetFilePath_From_Mac_ATS_Name"
  ft_GetFilePath_From_Mac_ATS_Name :: Ptr CChar -> Ptr CChar -> Ptr CUInt -> Ptr FT_Long -> IO FT_Error



foreign import ccall "FT_New_Face_From_FSSpec"
  ft_New_Face_From_FSSpec :: FT_Library -> Ptr FSSpec -> FT_Long -> Ptr FT_Face -> IO FT_Error



data FSRef

foreign import ccall "FT_New_Face_From_FSRef"
  ft_New_Face_From_FSRef :: FT_Library -> Ptr FSRef -> FT_Long -> Ptr FT_Face -> IO FT_Error
