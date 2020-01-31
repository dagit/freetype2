module Graphics.Rendering.FreeType.Internal.Module
  {-# DEPRECATED "freetype2 bindings were rewritten from scratch. Please switch to Graphics.FreeType.Bindings" #-}
  ( FT_ModuleRec_
  , FT_Module
  ) where

import           Graphics.FreeType.Bindings.Support.Module (FT_ModuleRec, FT_Module)



type FT_ModuleRec_ = FT_ModuleRec

