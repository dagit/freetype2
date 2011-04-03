{-# LANGUAGE ForeignFunctionInterface, EmptyDataDecls #-}
module Graphics.Rendering.FreeType.Internal.PrimitiveTypes where

import Foreign
import Foreign.C.Types

#include <stddef.h>

#include "ft2build.h"
#include FT_FREETYPE_H

ft_LOAD_DEFAULT :: FT_Int32
ft_LOAD_DEFAULT = #const FT_LOAD_DEFAULT
ft_LOAD_NO_SCALE :: FT_Int32
ft_LOAD_NO_SCALE = #const FT_LOAD_NO_SCALE
ft_LOAD_NO_HINTING :: FT_Int32
ft_LOAD_NO_HINTING = #const FT_LOAD_NO_HINTING
ft_LOAD_RENDER :: FT_Int32
ft_LOAD_RENDER = #const FT_LOAD_RENDER
ft_LOAD_NO_BITMAP :: FT_Int32
ft_LOAD_NO_BITMAP = #const FT_LOAD_NO_BITMAP
ft_LOAD_VERTICAL_LAYOUT :: FT_Int32
ft_LOAD_VERTICAL_LAYOUT = #const FT_LOAD_VERTICAL_LAYOUT
ft_LOAD_FORCE_AUTOHINT :: FT_Int32
ft_LOAD_FORCE_AUTOHINT = #const FT_LOAD_FORCE_AUTOHINT
ft_LOAD_CROP_BITMAP :: FT_Int32
ft_LOAD_CROP_BITMAP = #const FT_LOAD_CROP_BITMAP
ft_LOAD_PEDANTIC :: FT_Int32
ft_LOAD_PEDANTIC = #const FT_LOAD_PEDANTIC
ft_LOAD_IGNORE_GLOBAL_ADVANCE_WIDTH :: FT_Int32
ft_LOAD_IGNORE_GLOBAL_ADVANCE_WIDTH
  = #const FT_LOAD_IGNORE_GLOBAL_ADVANCE_WIDTH
ft_LOAD_NO_RECURSE :: FT_Int32
ft_LOAD_NO_RECURSE = #const FT_LOAD_NO_RECURSE
ft_LOAD_IGNORE_TRANSFORM :: FT_Int32
ft_LOAD_IGNORE_TRANSFORM = #const FT_LOAD_IGNORE_TRANSFORM
ft_LOAD_MONOCHROME :: FT_Int32
ft_LOAD_MONOCHROME = #const FT_LOAD_MONOCHROME
ft_LOAD_LINEAR_DESIGN :: FT_Int32
ft_LOAD_LINEAR_DESIGN = #const FT_LOAD_LINEAR_DESIGN
ft_LOAD_NO_AUTOHINT :: FT_Int32
ft_LOAD_NO_AUTOHINT = #const FT_LOAD_NO_AUTOHINT

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

