{-# LANGUAGE ForeignFunctionInterface, EmptyDataDecls #-}
module Graphics.Rendering.FreeType.Internal.CharMap
  {-# DEPRECATED "freetype2 bindings were rewritten from scratch. Please switch to FreeType.Raw" #-}
  ( FT_CharMapRec
  , FT_CharMap
  , face
  , encoding
  , platform_id
  , encoding_id
  ) where

import           FreeType.Raw.Core.Base (FT_CharMapRec, FT_CharMap)

import           Graphics.Rendering.FreeType.Internal.PrimitiveTypes
import           Graphics.Rendering.FreeType.Internal.FaceType

import           Foreign

#include "ft2build.h"
#include FT_FREETYPE_H



face :: FT_CharMap -> Ptr FT_Face
face = #ptr FT_CharMapRec, face

encoding :: FT_CharMap -> Ptr FT_Encoding
encoding = #ptr FT_CharMapRec, encoding

platform_id :: FT_CharMap -> Ptr FT_UShort
platform_id = #ptr FT_CharMapRec, platform_id

encoding_id :: FT_CharMap -> Ptr FT_UShort
encoding_id = #ptr FT_CharMapRec, encoding_id
