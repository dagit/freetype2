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
  ft_OpenType_Validate'
    :: FT_Face      -- ^ face
    -> FT_UInt      -- ^ validation_flags
    -> Ptr FT_Bytes -- ^ BASE_table
    -> Ptr FT_Bytes -- ^ GDEF_table
    -> Ptr FT_Bytes -- ^ GPOS_table
    -> Ptr FT_Bytes -- ^ GSUB_table
    -> Ptr FT_Bytes -- ^ JSTF_table
    -> IO FT_Error
