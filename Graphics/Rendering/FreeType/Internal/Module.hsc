{-# LANGUAGE ForeignFunctionInterface, EmptyDataDecls #-}
module Graphics.Rendering.FreeType.Internal.Module
( FT_ModuleRec_
, FT_Module
) where

import Foreign
import Foreign.Storable

#include <stddef.h>
#let alignment t = "%lu", (unsigned long)offsetof(struct {char x__; t (y__); }, y__)

#include "ft2build.h"
#include FT_FREETYPE_H

#include "internal/ftobjs.h"

data FT_ModuleRec_
type FT_Module = Ptr FT_ModuleRec_

instance Storable FT_ModuleRec_ where
  sizeOf    _ = #size struct FT_ModuleRec_
  alignment _ = #alignment struct FT_ModuleRec_
  peek = error "peek not implemented for FT_ModuleRec_"
  poke = error "poke not implemented for FT_ModuleRec_"

