{-# LANGUAGE PatternSynonyms #-}

module FreeType.Support.Scanline
  ( -- ** FT_Raster
    FT_Raster
  , FT_RasterRec
    -- ** FT_Span
  , FT_Span (..)
    -- ** FT_SpanFunc
  , FT_SpanFunc
    -- ** FT_Raster_Params
  , FT_Raster_Params (..)
    -- ** FT_RASTER_FLAG_XXX
  , pattern FT_RASTER_FLAG_DEFAULT
  , pattern FT_RASTER_FLAG_AA
  , pattern FT_RASTER_FLAG_DIRECT
  , pattern FT_RASTER_FLAG_CLIP
    -- ** FT_Raster_NewFunc
  , FT_Raster_NewFunc
    -- ** FT_Raster_DoneFunc
  , FT_Raster_DoneFunc
    -- ** FT_Raster_ResetFunc
  , FT_Raster_ResetFunc
    -- ** FT_Raster_SetModeFunc
  , FT_Raster_SetModeFunc
    -- ** FT_Raster_RenderFunc
  , FT_Raster_RenderFunc
    -- ** FT_Raster_Funcs
  , FT_Raster_Funcs (..)
    -- ** FT_Raster_BitTest_Func
  , FT_Raster_BitTest_Func
    -- ** FT_Raster_BitSet_Func
  , FT_Raster_BitSet_Func
  ) where

import           FreeType.Support.Scanline.Types

import           Data.Int

#include "ft2build.h"
#include FT_FREETYPE_H



pattern FT_RASTER_FLAG_DEFAULT
      , FT_RASTER_FLAG_AA
      , FT_RASTER_FLAG_DIRECT
      , FT_RASTER_FLAG_CLIP
     :: #type int
pattern FT_RASTER_FLAG_DEFAULT = #const FT_RASTER_FLAG_DEFAULT
pattern FT_RASTER_FLAG_AA      = #const FT_RASTER_FLAG_AA
pattern FT_RASTER_FLAG_DIRECT  = #const FT_RASTER_FLAG_DIRECT
pattern FT_RASTER_FLAG_CLIP    = #const FT_RASTER_FLAG_CLIP
