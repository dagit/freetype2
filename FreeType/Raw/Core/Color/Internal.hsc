{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}
{-# OPTIONS_HADDOCK hide #-}

module FreeType.Raw.Core.Color.Internal where

import           FreeType.Raw.Core.Base.Internal
import           FreeType.Raw.Core.Types.Internal

import           Foreign.C.Types
import           Foreign.Ptr

#include "ft2build.h"
#include FT_COLOR_H

data FT_Color = FT_Color
                  { cBlue  :: FT_Byte
                  , cGreen :: FT_Byte
                  , cRed   :: FT_Byte
                  , cAlpha :: FT_Byte
                  }



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
