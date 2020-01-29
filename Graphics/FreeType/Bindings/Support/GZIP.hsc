{-# LANGUAGE ForeignFunctionInterface #-}

module Graphics.FreeType.Bindings.Support.GZIP where

import           Graphics.FreeType.Bindings.Core.Types
import           Graphics.FreeType.Bindings.Support.System

import           Foreign.C.Types
import           Foreign.Ptr

#include "ft2build.h"
#include FT_FREETYPE_H

foreign import ccall "FT_Stream_OpenGzip"
  ft_Stream_OpenGzip :: FT_Stream -> FT_Stream -> IO FT_Error



foreign import ccall "FT_Gzip_Uncompress"
  ft_Stream_Gzip_Uncompress :: FT_Memory -> Ptr FT_Byte -> Ptr FT_ULong -> Ptr FT_Byte -> FT_ULong -> IO FT_Error
