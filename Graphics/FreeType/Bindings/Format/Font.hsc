{-# LANGUAGE ForeignFunctionInterface #-}

module Graphics.FreeType.Bindings.Format.Font where

import           Graphics.FreeType.Bindings.Core.Base

import           Foreign.C.Types
import           Foreign.Ptr

#include "ft2build.h"
#include FT_FREETYPE_H

foreign import ccall "FT_Get_Font_Format"
  ft_Get_Font_Format :: FT_Face -> IO (Ptr CChar)



foreign import ccall "FT_Get_X11_Font_Format"
  ft_Get_X11_Font_Format :: FT_Face -> IO (Ptr CChar)
