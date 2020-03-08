{-# LANGUAGE ForeignFunctionInterface #-}

module FreeType.Format.WinFNT.Internal
  ( -- ** FT_Get_WinFNT_Header
    ft_Get_WinFNT_Header'
  ) where

import           FreeType.Core.Base.Types
import           FreeType.Core.Types.Types
import           FreeType.Format.WinFNT.Types

import           Foreign.Ptr

#include "ft2build.h"
#include FT_WINFONTS_H

foreign import ccall "FT_Get_WinFNT_Header"
  ft_Get_WinFNT_Header' :: FT_Face -> Ptr FT_WinFNT_HeaderRec -> IO FT_Error
