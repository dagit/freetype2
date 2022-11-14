{-# LANGUAGE DataKinds
           , FlexibleInstances
           , ForeignFunctionInterface
           , MultiParamTypeClasses #-}
#if __GLASGOW_HASKELL__ >= 902
{-# LANGUAGE NoFieldSelectors #-}
#endif
{-# LANGUAGE PatternSynonyms
           , TypeApplications #-}

module FreeType.Core.Color.Types where

import           FreeType.Core.Types.Types

import           Foreign.Ptr
import           Foreign.Storable
import           Foreign.Storable.Offset

#include "ft2build.h"
#include FT_COLOR_H

data FT_Color = FT_Color
                  { blue  :: FT_Byte
                  , green :: FT_Byte
                  , red   :: FT_Byte
                  , alpha :: FT_Byte
                  }

instance Offset "blue"  FT_Color where rawOffset = #{offset struct FT_Color_, blue }
instance Offset "green" FT_Color where rawOffset = #{offset struct FT_Color_, green}
instance Offset "red"   FT_Color where rawOffset = #{offset struct FT_Color_, red  }
instance Offset "alpha" FT_Color where rawOffset = #{offset struct FT_Color_, alpha}

instance Storable FT_Color where
  sizeOf _    = #size      struct FT_Color_
  alignment _ = #alignment struct FT_Color_

  peek ptr =
    FT_Color
      <$> peek (offset @"blue"  ptr)
      <*> peek (offset @"green" ptr)
      <*> peek (offset @"red"   ptr)
      <*> peek (offset @"alpha" ptr)

  poke ptr val = do
    pokeField @"blue"  ptr val
    pokeField @"green" ptr val
    pokeField @"red"   ptr val
    pokeField @"alpha" ptr val



data FT_Palette_Data = FT_Palette_Data
                         { num_palettes           :: FT_UShort
                         , palette_name_ids       :: Ptr FT_UShort
                         , palette_flags          :: Ptr FT_UShort
                         , num_palette_entries    :: FT_UShort
                         , palette_entry_name_ids :: Ptr FT_UShort
                         }

instance Offset "num_palettes"           FT_Palette_Data where rawOffset = #{offset struct FT_Palette_Data_, num_palettes          }
instance Offset "palette_name_ids"       FT_Palette_Data where rawOffset = #{offset struct FT_Palette_Data_, palette_name_ids      }
instance Offset "palette_flags"          FT_Palette_Data where rawOffset = #{offset struct FT_Palette_Data_, palette_flags         }
instance Offset "num_palette_entries"    FT_Palette_Data where rawOffset = #{offset struct FT_Palette_Data_, num_palette_entries   }
instance Offset "palette_entry_name_ids" FT_Palette_Data where rawOffset = #{offset struct FT_Palette_Data_, palette_entry_name_ids}

instance Storable FT_Palette_Data where
  sizeOf _    = #size      struct FT_Palette_Data_
  alignment _ = #alignment struct FT_Palette_Data_

  peek ptr =
    FT_Palette_Data
      <$> peek (offset @"num_palettes"           ptr)
      <*> peek (offset @"palette_name_ids"       ptr)
      <*> peek (offset @"palette_flags"          ptr)
      <*> peek (offset @"num_palette_entries"    ptr)
      <*> peek (offset @"palette_entry_name_ids" ptr)

  poke ptr val = do
    pokeField @"num_palettes"           ptr val
    pokeField @"palette_name_ids"       ptr val
    pokeField @"palette_flags"          ptr val
    pokeField @"num_palette_entries"    ptr val
    pokeField @"palette_entry_name_ids" ptr val
