{-# LANGUAGE ForeignFunctionInterface, EmptyDataDecls #-}
module Graphics.Rendering.FreeType.Internal.FaceType
( FT_FaceRec_
, FT_Face
) where

import Foreign
import Foreign.Storable

#include <stddef.h>
#let alignment t = "%lu", (unsigned long)offsetof(struct {char x__; t (y__); }, y__)

#include "ft2build.h"
#include FT_FREETYPE_H

#include "internal/ftobjs.h"

data FT_FaceRec_
type FT_Face = Ptr FT_FaceRec_

instance Storable FT_FaceRec_ where
  sizeOf _    = #size struct FT_FaceRec_
  alignment _ = #alignment struct FT_FaceRec_
  peek = error "peek not implemented for FT_FaceRec_"
  poke = error "poke not implemented for FT_FaceRec_"
