module Graphics.Rendering.FreeType.Internal.Span
  {-# DEPRECATED "freetype2 bindings were rewritten from scratch. Please switch to FreeType" #-}
  ( FT_Span (FT_Span)
  , module Graphics.Rendering.FreeType.Internal.Span
  ) where

import           FreeType.Support.Scanline (FT_Span (..))

import           Foreign.C.Types



x :: FT_Span -> CShort
x = sX

len :: FT_Span -> CUShort
len = sLen

coverage :: FT_Span -> CUChar
coverage = sCoverage

