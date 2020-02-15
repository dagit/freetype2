module Graphics.Rendering.FreeType.Internal.Renderer
  {-# DEPRECATED "freetype2 bindings were rewritten from scratch. Please switch to FreeType.Raw" #-}
  ( FT_RendererRec_
  , FT_Renderer
  ) where

import           FreeType.Raw.Support.Module (FT_RendererRec, FT_Renderer)



type FT_RendererRec_ = FT_RendererRec
