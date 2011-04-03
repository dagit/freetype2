{-# LANGUAGE ForeignFunctionInterface, EmptyDataDecls #-}
module Graphics.Rendering.FreeType.Internal.GlyphSlot
( FT_GlyphSlotRec_
, FT_GlyphSlot
, library
, advance
) where

import Foreign
import Foreign.Storable

-- import Graphics.Rendering.FreeType.Internal.PrimitiveTypes
import qualified Graphics.Rendering.FreeType.Internal.Library as Lib
import qualified Graphics.Rendering.FreeType.Internal.Vector  as V

#include <stddef.h>
#let alignment t = "%lu", (unsigned long)offsetof(struct {char x__; t (y__); }, y__)

#include "ft2build.h"
#include FT_FREETYPE_H

#include "internal/ftobjs.h"

data FT_GlyphSlotRec_
type FT_GlyphSlot = Ptr FT_GlyphSlotRec_

instance Storable FT_GlyphSlotRec_ where
  sizeOf _    = #size struct FT_GlyphSlotRec_
  alignment _ = #alignment struct FT_GlyphSlotRec_
  peek = error "peek not implemented for FT_GlyphSlotRec_"
  poke = error "poke not implemented for FT_GlyphSlotRec_"

library :: FT_GlyphSlot -> Lib.FT_Library
library = (#ptr struct FT_GlyphSlotRec_, library)

advance :: FT_GlyphSlot -> Ptr V.FT_Vector
advance = (#ptr struct FT_GlyphSlotRec_, advance)

