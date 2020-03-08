{-# LANGUAGE ForeignFunctionInterface #-}

module FreeType.Control.Subpixel.Internal
  ( -- ** FT_Library_SetLcdFilter
    ft_Library_SetLcdFilter'
    -- ** FT_Library_SetLcdFilterWeights
  , ft_Library_SetLcdFilterWeights'
    -- ** FT_Library_SetLcdGeometry
  , ft_Library_SetLcdGeometry'
  ) where

import           FreeType.Control.Subpixel.Types
import           FreeType.Core.Base
import           FreeType.Core.Types.Types

import           Data.Word
import           Foreign.Ptr
import           Foreign.Storable

#include "ft2build.h"
#include FT_LCD_FILTER_H

foreign import ccall "FT_Library_SetLcdFilter"
  ft_Library_SetLcdFilter' :: FT_Library -> FT_LcdFilter -> IO FT_Error



foreign import ccall "FT_Library_SetLcdFilterWeights"
  ft_Library_SetLcdFilterWeights' :: FT_Library -> Ptr #{type unsigned char} -> IO FT_Error



foreign import ccall "FT_Library_SetLcdGeometry"
  ft_Library_SetLcdGeometry' :: FT_Library -> Ptr FT_Vector -> IO FT_Error
