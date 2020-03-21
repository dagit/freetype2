{- | Please refer to the
     [Format-Specific API > PFR Fonts](https://www.freetype.org/freetype2/docs/reference/ft2-pfr_fonts.html)
     chapter of the reference.

     Internal: "FreeType.Format.PFR.Internal".
 -}

module FreeType.Format.PFR
  ( -- ** FT_Get_PFR_Metrics
    ft_Get_PFR_Metrics
    -- ** FT_Get_PFR_Kerning
  , ft_Get_PFR_Kerning
    -- ** FT_Get_PFR_Advance
  , ft_Get_PFR_Advance
  ) where

import           FreeType.Core.Base
import           FreeType.Core.Types.Types
import           FreeType.Exception.Internal
import           FreeType.Format.PFR.Internal

import           Foreign.Marshal.Alloc
import           Foreign.Ptr
import           Foreign.Storable

#include "ft2build.h"
#include FT_PFR_H

ft_Get_PFR_Metrics
  :: FT_Face -- ^ face
  -> IO (Maybe FT_UInt, Maybe FT_UInt, Maybe FT_Fixed, Maybe FT_Fixed)
     -- ^ (outline_resolution, metrics_resolution, metrics_x_scale, metrics_y_scale)
ft_Get_PFR_Metrics face =
  alloca $ \outlinePtr ->
    alloca $ \metricsPtr ->
      alloca $ \metXPtr ->
        alloca $ \metYPtr -> do
          ftError "ft_Get_PFR_Metrics"
            $ ft_Get_PFR_Metrics' face outlinePtr metricsPtr metXPtr metYPtr
          (,,,)
            <$> nothingOnNULL outlinePtr
            <*> nothingOnNULL metricsPtr
            <*> nothingOnNULL metXPtr
            <*> nothingOnNULL metYPtr
  where
    nothingOnNULL a = if a == nullPtr
                        then return Nothing
                        else Just <$> peek a
    


ft_Get_PFR_Kerning
  :: FT_Face      -- ^ face
  -> FT_UInt      -- ^ left
  -> FT_UInt      -- ^ right
  -> IO FT_Vector -- ^ vector
ft_Get_PFR_Kerning =
  autoAllocaError "ft_Get_PFR_Kerning" ft_Get_PFR_Kerning'



ft_Get_PFR_Advance
  :: FT_Face   -- ^ face
  -> FT_UInt   -- ^ gindex
  -> IO FT_Pos -- ^ advance
ft_Get_PFR_Advance =
  autoAllocaError "ft_Get_PFR_Advance" ft_Get_PFR_Advance'
