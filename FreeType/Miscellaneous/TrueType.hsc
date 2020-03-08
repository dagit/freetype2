{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}

module FreeType.Miscellaneous.TrueType where

import           FreeType.Core.Base.Types
import           FreeType.Miscellaneous.TrueType.Types

#include "ft2build.h"
#include FT_MODULE_H

pattern FT_TRUETYPE_ENGINE_TYPE_NONE
      , FT_TRUETYPE_ENGINE_TYPE_UNPATENTED
      , FT_TRUETYPE_ENGINE_TYPE_PATENTED
     :: FT_TrueTypeEngineType
pattern FT_TRUETYPE_ENGINE_TYPE_NONE       = #const FT_TRUETYPE_ENGINE_TYPE_NONE
pattern FT_TRUETYPE_ENGINE_TYPE_UNPATENTED = #const FT_TRUETYPE_ENGINE_TYPE_UNPATENTED
pattern FT_TRUETYPE_ENGINE_TYPE_PATENTED   = #const FT_TRUETYPE_ENGINE_TYPE_PATENTED



foreign import ccall "FT_Get_TrueType_Engine_Type"
  ft_Get_TrueType_Engine_Type :: FT_Library -> IO FT_TrueTypeEngineType
