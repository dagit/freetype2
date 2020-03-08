{-# LANGUAGE ForeignFunctionInterface #-}

module FreeType.Core.Color.Internal
  ( -- ** FT_Palette_Data_Get
    ft_Palette_Data_Get'
  ) where

import           FreeType.Core.Color.Types
import           FreeType.Core.Base.Types
import           FreeType.Core.Types.Types

import           Foreign.Ptr

#include "ft2build.h"
#include FT_COLOR_H



foreign import ccall "FT_Palette_Data_Get"
  ft_Palette_Data_Get' :: FT_Face -> Ptr FT_Palette_Data -> IO FT_Error
