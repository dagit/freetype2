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
  ft_Get_Advance'
    :: FT_Face      -- ^ face
    -> FT_UInt      -- ^ gindex
    -> FT_Int32     -- ^ load_flags
    -> Ptr FT_Fixed -- ^ padvance
    -> IO FT_Error



foreign import ccall "FT_Get_Advances"
  ft_Get_Advances'
    :: FT_Face      -- ^ face
    -> FT_UInt      -- ^ start
    -> FT_UInt      -- ^ count
    -> FT_Int32     -- ^ load_flags
    -> Ptr FT_Fixed -- ^ padvances
    -> IO FT_Error
