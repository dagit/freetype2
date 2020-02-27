{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}

module FreeType.Core.Version where

import           FreeType.Core.Base
import           FreeType.Core.Types

import           Foreign.C.Types
import           Foreign.Ptr

#include "ft2build.h"
#include FT_FREETYPE_H

foreign import ccall "FT_Library_Version"
  ft_Library_Version :: FT_Library -> Ptr FT_Int -> Ptr FT_Int -> Ptr FT_Int -> IO ()



foreign import ccall "FT_Face_CheckTrueTypePatents"
  ft_Face_CheckTrueTypePatents :: FT_Face -> IO FT_Bool



foreign import ccall "FT_Face_SetUnpatentedHinting"
  ft_Face_SetUnpatentedHinting :: FT_Face -> FT_Bool -> IO FT_Bool



pattern FREETYPE_MAJOR
      , FREETYPE_MINOR
      , FREETYPE_PATCH
     :: CInt
pattern FREETYPE_MAJOR = #const FREETYPE_MAJOR
pattern FREETYPE_MINOR = #const FREETYPE_MINOR
pattern FREETYPE_PATCH = #const FREETYPE_PATCH
