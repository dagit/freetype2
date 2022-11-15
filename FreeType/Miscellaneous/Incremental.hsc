{- | Please refer to the
     [Miscellaneous > Incremental Loading](https://www.freetype.org/freetype2/docs/reference/ft2-incremental.html)
     chapter of the reference.
 -}

module FreeType.Miscellaneous.Incremental
  ( -- ** FT_Incremental
    FT_Incremental
    -- ** FT_Incremental_MetricsRec
  , FT_Incremental_MetricsRec (..)
    -- ** FT_Incremental_Metrics
  , FT_Incremental_Metrics
    -- ** FT_Incremental_GetGlyphDataFunc
  , FT_Incremental_GetGlyphDataFunc
    -- ** FT_Incremental_FreeGlyphDataFunc
  , FT_Incremental_FreeGlyphDataFunc
    -- ** FT_Incremental_GetGlyphMetricsFunc
  , FT_Incremental_GetGlyphMetricsFunc
    -- ** FT_Incremental_FuncsRec
  , FT_Incremental_FuncsRec (..)
    -- ** FT_Incremental_InterfaceRec
  , FT_Incremental_InterfaceRec (..)
    -- ** FT_Incremental_Interface
  , FT_Incremental_Interface
  ) where

import           FreeType.Miscellaneous.Incremental.Types
