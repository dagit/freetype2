{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}

module Graphics.FreeType.Bindings.Control.Driver where

import           Graphics.FreeType.Bindings.Core.Base
import           Graphics.FreeType.Bindings.Core.Types

import           Foreign.Ptr
import           Foreign.Storable

#include "ft2build.h"
#include FT_FREETYPE_H

#include "freetype/ftdriver.h"

pattern FT_HINTING_FREETYPE
      , FT_HINTING_ADOBE
      , FT_CFF_HINTING_FREETYPE
      , FT_CFF_HINTING_ADOBE
     :: FT_UInt
pattern FT_HINTING_FREETYPE     = #const FT_HINTING_FREETYPE
pattern FT_HINTING_ADOBE        = #const FT_HINTING_ADOBE
pattern FT_CFF_HINTING_FREETYPE = #const FT_CFF_HINTING_FREETYPE
pattern FT_CFF_HINTING_ADOBE    = #const FT_CFF_HINTING_ADOBE



pattern TT_INTERPRETER_VERSION_35
      , TT_INTERPRETER_VERSION_38
      , TT_INTERPRETER_VERSION_40
     :: FT_UInt
pattern TT_INTERPRETER_VERSION_35 = #const TT_INTERPRETER_VERSION_35
pattern TT_INTERPRETER_VERSION_38 = #const TT_INTERPRETER_VERSION_38
pattern TT_INTERPRETER_VERSION_40 = #const TT_INTERPRETER_VERSION_40



pattern FT_AUTOHINTER_SCRIPT_NONE
      , FT_AUTOHINTER_SCRIPT_LATIN
      , FT_AUTOHINTER_SCRIPT_CJK
      , FT_AUTOHINTER_SCRIPT_INDIC
     :: FT_UInt
pattern FT_AUTOHINTER_SCRIPT_NONE  = #const FT_AUTOHINTER_SCRIPT_NONE
pattern FT_AUTOHINTER_SCRIPT_LATIN = #const FT_AUTOHINTER_SCRIPT_LATIN
pattern FT_AUTOHINTER_SCRIPT_CJK   = #const FT_AUTOHINTER_SCRIPT_CJK
pattern FT_AUTOHINTER_SCRIPT_INDIC = #const FT_AUTOHINTER_SCRIPT_INDIC



data FT_Prop_GlyphToScriptMap = FT_Prop_GlyphToScriptMap
                                  { pgtsmFace :: FT_Face
                                  , pgtsmMap  :: Ptr FT_UShort
                                  }

instance Storable FT_Prop_GlyphToScriptMap where
  sizeOf _    = #size      struct FT_Prop_GlyphToScriptMap_
  alignment _ = #alignment struct FT_Prop_GlyphToScriptMap_

  peek ptr =
    FT_Prop_GlyphToScriptMap
      <$> #{peek struct FT_Prop_GlyphToScriptMap_, face} ptr
      <*> #{peek struct FT_Prop_GlyphToScriptMap_, map } ptr

  poke ptr val = do
    #{poke struct FT_Prop_GlyphToScriptMap_, face} ptr $ pgtsmFace val
    #{poke struct FT_Prop_GlyphToScriptMap_, map } ptr $ pgtsmMap  val



data FT_Prop_IncreaseXHeight = FT_Prop_IncreaseXHeight
                                 { pixhFace  :: FT_Face
                                 , pixhLimit :: FT_UInt
                                 }

instance Storable FT_Prop_IncreaseXHeight where
  sizeOf _    = #size      struct FT_Prop_IncreaseXHeight_
  alignment _ = #alignment struct FT_Prop_IncreaseXHeight_

  peek ptr =
    FT_Prop_IncreaseXHeight
      <$> #{peek struct FT_Prop_IncreaseXHeight_, face } ptr
      <*> #{peek struct FT_Prop_IncreaseXHeight_, limit} ptr

  poke ptr val = do
    #{poke struct FT_Prop_IncreaseXHeight_, face } ptr $ pixhFace  val
    #{poke struct FT_Prop_IncreaseXHeight_, limit} ptr $ pixhLimit val


