{-# LANGUAGE CApiFFI
           , CPP
           , ForeignFunctionInterface #-}

{- | Please refer to the
     [Format-Specific API > Font Formats](https://www.freetype.org/freetype2/docs/reference/ft2-font_formats.html)
     chapter of the reference.
 -}

module FreeType.Format.Font
  ( -- ** ft_Get_Font_Format
    ft_Get_Font_Format
  ) where

import           FreeType.Core.Base.Types

#ifdef aarch64_HOST_ARCH
import           Data.Word
#else
import           Data.Int
#endif
import           Foreign.Ptr

#include "ft2build.h"
#include FT_FREETYPE_H

foreign import CALLCV "freetype/ftfntfmt.h FT_Get_Font_Format"
  ft_Get_Font_Format
    :: FT_Face               -- ^ face
    -> IO (Ptr #{type char})