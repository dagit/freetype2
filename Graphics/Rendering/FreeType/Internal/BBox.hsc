module Graphics.Rendering.FreeType.Internal.BBox
  {-# DEPRECATED "freetype2 bindings were rewritten from scratch. Please switch to FreeType" #-}
  ( FT_BBox (FT_BBox)
  , module Graphics.Rendering.FreeType.Internal.BBox
  ) where

import           FreeType.Core.Types (FT_BBox (..))

import           Graphics.Rendering.FreeType.Internal.PrimitiveTypes



xMin :: FT_BBox -> FT_Pos
xMin = bbXMin

yMin :: FT_BBox -> FT_Pos
yMin = bbYMin

xMax :: FT_BBox -> FT_Pos
xMax = bbXMax

yMax :: FT_BBox -> FT_Pos
yMax = bbYMax
