{-# LANGUAGE ForeignFunctionInterface #-}

module FreeType.Support.BZIP2 where

import           FreeType.Core.Types
import           FreeType.Support.System

import           Foreign.C.Types

#include "ft2build.h"
#include FT_BZIP2_H

foreign import ccall "FT_Stream_OpenBzip2"
  ft_Stream_OpenBzip2 :: FT_Stream -> FT_Stream -> IO FT_Error
