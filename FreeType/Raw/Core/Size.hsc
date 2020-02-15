{-# LANGUAGE ForeignFunctionInterface #-}

module FreeType.Raw.Core.Size where

import           FreeType.Raw.Core.Base
import           FreeType.Raw.Core.Types

import           Foreign.C.Types
import           Foreign.Ptr

#include "ft2build.h"
#include FT_FREETYPE_H

foreign import ccall "FT_New_Size"
  ft_New_Size :: FT_Face -> Ptr FT_Size -> IO FT_Error



foreign import ccall "FT_Done_Size"
  ft_Done_Size :: FT_Size -> IO FT_Error



foreign import ccall "FT_Activate_Size"
  ft_Activate_Size :: FT_Size -> IO FT_Error
