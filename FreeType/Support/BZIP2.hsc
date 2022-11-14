{-# LANGUAGE ForeignFunctionInterface #-}

{- | Please refer to the
     [Support API > BZIP2 Streams](https://www.freetype.org/freetype2/docs/reference/ft2-bzip2.html)
     chapter of the reference.
 -}

module FreeType.Support.BZIP2
  ( -- ** FT_Stream_OpenBzip2
    ft_Stream_OpenBzip2
  ) where

import           FreeType.Circular.Types
import           FreeType.Core.Types.Types

#include "ft2build.h"
#include FT_BZIP2_H

foreign import ccall "FT_Stream_OpenBzip2"
  ft_Stream_OpenBzip2
    :: FT_Stream   -- ^ stream
    -> FT_Stream   -- ^ source
    -> IO FT_Error
