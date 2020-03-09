{-# LANGUAGE ForeignFunctionInterface #-}

module FreeType.Core.Color.Internal
  ( -- ** FT_Palette_Data_Get
    ft_Palette_Data_Get'
    -- ** FT_Palette_Set_Foreground_Color
  , ft_Palette_Set_Foreground_Color'
  ) where

import           FreeType.Core.Color.Types
import           FreeType.Core.Base.Types
import           FreeType.Core.Types.Types

import           Foreign.Ptr

#include "ft2build.h"
#include FT_COLOR_H
#include "ftcolor-plus.h"



foreign import ccall "FT_Palette_Data_Get"
  ft_Palette_Data_Get'
    :: FT_Face             -- ^ face
    -> Ptr FT_Palette_Data -- ^ apalette
    -> IO FT_Error



foreign import ccall "FT_Palette_Set_Foreground_Color_Plus"
  ft_Palette_Set_Foreground_Color'
    :: FT_Face      -- ^ face
    -> Ptr FT_Color -- ^ color
    -> IO FT_Error
