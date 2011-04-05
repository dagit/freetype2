{-# LANGUAGE ForeignFunctionInterface, EmptyDataDecls #-}
module Graphics.Rendering.FreeType.Internal.Renderer
( FT_RendererRec_
, FT_Renderer
) where

import Foreign
import Foreign.Storable

#include <stddef.h>
#let alignment t = "%lu", (unsigned long)offsetof(struct {char x__; t (y__); }, y__)

#include "ft2build.h"
#include FT_FREETYPE_H

#include "internal/ftobjs.h"

data FT_RendererRec_
type FT_Renderer = Ptr FT_RendererRec_

instance Storable FT_RendererRec_ where
  sizeOf    _ = #size struct FT_RendererRec_
  alignment _ = #alignment struct FT_RendererRec_
  peek = error "peek not implemented for FT_RendererRec_"
  poke = error "poke not implemented for FT_RendererRec_"

