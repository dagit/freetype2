{-# LANGUAGE ForeignFunctionInterface, EmptyDataDecls #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
module Graphics.Rendering.FreeType.Internal.PrimitiveTypes
  {-# DEPRECATED "freetype2 bindings were rewritten from scratch. Please switch to FreeType" #-}
  where

import           FreeType.Core.Types hiding ( FT_Byte, FT_UShort, FT_Int, FT_Int32
                                                , FT_UInt, FT_UInt32, FT_Glyph_Format
                                                )
import           FreeType.Core.Base hiding (FT_Size_Request_Type, FT_Encoding, FT_Render_Mode)
import           FreeType.Core.Version
import           FreeType.Support.Outline hiding (FT_Orientation)

import Foreign
import Foreign.C.Types

#include "ft2build.h"
#include FT_FREETYPE_H

ft_LOAD_DEFAULT
  , ft_LOAD_NO_SCALE
  , ft_LOAD_NO_HINTING
  , ft_LOAD_RENDER
  , ft_LOAD_NO_BITMAP
  , ft_LOAD_VERTICAL_LAYOUT
  , ft_LOAD_FORCE_AUTOHINT
  , ft_LOAD_CROP_BITMAP
  , ft_LOAD_PEDANTIC
  , ft_LOAD_IGNORE_GLOBAL_ADVANCE_WIDTH
  , ft_LOAD_NO_RECURSE
  , ft_LOAD_IGNORE_TRANSFORM
  , ft_LOAD_MONOCHROME
  , ft_LOAD_LINEAR_DESIGN
  , ft_LOAD_NO_AUTOHINT
 :: FT_Int32
ft_LOAD_DEFAULT                     = fromIntegral FT_LOAD_DEFAULT
ft_LOAD_NO_SCALE                    = fromIntegral FT_LOAD_NO_SCALE
ft_LOAD_NO_HINTING                  = fromIntegral FT_LOAD_NO_HINTING
ft_LOAD_RENDER                      = fromIntegral FT_LOAD_RENDER
ft_LOAD_NO_BITMAP                   = fromIntegral FT_LOAD_NO_BITMAP
ft_LOAD_VERTICAL_LAYOUT             = fromIntegral FT_LOAD_VERTICAL_LAYOUT
ft_LOAD_FORCE_AUTOHINT              = fromIntegral FT_LOAD_FORCE_AUTOHINT
ft_LOAD_CROP_BITMAP                 = fromIntegral FT_LOAD_CROP_BITMAP
ft_LOAD_PEDANTIC                    = fromIntegral FT_LOAD_PEDANTIC
ft_LOAD_IGNORE_GLOBAL_ADVANCE_WIDTH = fromIntegral FT_LOAD_IGNORE_GLOBAL_ADVANCE_WIDTH
ft_LOAD_NO_RECURSE                  = fromIntegral FT_LOAD_NO_RECURSE
ft_LOAD_IGNORE_TRANSFORM            = fromIntegral FT_LOAD_IGNORE_TRANSFORM
ft_LOAD_MONOCHROME                  = fromIntegral FT_LOAD_MONOCHROME
ft_LOAD_LINEAR_DESIGN               = fromIntegral FT_LOAD_LINEAR_DESIGN
ft_LOAD_NO_AUTOHINT                 = fromIntegral FT_LOAD_NO_AUTOHINT



type FT_Byte    = CUChar
type FT_Bytes   = Ptr FT_Byte
type FT_Char    = CChar
type FT_Int     = CInt
type FT_UInt    = CUInt
type FT_Int16   = CShort
type FT_UInt16  = CUShort
type FT_Int32   = Int32
type FT_UInt32  = Word32
type FT_Short   = CShort
type FT_UShort  = CUShort
type FT_Long    = CLong
type FT_ULong   = CULong
type FT_Bool    = CUChar
type FT_Offset  = #type size_t
type FT_Error   = CInt
type FT_F26Dot6 = CLong
type FT_Fixed   = CLong
type FT_Pos     = CLong
type FT_Pointer = Ptr ()


newtype FT_Render_Mode = FT_Render_Mode CUInt
  deriving (Eq, Show, Real, Ord, Enum, Num, Integral, Storable)

ft_RENDER_MODE_NORMAL
  , ft_RENDER_MODE_LIGHT
  , ft_RENDER_MODE_MONO
  , ft_RENDER_MODE_LCD
  , ft_RENDER_MODE_LCD_V
 :: FT_Render_Mode
ft_RENDER_MODE_NORMAL = FT_Render_Mode $ fromIntegral FT_RENDER_MODE_NORMAL
ft_RENDER_MODE_LIGHT  = FT_Render_Mode $ fromIntegral FT_RENDER_MODE_LIGHT
ft_RENDER_MODE_MONO   = FT_Render_Mode $ fromIntegral FT_RENDER_MODE_MONO
ft_RENDER_MODE_LCD    = FT_Render_Mode $ fromIntegral FT_RENDER_MODE_LCD
ft_RENDER_MODE_LCD_V  = FT_Render_Mode $ fromIntegral FT_RENDER_MODE_LCD_V



fREETYPE_MAJOR
  , fREETYPE_MINOR
  , fREETYPE_PATCH
 :: FT_Int
fREETYPE_MAJOR = fromIntegral FREETYPE_MAJOR
fREETYPE_MINOR = fromIntegral FREETYPE_MINOR
fREETYPE_PATCH = fromIntegral FREETYPE_PATCH



newtype FT_Encoding = FT_Encoding FT_UInt32
  deriving (Eq, Show, Real, Ord, Enum, Num, Integral, Storable)
ft_ENCODING_NONE
  , ft_ENCODING_MS_SYMBOL
  , ft_ENCODING_UNICODE
  , ft_ENCODING_SJIS
  , ft_ENCODING_GB2312
  , ft_ENCODING_BIG5
  , ft_ENCODING_WANSUNG
  , ft_ENCODING_JOHAB
  , ft_ENCODING_MS_SJIS
  , ft_ENCODING_MS_GB2312
  , ft_ENCODING_MS_BIG5
  , ft_ENCODING_MS_WANSUNG
  , ft_ENCODING_MS_JOHAB
  , ft_ENCODING_ADOBE_STANDARD
  , ft_ENCODING_ADOBE_EXPERT
  , ft_ENCODING_ADOBE_CUSTOM
  , ft_ENCODING_ADOBE_LATIN_1
  , ft_ENCODING_OLD_LATIN_2
  , ft_ENCODING_APPLE_ROMAN
 :: FT_Encoding
ft_ENCODING_NONE           = FT_Encoding $ fromIntegral FT_ENCODING_NONE
ft_ENCODING_MS_SYMBOL      = FT_Encoding $ fromIntegral FT_ENCODING_MS_SYMBOL
ft_ENCODING_UNICODE        = FT_Encoding $ fromIntegral FT_ENCODING_UNICODE
ft_ENCODING_SJIS           = FT_Encoding $ fromIntegral FT_ENCODING_SJIS
ft_ENCODING_GB2312         = FT_Encoding $ fromIntegral FT_ENCODING_GB2312
ft_ENCODING_BIG5           = FT_Encoding $ fromIntegral FT_ENCODING_BIG5
ft_ENCODING_WANSUNG        = FT_Encoding $ fromIntegral FT_ENCODING_WANSUNG
ft_ENCODING_JOHAB          = FT_Encoding $ fromIntegral FT_ENCODING_JOHAB
ft_ENCODING_MS_SJIS        = FT_Encoding $ fromIntegral FT_ENCODING_MS_SJIS
ft_ENCODING_MS_GB2312      = FT_Encoding $ fromIntegral FT_ENCODING_MS_GB2312
ft_ENCODING_MS_BIG5        = FT_Encoding $ fromIntegral FT_ENCODING_MS_BIG5
ft_ENCODING_MS_WANSUNG     = FT_Encoding $ fromIntegral FT_ENCODING_MS_WANSUNG
ft_ENCODING_MS_JOHAB       = FT_Encoding $ fromIntegral FT_ENCODING_MS_JOHAB
ft_ENCODING_ADOBE_STANDARD = FT_Encoding $ fromIntegral FT_ENCODING_ADOBE_STANDARD
ft_ENCODING_ADOBE_EXPERT   = FT_Encoding $ fromIntegral FT_ENCODING_ADOBE_EXPERT
ft_ENCODING_ADOBE_CUSTOM   = FT_Encoding $ fromIntegral FT_ENCODING_ADOBE_CUSTOM
ft_ENCODING_ADOBE_LATIN_1  = FT_Encoding $ fromIntegral FT_ENCODING_ADOBE_LATIN_1
ft_ENCODING_OLD_LATIN_2    = FT_Encoding $ fromIntegral FT_ENCODING_OLD_LATIN_2
ft_ENCODING_APPLE_ROMAN    = FT_Encoding $ fromIntegral FT_ENCODING_APPLE_ROMAN



newtype FT_FACE_FLAG = FT_FACE_FLAG FT_Int
  deriving (Eq, Show, Real, Ord, Enum, Num, Integral, Storable)

ft_FACE_FLAG_SCALABLE
  , ft_FACE_FLAG_FIXED_SIZES
  , ft_FACE_FLAG_FIXED_WIDTH
  , ft_FACE_FLAG_SFNT
  , ft_FACE_FLAG_HORIZONTAL
  , ft_FACE_FLAG_VERTICAL
  , ft_FACE_FLAG_KERNING
  , ft_FACE_FLAG_FAST_GLYPHS
  , ft_FACE_FLAG_MULTIPLE_MASTERS
  , ft_FACE_FLAG_GLYPH_NAMES
  , ft_FACE_FLAG_EXTERNAL_STREAM
  , ft_FACE_FLAG_HINTER
  , ft_FACE_FLAG_CID_KEYED
  , ft_FACE_FLAG_TRICKY
 :: FT_FACE_FLAG
ft_FACE_FLAG_SCALABLE          = FT_FACE_FLAG $ fromIntegral FT_FACE_FLAG_SCALABLE
ft_FACE_FLAG_FIXED_SIZES       = FT_FACE_FLAG $ fromIntegral FT_FACE_FLAG_FIXED_SIZES
ft_FACE_FLAG_FIXED_WIDTH       = FT_FACE_FLAG $ fromIntegral FT_FACE_FLAG_FIXED_WIDTH
ft_FACE_FLAG_SFNT              = FT_FACE_FLAG $ fromIntegral FT_FACE_FLAG_SFNT
ft_FACE_FLAG_HORIZONTAL        = FT_FACE_FLAG $ fromIntegral FT_FACE_FLAG_HORIZONTAL
ft_FACE_FLAG_VERTICAL          = FT_FACE_FLAG $ fromIntegral FT_FACE_FLAG_VERTICAL
ft_FACE_FLAG_KERNING           = FT_FACE_FLAG $ fromIntegral FT_FACE_FLAG_KERNING
ft_FACE_FLAG_FAST_GLYPHS       = FT_FACE_FLAG $ fromIntegral FT_FACE_FLAG_FAST_GLYPHS
ft_FACE_FLAG_MULTIPLE_MASTERS  = FT_FACE_FLAG $ fromIntegral FT_FACE_FLAG_MULTIPLE_MASTERS
ft_FACE_FLAG_GLYPH_NAMES       = FT_FACE_FLAG $ fromIntegral FT_FACE_FLAG_GLYPH_NAMES
ft_FACE_FLAG_EXTERNAL_STREAM   = FT_FACE_FLAG $ fromIntegral FT_FACE_FLAG_EXTERNAL_STREAM
ft_FACE_FLAG_HINTER            = FT_FACE_FLAG $ fromIntegral FT_FACE_FLAG_HINTER
ft_FACE_FLAG_CID_KEYED         = FT_FACE_FLAG $ fromIntegral FT_FACE_FLAG_CID_KEYED
ft_FACE_FLAG_TRICKY            = FT_FACE_FLAG $ fromIntegral FT_FACE_FLAG_TRICKY



newtype FT_OPEN = FT_OPEN FT_UInt
  deriving (Eq, Show, Real, Ord, Enum, Num, Integral, Storable)

ft_OPEN_MEMORY
  , ft_OPEN_STREAM
  , ft_OPEN_PATHNAME
  , ft_OPEN_DRIVER
  , ft_OPEN_PARAMS
 :: FT_OPEN
ft_OPEN_MEMORY   = FT_OPEN $ fromIntegral FT_OPEN_MEMORY
ft_OPEN_STREAM   = FT_OPEN $ fromIntegral FT_OPEN_STREAM
ft_OPEN_PATHNAME = FT_OPEN $ fromIntegral FT_OPEN_PATHNAME
ft_OPEN_DRIVER   = FT_OPEN $ fromIntegral FT_OPEN_DRIVER
ft_OPEN_PARAMS   = FT_OPEN $ fromIntegral FT_OPEN_PARAMS



newtype FT_Size_Request_Type = FT_Size_Request_Type FT_UInt
  deriving (Eq, Show, Real, Ord, Enum, Num, Integral, Storable)

ft_SIZE_REQUEST_TYPE_NOMINAL
  , ft_SIZE_REQUEST_TYPE_REAL_DIM
  , ft_SIZE_REQUEST_TYPE_BBOX
  , ft_SIZE_REQUEST_TYPE_CELL
  , ft_SIZE_REQUEST_TYPE_SCALES
 :: FT_Size_Request_Type
ft_SIZE_REQUEST_TYPE_NOMINAL  = FT_Size_Request_Type $ fromIntegral FT_SIZE_REQUEST_TYPE_NOMINAL
ft_SIZE_REQUEST_TYPE_REAL_DIM = FT_Size_Request_Type $ fromIntegral FT_SIZE_REQUEST_TYPE_REAL_DIM
ft_SIZE_REQUEST_TYPE_BBOX     = FT_Size_Request_Type $ fromIntegral FT_SIZE_REQUEST_TYPE_BBOX
ft_SIZE_REQUEST_TYPE_CELL     = FT_Size_Request_Type $ fromIntegral FT_SIZE_REQUEST_TYPE_CELL
ft_SIZE_REQUEST_TYPE_SCALES   = FT_Size_Request_Type $ fromIntegral FT_SIZE_REQUEST_TYPE_SCALES



ft_LOAD_TARGET_NORMAL
  , ft_LOAD_TARGET_LIGHT
  , ft_LOAD_TARGET_MONO
  , ft_LOAD_TARGET_LCD
  , ft_LOAD_TARGET_LCD_V
 :: FT_UInt32
ft_LOAD_TARGET_NORMAL = fromIntegral FT_LOAD_TARGET_NORMAL
ft_LOAD_TARGET_LIGHT  = fromIntegral FT_LOAD_TARGET_LIGHT
ft_LOAD_TARGET_MONO   = fromIntegral FT_LOAD_TARGET_MONO
ft_LOAD_TARGET_LCD    = fromIntegral FT_LOAD_TARGET_LCD
ft_LOAD_TARGET_LCD_V  = fromIntegral FT_LOAD_TARGET_LCD_V



newtype FT_Kerning_Mode = FT_Kerning_Mode FT_UInt32
  deriving (Eq, Show, Real, Ord, Enum, Num, Integral, Storable)

ft_KERNING_DEFAULT
  , ft_KERNING_UNFITTED
  , ft_KERNING_UNSCALED
 :: FT_Kerning_Mode
ft_KERNING_DEFAULT  = FT_Kerning_Mode $ fromIntegral FT_KERNING_DEFAULT
ft_KERNING_UNFITTED = FT_Kerning_Mode $ fromIntegral FT_KERNING_UNFITTED
ft_KERNING_UNSCALED = FT_Kerning_Mode $ fromIntegral FT_KERNING_UNSCALED



newtype FT_SUBGLYPH_FLAG = FT_SUBGLYPH_FLAG FT_UInt
  deriving (Eq, Show, Real, Ord, Enum, Num, Integral, Storable)

ft_SUBGLYPH_FLAG_ARGS_ARE_WORDS
  , ft_SUBGLYPH_FLAG_ARGS_ARE_XY_VALUES
  , ft_SUBGLYPH_FLAG_ROUND_XY_TO_GRID
  , ft_SUBGLYPH_FLAG_SCALE
  , ft_SUBGLYPH_FLAG_XY_SCALE
  , ft_SUBGLYPH_FLAG_2X2
  , ft_SUBGLYPH_FLAG_USE_MY_METRICS
 :: FT_SUBGLYPH_FLAG
ft_SUBGLYPH_FLAG_ARGS_ARE_WORDS     = FT_SUBGLYPH_FLAG $ fromIntegral FT_SUBGLYPH_FLAG_ARGS_ARE_WORDS
ft_SUBGLYPH_FLAG_ARGS_ARE_XY_VALUES = FT_SUBGLYPH_FLAG $ fromIntegral FT_SUBGLYPH_FLAG_ARGS_ARE_XY_VALUES
ft_SUBGLYPH_FLAG_ROUND_XY_TO_GRID   = FT_SUBGLYPH_FLAG $ fromIntegral FT_SUBGLYPH_FLAG_ROUND_XY_TO_GRID
ft_SUBGLYPH_FLAG_SCALE              = FT_SUBGLYPH_FLAG $ fromIntegral FT_SUBGLYPH_FLAG_SCALE
ft_SUBGLYPH_FLAG_XY_SCALE           = FT_SUBGLYPH_FLAG $ fromIntegral FT_SUBGLYPH_FLAG_XY_SCALE
ft_SUBGLYPH_FLAG_2X2                = FT_SUBGLYPH_FLAG $ fromIntegral FT_SUBGLYPH_FLAG_2X2
ft_SUBGLYPH_FLAG_USE_MY_METRICS     = FT_SUBGLYPH_FLAG $ fromIntegral FT_SUBGLYPH_FLAG_USE_MY_METRICS



ft_FSTYPE_INSTALLABLE_EMBEDDING
  , ft_FSTYPE_RESTRICTED_LICENSE_EMBEDDING
  , ft_FSTYPE_PREVIEW_AND_PRINT_EMBEDDING
  , ft_FSTYPE_EDITABLE_EMBEDDING
  , ft_FSTYPE_NO_SUBSETTING
  , ft_FSTYPE_BITMAP_EMBEDDING_ONLY
  :: FT_UShort
ft_FSTYPE_INSTALLABLE_EMBEDDING        = fromIntegral FT_FSTYPE_INSTALLABLE_EMBEDDING
ft_FSTYPE_RESTRICTED_LICENSE_EMBEDDING = fromIntegral FT_FSTYPE_RESTRICTED_LICENSE_EMBEDDING
ft_FSTYPE_PREVIEW_AND_PRINT_EMBEDDING  = fromIntegral FT_FSTYPE_PREVIEW_AND_PRINT_EMBEDDING
ft_FSTYPE_EDITABLE_EMBEDDING           = fromIntegral FT_FSTYPE_EDITABLE_EMBEDDING
ft_FSTYPE_NO_SUBSETTING                = fromIntegral FT_FSTYPE_NO_SUBSETTING
ft_FSTYPE_BITMAP_EMBEDDING_ONLY        = fromIntegral FT_FSTYPE_BITMAP_EMBEDDING_ONLY



newtype FT_Glyph_Format = FT_Glyph_Format FT_UInt32
  deriving (Eq, Show, Real, Ord, Enum, Num, Integral, Storable)

ft_GLYPH_FORMAT_NONE
  , ft_GLYPH_FORMAT_COMPOSITE
  , ft_GLYPH_FORMAT_BITMAP
  , ft_GLYPH_FORMAT_OUTLINE
  , ft_GLYPH_FORMAT_PLOTTER
 :: FT_Glyph_Format
ft_GLYPH_FORMAT_NONE      = FT_Glyph_Format $ fromIntegral FT_GLYPH_FORMAT_NONE
ft_GLYPH_FORMAT_COMPOSITE = FT_Glyph_Format $ fromIntegral FT_GLYPH_FORMAT_COMPOSITE
ft_GLYPH_FORMAT_BITMAP    = FT_Glyph_Format $ fromIntegral FT_GLYPH_FORMAT_BITMAP
ft_GLYPH_FORMAT_OUTLINE   = FT_Glyph_Format $ fromIntegral FT_GLYPH_FORMAT_OUTLINE
ft_GLYPH_FORMAT_PLOTTER   = FT_Glyph_Format $ fromIntegral FT_GLYPH_FORMAT_PLOTTER



newtype FT_OUTLINE_FLAGS = FT_OUTLINE_FLAGS FT_UInt32
  deriving (Eq, Show, Real, Ord, Enum, Num, Integral, Storable)

ft_OUTLINE_NONE
  , ft_OUTLINE_OWNER
  , ft_OUTLINE_EVEN_ODD_FILL
  , ft_OUTLINE_REVERSE_FILL
  , ft_OUTLINE_IGNORE_DROPOUTS
  , ft_OUTLINE_SMART_DROPOUTS
  , ft_OUTLINE_INCLUDE_STUBS
  , ft_OUTLINE_HIGH_PRECISION
  , ft_OUTLINE_SINGLE_PASS
 :: FT_OUTLINE_FLAGS
ft_OUTLINE_NONE            = FT_OUTLINE_FLAGS $ fromIntegral FT_OUTLINE_NONE
ft_OUTLINE_OWNER           = FT_OUTLINE_FLAGS $ fromIntegral FT_OUTLINE_OWNER
ft_OUTLINE_EVEN_ODD_FILL   = FT_OUTLINE_FLAGS $ fromIntegral FT_OUTLINE_EVEN_ODD_FILL
ft_OUTLINE_REVERSE_FILL    = FT_OUTLINE_FLAGS $ fromIntegral FT_OUTLINE_REVERSE_FILL
ft_OUTLINE_IGNORE_DROPOUTS = FT_OUTLINE_FLAGS $ fromIntegral FT_OUTLINE_IGNORE_DROPOUTS
ft_OUTLINE_SMART_DROPOUTS  = FT_OUTLINE_FLAGS $ fromIntegral FT_OUTLINE_SMART_DROPOUTS
ft_OUTLINE_INCLUDE_STUBS   = FT_OUTLINE_FLAGS $ fromIntegral FT_OUTLINE_INCLUDE_STUBS
ft_OUTLINE_HIGH_PRECISION  = FT_OUTLINE_FLAGS $ fromIntegral FT_OUTLINE_HIGH_PRECISION
ft_OUTLINE_SINGLE_PASS     = FT_OUTLINE_FLAGS $ fromIntegral FT_OUTLINE_SINGLE_PASS



newtype FT_Orientation = FT_Orientation FT_UInt
  deriving (Eq, Show, Real, Ord, Enum, Num, Integral, Storable)

ft_ORIENTATION_TRUETYPE
  , ft_ORIENTATION_POSTSCRIPT
  , ft_ORIENTATION_FILL_RIGHT
  , ft_ORIENTATION_FILL_LEFT
  , ft_ORIENTATION_NONE
 :: FT_Orientation
ft_ORIENTATION_TRUETYPE   = FT_Orientation $ fromIntegral FT_ORIENTATION_TRUETYPE
ft_ORIENTATION_POSTSCRIPT = FT_Orientation $ fromIntegral FT_ORIENTATION_POSTSCRIPT
ft_ORIENTATION_FILL_RIGHT = FT_Orientation $ fromIntegral FT_ORIENTATION_FILL_RIGHT
ft_ORIENTATION_FILL_LEFT  = FT_Orientation $ fromIntegral FT_ORIENTATION_FILL_LEFT
ft_ORIENTATION_NONE       = FT_Orientation $ fromIntegral FT_ORIENTATION_NONE
