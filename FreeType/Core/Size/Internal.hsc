{-# LANGUAGE ForeignFunctionInterface #-}

module FreeType.Core.Size.Internal
  ( -- ** FT_New_Size
    ft_New_Size'
    -- ** FT_Done_Size
  , ft_Done_Size'
    -- ** FT_Activate_Size
  , ft_Activate_Size'
  ) where

import           FreeType.Core.Base.Types
import           FreeType.Core.Types.Types

import           Foreign.Ptr

#include "ft2build.h"
#include FT_FREETYPE_H

foreign import ccall "FT_New_Size"
  ft_New_Size' :: FT_Face -> Ptr FT_Size -> IO FT_Error



foreign import ccall "FT_Done_Size"
  ft_Done_Size' :: FT_Size -> IO FT_Error



foreign import ccall "FT_Activate_Size"
  ft_Activate_Size' :: FT_Size -> IO FT_Error
