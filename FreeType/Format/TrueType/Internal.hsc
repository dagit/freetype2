{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}

module FreeType.Format.TrueType.Internal
  ( -- ** FT_Get_Sfnt_Table
    ft_Get_Sfnt_Table'
    -- ** FT_Load_Sfnt_Table
  , ft_Load_Sfnt_Table'
    -- ** FT_Sfnt_Table_Info
  , ft_Sfnt_Table_Info'
    -- ** FT_PARAM_TAG_UNPATENTED_HINTING
  , pattern FT_PARAM_TAG_UNPATENTED_HINTING
    -- ** TT_PLATFORM_XXX
  , pattern TT_PLATFORM_ISO
    -- ** TT_APPLE_ID_XXX
  , pattern TT_APPLE_ID_ISO_10646
    -- ** TT_ISO_ID_XXX
  , pattern TT_ISO_ID_7BIT_ASCII
  , pattern TT_ISO_ID_10646
  , pattern TT_ISO_ID_8859_1
  ) where

import           FreeType.Control.Parameter.Internal (pattern FT_PARAM_TAG_UNPATENTED_HINTING)
import           FreeType.Core.Base.Types
import           FreeType.Core.Types.Types
import           FreeType.Format.TrueType.Types

import           Foreign.Ptr

#include "ft2build.h"
#include FT_TRUETYPE_TABLES_H
#include FT_TRUETYPE_IDS_H

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



pattern TT_PLATFORM_ISO :: FT_UShort
pattern TT_PLATFORM_ISO = #const TT_PLATFORM_ISO



pattern TT_APPLE_ID_ISO_10646 :: FT_UShort
pattern TT_APPLE_ID_ISO_10646 = #const TT_APPLE_ID_ISO_10646



pattern TT_ISO_ID_7BIT_ASCII
      , TT_ISO_ID_10646
      , TT_ISO_ID_8859_1
     :: FT_UShort
pattern TT_ISO_ID_7BIT_ASCII = #const TT_ISO_ID_7BIT_ASCII
pattern TT_ISO_ID_10646      = #const TT_ISO_ID_10646
pattern TT_ISO_ID_8859_1     = #const TT_ISO_ID_8859_1
