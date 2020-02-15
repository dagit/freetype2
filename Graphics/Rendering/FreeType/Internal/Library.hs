module Graphics.Rendering.FreeType.Internal.Library
  {-# DEPRECATED "freetype2 bindings were rewritten from scratch. Please switch to FreeType.Raw" #-}
  ( FT_LibraryRec_
  , FT_Library
  ) where

import           FreeType.Raw.Core.Base (FT_LibraryRec, FT_Library)



type FT_LibraryRec_ = FT_LibraryRec
