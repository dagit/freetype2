{-# LANGUAGE ForeignFunctionInterface #-}
module Graphics.Rendering.FreeType.Internal.Face
( FT_FaceRec_
, FT_Face
, num_faces
, face_index
, face_flags
, style_flags
, num_glyphs
, family_name
, style_name
, num_fixed_sizes
, available_sizes
, num_charmaps
, charmaps
, generic
, bbox
, units_per_EM
, ascender
, descender
, height
, max_advance_width
, max_advance_height
, underline_position
, underline_thickness
, glyph
, size
, charmap
, ft_HAS_HORIZONTAL
, ft_HAS_VERTICAL
, ft_HAS_KERNING
, ft_IS_SCALABLE
, ft_IS_SFNT
, ft_IS_FIXED_WIDTH
, ft_HAS_FIXED_SIZES
, ft_HAS_FAST_GLYPHS
, ft_HAS_GLYPH_NAMES
, ft_HAS_MULTIPLE_MASTERS
, ft_IS_CID_KEYED
, ft_IS_TRICKY
, ft_STYLE_FLAG_ITALIC
, ft_STYLE_FLAG_BOLD
) where

import Foreign
import Foreign.C.String

import Graphics.Rendering.FreeType.Internal.FaceType
import Graphics.Rendering.FreeType.Internal.PrimitiveTypes
import qualified Graphics.Rendering.FreeType.Internal.Generic as G
import qualified Graphics.Rendering.FreeType.Internal.GlyphSlot as GS
import qualified Graphics.Rendering.FreeType.Internal.Size as S
import qualified Graphics.Rendering.FreeType.Internal.BitmapSize as BS
import qualified Graphics.Rendering.FreeType.Internal.CharMap as CM
import qualified Graphics.Rendering.FreeType.Internal.BBox as BB

#include "ft2build.h"
#include FT_FREETYPE_H

num_faces :: FT_Face -> Ptr FT_Long
num_faces = #ptr struct FT_FaceRec_, num_faces

face_index :: FT_Face -> Ptr FT_Long
face_index = #ptr struct FT_FaceRec_, face_index

face_flags :: FT_Face -> Ptr FT_Long
face_flags = #ptr struct FT_FaceRec_, face_flags

style_flags :: FT_Face -> Ptr FT_Long
style_flags = #ptr struct FT_FaceRec_, style_flags

num_glyphs :: FT_Face -> Ptr FT_Long
num_glyphs = #ptr struct FT_FaceRec_, num_glyphs

family_name :: FT_Face -> Ptr CString
family_name = #ptr struct FT_FaceRec_, family_name

style_name :: FT_Face -> Ptr CString
style_name = #ptr struct FT_FaceRec_, style_name

num_fixed_sizes :: FT_Face -> Ptr FT_Int
num_fixed_sizes = #ptr struct FT_FaceRec_, num_fixed_sizes

available_sizes :: FT_Face -> Ptr (Ptr BS.FT_Bitmap_Size)
available_sizes = #ptr struct FT_FaceRec_, available_sizes

num_charmaps :: FT_Face -> Ptr FT_Int
num_charmaps = #ptr struct FT_FaceRec_, num_charmaps

charmaps :: FT_Face -> Ptr (Ptr CM.FT_CharMap)
charmaps = #ptr struct FT_FaceRec_, charmaps

generic :: FT_Face -> Ptr G.FT_Generic
generic = #ptr struct FT_FaceRec_, generic

bbox :: FT_Face -> Ptr BB.FT_BBox
bbox = #ptr struct FT_FaceRec_, bbox

units_per_EM :: FT_Face -> Ptr FT_UShort
units_per_EM = #ptr struct FT_FaceRec_, units_per_EM

ascender :: FT_Face -> Ptr FT_Short
ascender = #ptr struct FT_FaceRec_, ascender

descender :: FT_Face -> Ptr FT_Short
descender = #ptr struct FT_FaceRec_, descender

height :: FT_Face -> Ptr FT_Short
height = #ptr struct FT_FaceRec_, height

max_advance_width :: FT_Face -> Ptr FT_Short
max_advance_width = #ptr struct FT_FaceRec_, max_advance_width

max_advance_height :: FT_Face -> Ptr FT_Short
max_advance_height = #ptr struct FT_FaceRec_, max_advance_height

underline_position :: FT_Face -> Ptr FT_Short
underline_position = #ptr struct FT_FaceRec_, underline_position

underline_thickness :: FT_Face -> Ptr FT_Short
underline_thickness = #ptr struct FT_FaceRec_, underline_thickness

glyph :: FT_Face -> Ptr GS.FT_GlyphSlot
glyph = #ptr struct FT_FaceRec_, glyph

size :: FT_Face -> Ptr S.FT_Size
size = #ptr struct FT_FaceRec_, size

charmap :: FT_Face -> Ptr CM.FT_CharMap
charmap = #ptr struct FT_FaceRec_, charmap

ft_HAS :: FT_FACE_FLAG -> FT_Face -> IO Bool
ft_HAS flag face = do
  f <- peek $ face_flags face
  return $ 0 /= (f .&. fromIntegral flag)

ft_HAS_HORIZONTAL :: FT_Face -> IO Bool
ft_HAS_HORIZONTAL = ft_HAS ft_FACE_FLAG_HORIZONTAL

ft_HAS_VERTICAL :: FT_Face -> IO Bool
ft_HAS_VERTICAL = ft_HAS ft_FACE_FLAG_VERTICAL

ft_HAS_KERNING :: FT_Face -> IO Bool
ft_HAS_KERNING = ft_HAS ft_FACE_FLAG_KERNING

ft_IS_SCALABLE :: FT_Face -> IO Bool
ft_IS_SCALABLE = ft_HAS ft_FACE_FLAG_SCALABLE

ft_IS_SFNT :: FT_Face -> IO Bool
ft_IS_SFNT = ft_HAS ft_FACE_FLAG_SFNT

ft_IS_FIXED_WIDTH :: FT_Face -> IO Bool
ft_IS_FIXED_WIDTH = ft_HAS ft_FACE_FLAG_FIXED_WIDTH

ft_HAS_FIXED_SIZES :: FT_Face -> IO Bool
ft_HAS_FIXED_SIZES = ft_HAS ft_FACE_FLAG_FIXED_SIZES

ft_HAS_FAST_GLYPHS :: FT_Face -> IO Bool
ft_HAS_FAST_GLYPHS = ft_HAS ft_FACE_FLAG_FAST_GLYPHS

ft_HAS_GLYPH_NAMES :: FT_Face -> IO Bool
ft_HAS_GLYPH_NAMES = ft_HAS ft_FACE_FLAG_GLYPH_NAMES

ft_HAS_MULTIPLE_MASTERS :: FT_Face -> IO Bool
ft_HAS_MULTIPLE_MASTERS = ft_HAS ft_FACE_FLAG_MULTIPLE_MASTERS

ft_IS_CID_KEYED :: FT_Face -> IO Bool
ft_IS_CID_KEYED = ft_HAS ft_FACE_FLAG_CID_KEYED

ft_IS_TRICKY :: FT_Face -> IO Bool
ft_IS_TRICKY = ft_HAS ft_FACE_FLAG_TRICKY

ft_STYLE_FLAG_ITALIC :: FT_Long
ft_STYLE_FLAG_ITALIC = #const FT_STYLE_FLAG_ITALIC

ft_STYLE_FLAG_BOLD :: FT_Long
ft_STYLE_FLAG_BOLD = #const FT_STYLE_FLAG_BOLD 
