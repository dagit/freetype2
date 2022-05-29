{-# LANGUAGE ForeignFunctionInterface #-}

module FreeType.Error.Enumerations.Internal
  ( -- ** FT_Error_String
    ft_Error_String'
  ) where

import           FreeType.Core.Types.Types

#ifdef aarch64_HOST_ARCH
import           Data.Word
#else
import           Data.Int
#endif
import           Foreign.Ptr

#include "ft2build.h"
#include FT_FREETYPE_H

foreign import ccall "FT_Error_String"
  ft_Error_String'
    :: FT_Error              -- ^ error_code
    -> IO (Ptr #{type char})
