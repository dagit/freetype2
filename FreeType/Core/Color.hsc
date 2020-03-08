{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE TemplateHaskell #-}

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
--  , ft_Palette_Set_Foreground_Color
  ) where

import           FreeType.Core.Base.Types
import           FreeType.Core.Color.Internal
import           FreeType.Core.Color.Types
import           FreeType.Core.Types.Types
import           FreeType.Exception.Internal

import           Foreign.Ptr

#include "ft2build.h"
#include FT_COLOR_H


pattern FT_PALETTE_FOR_LIGHT_BACKGROUND    
      , FT_PALETTE_FOR_DARK_BACKGROUND    
     :: FT_UShort    
pattern FT_PALETTE_FOR_LIGHT_BACKGROUND = #const FT_PALETTE_FOR_LIGHT_BACKGROUND    
pattern FT_PALETTE_FOR_DARK_BACKGROUND  = #const FT_PALETTE_FOR_DARK_BACKGROUND    



ft_Palette_Data_Get
  :: FT_Face            -- ^ face
  -> IO FT_Palette_Data -- ^ palette
ft_Palette_Data_Get =
  autoAllocaError 'ft_Palette_Data_Get ft_Palette_Data_Get'



foreign import ccall "FT_Palette_Select"    
  ft_Palette_Select
    :: FT_Face      -- ^ face
    -> FT_UShort    -- ^ palette_index
    -> Ptr FT_Color -- ^ apalette
    -> IO FT_Error    
