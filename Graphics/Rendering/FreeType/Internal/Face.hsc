{-# LANGUAGE ForeignFunctionInterface, EmptyDataDecls #-}
module Graphics.Rendering.FreeType.Internal.Face
( FT_FaceRec_
, FT_Face
, num_faces
, num_glyphs
, glyph
, underline_thickness
) where

import Foreign
import Foreign.Storable

import Graphics.Rendering.FreeType.Internal.PrimitiveTypes
import qualified Graphics.Rendering.FreeType.Internal.GlyphSlot as GS

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

num_faces :: FT_Face -> Ptr FT_Long
num_faces = #ptr struct FT_FaceRec_, num_faces

num_glyphs :: FT_Face -> Ptr FT_Long
num_glyphs = #ptr struct FT_FaceRec_, num_glyphs

glyph :: FT_Face -> Ptr GS.FT_GlyphSlot
glyph = #ptr struct FT_FaceRec_, glyph

underline_thickness :: FT_Face -> Ptr FT_Short
underline_thickness = #ptr struct FT_FaceRec_, underline_thickness

