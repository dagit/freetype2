{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}

module FreeType.Raw.Support.Glyph where

import           FreeType.Raw.Core.Base
import           FreeType.Raw.Core.Glyph
import           FreeType.Raw.Core.Types
import           FreeType.Raw.Support.Outline

import           Foreign.C.Types
import           Foreign.Ptr

#include "ft2build.h"
#include FT_FREETYPE_H

#include "freetype/ftstroke.h"

data FT_StrokerRec
type FT_Stroker = Ptr FT_StrokerRec



type FT_Stroker_LineJoin = FT_UInt

pattern FT_STROKER_LINEJOIN_ROUND
      , FT_STROKER_LINEJOIN_BEVEL
      , FT_STROKER_LINEJOIN_MITER_VARIABLE
      , FT_STROKER_LINEJOIN_MITER
      , FT_STROKER_LINEJOIN_MITER_FIXED
     :: FT_UInt
pattern FT_STROKER_LINEJOIN_ROUND          = #const FT_STROKER_LINEJOIN_ROUND
pattern FT_STROKER_LINEJOIN_BEVEL          = #const FT_STROKER_LINEJOIN_BEVEL
pattern FT_STROKER_LINEJOIN_MITER_VARIABLE = #const FT_STROKER_LINEJOIN_MITER_VARIABLE
pattern FT_STROKER_LINEJOIN_MITER          = #const FT_STROKER_LINEJOIN_MITER
pattern FT_STROKER_LINEJOIN_MITER_FIXED    = #const FT_STROKER_LINEJOIN_MITER_FIXED



type FT_Stroker_LineCap = FT_UInt

pattern FT_STROKER_LINECAP_BUTT
      , FT_STROKER_LINECAP_ROUND
      , FT_STROKER_LINECAP_SQUARE
     :: FT_UInt
pattern FT_STROKER_LINECAP_BUTT   = #const FT_STROKER_LINECAP_BUTT
pattern FT_STROKER_LINECAP_ROUND  = #const FT_STROKER_LINECAP_ROUND
pattern FT_STROKER_LINECAP_SQUARE = #const FT_STROKER_LINECAP_SQUARE



type FT_StrokerBorder = FT_UInt

pattern FT_STROKER_BORDER_LEFT
      , FT_STROKER_BORDER_RIGHT
     :: FT_UInt
pattern FT_STROKER_BORDER_LEFT  = #const FT_STROKER_BORDER_LEFT
pattern FT_STROKER_BORDER_RIGHT = #const FT_STROKER_BORDER_LEFT



foreign import ccall "FT_Outline_GetInsideBorder"
  ft_Outline_GetInsideBorder :: Ptr FT_Outline -> IO FT_StrokerBorder



foreign import ccall "FT_Outline_GetOutsideBorder"
  ft_Outline_GetOusideBorder :: Ptr FT_Outline -> IO FT_StrokerBorder



foreign import ccall "FT_Glyph_Stroke"
  ft_Glyph_Stroke :: Ptr FT_Glyph -> FT_Stroker -> FT_Bool -> IO FT_Error



foreign import ccall "FT_Glyph_StrokeBorder"
  ft_Glyph_StrokeBorder :: Ptr FT_Glyph -> FT_Stroker -> FT_Bool -> FT_Bool -> IO FT_Error



foreign import ccall "FT_Stroker_New"
  ft_Stroker_New :: FT_Library -> Ptr FT_Stroker -> IO FT_Error



foreign import ccall "FT_Stroker_Set"
  ft_Stroker_Set :: FT_Stroker -> FT_Fixed -> FT_Stroker_LineCap -> FT_Stroker_LineJoin -> FT_Fixed -> IO ()



foreign import ccall "FT_Stroker_Rewind"
  ft_Stroker_Rewind :: FT_Stroker -> IO ()



foreign import ccall "FT_Stroker_ParseOutline"
  ft_Stroker_ParseOutline :: FT_Stroker -> Ptr FT_Outline -> FT_Bool -> IO FT_Error



foreign import ccall "FT_Stroker_Done"
  ft_Stroker_Done :: FT_Stroker -> IO ()



foreign import ccall "FT_Stroker_BeginSubPath"
  ft_Stroker_BeingSubPath :: FT_Stroker -> Ptr FT_Vector -> FT_Bool -> IO FT_Error



foreign import ccall "FT_Stroker_EndSubPath"
  ft_Stroker_EndSubPath :: FT_Stroker -> IO FT_Error



foreign import ccall "FT_Stroker_LineTo"
  ft_Stroker_LineTo :: FT_Stroker -> Ptr FT_Vector -> IO FT_Error



foreign import ccall "FT_Stroker_ConicTo"
  ft_Stroker_ConicTo :: FT_Stroker -> Ptr FT_Vector -> Ptr FT_Vector -> IO FT_Error



foreign import ccall "FT_Stroker_CubicTo"
  ft_Stroker_CubicTo :: FT_Stroker -> Ptr FT_Vector -> Ptr FT_Vector -> Ptr FT_Vector -> IO FT_Error



foreign import ccall "FT_Stroker_GetBorderCounts"
  ft_Stroker_GetBorderCounts :: FT_Stroker -> FT_StrokerBorder -> Ptr FT_UInt -> Ptr FT_UInt -> IO FT_Error



foreign import ccall "FT_Stroker_ExportBorder"
  ft_Stroker_ExportBorder :: FT_Stroker -> FT_StrokerBorder -> Ptr FT_Outline -> IO ()



foreign import ccall "FT_Stroker_GetCounts"
  ft_Stroker_GetCounts :: FT_Stroker -> Ptr FT_UInt -> Ptr FT_UInt -> IO FT_Error



foreign import ccall "FT_Stroker_Export"
  ft_Stroker_Export :: FT_Stroker -> Ptr FT_Outline -> IO ()
