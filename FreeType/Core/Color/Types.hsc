{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}

module FreeType.Core.Color.Types where

import           FreeType.Core.Types.Types

import           Data.Function ((&))
import           Foreign.Ptr
import           Foreign.Storable

#include "ft2build.h"
#include FT_COLOR_H

data FT_Color = FT_Color
                  { cBlue  :: FT_Byte
                  , cGreen :: FT_Byte
                  , cRed   :: FT_Byte
                  , cAlpha :: FT_Byte
                  }

instance Storable FT_Color where    
  sizeOf _    = #size      struct FT_Color_    
  alignment _ = #alignment struct FT_Color_    
    
  peek ptr =    
    FT_Color    
      <$> #{peek struct FT_Color_, blue } ptr    
      <*> #{peek struct FT_Color_, green} ptr    
      <*> #{peek struct FT_Color_, red  } ptr    
      <*> #{peek struct FT_Color_, alpha} ptr    
    
  poke ptr val = do    
    #{poke struct FT_Color_, blue } ptr $ val & cBlue    
    #{poke struct FT_Color_, green} ptr $ val & cGreen    
    #{poke struct FT_Color_, red  } ptr $ val & cRed    
    #{poke struct FT_Color_, alpha} ptr $ val & cAlpha



data FT_Palette_Data = FT_Palette_Data
                         { pdNum_palettes           :: FT_UShort
                         , pdPalette_name_ids       :: Ptr FT_UShort
                         , pdPalette_flags          :: Ptr FT_UShort
                         , pdNum_palette_entries    :: FT_UShort
                         , pdPalette_entry_name_ids :: Ptr FT_UShort
                         }

instance Storable FT_Palette_Data where    
  sizeOf _    = #size      struct FT_Palette_Data_    
  alignment _ = #alignment struct FT_Palette_Data_    
    
  peek ptr =    
    FT_Palette_Data    
      <$> #{peek struct FT_Palette_Data_, num_palettes          } ptr    
      <*> #{peek struct FT_Palette_Data_, palette_name_ids      } ptr    
      <*> #{peek struct FT_Palette_Data_, palette_flags         } ptr    
      <*> #{peek struct FT_Palette_Data_, num_palette_entries   } ptr    
      <*> #{peek struct FT_Palette_Data_, palette_entry_name_ids} ptr    
    
  poke ptr val = do    
    #{poke struct FT_Palette_Data_, num_palettes          } ptr $ val & pdNum_palettes    
    #{poke struct FT_Palette_Data_, palette_name_ids      } ptr $ val & pdPalette_name_ids    
    #{poke struct FT_Palette_Data_, palette_flags         } ptr $ val & pdPalette_flags    
    #{poke struct FT_Palette_Data_, num_palette_entries   } ptr $ val & pdNum_palette_entries    
    #{poke struct FT_Palette_Data_, palette_entry_name_ids} ptr $ val & pdPalette_entry_name_ids
