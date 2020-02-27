{-# OPTIONS_GHC -fno-warn-orphans #-}

module FreeType.Core.Color
  ( module FreeType.Core.Color.Internal
  ) where

import           FreeType.Core.Color.Internal
import           FreeType.Lens

import           Foreign.Storable
import           Lens.Micro ((^.))

#include "ft2build.h"
#include FT_COLOR_H

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
    #{poke struct FT_Color_, blue } ptr $ val^.blue
    #{poke struct FT_Color_, green} ptr $ val^.green
    #{poke struct FT_Color_, red  } ptr $ val^.red
    #{poke struct FT_Color_, alpha} ptr $ val^.alpha



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
    #{poke struct FT_Palette_Data_, num_palettes          } ptr $ val^.num_palettes
    #{poke struct FT_Palette_Data_, palette_name_ids      } ptr $ val^.palette_name_ids
    #{poke struct FT_Palette_Data_, palette_flags         } ptr $ val^.palette_flags
    #{poke struct FT_Palette_Data_, num_palette_entries   } ptr $ val^.num_palette_entries
    #{poke struct FT_Palette_Data_, palette_entry_name_ids} ptr $ val^.palette_entry_name_ids
