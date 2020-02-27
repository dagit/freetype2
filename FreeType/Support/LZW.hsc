{-# LANGUAGE ForeignFunctionInterface #-}

module FreeType.Support.LZW where

import           FreeType.Core.Types
import           FreeType.Support.System

import           Foreign.C.Types

#include "ft2build.h"
#include FT_FREETYPE_H

foreign import ccall "FT_Stream_OpenLZW"
  ft_Stream_OpenLZW :: FT_Stream -> FT_Stream -> IO FT_Error
