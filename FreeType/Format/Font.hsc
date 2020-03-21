{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE TemplateHaskell #-}

{- | Please refer to the
     [Format-Specific API > Font Formats](https://www.freetype.org/freetype2/docs/reference/ft2-font_formats.html)
     chapter of the reference.

     Internal: "FreeType.Format.Font.Internal".
 -}

module FreeType.Format.Font
  ( -- ** ft_Get_Font_Format
    ft_Get_Font_Format
  ) where

import           FreeType.Core.Base.Types
import           FreeType.Format.Font.Internal

import           Foreign.C.String
import           Foreign.Ptr

#include "ft2build.h"
#include FT_FREETYPE_H

ft_Get_Font_Format
  :: FT_Face   -- ^ face
  -> IO String
ft_Get_Font_Format face =
  peekCString . castPtr =<< ft_Get_Font_Format' face
