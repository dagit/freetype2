{-# LANGUAGE ForeignFunctionInterface #-}

module FreeType.Format.BDF.Internal
  ( -- ** FT_Get_BDF_Charset_ID
    ft_Get_BDF_Charset_ID'
    -- ** FT_Get_BDF_Property
  , ft_Get_BDF_Property'
  ) where

import           FreeType.Core.Base.Types
import           FreeType.Core.Types.Types
import           FreeType.Format.BDF.Types

import           Data.Int
import           Foreign.Ptr

#include "ft2build.h"
#include FT_BDF_H

foreign import ccall "FT_Get_BDF_Charset_ID"
  ft_Get_BDF_Charset_ID' :: FT_Face -> Ptr (Ptr #{type char}) -> Ptr (Ptr #{type char}) -> IO FT_Error



foreign import ccall "FT_Get_BDF_Property"
  ft_Get_BDF_Property' :: FT_Face -> Ptr #{type char} -> Ptr BDF_PropertyRec -> IO FT_Error
