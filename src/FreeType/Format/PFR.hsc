{-# LANGUAGE CApiFFI
           , CPP
           , ForeignFunctionInterface #-}

{- | Please refer to the
     [Format-Specific API > PFR Fonts](https://www.freetype.org/freetype2/docs/reference/ft2-pfr_fonts.html)
     chapter of the reference.
 -}

module FreeType.Format.PFR
  ( -- ** FT_Get_PFR_Metrics
    ft_Get_PFR_Metrics
    -- ** FT_Get_PFR_Kerning
  , ft_Get_PFR_Kerning
    -- ** FT_Get_PFR_Advance
  , ft_Get_PFR_Advance
  ) where

import           FreeType.Core.Base.Types
import           FreeType.Core.Types.Types

import           Foreign.Ptr

#include "ft2build.h"
#include FT_PFR_H

foreign import CALLCV "freetype/ftpfr.h FT_Get_PFR_Metrics"
  ft_Get_PFR_Metrics
    :: FT_Face      -- ^ face
    -> Ptr FT_UInt  -- ^ aoutline_resolution
    -> Ptr FT_UInt  -- ^ ametrics_resolution
    -> Ptr FT_Fixed -- ^ ametrics_x_scale
    -> Ptr FT_Fixed -- ^ ametrics_y_scale
    -> IO FT_Error



foreign import CALLCV "freetype/ftpfr.h FT_Get_PFR_Kerning"
  ft_Get_PFR_Kerning
    :: FT_Face       -- ^ face
    -> FT_UInt       -- ^ left
    -> FT_UInt       -- ^ right
    -> Ptr FT_Vector -- ^ avector
    -> IO FT_Error



foreign import CALLCV "freetype/ftpfr.h FT_Get_PFR_Advance"
  ft_Get_PFR_Advance
    :: FT_Face     -- ^ face
    -> FT_UInt     -- ^ gindex
    -> Ptr FT_Pos  -- ^ aadvance
    -> IO FT_Error
