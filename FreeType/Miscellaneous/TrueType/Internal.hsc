{-# LANGUAGE PatternSynonyms #-}

module FreeType.Miscellaneous.TrueType.Internal
  ( -- ** FT_TrueTypeEngineType
    pattern FT_TRUETYPE_ENGINE_TYPE_UNPATENTED
  ) where

import           FreeType.Miscellaneous.TrueType.Types

#include "ft2build.h"
#include FT_MODULE_H

pattern FT_TRUETYPE_ENGINE_TYPE_UNPATENTED :: FT_TrueTypeEngineType
pattern FT_TRUETYPE_ENGINE_TYPE_UNPATENTED = #const FT_TRUETYPE_ENGINE_TYPE_UNPATENTED
