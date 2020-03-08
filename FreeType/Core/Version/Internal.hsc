{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}

module FreeType.Core.Version.Internal
  ( -- ** FT_Library_Version
    ft_Library_Version'
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
