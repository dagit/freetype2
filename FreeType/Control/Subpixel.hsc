{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}

module FreeType.Control.Subpixel where

import           FreeType.Core.Base
import           FreeType.Core.Types

import           Foreign.C.Types
import           Foreign.Marshal.Array (peekArray, pokeArray)
import           Foreign.Ptr
import           Foreign.Storable

#include "ft2build.h"
#include FT_FREETYPE_H

#include "freetype/ftlcdfil.h"

type FT_LcdFilter = FT_UInt

pattern FT_LCD_FILTER_NONE
      , FT_LCD_FILTER_DEFAULT
      , FT_LCD_FILTER_LIGHT
      , FT_LCD_FILTER_LEGACY1
      , FT_LCD_FILTER_LEGACY
     :: FT_LcdFilter
pattern FT_LCD_FILTER_NONE    = #const FT_LCD_FILTER_NONE
pattern FT_LCD_FILTER_DEFAULT = #const FT_LCD_FILTER_DEFAULT
pattern FT_LCD_FILTER_LIGHT   = #const FT_LCD_FILTER_LIGHT
pattern FT_LCD_FILTER_LEGACY1 = #const FT_LCD_FILTER_LEGACY1
pattern FT_LCD_FILTER_LEGACY  = #const FT_LCD_FILTER_LEGACY



foreign import ccall "FT_Library_SetLcdFilter"
  ft_Library_SetLcdFilter :: FT_Library -> FT_LcdFilter -> IO FT_Error



foreign import ccall "FT_Library_SetLcdFilterWeights"
  ft_Library_SetLcdFilterWeights :: FT_Library -> Ptr CUChar -> IO FT_Error



data FT_LcdFiveTapFilter = FT_LcdFiveTapFilter FT_Byte FT_Byte FT_Byte FT_Byte FT_Byte

instance Storable FT_LcdFiveTapFilter where
  sizeOf _    = #size      FT_LcdFiveTapFilter
  alignment _ = #alignment FT_LcdFiveTapFilter

  peek ptr = do
    [a, b, c, d, e] <- peekArray 5 (castPtr ptr :: Ptr FT_Byte)
    return $ FT_LcdFiveTapFilter a b c d e

  poke ptr (FT_LcdFiveTapFilter a b c d e) =
    pokeArray (castPtr ptr :: Ptr FT_Byte) [a, b, c, d, e]



foreign import ccall "FT_Library_SetLcdGeometry"
  ft_Library_SetLcdGeometry :: FT_Library -> Ptr FT_Vector -> IO FT_Error
