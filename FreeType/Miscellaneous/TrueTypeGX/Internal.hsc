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
  ft_TrueTypeGX_Validate'
    :: FT_Face      -- ^ face
    -> FT_UInt      -- ^ validation_flags
    -> Ptr FT_Bytes -- ^ tables
    -> FT_UInt      -- ^ table_length
    -> IO FT_Error



foreign import ccall "FT_ClassicKern_Validate"
  ft_ClassicKern_Validate'
    :: FT_Face      -- ^ face
    -> FT_UInt      -- ^ validation_flags
    -> Ptr FT_Bytes -- ^ ckern_table
    -> IO FT_Error
