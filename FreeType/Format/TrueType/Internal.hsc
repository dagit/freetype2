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
  ft_Get_Sfnt_Table'
    :: FT_Face     -- ^ face
    -> FT_Sfnt_Tag -- ^ tag
    -> IO (Ptr ())



foreign import ccall "FT_Load_Sfnt_Table"
  ft_Load_Sfnt_Table'
    :: FT_Face      -- ^ face
    -> FT_ULong     -- ^ tag
    -> FT_Long      -- ^ offset
    -> Ptr FT_Byte  -- ^ buffer
    -> Ptr FT_ULong -- ^ length
    -> IO FT_Error



foreign import ccall "FT_Sfnt_Table_Info"
  ft_Sfnt_Table_Info'
    :: FT_Face      -- ^ face
    -> FT_UInt      -- ^ table_index
    -> Ptr FT_ULong -- ^ tag
    -> Ptr FT_ULong -- ^ length
    -> IO FT_Error
