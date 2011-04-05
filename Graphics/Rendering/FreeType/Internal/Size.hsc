{-# LANGUAGE ForeignFunctionInterface, EmptyDataDecls #-}
module Graphics.Rendering.FreeType.Internal.Size
( FT_SizeRec_
, FT_Size
, face
, generic
, metrics
) where

import Foreign
import Foreign.Storable

import Graphics.Rendering.FreeType.Internal.FaceType
import Graphics.Rendering.FreeType.Internal.SizeMetrics
import Graphics.Rendering.FreeType.Internal.Generic

#include <stddef.h>
#let alignment t = "%lu", (unsigned long)offsetof(struct {char x__; t (y__); }, y__)

#include "ft2build.h"
#include FT_FREETYPE_H

#include "internal/ftobjs.h"

data FT_SizeRec_
type FT_Size = Ptr FT_SizeRec_

instance Storable FT_SizeRec_ where
  sizeOf _ = #size struct FT_SizeRec_
  alignment _ = #alignment struct FT_SizeRec_
  peek = error "peek not implemented for FT_SizeRec_"
  poke = error "poke not implemented for FT_SizeRec_"

face :: FT_Size -> Ptr FT_Face
face = #ptr struct FT_SizeRec_, face

generic :: FT_Size -> Ptr FT_Generic
generic = #ptr struct FT_SizeRec_, generic

metrics :: FT_Size -> Ptr FT_Size_Metrics
metrics = #ptr struct FT_SizeRec_, metrics

