module Graphics.Rendering.FreeType.Internal.Module
  {-# DEPRECATED "freetype2 bindings were rewritten from scratch. Please switch to FreeType.Raw" #-}
  ( FT_ModuleRec_
  , FT_Module
  ) where

import           FreeType.Raw.Support.Module (FT_ModuleRec, FT_Module)



type FT_ModuleRec_ = FT_ModuleRec

