{-# LANGUAGE EmptyDataDecls
           , ForeignFunctionInterface
           , PatternSynonyms #-}

{- | Please refer to the
     [Support API > Glyph Stroker](https://www.freetype.org/freetype2/docs/reference/ft2-glyph_stroker.html)
     chapter of the reference.
-}

module FreeType.Support.Glyph
  ( -- ** FT_Stroker
    FT_Stroker
    -- ** FT_Stroker_LineJoin
  , FT_Stroker_LineJoin
  , pattern FT_STROKER_LINEJOIN_ROUND
  , pattern FT_STROKER_LINEJOIN_BEVEL
  , pattern FT_STROKER_LINEJOIN_MITER_VARIABLE
  , pattern FT_STROKER_LINEJOIN_MITER
  , pattern FT_STROKER_LINEJOIN_MITER_FIXED
    -- ** FT_Stroker_LineCap
  , FT_Stroker_LineCap
  , pattern FT_STROKER_LINECAP_BUTT
  , pattern FT_STROKER_LINECAP_ROUND
  , pattern FT_STROKER_LINECAP_SQUARE
    -- ** FT_StrokerBorder
  , FT_StrokerBorder
  , pattern FT_STROKER_BORDER_LEFT
  , pattern FT_STROKER_BORDER_RIGHT
    -- ** FT_Outline_GetInsideBorder
  , ft_Outline_GetInsideBorder
    -- ** FT_Outline_GetOutsideBorder
  , ft_Outline_GetOutsideBorder
    -- ** FT_Glyph_Stroke
  , ft_Glyph_Stroke
    -- ** FT_Glyph_StrokeBorder
  , ft_Glyph_StrokeBorder
    -- ** FT_Stroker_New
  , ft_Stroker_New
    -- ** FT_Stroker_Set
  , ft_Stroker_Set
    -- ** FT_Stroker_Rewind
  , ft_Stroker_Rewind
    -- ** FT_Stroker_ParseOutline
  , ft_Stroker_ParseOutline
    -- ** FT_Stroker_Done
  , ft_Stroker_Done
    -- ** FT_Stroker_BeginSubPath
  , ft_Stroker_BeginSubPath
    -- ** FT_Stroker_EndSubPath
  , ft_Stroker_EndSubPath
    -- ** FT_Stroker_LineTo
  , ft_Stroker_LineTo
    -- ** FT_Stroker_ConicTo
  , ft_Stroker_ConicTo
    -- ** FT_Stroker_CubicTo
  , ft_Stroker_CubicTo
    -- ** FT_Stroker_GetBorderCounts
  , ft_Stroker_GetBorderCounts
    -- ** FT_Stroker_ExportBorder
  , ft_Stroker_ExportBorder
    -- ** FT_Stroker_GetCounts
  , ft_Stroker_GetCounts
    -- ** FT_Stroker_Export
  , ft_Stroker_Export
  ) where

import           FreeType.Core.Base
import           FreeType.Core.Glyph
import           FreeType.Core.Types.Types
import           FreeType.Support.Glyph.Types
import           FreeType.Support.Outline.Types

import           Foreign.Ptr

#include "ft2build.h"
#include FT_STROKER_H

pattern FT_STROKER_LINEJOIN_ROUND
      , FT_STROKER_LINEJOIN_BEVEL
      , FT_STROKER_LINEJOIN_MITER_VARIABLE
      , FT_STROKER_LINEJOIN_MITER
      , FT_STROKER_LINEJOIN_MITER_FIXED
     :: (Eq a, Num a) => a
pattern FT_STROKER_LINEJOIN_ROUND          = #const FT_STROKER_LINEJOIN_ROUND
pattern FT_STROKER_LINEJOIN_BEVEL          = #const FT_STROKER_LINEJOIN_BEVEL
pattern FT_STROKER_LINEJOIN_MITER_VARIABLE = #const FT_STROKER_LINEJOIN_MITER_VARIABLE
pattern FT_STROKER_LINEJOIN_MITER          = #const FT_STROKER_LINEJOIN_MITER
pattern FT_STROKER_LINEJOIN_MITER_FIXED    = #const FT_STROKER_LINEJOIN_MITER_FIXED



pattern FT_STROKER_LINECAP_BUTT
      , FT_STROKER_LINECAP_ROUND
      , FT_STROKER_LINECAP_SQUARE
     :: (Eq a, Num a) => a
pattern FT_STROKER_LINECAP_BUTT   = #const FT_STROKER_LINECAP_BUTT
pattern FT_STROKER_LINECAP_ROUND  = #const FT_STROKER_LINECAP_ROUND
pattern FT_STROKER_LINECAP_SQUARE = #const FT_STROKER_LINECAP_SQUARE



pattern FT_STROKER_BORDER_LEFT
      , FT_STROKER_BORDER_RIGHT
     :: (Eq a, Num a) => a
pattern FT_STROKER_BORDER_LEFT  = #const FT_STROKER_BORDER_LEFT
pattern FT_STROKER_BORDER_RIGHT = #const FT_STROKER_BORDER_LEFT



foreign import ccall "FT_Outline_GetInsideBorder"
  ft_Outline_GetInsideBorder
    :: Ptr FT_Outline      -- ^ outline
    -> IO FT_StrokerBorder



foreign import ccall "FT_Outline_GetOutsideBorder"
  ft_Outline_GetOutsideBorder
    :: Ptr FT_Outline      -- ^ outline
    -> IO FT_StrokerBorder



foreign import ccall "FT_Glyph_Stroke"
  ft_Glyph_Stroke
    :: Ptr FT_Glyph -- ^ pglyph
    -> FT_Stroker   -- ^ stroker
    -> FT_Bool      -- ^ destroy
    -> IO FT_Error



foreign import ccall "FT_Glyph_StrokeBorder"
  ft_Glyph_StrokeBorder
    :: Ptr FT_Glyph -- ^ pglyph
    -> FT_Stroker   -- ^ stroker
    -> FT_Bool      -- ^ inside
    -> FT_Bool      -- ^ destroy
    -> IO FT_Error



foreign import ccall "FT_Stroker_New"
  ft_Stroker_New
    :: FT_Library     -- ^ library
    -> Ptr FT_Stroker -- ^ astroker
    -> IO FT_Error



foreign import ccall "FT_Stroker_Set"
  ft_Stroker_Set
    :: FT_Stroker          -- ^ stroker
    -> FT_Fixed            -- ^ radius
    -> FT_Stroker_LineCap  -- ^ line_cap
    -> FT_Stroker_LineJoin -- ^ line_join
    -> FT_Fixed            -- ^ miter_limit
    -> IO ()



foreign import ccall "FT_Stroker_Rewind"
  ft_Stroker_Rewind
    :: FT_Stroker -- ^ stroker
    -> IO ()



foreign import ccall "FT_Stroker_ParseOutline"
  ft_Stroker_ParseOutline
    :: FT_Stroker     -- ^ stroker
    -> Ptr FT_Outline -- ^ outline
    -> FT_Bool        -- ^ opened
    -> IO FT_Error



foreign import ccall "FT_Stroker_Done"
  ft_Stroker_Done :: FT_Stroker -> IO ()



foreign import ccall "FT_Stroker_BeginSubPath"
  ft_Stroker_BeginSubPath
    :: FT_Stroker    -- ^ stroker
    -> Ptr FT_Vector -- ^ to
    -> FT_Bool       -- ^ open
    -> IO FT_Error



foreign import ccall "FT_Stroker_EndSubPath"
  ft_Stroker_EndSubPath
    :: FT_Stroker -- ^ stroker
    -> IO FT_Error



foreign import ccall "FT_Stroker_LineTo"
  ft_Stroker_LineTo
    :: FT_Stroker    -- ^ stroker
    -> Ptr FT_Vector -- ^ to
    -> IO FT_Error



foreign import ccall "FT_Stroker_ConicTo"
  ft_Stroker_ConicTo
    :: FT_Stroker    -- ^ stroker
    -> Ptr FT_Vector -- ^ control
    -> Ptr FT_Vector -- ^ to
    -> IO FT_Error



foreign import ccall "FT_Stroker_CubicTo"
  ft_Stroker_CubicTo
    :: FT_Stroker    -- ^ stroker
    -> Ptr FT_Vector -- ^ control1
    -> Ptr FT_Vector -- ^ control2
    -> Ptr FT_Vector -- ^ to
    -> IO FT_Error



foreign import ccall "FT_Stroker_GetBorderCounts"
  ft_Stroker_GetBorderCounts
    :: FT_Stroker       -- ^ stroker
    -> FT_StrokerBorder -- ^ border
    -> Ptr FT_UInt      -- ^ anum_points
    -> Ptr FT_UInt      -- ^ anum_contours
    -> IO FT_Error



foreign import ccall "FT_Stroker_ExportBorder"
  ft_Stroker_ExportBorder :: FT_Stroker -> FT_StrokerBorder -> Ptr FT_Outline -> IO ()



foreign import ccall "FT_Stroker_GetCounts"
  ft_Stroker_GetCounts
    :: FT_Stroker  -- ^ stroker
    -> Ptr FT_UInt -- ^ anum_points
    -> Ptr FT_UInt -- ^ anum_contours
    -> IO FT_Error



foreign import ccall "FT_Stroker_Export"
  ft_Stroker_Export
    :: FT_Stroker     -- ^ stroker
    -> Ptr FT_Outline -- ^ outline
    -> IO ()
