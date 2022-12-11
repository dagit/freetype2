{-# LANGUAGE CApiFFI
           , CPP
           , ForeignFunctionInterface
           , PatternSynonyms #-}

{- | Please refer to the
     [Core API > Glyph Color Management](https://www.freetype.org/freetype2/docs/reference/ft2-color_management.html)
     chapter of the reference.
-}

module FreeType.Core.Color
  ( -- ** FT_Color
    FT_Color (..)
    -- ** FT_PALETTE_XXX
  , pattern FT_PALETTE_FOR_LIGHT_BACKGROUND
  , pattern FT_PALETTE_FOR_DARK_BACKGROUND
    -- ** FT_Palette_Data
  , FT_Palette_Data (..)
    -- ** FT_Palette_Data_Get
  , ft_Palette_Data_Get
    -- ** FT_Palette_Select
  , ft_Palette_Select
    -- ** FT_Palette_Set_Foreground_Color
  , ft_Palette_Set_Foreground_Color
  ) where

import           FreeType.Core.Base.Types
import           FreeType.Core.Color.Types
import           FreeType.Core.Types.Types

import           Foreign.Ptr

#include "ft2build.h"
#include FT_COLOR_H
#include "extra/ftcolor.h"



pattern FT_PALETTE_FOR_LIGHT_BACKGROUND
      , FT_PALETTE_FOR_DARK_BACKGROUND
     :: (Eq a, Num a) => a
pattern FT_PALETTE_FOR_LIGHT_BACKGROUND = #const FT_PALETTE_FOR_LIGHT_BACKGROUND
pattern FT_PALETTE_FOR_DARK_BACKGROUND  = #const FT_PALETTE_FOR_DARK_BACKGROUND



foreign import CALLCV "freetype/ftcolor.h FT_Palette_Data_Get"
  ft_Palette_Data_Get
    :: FT_Face             -- ^ face
    -> Ptr FT_Palette_Data -- ^ apalette
    -> IO FT_Error



foreign import CALLCV "freetype/ftcolor.h FT_Palette_Select"
  ft_Palette_Select
    :: FT_Face            -- ^ face
    -> FT_UShort          -- ^ palette_index
    -> Ptr (Ptr FT_Color) -- ^ apalette
    -> IO FT_Error



foreign import CALLCV "extra/ftcolor.h FT_Palette_Set_Foreground_Color_ptr"
  ft_Palette_Set_Foreground_Color
    :: FT_Face      -- ^ face
    -> Ptr FT_Color -- ^ color
    -> IO FT_Error
