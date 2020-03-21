module FreeType.Control.Driver.Types where

import           FreeType.Core.Base.Types
import           FreeType.Core.Types.Types

import           Foreign.Ptr
import           Foreign.Storable

#include "ft2build.h"
#include FT_DRIVER_H



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
