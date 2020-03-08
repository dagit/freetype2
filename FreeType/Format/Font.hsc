{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE TemplateHaskell #-}

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
  :: FT_Face        -- ^ face
  -> IO String
ft_Get_Font_Format face =
  peekCString . castPtr =<< ft_Get_Font_Format' face
