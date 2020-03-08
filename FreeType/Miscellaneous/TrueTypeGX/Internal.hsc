{-# LANGUAGE ForeignFunctionInterface #-}

module FreeType.Miscellaneous.TrueTypeGX.Internal
  ( -- ** FT_TrueTypeGX_Validate
    ft_TrueTypeGX_Validate'
    -- ** FT_ClassicKern_Validate
  , ft_ClassicKern_Validate'
  ) where

import           FreeType.Core.Base.Types
import           FreeType.Core.Types.Types

import           Foreign.Ptr

#include "ft2build.h"
#include FT_GX_VALIDATE_H

foreign import ccall "FT_TrueTypeGX_Validate"
  ft_TrueTypeGX_Validate' :: FT_Face -> FT_UInt -> Ptr FT_Bytes -> FT_UInt -> IO FT_Error



foreign import ccall "FT_ClassicKern_Validate"
  ft_ClassicKern_Validate' :: FT_Face -> FT_UInt -> Ptr FT_Bytes -> IO FT_Error
