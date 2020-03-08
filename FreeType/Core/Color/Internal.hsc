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
import           FreeType.Error.Values

import           Foreign.Ptr

#include "ft2build.h"
#include FT_COLOR_H



foreign import ccall "FT_Palette_Data_Get"
  ft_Palette_Data_Get' :: FT_Face -> Ptr FT_Palette_Data -> IO FT_Error



{-# WARNING ft_Palette_Set_Foreground_Color' "Not implemented, requires a function rewrite on the other side" #-}
ft_Palette_Set_Foreground_Color' :: FT_Face -> Ptr FT_Color -> IO FT_Error
ft_Palette_Set_Foreground_Color' _ _ = return FT_Err_Unimplemented_Feature
{-
foreign import ccall "FT_Palette_Set_Foreground_Color"
  ft_Palette_Set_Foreground_Color' :: FT_Face -> Ptr FT_Color -> IO FT_Error
-}
