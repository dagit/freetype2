{-# LANGUAGE ForeignFunctionInterface #-}

{- | Please refer to the
     [Support API > GZIP Streams](https://www.freetype.org/freetype2/docs/reference/ft2-gzip.html)
     chapter of the reference.
 -}

module FreeType.Support.GZIP
  ( -- ** FT_Stream_OpenGzip
    ft_Stream_OpenGzip
    -- ** FT_Gzip_Uncompress
  , ft_Gzip_Uncompress
  ) where

import           FreeType.Circular.Types
import           FreeType.Core.Types.Types

import           Foreign.Ptr

#include "ft2build.h"
#include FT_FREETYPE_H

foreign import ccall "FT_Stream_OpenGzip"
  ft_Stream_OpenGzip
    :: FT_Stream   -- ^ stream
    -> FT_Stream   -- ^ source
    -> IO FT_Error



foreign import ccall "FT_Gzip_Uncompress"
  ft_Gzip_Uncompress
    :: FT_Memory    -- ^ memory
    -> Ptr FT_Byte  -- ^ output
    -> Ptr FT_ULong -- ^ output_len
    -> Ptr FT_Byte  -- ^ input
    -> FT_ULong     -- ^ input_len
    -> IO FT_Error
