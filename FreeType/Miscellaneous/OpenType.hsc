{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE TemplateHaskell #-}

module FreeType.Miscellaneous.OpenType
  ( -- ** FT_OpenType_Validate
    ft_OpenType_Validate
    -- ** FT_OpenType_Free
  , ft_OpenType_Free
    -- ** FT_VALIDATE_OTXXX
  , pattern FT_VALIDATE_BASE
  , pattern FT_VALIDATE_GDEF
  , pattern FT_VALIDATE_GPOS
  , pattern FT_VALIDATE_GSUB
  , pattern FT_VALIDATE_JSTF
  , pattern FT_VALIDATE_MATH
  , pattern FT_VALIDATE_OT
  ) where

import           FreeType.Core.Base
import           FreeType.Core.Types.Types
import           FreeType.Exception.Internal
import           FreeType.Miscellaneous.OpenType.Internal

import           Foreign.Ptr

#include "ft2build.h"
#include FT_OPENTYPE_VALIDATE_H

ft_OpenType_Validate
  :: FT_Face      -- ^ face
  -> FT_UInt      -- ^ validation_flags
  -> Ptr FT_Bytes -- ^ BASE_table
  -> Ptr FT_Bytes -- ^ GDEF_table
  -> Ptr FT_Bytes -- ^ GPOS_table
  -> Ptr FT_Bytes -- ^ GSUB_table
  -> Ptr FT_Bytes -- ^ JSTF_table
  -> IO ()
ft_OpenType_Validate =
  autoError 'ft_OpenType_Validate ft_OpenType_Validate'



foreign import ccall "FT_OpenType_Free"
  ft_OpenType_Free
    :: FT_Face  -- ^ face
    -> FT_Bytes -- ^ table
    -> IO ()



pattern FT_VALIDATE_BASE
      , FT_VALIDATE_GDEF
      , FT_VALIDATE_GPOS
      , FT_VALIDATE_GSUB
      , FT_VALIDATE_JSTF
      , FT_VALIDATE_MATH
      , FT_VALIDATE_OT
     :: FT_UInt
pattern FT_VALIDATE_BASE = #const FT_VALIDATE_BASE
pattern FT_VALIDATE_GDEF = #const FT_VALIDATE_GDEF
pattern FT_VALIDATE_GPOS = #const FT_VALIDATE_GPOS
pattern FT_VALIDATE_GSUB = #const FT_VALIDATE_GSUB
pattern FT_VALIDATE_JSTF = #const FT_VALIDATE_JSTF
pattern FT_VALIDATE_MATH = #const FT_VALIDATE_MATH
pattern FT_VALIDATE_OT   = #const FT_VALIDATE_OT
