{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}

module FreeType.Miscellaneous.OpenType where

import           FreeType.Core.Base
import           FreeType.Core.Types

import           Foreign.C.Types
import           Foreign.Ptr

#include "ft2build.h"
#include FT_FREETYPE_H

#include "freetype/ftotval.h"

foreign import ccall "FT_OpenType_Validate"
  ft_OpenType_Validate :: FT_Face -> FT_UInt -> Ptr FT_Bytes -> Ptr FT_Bytes -> Ptr FT_Bytes -> Ptr FT_Bytes -> Ptr FT_Bytes -> IO FT_Error



foreign import ccall "FT_OpenType_Free"
  ft_OpenType_Free :: FT_Face -> FT_Bytes -> IO ()



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
