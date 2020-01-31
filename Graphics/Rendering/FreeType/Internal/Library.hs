module Graphics.Rendering.FreeType.Internal.Library
  {-# DEPRECATED "freetype2 bindings were rewritten from scratch. Please switch to Graphics.FreeType.Bindings" #-}
  ( FT_LibraryRec_
  , FT_Library
  ) where

import           Graphics.FreeType.Bindings.Core.Base (FT_LibraryRec, FT_Library)



type FT_LibraryRec_ = FT_LibraryRec
