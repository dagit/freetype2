{-# LANGUAGE ForeignFunctionInterface #-}

module FreeType.Format.TrueType.Internal
  ( -- ** FT_Get_Sfnt_Table
    ft_Get_Sfnt_Table'
    -- ** FT_Load_Sfnt_Table
  , ft_Load_Sfnt_Table'
    -- ** FT_Sfnt_Table_Info
  , ft_Sfnt_Table_Info'
  ) where

import           FreeType.Core.Base.Types
import           FreeType.Core.Types.Types
import           FreeType.Format.TrueType.Types

import           Foreign.Ptr

#include "ft2build.h"
#include FT_TRUETYPE_TABLES_H

foreign import ccall "FT_Get_Sfnt_Table"
  ft_Get_Sfnt_Table' :: FT_Face -> FT_Sfnt_Tag -> IO (Ptr ())



foreign import ccall "FT_Load_Sfnt_Table"
  ft_Load_Sfnt_Table' :: FT_Face -> FT_ULong -> FT_Long -> Ptr FT_Byte -> Ptr FT_ULong -> IO FT_Error



foreign import ccall "FT_Sfnt_Table_Info"
  ft_Sfnt_Table_Info' :: FT_Face -> FT_UInt -> Ptr FT_ULong -> Ptr FT_ULong -> IO FT_Error
