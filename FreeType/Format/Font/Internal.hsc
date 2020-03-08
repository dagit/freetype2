{-# LANGUAGE ForeignFunctionInterface #-}

module FreeType.Format.Font.Internal
  ( -- ^ FT_Get_Font_Format
    ft_Get_Font_Format'
  ) where

import           FreeType.Core.Base.Types

import           Data.Int
import           Foreign.Ptr

#include "ft2build.h"
#include FT_FREETYPE_H

foreign import ccall "FT_Get_Font_Format"
  ft_Get_Font_Format' :: FT_Face -> IO (Ptr #{type char})
