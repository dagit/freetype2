{-# LANGUAGE ForeignFunctionInterface #-}

module FreeType.Format.CID where

import           FreeType.Core.Base
import           FreeType.Core.Types

import           Foreign.C.Types
import           Foreign.Ptr

#include "ft2build.h"
#include FT_CID_H

foreign import ccall "FT_Get_CID_Registry_Ordering_Supplement"
  ft_Get_CID_Registry_Ordering_Supplement :: FT_Face -> Ptr (Ptr CChar) -> Ptr (Ptr CChar) -> Ptr FT_Int -> IO FT_Error



foreign import ccall "FT_Get_CID_Is_Internally_CID_Keyed"
  ft_Get_CID_Is_Internally_CID_Keyed :: FT_Face -> Ptr FT_Bool -> IO FT_Error



foreign import ccall "FT_Get_CID_From_Glyph_Index"
  ft_Get_CID_From_Glyph_Index :: FT_Face -> FT_UInt -> Ptr FT_UInt -> IO FT_Error
