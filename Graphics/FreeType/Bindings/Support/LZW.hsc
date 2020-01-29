{-# LANGUAGE ForeignFunctionInterface #-}

module Graphics.FreeType.Bindings.Support.LZW where

import           Graphics.FreeType.Bindings.Core.Types
import           Graphics.FreeType.Bindings.Support.System

import           Foreign.C.Types

#include "ft2build.h"
#include FT_FREETYPE_H

foreign import ccall "FT_Stream_OpenLZW"
  ft_Stream_OpenLZW :: FT_Stream -> FT_Stream -> IO FT_Error
