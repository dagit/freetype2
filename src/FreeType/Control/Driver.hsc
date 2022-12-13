{-# LANGUAGE PatternSynonyms #-}

{- | Please refer to the
     [Controlling FreeType Modules > Driver properties](https://www.freetype.org/freetype2/docs/reference/ft2-properties.html)
     chapter of the reference.
 -}

module FreeType.Control.Driver
  ( -- ** FT_HINTING_XXX
    pattern FT_HINTING_FREETYPE
  , pattern FT_HINTING_ADOBE
    -- ** TT_INTERPRETER_VERSION_XXX
  , pattern TT_INTERPRETER_VERSION_35
  , pattern TT_INTERPRETER_VERSION_38
  , pattern TT_INTERPRETER_VERSION_40
    -- ** FT_AUTOHINTER_SCRIPT_XXX
  , pattern FT_AUTOHINTER_SCRIPT_NONE 
  , pattern FT_AUTOHINTER_SCRIPT_LATIN
  , pattern FT_AUTOHINTER_SCRIPT_CJK  
  , pattern FT_AUTOHINTER_SCRIPT_INDIC
    -- ** FT_Prop_GlyphToScriptMap
  , FT_Prop_GlyphToScriptMap (..)
    -- ** FT_Prop_IncreaseXHeight
  , FT_Prop_IncreaseXHeight (..)
  ) where

import           FreeType.Control.Driver.Types

#include "ft2build.h"
#include FT_DRIVER_H

pattern FT_HINTING_FREETYPE
      , FT_HINTING_ADOBE
     :: (Eq a, Num a) => a
pattern FT_HINTING_FREETYPE     = #const FT_HINTING_FREETYPE
pattern FT_HINTING_ADOBE        = #const FT_HINTING_ADOBE



pattern TT_INTERPRETER_VERSION_35
      , TT_INTERPRETER_VERSION_38
      , TT_INTERPRETER_VERSION_40
     :: (Eq a, Num a) => a
pattern TT_INTERPRETER_VERSION_35 = #const TT_INTERPRETER_VERSION_35
pattern TT_INTERPRETER_VERSION_38 = #const TT_INTERPRETER_VERSION_38
pattern TT_INTERPRETER_VERSION_40 = #const TT_INTERPRETER_VERSION_40



pattern FT_AUTOHINTER_SCRIPT_NONE
      , FT_AUTOHINTER_SCRIPT_LATIN
      , FT_AUTOHINTER_SCRIPT_CJK
      , FT_AUTOHINTER_SCRIPT_INDIC
     :: (Eq a, Num a) => a
pattern FT_AUTOHINTER_SCRIPT_NONE  = #const FT_AUTOHINTER_SCRIPT_NONE
pattern FT_AUTOHINTER_SCRIPT_LATIN = #const FT_AUTOHINTER_SCRIPT_LATIN
pattern FT_AUTOHINTER_SCRIPT_CJK   = #const FT_AUTOHINTER_SCRIPT_CJK
pattern FT_AUTOHINTER_SCRIPT_INDIC = #const FT_AUTOHINTER_SCRIPT_INDIC
