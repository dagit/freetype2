{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}

module FreeType.Core.Version.Internal
  ( -- ** FT_Library_Version
    ft_Library_Version'
    -- ** FT_Face_CheckTrueTypePatents
  , ft_Face_CheckTrueTypePatents
    -- ** FT_Face_SetUnpatentedHinting
  , ft_Face_SetUnpatentedHinting
  ) where

import           FreeType.Core.Base
import           FreeType.Core.Types.Types

import           Foreign.Ptr

#include "ft2build.h"
#include FT_FREETYPE_H

foreign import ccall "FT_Library_Version"
  ft_Library_Version'
    :: FT_Library -- ^ library
    -> Ptr FT_Int -- ^ amajor
    -> Ptr FT_Int -- ^ aminor
    -> Ptr FT_Int -- ^ apatch
    -> IO ()



foreign import ccall "FT_Face_CheckTrueTypePatents"
  ft_Face_CheckTrueTypePatents
    :: FT_Face    -- ^ face
    -> IO FT_Bool



foreign import ccall "FT_Face_SetUnpatentedHinting"
  ft_Face_SetUnpatentedHinting
    :: FT_Face    -- ^ face
    -> FT_Bool    -- ^ value
    -> IO FT_Bool
