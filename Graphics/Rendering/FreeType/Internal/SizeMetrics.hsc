module Graphics.Rendering.FreeType.Internal.SizeMetrics
  {-# DEPRECATED "freetype2 bindings were rewritten from scratch. Please switch to FreeType" #-}
  ( FT_Size_Metrics (FT_Size_Metrics)
  , module Graphics.Rendering.FreeType.Internal.SizeMetrics
  ) where

import           FreeType.Core.Base (FT_Size_Metrics (..))

import           Graphics.Rendering.FreeType.Internal.PrimitiveTypes



x_ppem :: FT_Size_Metrics -> FT_UShort
x_ppem = smX_ppem

y_ppem :: FT_Size_Metrics -> FT_UShort
y_ppem = smY_ppem

x_scale :: FT_Size_Metrics -> FT_Fixed
x_scale = smX_scale

y_scale :: FT_Size_Metrics -> FT_Fixed
y_scale = smY_scale

ascender :: FT_Size_Metrics -> FT_Pos
ascender = smAscender

descender :: FT_Size_Metrics -> FT_Pos
descender = smDescender

height :: FT_Size_Metrics -> FT_Pos
height = smHeight

max_advance :: FT_Size_Metrics -> FT_Pos
max_advance = smMax_advance
