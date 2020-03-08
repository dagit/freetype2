{-# LANGUAGE ForeignFunctionInterface #-}

module FreeType.Format.Type1.Internal
  ( -- ** FT_Get_PS_Font_Info
    ft_Get_PS_Font_Info'
    -- ** FT_Get_PS_Font_Private
  , ft_Get_PS_Font_Private'
  ) where

import           FreeType.Core.Base.Types
import           FreeType.Core.Types.Types
import           FreeType.Format.Type1.Types

import           Foreign.Ptr

#include "ft2build.h"
#include FT_TYPE1_TABLES_H

foreign import ccall "FT_Get_PS_Font_Info"
  ft_Get_PS_Font_Info' :: FT_Face -> PS_FontInfo -> IO FT_Error



foreign import ccall "FT_Get_PS_Font_Private"
  ft_Get_PS_Font_Private' :: FT_Face -> PS_Private -> IO FT_Error
