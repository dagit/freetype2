{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}

module FreeType.Miscellaneous.TrueType where

import           FreeType.Core.Base
import           FreeType.Core.Types

import           Foreign.C.Types

#include "ft2build.h"
#include FT_FREETYPE_H

#include "freetype/ftmodapi.h"

type FT_TrueTypeEngineType = FT_UInt

pattern FT_TRUETYPE_ENGINE_TYPE_NONE
      , FT_TRUETYPE_ENGINE_TYPE_UNPATENTED
      , FT_TRUETYPE_ENGINE_TYPE_PATENTED
     :: FT_TrueTypeEngineType
pattern FT_TRUETYPE_ENGINE_TYPE_NONE       = #const FT_TRUETYPE_ENGINE_TYPE_NONE
pattern FT_TRUETYPE_ENGINE_TYPE_UNPATENTED = #const FT_TRUETYPE_ENGINE_TYPE_UNPATENTED
pattern FT_TRUETYPE_ENGINE_TYPE_PATENTED   = #const FT_TRUETYPE_ENGINE_TYPE_PATENTED



foreign import ccall "FT_Get_TrueType_Engine_Type"
  ft_Get_TrueType_Engine_Type :: FT_Library -> IO FT_TrueTypeEngineType
