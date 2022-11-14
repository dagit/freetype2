{-# LANGUAGE ForeignFunctionInterface #-}

{- | Please refer to the
     [Support API > LZW Streams](https://www.freetype.org/freetype2/docs/reference/ft2-lzw.html)
     chapter of the reference.
 -}

module FreeType.Support.LZW
  ( -- ** FT_Stream_OpenLZW
    ft_Stream_OpenLZW
  ) where

import           FreeType.Circular.Types
import           FreeType.Core.Types.Types

#include "ft2build.h"
#include FT_FREETYPE_H

foreign import ccall "FT_Stream_OpenLZW"
  ft_Stream_OpenLZW
    :: FT_Stream   -- ^ stream
    -> FT_Stream   -- ^ source
    -> IO FT_Error
