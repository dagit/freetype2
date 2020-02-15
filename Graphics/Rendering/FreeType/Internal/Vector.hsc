module Graphics.Rendering.FreeType.Internal.Vector
  {-# DEPRECATED "freetype2 bindings were rewritten from scratch. Please switch to FreeType.Raw" #-}
  ( FT_Vector (FT_Vector)
  , module Graphics.Rendering.FreeType.Internal.Vector
  ) where

import           FreeType.Raw.Core.Types (FT_Vector (..))

import           Graphics.Rendering.FreeType.Internal.PrimitiveTypes



x :: FT_Vector -> FT_Pos
x = vX

y :: FT_Vector -> FT_Pos
y = vY
