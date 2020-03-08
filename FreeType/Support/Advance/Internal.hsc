{-# LANGUAGE ForeignFunctionInterface #-}

module FreeType.Support.Advance.Internal
  ( -- ** FT_Get_Advance
    ft_Get_Advance'
    -- ** FT_Get_Advances
  , ft_Get_Advances'
  ) where

import           FreeType.Core.Base
import           FreeType.Core.Types.Types

import           Foreign.Ptr

#include "ft2build.h"
#include FT_ADVANCES_H

foreign import ccall "FT_Get_Advance"
  ft_Get_Advance' :: FT_Face -> FT_UInt -> FT_Int32 -> Ptr FT_Fixed -> IO FT_Error



foreign import ccall "FT_Get_Advances"
  ft_Get_Advances' :: FT_Face -> FT_UInt -> FT_UInt -> FT_Int32 -> Ptr FT_Fixed -> IO FT_Error
