{-# LANGUAGE ForeignFunctionInterface, EmptyDataDecls #-}
module Graphics.Rendering.FreeType.Internal.CharMap
( FT_CharMapRec
, FT_CharMap
, face
, encoding
, platform_id
, encoding_id
) where

import Foreign

import Graphics.Rendering.FreeType.Internal.PrimitiveTypes
import Graphics.Rendering.FreeType.Internal.FaceType

#include <stddef.h>
#let alignment t = "%lu", (unsigned long)offsetof(struct {char x__; t (y__); }, y__)

#include "ft2build.h"
#include FT_FREETYPE_H

data FT_CharMapRec
type FT_CharMap = Ptr FT_CharMapRec

face :: FT_CharMap -> Ptr FT_Face
face = #ptr FT_CharMapRec, face

encoding :: FT_CharMap -> Ptr FT_Encoding
encoding = #ptr FT_CharMapRec, encoding

platform_id :: FT_CharMap -> Ptr FT_UShort
platform_id = #ptr FT_CharMapRec, platform_id

encoding_id :: FT_CharMap -> Ptr FT_UShort
encoding_id = #ptr FT_CharMapRec, encoding_id
