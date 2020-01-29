{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}

module Graphics.FreeType.Bindings.Support.Advance where

import           Graphics.FreeType.Bindings.Core.Base
import           Graphics.FreeType.Bindings.Core.Types

import           Foreign.C.Types
import           Foreign.Ptr

#include "ft2build.h"
#include FT_FREETYPE_H

#include "freetype/ftadvanc.h"

foreign import ccall "FT_Get_Advance"
  ft_Get_Advance :: FT_Face -> FT_UInt -> FT_Int32 -> Ptr FT_Fixed -> IO FT_Error



foreign import ccall "FT_Get_Advances"
  ft_Get_Advances :: FT_Face -> FT_UInt -> FT_UInt -> FT_Int32 -> Ptr FT_Fixed -> IO FT_Error



pattern FT_ADVANCE_FLAG_FAST_ONLY
     :: FT_UInt
pattern FT_ADVANCE_FLAG_FAST_ONLY = #const FT_ADVANCE_FLAG_FAST_ONLY
