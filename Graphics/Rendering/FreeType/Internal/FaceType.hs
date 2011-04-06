{-# LANGUAGE EmptyDataDecls #-}
module Graphics.Rendering.FreeType.Internal.FaceType
( FT_FaceRec_
, FT_Face
) where

import Foreign

data FT_FaceRec_
type FT_Face = Ptr FT_FaceRec_
