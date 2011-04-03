{-# LANGUAGE ForeignFunctionInterface #-}
module Graphics.Rendering.FreeType.Internal where

import Foreign.C.Types
import Foreign.C.String
import Foreign
import Foreign.Storable

#include "ft2build.h"
#include FT_FREETYPE_H
#include "Internal_wrapper.h"

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


type FT_Int     = CInt
type FT_UInt    = CUInt
type FT_Int32   = Int32
type FT_Byte    = CUChar
type FT_ULong   = CULong
type FT_Error   = CInt
type FT_Long    = CLong
type FT_F26Dot6 = CLong
type FT_Fixed   = CLong
type FT_Pos     = CLong

foreign import ccall "FT_Init_FreeType"
  c_FT_Init_FreeType :: Ptr FT_Library -> IO FT_Error

data FT_Library = FT_Library (ForeignPtr FT_Library)

#include <stddef.h>
#let alignment t = "%lu", (unsigned long)offsetof(struct {char x__; t (y__); }, y__)

instance Storable FT_Library where
  sizeOf _    = #size FT_Library
  alignment _ = #alignment FT_Library
  peek ptr = do
    lib <- mallocForeignPtr
    withForeignPtr lib $ \lp ->
      copy lp ptr
    return $! FT_Library lib
  poke dest (FT_Library srcfp) = do
    withForeignPtr srcfp $ \src ->
      copy dest src

ft_Init_FreeType :: IO (Either FT_Error FT_Library)
ft_Init_FreeType = do
  p <- mallocForeignPtr
  e <- withForeignPtr p c_FT_Init_FreeType
  case e of
    0 -> return $! Right $! FT_Library p
    _ -> return $! Left e

data FT_Face = FT_Face (ForeignPtr FT_Face)

instance Storable FT_Face where
  sizeOf _    = #size FT_Face
  alignment _ = #alignment FT_Face
  peek ptr = do
    face <- mallocForeignPtr
    withForeignPtr face $ \lp ->
      copy lp ptr
    return $! FT_Face face
  poke dest (FT_Face srcptr) = do
    withForeignPtr srcptr $ \src ->
      copy dest src

copy :: Storable a => Ptr a -> Ptr a -> IO ()
copy dest src = copyBytes dest src (sizeOf (type_ src))
  where
  -- cute trick to avoid needing ScopedTypeVariables
  -- thanks to Saizan
  type_ :: Ptr a -> a
  type_ = undefined

move :: Storable a => Ptr a -> Ptr a -> IO ()
move dest src = moveBytes dest src (sizeOf (type_ src))
  where
  type_ :: Ptr a -> a
  type_ = undefined

foreign import ccall "w_FT_New_Face"
  w_FT_New_Face :: Ptr FT_Library  -> CString -> FT_Long
                -> Ptr FT_Face -> IO FT_Error

ft_New_Face :: FT_Library -> FilePath -> FT_Long
            -> IO (Either FT_Error FT_Face)
ft_New_Face (FT_Library lib) fp index = do
  faceptr <- mallocForeignPtr
  err <- withCString fp $ \cstr ->
    withForeignPtr faceptr $ \ptr ->
      withForeignPtr lib $ \lp ->
        w_FT_New_Face lp cstr index ptr
  case err of
    0 -> return $! Right $! FT_Face faceptr
    _ -> return $! Left err

foreign import ccall "w_FT_Set_Char_Size"
  w_FT_Set_Char_Size :: Ptr FT_Face -> FT_F26Dot6 -> FT_F26Dot6
                     -> FT_UInt     -> FT_UInt    -> IO FT_Error

ft_Set_Char_Size :: FT_Face -> FT_F26Dot6 -> FT_F26Dot6
                 -> FT_UInt -> FT_UInt    -> IO FT_Error
ft_Set_Char_Size (FT_Face faceptr) w h hr vr =
  withForeignPtr faceptr $ \p ->
    w_FT_Set_Char_Size p w h hr vr

foreign import ccall "w_FT_Set_Pixel_Sizes"
  w_FT_Set_Pixel_Sizes :: Ptr FT_Face -> FT_UInt -> FT_UInt
                       -> IO FT_Error

ft_Set_Pixel_Sizes :: FT_Face -> FT_UInt -> FT_UInt -> IO FT_Error
ft_Set_Pixel_Sizes (FT_Face faceptr) w h =
  withForeignPtr faceptr $ \p ->
    w_FT_Set_Pixel_Sizes p w h

foreign import ccall "w_FT_Get_Char_Index"
  w_FT_Get_Char_Index :: Ptr FT_Face -> FT_ULong -> IO FT_UInt

ft_Get_Char_Index :: FT_Face -> FT_ULong -> IO FT_UInt
ft_Get_Char_Index (FT_Face faceptr) code =
  withForeignPtr faceptr $ \p ->
    w_FT_Get_Char_Index p code

data FT_Matrix = FT_Matrix
  { xx, xy :: FT_Fixed
  , yx, yy :: FT_Fixed
  }

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

foreign import ccall "w_FT_Set_Transform"
  w_FT_Set_Transform :: Ptr FT_Face -> Ptr FT_Matrix
                     -> Ptr FT_Vector -> IO ()

ft_Set_Transform :: FT_Face -> Ptr FT_Matrix
                 -> Ptr FT_Vector -> IO ()
ft_Set_Transform (FT_Face faceptr) mat vec =
  withForeignPtr faceptr $ \p ->
    w_FT_Set_Transform p mat vec

foreign import ccall "w_FT_Load_Char"
  w_FT_Load_Char :: Ptr FT_Face -> FT_ULong -> FT_Int32 -> IO FT_Error

ft_Load_Char :: FT_Face -> FT_ULong -> FT_Int32 -> IO FT_Error
ft_Load_Char (FT_Face faceptr) char flags =
  withForeignPtr faceptr $ \p ->
    w_FT_Load_Char p char flags

foreign import ccall "w_FT_Done_Face"
  w_FT_Done_Face :: Ptr FT_Face -> IO FT_Error

ft_Done_Face :: FT_Face -> IO FT_Error
ft_Done_Face (FT_Face faceptr) =
  withForeignPtr faceptr w_FT_Done_Face

foreign import ccall "w_FT_Done_FreeType"
  w_FT_Done_FreeType :: Ptr FT_Library -> IO FT_Error

ft_Done_FreeType :: FT_Library -> IO FT_Error
ft_Done_FreeType (FT_Library libptr) =
  withForeignPtr libptr w_FT_Done_FreeType

data FT_GlyphSlot = FT_GlyphSlot (Ptr FT_GlyphSlot)

instance Storable FT_GlyphSlot where
  sizeOf _    = #size FT_GlyphSlot
  alignment _ = #alignment FT_GlyphSlot
  peek ptr = do
    slot <- malloc
    copy slot ptr
    return $! FT_GlyphSlot slot
  poke dest (FT_GlyphSlot src) = do
    copy dest src

withGlyphSlot :: FT_Face -> (Ptr FT_GlyphSlot -> IO a) -> IO a
withGlyphSlot (FT_Face faceptr) f =
  withForeignPtr faceptr $ \p ->
    f $ p `plusPtr` (#offset struct FT_FaceRec_, glyph)







{-
data FT_Face = FT_Face
  { num_faces   :: FT_Long
  , face_index  :: FT_Long

  , face_flags  :: FT_Long
  , style_flags :: FT_Long

  , num_glyphs  :: FT_Long

  , family_name :: Ptr FT_String
  , style_name  :: Ptr FT_String

  , num_fixed_sizes :: FT_Int
  , available_sizes :: FT_Int

  , num_charmaps :: FT_Int
  , charmaps     :: Ptr FT_CharMap

  -- , generic      :: FT_Generic

  , bbox         :: FT_BBox

  , units_per_EM :: FT_UShort
  , ascender     :: FT_Short
  , descender    :: FT_Short
  , height       :: FT_Short

  , max_advance_width  :: FT_Short
  , max_advance_height :: FT_Short

  , underline_position :: FT_Short
  , unerline_thickness :: FT_Short

  , glyph   :: FT_GlyphSlot
  , size    :: FT_Size
  , charmap :: FT_CharMap

  {-
  -- private begin
  , driver :: FT_Driver
  , memory :: FT_Memory
  , stream :: FT_Stream
  
  , sizes_list :: FT_ListRec

  , autohint   :: FT_Generic
  , extensions :: Ptr ()

  , internal :: FT_Face_Internal
  -- private end
  -}
  }

instance Storable FT_Face where
  sizeOf _    = (#size FT_Face)
  alignment _ = alignment (undefined :: FT_Long)
  peek ptr = do
    numFaces           <- (#peek FT_Face, num_faces)
    faceIndex          <- (#peek FT_Face, face_index)
    faceFlags          <- (#peek FT_Face, face_flags)
    styleFlags         <- (#peek FT_Face, style_flags)
    numGlyphs          <- (#peek FT_Face, num_glyphs)
    familyName         <- (#peek FT_Face, family_name)
    styleName          <- (#peek FT_Face, style_name)
    numFixedSizes      <- (#peek FT_Face, num_fixed_sizes)
    availableSizes     <- (#peek FT_Face, available_sizes)
    numCharmaps        <- (#peek FT_Face, num_charmaps)
    charmaps_          <- (#peek FT_Face, charmaps)
    bbox_              <- (#peek FT_Face, bbox)
    unitsPerEM         <- (#peek FT_Face, units_per_EM)
    ascender_          <- (#peek FT_Face, ascender)
    descender_         <- (#peek FT_Face, descender)
    height_            <- (#peek FT_Face, height)
    maxAdvanceWidth    <- (#peek FT_Face, max_advance_width)
    maxAdvanceHeight   <- (#peek FT_Face, max_advance_height)
    underlinePosition  <- (#peek FT_Face, underline_position)
    underlineThickness <- (#peek FT_Face, underline_thickness)
    glyph_             <- (#peek FT_Face, glyph)
    size_              <- (#peek FT_Face, size)
    charmap_           <- (#peek FT_Face, charmap)
    return $! FT_Face
      { num_faces           = numFaces
      , face_index          = faceIndex
      , face_flags          = faceFlags
      , style_flags         = styleFlags
      , num_glyphs          = numGlyphs
      , family_name         = familyName
      , style_name          = styleName
      , num_fixed_sizes     = numFixedSizes
      , available_sizes     = availableSizes
      , num_charmaps        = numCharmaps
      , charmaps            = charmaps_
      , bbox_               = bbox
      , units_per_EM        = unitsPerEM
      , ascender            = ascender_
      , descender           = descender_
      , height              = height_
      , max_advance_width   = maxAdvanceWidth
      , max_advance_height  = maxAdvanceHeight
      , underline_position  = underlinePosition
      , underline_thickness = underlineThickness
      , glyph               = glyph_
      , size                = size_
      , charmap             = charmap_
      }
  poke ptr val = do
    (#poke FT_Face, num_faces)       ptr (num_faces val)
    (#poke FT_Face, face_index)      ptr (face_index val)
    (#poke FT_Face, face_flags)      ptr (face_flags val)
    (#poke FT_Face, style_flags)     ptr (style_flags val)
    (#poke FT_Face, num_glyphs)      ptr (num_glyphs val)
    (#poke FT_Face, family_name)     ptr (family_name val)
    (#poke FT_Face, style_name)      ptr (style_name val)
    (#poke FT_Face, num_fixed_sizes) ptr (num_fixed_sizes val)
-}
-- How much of this stuff should we actually implement in Haskell?
{-
type FT_DebugHook_Func = FunPtr (Ptr () -> IO())

type FT_Bitmap_LcdFilterFunc = FunPtr
  (Ptr FT_Bitmap -> FT_Render_Mode -> FT_Library -> IO ())

type FT_Alloc_Func   = FunPtr
  (FT_Memory -> CLong -> IO (Ptr ()))
type FT_Free_Func    = FunPtr
  (FT_Memory -> Ptr () -> IO ())
type FT_Realloc_Func = FunPtr
  (FT_Memory -> CLong -> CLong -> Ptr () -> IO (Ptr ()))

type FT_Generic_Finalizer = FunPtr
  (Ptr () -> IO ())

#{enum FT_LcdFilter, FT_LcdFilter
    ft_LCD_FILTER_NONE    = FT_LCD_FILTER_NONE
  , ft_LCD_FILTER_DEFAULT = FT_LCD_FILTER_DEFAULT
  , ft_LCD_FILTER_LIGHT   = FT_LCD_FILTER_LIGHT
  , ft_LCD_FILTER_LEGACY  = FT_LCD_FILTER_LEGACY
  , ft_LCD_FILTER_MAX     = FT_LCD_FILTER_MAX
  }

#{enum FT_Render_Mode, FT_Render_Mode
    ft_RENDER_MODE_NORMAL = FT_RENDER_MODE_NORMAL
  , ft_RENDER_MODE_LIGHT  = FT_RENDER_MODE_LIGHT
  , ft_RENDER_MODE_MONO   = FT_RENDER_MODE_MONO
  , ft_RENDER_MODE_LCD    = FT_RENDER_MODE_LCD
  , ft_RENDER_MODE_LCD_V  = FT_RENDER_MODE_LCD_V
  , ft_RENDER_MODE_MAX    = FT_RENDER_MODE_MAX
  }

data FT_Bitmap = FT_Bitmap
  { rows         :: CInt
  , width        :: CInt
  , pitch        :: CInt
  , buffer       :: Ptr CUChar
  , num_grays    :: CShort
  , pixel_mode   :: CChar
  , palette_mode :: CChar
  , palette      :: Ptr ()
  }

data FT_Library = FT_Library
  { memory           :: FT_Memory
  , generic          :: FT_Generic
  , version_major    :: FT_Int
  , version_minor    :: FT_Int
  , version_patch    :: FT_Int
  , num_modules      :: FT_UInt
  , modules          :: [FT_Module] -- len == FT_MAX_MODULES
  , renderers        :: FT_ListRec
  , cur_renderer     :: FT_Renderer
  , auto_hinter      :: FT_Module
  , raster_pool      :: Ptr FT_Byte
  , raster_pool_size :: FT_ULong
  , debug_hooks      :: [FT_DebugHook_Func] -- len == 4
#ifdef FT_CONFIG_OPTION_SUBPIXEL_RENDERING
  , lcd_filter       :: FT_LcdFilter
  , lcd_extra        :: FT_Int
  , lcd_weights      :: [FT_Byte] -- len == 7
  , lcd_filter_func  :: FT_Bitmap_LcdFilterFunc
#endif
#ifdef FT_CONFIG_OPTION_PIC
  , pic_container    :: FT_PIC_Container
#endif
  , refcount         :: FT_UInt
  }

data FT_Memory = FT_Memory
  { user    :: Ptr () 
  , alloc   :: FT_Alloc_Func
  , free    :: FT_Free_Func
  , realloc :: FT_Realloc_Func
  }

data FT_Generic = FT_Generic
  { data      :: Ptr () 
  , finalizer :: FT_Generic_Finalizer
  }

data FT_Module = FT_Module
  { clazz   :: Ptr FT_Module_Class
  , library :: FT_Library
  , memory  :: FT_Memory
  , generic :: FT_Generic
  }

data FT_ListRec = FT_ListRec
  { head :: FT_ListNode
  , tail :: FT_ListNode
  }

data FT_ListNode = FT_ListNode
  { prev  :: FT_ListNode
  , next  :: FT_ListNode
  , data_ :: Ptr ()
  }

data FT_Renderer = FT_Renderer
  { root          :: FT_Module
  , clazz         :: Ptr FT_Render_Class
  , glyph_format  :: FT_Glyph_Format
  , glyph_class   :: FT_Glphy_Class
  , raster        :: FT_Raster
  , raster_render :: FT_Raster_Render_Func
  , render        :: FT_Render_RenderFunc
  }

data FT_Module_Class = FT_Module_Class
  { module_flags      :: FT_ULong
  , module_size       :: FT_Long
  , module_name       :: Ptr FT_String
  , module_version    :: FT_Fixed
  , module_requires   :: FT_Fixed
  , module_interfaces :: Ptr ()
  , module_init       :: FT_Module_Constructor
  , module_done       :: FT_Module_Destructor
  , get_interface     :: FT_Module_Requester
  }
-}
