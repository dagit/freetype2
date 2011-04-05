{-# LANGUAGE ForeignFunctionInterface, EmptyDataDecls #-}
module Graphics.Rendering.FreeType.Internal.Driver
( FT_DriverRec_
, FT_Driver
) where

import Foreign
import Foreign.Storable

#include <stddef.h>
#let alignment t = "%lu", (unsigned long)offsetof(struct {char x__; t (y__); }, y__)

#include "ft2build.h"
#include FT_FREETYPE_H

#include "internal/ftobjs.h"

data FT_DriverRec_
type FT_Driver = Ptr FT_DriverRec_

instance Storable FT_DriverRec_ where
  sizeOf    _ = #size struct FT_DriverRec_
  alignment _ = #alignment struct FT_DriverRec_
  peek = error "peek not implemented for FT_DriverRec_"
  poke = error "poke not implemented for FT_DriverRec_"

