{-# LANGUAGE EmptyDataDecls #-}
module Graphics.Rendering.FreeType.Internal.Library
( FT_LibraryRec_
, FT_Library
) where

import Foreign

data FT_LibraryRec_
type FT_Library = Ptr FT_LibraryRec_

