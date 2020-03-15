{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}

{- | Please refer to the
     [Controlling FreeType Modules > Subpixel Rendering](https://www.freetype.org/freetype2/docs/reference/ft2-lcd_rendering.html)
     chapter of the reference.

     Internal: "FreeType.Control.Subpixel.Internal".
 -}

module FreeType.Control.Subpixel
  ( -- ** FT_LcdFilter
    FT_LcdFilter
  , pattern FT_LCD_FILTER_NONE
  , pattern FT_LCD_FILTER_DEFAULT
  , pattern FT_LCD_FILTER_LIGHT
  , pattern FT_LCD_FILTER_LEGACY1
  , pattern FT_LCD_FILTER_LEGACY
    -- ** FT_Library_SetLcdFilter
  , ft_Library_SetLcdFilter
    -- ** FT_Library_SetLcdFilterWeights
  , ft_Library_SetLcdFilterWeights
    -- ** FT_LcdFiveTapFilter
  , pattern FT_LCD_FILTER_FIVE_TAPS
  , FT_LcdFiveTapFilter
    -- ** FT_Library_SetLcdGeometry
  , ft_Library_SetLcdGeometry
  ) where

import           FreeType.Control.Subpixel.Internal
import           FreeType.Control.Subpixel.Types
import           FreeType.Core.Base
import           FreeType.Core.Types.Types
import           FreeType.Exception.Internal

import           Data.Word
import           Foreign.Marshal.Array

#include "ft2build.h"
#include FT_LCD_FILTER_H

pattern FT_LCD_FILTER_NONE
      , FT_LCD_FILTER_DEFAULT
      , FT_LCD_FILTER_LIGHT
      , FT_LCD_FILTER_LEGACY1
      , FT_LCD_FILTER_LEGACY
     :: (Eq a, Num a) => a
pattern FT_LCD_FILTER_NONE    = #const FT_LCD_FILTER_NONE
pattern FT_LCD_FILTER_DEFAULT = #const FT_LCD_FILTER_DEFAULT
pattern FT_LCD_FILTER_LIGHT   = #const FT_LCD_FILTER_LIGHT
pattern FT_LCD_FILTER_LEGACY1 = #const FT_LCD_FILTER_LEGACY1
pattern FT_LCD_FILTER_LEGACY  = #const FT_LCD_FILTER_LEGACY



ft_Library_SetLcdFilter
  :: FT_Library   -- ^ library
  -> FT_LcdFilter -- ^ filter
  -> IO ()
ft_Library_SetLcdFilter =
  autoError "ft_Library_SetLcdFilter" ft_Library_SetLcdFilter'



ft_Library_SetLcdFilterWeights
  :: FT_Library              -- ^ library
  -> ( #type unsigned char
     , #type unsigned char
     , #type unsigned char
     , #type unsigned char
     , #type unsigned char
     ) -- ^ weights
  -> IO ()
ft_Library_SetLcdFilterWeights lib (a, b, c, d, e) =
  withArray [a, b, c, d, e] $ \weightsPtr ->
    ftError "ft_Library_SetLcdFilterWeights"
      $ ft_Library_SetLcdFilterWeights' lib weightsPtr



pattern FT_LCD_FILTER_FIVE_TAPS :: (Eq a, Num a) => a
pattern FT_LCD_FILTER_FIVE_TAPS = #const FT_LCD_FILTER_FIVE_TAPS



ft_Library_SetLcdGeometry
  :: FT_Library                        -- ^ library
  -> (FT_Vector, FT_Vector, FT_Vector) -- ^ sub
  -> IO ()
ft_Library_SetLcdGeometry lib (a, b, c) =
  withArray [a, b, c] $ \subPtr ->
    ftError "ft_Library_SetLcdGeometry" $ ft_Library_SetLcdGeometry' lib subPtr
