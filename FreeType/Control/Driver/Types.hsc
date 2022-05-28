{-# LANGUAGE DataKinds
           , FlexibleInstances
           , MultiParamTypeClasses
           , TypeApplications #-}

module FreeType.Control.Driver.Types where

import           FreeType.Core.Base.Types
import           FreeType.Core.Types.Types

import           Foreign.Ptr
import           Foreign.Storable
import           Foreign.Storable.Offset

#include "ft2build.h"
#include FT_DRIVER_H



data FT_Prop_GlyphToScriptMap = FT_Prop_GlyphToScriptMap
                                  { pgtsmFace :: FT_Face
                                  , pgtsmMap  :: Ptr FT_UShort
                                  }

instance Offset "pgtsmFace" FT_Prop_GlyphToScriptMap where rawOffset = #{offset struct FT_Prop_GlyphToScriptMap_, face}
instance Offset "pgtsmMap"  FT_Prop_GlyphToScriptMap where rawOffset = #{offset struct FT_Prop_GlyphToScriptMap_, map }

instance Storable FT_Prop_GlyphToScriptMap where
  sizeOf _    = #size      struct FT_Prop_GlyphToScriptMap_
  alignment _ = #alignment struct FT_Prop_GlyphToScriptMap_

  peek ptr =
    FT_Prop_GlyphToScriptMap
      <$> peek (offset @"pgtsmFace" ptr)
      <*> peek (offset @"pgtsmMap"  ptr)

  poke ptr val = do
    pokeField @"pgtsmFace" ptr val
    pokeField @"pgtsmMap"  ptr val



data FT_Prop_IncreaseXHeight = FT_Prop_IncreaseXHeight
                                 { pixhFace  :: FT_Face
                                 , pixhLimit :: FT_UInt
                                 }

instance Offset "pixhFace"  FT_Prop_IncreaseXHeight where rawOffset = #{offset struct FT_Prop_IncreaseXHeight_, face }
instance Offset "pixhLimit" FT_Prop_IncreaseXHeight where rawOffset = #{offset struct FT_Prop_IncreaseXHeight_, limit}

instance Storable FT_Prop_IncreaseXHeight where
  sizeOf _    = #size      struct FT_Prop_IncreaseXHeight_
  alignment _ = #alignment struct FT_Prop_IncreaseXHeight_

  peek ptr =
    FT_Prop_IncreaseXHeight
      <$> peek (offset @"pixhFace"  ptr)
      <*> peek (offset @"pixhLimit" ptr)

  poke ptr val = do
    pokeField @"pixhFace"  ptr val
    pokeField @"pixhLimit" ptr val
