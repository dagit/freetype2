{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}

module FreeType.Support.Glyph.Internal
  ( -- ** FT_Glyph_Stroke
    ft_Glyph_Stroke'
    -- ** FT_Glyph_StrokeBorder
  , ft_Glyph_StrokeBorder'
    -- ** FT_Stroker_New
  , ft_Stroker_New'
    -- ** FT_Stroker_ParseOutline
  , ft_Stroker_ParseOutline'
    -- ** FT_Stroker_BeginSubPath
  , ft_Stroker_BeginSubPath'
    -- ** FT_Stroker_EndSubPath
  , ft_Stroker_EndSubPath'
    -- ** FT_Stroker_LineTo
  , ft_Stroker_LineTo'
    -- ** FT_Stroker_ConicTo
  , ft_Stroker_ConicTo'
    -- ** FT_Stroker_CubicTo
  , ft_Stroker_CubicTo'
    -- ** FT_Stroker_GetBorderCounts
  , ft_Stroker_GetBorderCounts'
    -- ** FT_Stroker_GetCounts
  , ft_Stroker_GetCounts'
  ) where

import           FreeType.Core.Base
import           FreeType.Core.Glyph
import           FreeType.Core.Types.Types
import           FreeType.Support.Glyph.Types
import           FreeType.Support.Outline

import           Foreign.Ptr

#include "ft2build.h"
#include FT_STROKER_H

foreign import ccall "FT_Glyph_Stroke"
  ft_Glyph_Stroke' :: Ptr FT_Glyph -> FT_Stroker -> FT_Bool -> IO FT_Error



foreign import ccall "FT_Glyph_StrokeBorder"
  ft_Glyph_StrokeBorder' :: Ptr FT_Glyph -> FT_Stroker -> FT_Bool -> FT_Bool -> IO FT_Error



foreign import ccall "FT_Stroker_New"
  ft_Stroker_New' :: FT_Library -> Ptr FT_Stroker -> IO FT_Error



foreign import ccall "FT_Stroker_ParseOutline"
  ft_Stroker_ParseOutline' :: FT_Stroker -> Ptr FT_Outline -> FT_Bool -> IO FT_Error



foreign import ccall "FT_Stroker_BeginSubPath"
  ft_Stroker_BeginSubPath' :: FT_Stroker -> Ptr FT_Vector -> FT_Bool -> IO FT_Error



foreign import ccall "FT_Stroker_EndSubPath"
  ft_Stroker_EndSubPath' :: FT_Stroker -> IO FT_Error



foreign import ccall "FT_Stroker_LineTo"
  ft_Stroker_LineTo' :: FT_Stroker -> Ptr FT_Vector -> IO FT_Error



foreign import ccall "FT_Stroker_ConicTo"
  ft_Stroker_ConicTo' :: FT_Stroker -> Ptr FT_Vector -> Ptr FT_Vector -> IO FT_Error



foreign import ccall "FT_Stroker_CubicTo"
  ft_Stroker_CubicTo' :: FT_Stroker -> Ptr FT_Vector -> Ptr FT_Vector -> Ptr FT_Vector -> IO FT_Error



foreign import ccall "FT_Stroker_GetBorderCounts"
  ft_Stroker_GetBorderCounts' :: FT_Stroker -> FT_StrokerBorder -> Ptr FT_UInt -> Ptr FT_UInt -> IO FT_Error



foreign import ccall "FT_Stroker_GetCounts"
  ft_Stroker_GetCounts' :: FT_Stroker -> Ptr FT_UInt -> Ptr FT_UInt -> IO FT_Error
