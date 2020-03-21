module FreeType.Core.Layer.Types where

import           FreeType.Core.Types.Types

import           Data.Function ((&))
import           Foreign.Ptr
import           Foreign.Storable

#include "ft2build.h"
#include FT_FREETYPE_H

data FT_LayerIterator = FT_LayerIterator
                          { liNum_layers :: FT_UInt
                          , liLayer      :: FT_UInt
                          , liP          :: Ptr FT_Byte
                          }

instance Storable FT_LayerIterator where    
  sizeOf _    = #size      struct FT_LayerIterator_    
  alignment _ = #alignment struct FT_LayerIterator_    
    
  peek ptr =    
    FT_LayerIterator    
      <$> #{peek struct FT_LayerIterator_, num_layers} ptr    
      <*> #{peek struct FT_LayerIterator_, layer     } ptr    
      <*> #{peek struct FT_LayerIterator_, p         } ptr    
    
  poke ptr val = do    
    #{poke struct FT_LayerIterator_, num_layers} ptr $ val & liNum_layers    
    #{poke struct FT_LayerIterator_, layer     } ptr $ val & liLayer    
    #{poke struct FT_LayerIterator_, p         } ptr $ val & liP
