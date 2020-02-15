module Graphics.Rendering.FreeType.Internal.FaceType
  {-# DEPRECATED "freetype2 bindings were rewritten from scratch. Please switch to FreeType.Raw" #-}
  ( FT_FaceRec_
  , FT_Face
  ) where

import           FreeType.Raw.Core.Base

type FT_FaceRec_ = FT_FaceRec
