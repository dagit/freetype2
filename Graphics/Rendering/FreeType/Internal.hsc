{-# LANGUAGE ForeignFunctionInterface, EmptyDataDecls #-}
module Graphics.Rendering.FreeType.Internal where

import Foreign.C.Types
import Foreign.C.String
import Foreign
import Foreign.Storable

#include <stddef.h>
#let alignment t = "%lu", (unsigned long)offsetof(struct {char x__; t (y__); }, y__)

#include "ft2build.h"
#include FT_FREETYPE_H

#include "internal/ftobjs.h"

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

data FT_LibraryRec_
type FT_Library = Ptr FT_LibraryRec_

instance Storable FT_LibraryRec_ where
  sizeOf _    = #size struct FT_LibraryRec_
  alignment _ = #alignment struct FT_LibraryRec_
  peek = error "peek not implemented for FT_LibraryRec_"
  poke = error "poke not implemented for FT_LibraryRec_"

foreign import ccall "FT_Init_FreeType"
  ft_Init_FreeType :: Ptr FT_Library -> IO FT_Error

data FT_FaceRec_
type FT_Face = Ptr FT_FaceRec_

instance Storable FT_FaceRec_ where
  sizeOf _    = #size struct FT_FaceRec_
  alignment _ = #alignment struct FT_FaceRec_
  peek = error "peek not implemented for FT_FaceRec_"
  poke = error "poke not implemented for FT_FaceRec_"

face_num_faces :: FT_Face -> Ptr FT_Long
face_num_faces = #ptr struct FT_FaceRec_, num_faces

face_num_glyphs :: FT_Face -> Ptr FT_Long
face_num_glyphs = #ptr struct FT_FaceRec_, num_glyphs

glyph :: FT_Face -> IO FT_GlyphSlot
glyph ptr = peek $ (#ptr struct FT_FaceRec_, glyph) ptr

face_underline_thickness :: FT_Face -> Ptr FT_Short
face_underline_thickness = #ptr struct FT_FaceRec_, underline_thickness



foreign import ccall "FT_New_Face"
  ft_New_Face :: FT_Library  -> CString -> FT_Long
              -> Ptr FT_Face -> IO FT_Error

foreign import ccall "FT_Set_Char_Size"
  ft_Set_Char_Size :: FT_Face -> FT_F26Dot6 -> FT_F26Dot6
                   -> FT_UInt -> FT_UInt    -> IO FT_Error

foreign import ccall "FT_Set_Pixel_Sizes"
  ft_Set_Pixel_Sizes :: FT_Face -> FT_UInt -> FT_UInt
                     -> IO FT_Error

foreign import ccall "FT_Get_Char_Index"
  ft_Get_Char_Index :: FT_Face -> FT_ULong -> IO FT_UInt

data FT_Matrix = FT_Matrix
  { xx, xy :: FT_Fixed
  , yx, yy :: FT_Fixed
  }
  deriving (Read, Show, Eq)

instance Storable FT_Matrix where
  sizeOf _    = #size FT_Matrix
  alignment _ = alignment (undefined :: FT_Fixed)
  peek ptr = do
    xx' <- (#peek FT_Matrix, xx) ptr
    xy' <- (#peek FT_Matrix, xy) ptr
    yx' <- (#peek FT_Matrix, yx) ptr
    yy' <- (#peek FT_Matrix, yy) ptr
    return $! FT_Matrix xx' xy' yx' yy'
  poke ptr val = do
    (#poke FT_Matrix, xx) ptr (xx val)
    (#poke FT_Matrix, xy) ptr (xy val)
    (#poke FT_Matrix, yx) ptr (yx val)
    (#poke FT_Matrix, yy) ptr (yy val)

data FT_Vector = FT_Vector
  { x :: FT_Pos
  , y :: FT_Pos
  }
  deriving (Read, Show, Eq)

instance Storable FT_Vector where
  sizeOf _    = #size FT_Vector
  alignment _ = alignment (undefined :: FT_Pos)
  peek ptr = do
    x' <- (#peek FT_Vector, x) ptr
    y' <- (#peek FT_Vector, y) ptr
    return $! FT_Vector x' y'
  poke ptr val = do
    (#poke FT_Vector, x) ptr (x val)
    (#poke FT_Vector, y) ptr (y val)

foreign import ccall "FT_Set_Transform"
  ft_Set_Transform :: FT_Face -> Ptr FT_Matrix
                   -> Ptr FT_Vector -> IO ()

foreign import ccall "FT_Load_Char"
  ft_Load_Char :: FT_Face -> FT_ULong -> FT_Int32 -> IO FT_Error

foreign import ccall "FT_Done_Face"
  ft_Done_Face :: FT_Face -> IO FT_Error

foreign import ccall "FT_Done_FreeType"
  ft_Done_FreeType :: FT_Library -> IO FT_Error

data FT_GlyphSlotRec_
type FT_GlyphSlot = Ptr FT_GlyphSlotRec_

instance Storable FT_GlyphSlotRec_ where
  sizeOf _    = #size struct FT_GlyphSlotRec_
  alignment _ = #alignment struct FT_GlyphSlotRec_
  peek = error "peek not implemented for FT_GlyphSlotRec_"
  poke = error "poke not implemented for FT_GlyphSlotRec_"

glyphSlot'library :: FT_GlyphSlot -> FT_Library
glyphSlot'library = (#ptr struct FT_GlyphSlotRec_, library)

advance :: FT_GlyphSlot -> Ptr FT_Vector
advance = (#ptr struct FT_GlyphSlotRec_, advance)

data FT_Bitmap = FT_Bitmap
  { rows         :: CInt
  , width        :: CInt
  , pitch        :: CInt
  , buffer       :: Ptr CChar
  , num_grays    :: CShort
  , pixel_mode   :: CChar
  , palette_mode :: CChar
  , palette      :: Ptr ()
  }

instance Storable FT_Bitmap where
  sizeOf _    = #size FT_Bitmap
  alignment _ = #alignment FT_Bitmap
  peek ptr = do
    rows'         <- (#peek FT_Bitmap, rows) ptr
    width'        <- (#peek FT_Bitmap, width) ptr
    pitch'        <- (#peek FT_Bitmap, pitch) ptr
    buffer'       <- (#peek FT_Bitmap, buffer) ptr
    num_grays'    <- (#peek FT_Bitmap, num_grays) ptr
    pixel_mode'   <- (#peek FT_Bitmap, pixel_mode) ptr
    palette_mode' <- (#peek FT_Bitmap, palette_mode) ptr
    palette'      <- (#peek FT_Bitmap, palette) ptr
    return $ FT_Bitmap
      { rows = rows'
      , width = width'
      , pitch = pitch'
      , buffer = buffer'
      , num_grays = num_grays'
      , pixel_mode = pixel_mode'
      , palette_mode = palette_mode'
      , palette = palette'
      }
  poke ptr val = do
    (#poke FT_Bitmap, rows) ptr (rows val)
    (#poke FT_Bitmap, width) ptr (width val)
    (#poke FT_Bitmap, pitch) ptr (pitch val)
    (#poke FT_Bitmap, buffer) ptr (buffer val)
    (#poke FT_Bitmap, num_grays) ptr (num_grays val)
    (#poke FT_Bitmap, pixel_mode) ptr (pixel_mode val)
    (#poke FT_Bitmap, palette_mode) ptr (palette_mode val)
    (#poke FT_Bitmap, palette) ptr (palette val)

bitmap :: FT_GlyphSlot -> Ptr FT_Bitmap
bitmap = (#ptr struct FT_GlyphSlotRec_, bitmap)
--  (#peek struct FT_GlyphSlotRec_, bitmap) glyphptr

bitmap_left :: FT_GlyphSlot -> Ptr FT_Int
bitmap_left = (#ptr struct FT_GlyphSlotRec_, bitmap_left)
--  (#peek struct FT_GlyphSlotRec_, bitmap_left) glyphptr

bitmap_top :: FT_GlyphSlot -> Ptr FT_Int
bitmap_top = (#ptr struct FT_GlyphSlotRec_, bitmap_top)
--  (#peek struct FT_GlyphSlotRec_, bitmap_top) glyphptr

