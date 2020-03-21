module FreeType.Control.Subpixel.Types where

import           FreeType.Core.Types.Types

import           Data.Word
import           Foreign.Ptr

#include "ft2build.h"
#include FT_LCD_FILTER_H



type FT_LcdFilter = #type enum FT_LcdFilter_



type FT_LcdFiveTapFilter = Ptr FT_Byte
