{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}

{- | Please refer to the
     [Format-Specific API > Gasp Table](https://www.freetype.org/freetype2/docs/reference/ft2-gasp_table.html)
     chapter of the reference.
 -}

module FreeType.Format.Gasp
  ( -- ** FT_GASP_XXX
    pattern FT_GASP_NO_TABLE         
  , pattern FT_GASP_DO_GRIDFIT       
  , pattern FT_GASP_DO_GRAY          
  , pattern FT_GASP_SYMMETRIC_GRIDFIT
  , pattern FT_GASP_SYMMETRIC_SMOOTHING
    -- ** FT_Get_Gasp
  , ft_Get_Gasp
  ) where

import           FreeType.Core.Base
import           FreeType.Core.Types.Types

#include "ft2build.h"
#include FT_FREETYPE_H

#include FT_GASP_H

pattern FT_GASP_NO_TABLE
      , FT_GASP_DO_GRIDFIT
      , FT_GASP_DO_GRAY
      , FT_GASP_SYMMETRIC_GRIDFIT
      , FT_GASP_SYMMETRIC_SMOOTHING
     :: FT_Int
pattern FT_GASP_NO_TABLE            = #const FT_GASP_NO_TABLE
pattern FT_GASP_DO_GRIDFIT          = #const FT_GASP_DO_GRIDFIT
pattern FT_GASP_DO_GRAY             = #const FT_GASP_DO_GRAY
pattern FT_GASP_SYMMETRIC_GRIDFIT   = #const FT_GASP_SYMMETRIC_GRIDFIT
pattern FT_GASP_SYMMETRIC_SMOOTHING = #const FT_GASP_SYMMETRIC_SMOOTHING



foreign import ccall "FT_Get_Gasp"
  ft_Get_Gasp
    :: FT_Face   -- ^ face
    -> FT_UInt   -- ^ ppem
    -> IO FT_Int
