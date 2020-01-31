module Graphics.Rendering.FreeType.Internal.Renderer
  {-# DEPRECATED "freetype2 bindings were rewritten from scratch. Please switch to Graphics.FreeType.Bindings" #-}
  ( FT_RendererRec_
  , FT_Renderer
  ) where

import           Graphics.FreeType.Bindings.Support.Module (FT_RendererRec, FT_Renderer)



type FT_RendererRec_ = FT_RendererRec
