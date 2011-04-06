{-# LANGUAGE EmptyDataDecls #-}
module Graphics.Rendering.FreeType.Internal.Renderer
( FT_RendererRec_
, FT_Renderer
) where

import Foreign

data FT_RendererRec_
type FT_Renderer = Ptr FT_RendererRec_

