{-# LANGUAGE DataKinds
           , ForeignFunctionInterface
           , MultiParamTypeClasses
           , PatternSynonyms
           , TypeApplications #-}

module FreeType.Core.Color.Types where

import           FreeType.Core.Types.Types

import           Foreign.Ptr
import           Foreign.Storable
import           Foreign.Storable.Offset

#include "ft2build.h"
#include FT_COLOR_H

data FT_Color = FT_Color
                  { cBlue  :: FT_Byte
                  , cGreen :: FT_Byte
                  , cRed   :: FT_Byte
                  , cAlpha :: FT_Byte
                  }

instance Offset "cBlue"  FT_Color where rawOffset = #{offset struct FT_Color_, blue }
instance Offset "cGreen" FT_Color where rawOffset = #{offset struct FT_Color_, green}
instance Offset "cRed"   FT_Color where rawOffset = #{offset struct FT_Color_, red  }
instance Offset "cAlpha" FT_Color where rawOffset = #{offset struct FT_Color_, alpha}

instance Storable FT_Color where
  sizeOf _    = #size      struct FT_Color_
  alignment _ = #alignment struct FT_Color_

  peek ptr =
    FT_Color
      <$> peek (offset @"cBlue"  ptr)
      <*> peek (offset @"cGreen" ptr)
      <*> peek (offset @"cRed"   ptr)
      <*> peek (offset @"cAlpha" ptr)

  poke ptr val = do
    pokeField @"cBlue"  ptr val
    pokeField @"cGreen" ptr val
    pokeField @"cRed"   ptr val
    pokeField @"cAlpha" ptr val



data FT_Palette_Data = FT_Palette_Data
                         { pdNum_palettes           :: FT_UShort
                         , pdPalette_name_ids       :: Ptr FT_UShort
                         , pdPalette_flags          :: Ptr FT_UShort
                         , pdNum_palette_entries    :: FT_UShort
                         , pdPalette_entry_name_ids :: Ptr FT_UShort
                         }

instance Offset "pdNum_palettes"           FT_Palette_Data where rawOffset = #{offset struct FT_Palette_Data_, num_palettes          }
instance Offset "pdPalette_name_ids"       FT_Palette_Data where rawOffset = #{offset struct FT_Palette_Data_, palette_name_ids      }
instance Offset "pdPalette_flags"          FT_Palette_Data where rawOffset = #{offset struct FT_Palette_Data_, palette_flags         }
instance Offset "pdNum_palette_entries"    FT_Palette_Data where rawOffset = #{offset struct FT_Palette_Data_, num_palette_entries   }
instance Offset "pdPalette_entry_name_ids" FT_Palette_Data where rawOffset = #{offset struct FT_Palette_Data_, palette_entry_name_ids}

instance Storable FT_Palette_Data where
  sizeOf _    = #size      struct FT_Palette_Data_
  alignment _ = #alignment struct FT_Palette_Data_

  peek ptr =
    FT_Palette_Data
      <$> peek (offset @"pdNum_palettes"           ptr)
      <*> peek (offset @"pdPalette_name_ids"       ptr)
      <*> peek (offset @"pdPalette_flags"          ptr)
      <*> peek (offset @"pdNum_palette_entries"    ptr)
      <*> peek (offset @"pdPalette_entry_name_ids" ptr)

  poke ptr val = do
    pokeField @"pdNum_palettes"           ptr val
    pokeField @"pdPalette_name_ids"       ptr val
    pokeField @"pdPalette_flags"          ptr val
    pokeField @"pdNum_palette_entries"    ptr val
    pokeField @"pdPalette_entry_name_ids" ptr val
