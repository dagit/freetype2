{-# LANGUAGE ForeignFunctionInterface #-}

module FreeType.Error.Enumerations.Internal
  ( -- ** FT_Error_String
    ft_Error_String'
  ) where

import           FreeType.Core.Types.Types

import           Data.Int
import           Foreign.Ptr

#include "ft2build.h"
#include FT_FREETYPE_H

foreign import ccall "FT_Error_String"
  ft_Error_String' :: FT_Error -> IO (Ptr #{type char})
