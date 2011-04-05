{-# LANGUAGE ForeignFunctionInterface, EmptyDataDecls #-}
module Graphics.Rendering.FreeType.Internal.GlyphSlot
( FT_GlyphSlotRec_
, FT_GlyphSlot
, library
, face
, next
, generic
, metrics
, linearHoriAdvance
, linearVertAdvance
, advance
-- , format
, bitmap
, bitmap_top
, bitmap_left
-- , outline
, num_subglyphs
, subglyphs
, control_data
, control_len
, lsb_delta
, rsb_delta
) where

import Foreign
import Foreign.C.Types
import Foreign.Storable

import Graphics.Rendering.FreeType.Internal.PrimitiveTypes
import qualified Graphics.Rendering.FreeType.Internal.Generic as G
import qualified Graphics.Rendering.FreeType.Internal.Library as L
import qualified Graphics.Rendering.FreeType.Internal.FaceType as F
import qualified Graphics.Rendering.FreeType.Internal.Vector  as V
import qualified Graphics.Rendering.FreeType.Internal.Bitmap as B
import qualified Graphics.Rendering.FreeType.Internal.SubGlyph as SG
import qualified Graphics.Rendering.FreeType.Internal.GlyphMetrics as GM

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

library :: FT_GlyphSlot -> Ptr L.FT_Library
library = #ptr struct FT_GlyphSlotRec_, library

face :: FT_GlyphSlot -> Ptr F.FT_Face
face = #ptr struct FT_GlyphSlotRec_, face

next :: FT_GlyphSlot -> Ptr FT_GlyphSlot
next = #ptr struct FT_GlyphSlotRec_, next

generic :: FT_GlyphSlot -> Ptr G.FT_Generic
generic = #ptr struct FT_GlyphSlotRec_, generic

metrics :: FT_GlyphSlot -> Ptr GM.FT_Glyph_Metrics
metrics = #ptr struct FT_GlyphSlotRec_, metrics

linearHoriAdvance :: FT_GlyphSlot -> Ptr FT_Fixed
linearHoriAdvance = #ptr struct FT_GlyphSlotRec_, linearHoriAdvance

linearVertAdvance :: FT_GlyphSlot -> Ptr FT_Fixed
linearVertAdvance = #ptr struct FT_GlyphSlotRec_, linearVertAdvance

advance :: FT_GlyphSlot -> Ptr V.FT_Vector
advance = #ptr struct FT_GlyphSlotRec_, advance

{- TODO: implement FT_Glyph_Format
format :: FT_GlyphSlot -> Ptr FT_Glyph_Format
format = #ptr struct FT_Glyph_Format, format
-}

bitmap :: FT_GlyphSlot -> Ptr B.FT_Bitmap
bitmap = #ptr struct FT_GlyphSlotRec_, bitmap

bitmap_left :: FT_GlyphSlot -> Ptr FT_Int
bitmap_left = #ptr struct FT_GlyphSlotRec_, bitmap_left

bitmap_top :: FT_GlyphSlot -> Ptr FT_Int
bitmap_top = #ptr struct FT_GlyphSlotRec_, bitmap_top

{- TODO: implement FT_Outline
outline :: FT_GlyphSlot -> Ptr FT_Outline
outline = #ptr struct FT_GlyphSlotRec_, outline
-}

num_subglyphs :: FT_GlyphSlot -> Ptr FT_UInt
num_subglyphs = #ptr struct FT_GlyphSlotRec_, num_subglyphs

subglyphs :: FT_GlyphSlot -> Ptr SG.FT_SubGlyph
subglyphs = #ptr struct FT_GlyphSlotRec_, subglyphs

control_data :: FT_GlyphSlot -> Ptr a
control_data = #ptr struct FT_GlyphSlotRec_, control_data

control_len :: FT_GlyphSlot -> Ptr CLong
control_len = #ptr struct FT_GlyphSlotRec_, control_len

lsb_delta :: FT_GlyphSlot -> Ptr FT_Pos
lsb_delta = #ptr struct FT_GlyphSlotRec_, lsb_delta

rsb_delta :: FT_GlyphSlot -> Ptr FT_Pos
rsb_delta = #ptr struct FT_GlyphSlotRec_, rsb_delta

