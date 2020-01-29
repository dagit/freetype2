{-# LANGUAGE ForeignFunctionInterface #-}

module Graphics.FreeType.Bindings.Error.Enumerations where

import           Graphics.FreeType.Bindings.Core.Types

import           Foreign.C.Types
import           Foreign.C.String

#include "ft2build.h"
#include FT_FREETYPE_H

foreign import ccall "FT_Error_String"
  ft_Error_String :: FT_Error -> CString
