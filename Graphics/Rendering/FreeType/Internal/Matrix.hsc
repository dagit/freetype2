module Graphics.Rendering.FreeType.Internal.Matrix
  {-# DEPRECATED "freetype2 bindings were rewritten from scratch. Please switch to FreeType.Raw" #-}
  ( FT_Matrix (FT_Matrix)
  , module Graphics.Rendering.FreeType.Internal.Matrix
  ) where

import           FreeType.Raw.Core.Types (FT_Matrix (..))

import           Graphics.Rendering.FreeType.Internal.PrimitiveTypes



xx :: FT_Matrix -> FT_Fixed
xx = mXx

xy :: FT_Matrix -> FT_Fixed
xy = mXy

yx :: FT_Matrix -> FT_Fixed
yx = mYx

yy :: FT_Matrix -> FT_Fixed
yy = mYy
