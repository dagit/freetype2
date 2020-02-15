{-# LANGUAGE ForeignFunctionInterface #-}

module FreeType.Raw.Support.BZIP2 where

import           FreeType.Raw.Core.Types
import           FreeType.Raw.Support.System

import           Foreign.C.Types

#include "ft2build.h"
#include FT_FREETYPE_H

foreign import ccall "FT_Stream_OpenBzip2"
  ft_Stream_OpenBzip2 :: FT_Stream -> FT_Stream -> IO FT_Error
