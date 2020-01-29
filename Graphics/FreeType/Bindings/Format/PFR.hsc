{-# LANGUAGE ForeignFunctionInterface #-}

module Graphics.FreeType.Bindings.Format.PFR where

import           Graphics.FreeType.Bindings.Core.Base
import           Graphics.FreeType.Bindings.Core.Types

import           Foreign.C.Types
import           Foreign.Ptr

#include "ft2build.h"
#include FT_PFR_H

foreign import ccall "FT_Get_PFR_Metrics"
  ft_Get_PFR_Metrics :: FT_Face -> Ptr FT_UInt -> Ptr FT_UInt -> Ptr FT_Fixed -> Ptr FT_Fixed -> IO FT_Error



foreign import ccall "FT_Get_PFR_Kerning"
  ft_Get_PFR_Kerning :: FT_Face -> FT_UInt -> FT_UInt -> Ptr FT_Vector -> IO FT_Error



foreign import ccall "FT_Get_PFR_Advance"
  ft_Get_PFR_Advance :: FT_Face -> FT_UInt -> Ptr FT_Pos -> IO FT_Error
