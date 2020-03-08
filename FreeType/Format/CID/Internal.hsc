{-# LANGUAGE ForeignFunctionInterface #-}

module FreeType.Format.CID.Internal
  ( -- ** FT_Get_CID_Registry_Ordering_Supplement
    ft_Get_CID_Registry_Ordering_Supplement'
    -- ** FT_Get_CID_Is_Internally_CID_Keyed
  , ft_Get_CID_Is_Internally_CID_Keyed'
    -- ** FT_Get_CID_From_Glyph_Index
  , ft_Get_CID_From_Glyph_Index'
  ) where

import           FreeType.Core.Base
import           FreeType.Core.Types.Types

import           Data.Int
import           Foreign.Ptr

#include "ft2build.h"
#include FT_CID_H

foreign import ccall "FT_Get_CID_Registry_Ordering_Supplement"
  ft_Get_CID_Registry_Ordering_Supplement'
    :: FT_Face                -- ^ face
    -> Ptr (Ptr #{type char}) -- ^ registry
    -> Ptr (Ptr #{type char}) -- ^ ordering
    -> Ptr FT_Int             -- ^ supplement
    -> IO FT_Error



foreign import ccall "FT_Get_CID_Is_Internally_CID_Keyed"
  ft_Get_CID_Is_Internally_CID_Keyed'
    :: FT_Face     -- ^ face
    -> Ptr FT_Bool -- ^ is_cid
    -> IO FT_Error



foreign import ccall "FT_Get_CID_From_Glyph_Index"
  ft_Get_CID_From_Glyph_Index'
    :: FT_Face     -- ^ face
    -> FT_UInt     -- ^ glyph_index
    -> Ptr FT_UInt -- ^ cid
    -> IO FT_Error
