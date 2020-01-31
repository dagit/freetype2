module Graphics.Rendering.FreeType.Internal.Vector
  {-# DEPRECATED "freetype2 bindings were rewritten from scratch. Please switch to Graphics.FreeType.Bindings" #-}
  ( FT_Vector (FT_Vector)
  , module Graphics.Rendering.FreeType.Internal.Vector
  ) where

import           Graphics.FreeType.Bindings.Core.Types (FT_Vector (..))

import           Graphics.Rendering.FreeType.Internal.PrimitiveTypes



x :: FT_Vector -> FT_Pos
x = vX

y :: FT_Vector -> FT_Pos
y = vY
