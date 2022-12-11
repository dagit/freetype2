{-# LANGUAGE DataKinds
           , DuplicateRecordFields
           , FlexibleInstances
           , MultiParamTypeClasses #-}
#if __GLASGOW_HASKELL__ >= 902
{-# LANGUAGE NoFieldSelectors #-}
#endif
{-# LANGUAGE TypeApplications #-}

module FreeType.Control.Driver.Types where

import           FreeType.Core.Base.Types
import           FreeType.Core.Types.Types

import           Foreign.Ptr
import           Foreign.Storable
import           Foreign.Storable.Offset

#include "ft2build.h"
#include FT_DRIVER_H



data {-# CTYPE "freetype/ftdriver.h" "FT_Prop_GlyphToScriptMap" #-} FT_Prop_GlyphToScriptMap =
       FT_Prop_GlyphToScriptMap
         { face :: FT_Face
         , map  :: Ptr FT_UShort
         }

instance Offset "face" FT_Prop_GlyphToScriptMap where rawOffset = #{offset struct FT_Prop_GlyphToScriptMap_, face}
instance Offset "map"  FT_Prop_GlyphToScriptMap where rawOffset = #{offset struct FT_Prop_GlyphToScriptMap_, map }

instance Storable FT_Prop_GlyphToScriptMap where
  sizeOf _    = #size      struct FT_Prop_GlyphToScriptMap_
  alignment _ = #alignment struct FT_Prop_GlyphToScriptMap_

  peek ptr =
    FT_Prop_GlyphToScriptMap
      <$> peek (offset @"face" ptr)
      <*> peek (offset @"map"  ptr)

  poke ptr val = do
    pokeField @"face" ptr val
    pokeField @"map"  ptr val



data {-# CTYPE "freetype/ftdriver.h" "FT_Prop_IncreaseXHeight" #-} FT_Prop_IncreaseXHeight =
       FT_Prop_IncreaseXHeight
         { face  :: FT_Face
         , limit :: FT_UInt
         }

instance Offset "face"  FT_Prop_IncreaseXHeight where rawOffset = #{offset struct FT_Prop_IncreaseXHeight_, face }
instance Offset "limit" FT_Prop_IncreaseXHeight where rawOffset = #{offset struct FT_Prop_IncreaseXHeight_, limit}

instance Storable FT_Prop_IncreaseXHeight where
  sizeOf _    = #size      struct FT_Prop_IncreaseXHeight_
  alignment _ = #alignment struct FT_Prop_IncreaseXHeight_

  peek ptr =
    FT_Prop_IncreaseXHeight
      <$> peek (offset @"face"  ptr)
      <*> peek (offset @"limit" ptr)

  poke ptr val = do
    pokeField @"face"  ptr val
    pokeField @"limit" ptr val
