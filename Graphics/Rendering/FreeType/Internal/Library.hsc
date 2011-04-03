{-# LANGUAGE ForeignFunctionInterface, EmptyDataDecls #-}
module Graphics.Rendering.FreeType.Internal.Library
( FT_LibraryRec_
, FT_Library
) where

import Foreign
import Foreign.Storable

#include <stddef.h>
#let alignment t = "%lu", (unsigned long)offsetof(struct {char x__; t (y__); }, y__)

#include "ft2build.h"
#include FT_FREETYPE_H

#include "internal/ftobjs.h"

data FT_LibraryRec_
type FT_Library = Ptr FT_LibraryRec_

instance Storable FT_LibraryRec_ where
  sizeOf _    = #size struct FT_LibraryRec_
  alignment _ = #alignment struct FT_LibraryRec_
  peek = error "peek not implemented for FT_LibraryRec_"
  poke = error "poke not implemented for FT_LibraryRec_"

