module Graphics.Rendering.FreeType.Internal.FaceType
  {-# DEPRECATED "freetype2 bindings were rewritten from scratch. Please switch to Graphics.FreeType.Bindings" #-}
  ( FT_FaceRec_
  , FT_Face
  ) where

import           Graphics.FreeType.Bindings.Core.Base

type FT_FaceRec_ = FT_FaceRec
