{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}

module FreeType.Raw.Core.Color where

import           FreeType.Raw.Core.Base
import           FreeType.Raw.Core.Types

import           Foreign.C.Types
import           Foreign.Ptr
import           Foreign.Storable

#include "ft2build.h"
#include FT_FREETYPE_H

#include "freetype/ftcolor.h"

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
    #{poke struct FT_Color_, blue } ptr $ cBlue  val
    #{poke struct FT_Color_, green} ptr $ cGreen val
    #{poke struct FT_Color_, red  } ptr $ cRed   val
    #{poke struct FT_Color_, alpha} ptr $ cAlpha val



pattern FT_PALETTE_FOR_LIGHT_BACKGROUND
      , FT_PALETTE_FOR_DARK_BACKGROUND
     :: FT_UInt
pattern FT_PALETTE_FOR_LIGHT_BACKGROUND = #const FT_PALETTE_FOR_LIGHT_BACKGROUND
pattern FT_PALETTE_FOR_DARK_BACKGROUND  = #const FT_PALETTE_FOR_DARK_BACKGROUND



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
    #{poke struct FT_Palette_Data_, num_palettes          } ptr $ pdNum_palettes           val
    #{poke struct FT_Palette_Data_, palette_name_ids      } ptr $ pdPalette_name_ids       val
    #{poke struct FT_Palette_Data_, palette_flags         } ptr $ pdPalette_flags          val
    #{poke struct FT_Palette_Data_, num_palette_entries   } ptr $ pdNum_palette_entries    val
    #{poke struct FT_Palette_Data_, palette_entry_name_ids} ptr $ pdPalette_entry_name_ids val



foreign import ccall "FT_Palette_Data_Get"
  ft_Palette_Data_Get :: FT_Face -> Ptr FT_Palette_Data -> IO FT_Error



foreign import ccall "FT_Palette_Select"
  ft_Palette_Select :: FT_Face -> FT_UShort -> Ptr FT_Color -> IO FT_Error


{-# WARNING ft_Palette_Set_Foreground_Color "Not implemented, requires a function rewrite on the other side" #-}
ft_Palette_Set_Foreground_Color :: IO ()
ft_Palette_Set_Foreground_Color = return ()
{-
foreign import ccall "FT_Palette_Set_Foreground_Color"
  ft_Palette_Set_Foreground_Color :: FT_Face -> FT_Color -> IO FT_Error
-}
