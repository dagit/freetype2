{-# LANGUAGE EmptyDataDecls #-}
module Graphics.Rendering.FreeType.Internal.SubGlyph
( FT_SubGlyphRec_
, FT_SubGlyph
) where

import Foreign

data FT_SubGlyphRec_
type FT_SubGlyph = Ptr FT_SubGlyphRec_
