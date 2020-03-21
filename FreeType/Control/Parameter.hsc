{-# LANGUAGE PatternSynonyms #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}

{- | Please refer to the
     [Controlling FreeType Modules > Parameter Tags](https://www.freetype.org/freetype2/docs/reference/ft2-parameter_tags.html)
     chapter of the reference.

     Internal: "FreeType.Control.Parameter.Internal".
 -}

module FreeType.Control.Parameter
  ( -- ** FT_PARAM_TAG_IGNORE_TYPOGRAPHIC_FAMILY
    pattern FT_PARAM_TAG_IGNORE_TYPOGRAPHIC_FAMILY
    -- ** FT_PARAM_TAG_IGNORE_TYPOGRAPHIC_SUBFAMILY
  , pattern FT_PARAM_TAG_IGNORE_TYPOGRAPHIC_SUBFAMILY
    -- ** FT_PARAM_TAG_INCREMENTAL
  , pattern FT_PARAM_TAG_INCREMENTAL
    -- ** FT_PARAM_TAG_LCD_FILTER_WEIGHTS
  , pattern FT_PARAM_TAG_LCD_FILTER_WEIGHTS
    -- ** FT_PARAM_TAG_RANDOM_SEED
  , pattern FT_PARAM_TAG_RANDOM_SEED
    -- ** FT_PARAM_TAG_STEM_DARKENING
  , pattern FT_PARAM_TAG_STEM_DARKENING
    -- ** FT_PARAM_TAG_UNPATENTED_HINTING
    -- | Deprecated: 'FT_PARAM_TAG_UNPATENTED_HINTING'
  ) where

import           FreeType.Control.Parameter.Internal (pattern FT_PARAM_TAG_UNPATENTED_HINTING)
import           FreeType.Core.Types.Types

#include "ft2build.h"
#include FT_FREETYPE_H
#include "freetype/ftparams.h"

pattern FT_PARAM_TAG_IGNORE_TYPOGRAPHIC_FAMILY
      , FT_PARAM_TAG_IGNORE_TYPOGRAPHIC_SUBFAMILY
      , FT_PARAM_TAG_INCREMENTAL
      , FT_PARAM_TAG_LCD_FILTER_WEIGHTS
      , FT_PARAM_TAG_RANDOM_SEED
      , FT_PARAM_TAG_STEM_DARKENING
     :: (Eq a, Num a) => a
pattern FT_PARAM_TAG_IGNORE_TYPOGRAPHIC_FAMILY    = #const FT_PARAM_TAG_IGNORE_TYPOGRAPHIC_FAMILY
pattern FT_PARAM_TAG_IGNORE_TYPOGRAPHIC_SUBFAMILY = #const FT_PARAM_TAG_IGNORE_TYPOGRAPHIC_SUBFAMILY
pattern FT_PARAM_TAG_INCREMENTAL                  = #const FT_PARAM_TAG_INCREMENTAL
pattern FT_PARAM_TAG_LCD_FILTER_WEIGHTS           = #const FT_PARAM_TAG_LCD_FILTER_WEIGHTS
pattern FT_PARAM_TAG_RANDOM_SEED                  = #const FT_PARAM_TAG_RANDOM_SEED
pattern FT_PARAM_TAG_STEM_DARKENING               = #const FT_PARAM_TAG_STEM_DARKENING
