{-# LANGUAGE PatternSynonyms #-}

module FreeType.Control.Parameter.Internal
  ( -- ** FT_PARAM_TAG_UNPATENTED_HINTING
    pattern FT_PARAM_TAG_UNPATENTED_HINTING
  ) where

import           FreeType.Core.Types.Types

#include "ft2build.h"
#include FT_FREETYPE_H
#include "freetype/ftparams.h"

pattern FT_PARAM_TAG_UNPATENTED_HINTING :: FT_UInt
pattern FT_PARAM_TAG_UNPATENTED_HINTING = #const FT_PARAM_TAG_UNPATENTED_HINTING
