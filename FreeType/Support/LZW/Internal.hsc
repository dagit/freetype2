{-# LANGUAGE ForeignFunctionInterface #-}

module FreeType.Support.LZW.Internal
  ( -- ** FT_Stream_OpenLZW
    ft_Stream_OpenLZW'
  )where

import           FreeType.Core.Types.Types
import           FreeType.Support.System.Types

#include "ft2build.h"
#include FT_FREETYPE_H

foreign import ccall "FT_Stream_OpenLZW"
  ft_Stream_OpenLZW' :: FT_Stream -> FT_Stream -> IO FT_Error
