{-# LANGUAGE ForeignFunctionInterface #-}

module FreeType.Miscellaneous.OpenType.Internal
  ( -- ** ft_OpenType_Validate
    ft_OpenType_Validate'
  ) where

import           FreeType.Core.Base
import           FreeType.Core.Types.Types

import           Foreign.Ptr

#include "ft2build.h"
#include FT_OPENTYPE_VALIDATE_H

foreign import ccall "FT_OpenType_Validate"
  ft_OpenType_Validate' :: FT_Face -> FT_UInt -> Ptr FT_Bytes -> Ptr FT_Bytes -> Ptr FT_Bytes -> Ptr FT_Bytes -> Ptr FT_Bytes -> IO FT_Error
