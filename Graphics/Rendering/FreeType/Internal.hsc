{-# LANGUAGE ForeignFunctionInterface #-}
module Graphics.Rendering.FreeType.Internal where
import Foreign.C.Types
import Foreign
import Foreign.Storable
import Foreign.Marshal.Alloc

#include "ft2build.h"
#include FT_FREETYPE_H

type FT_Int   = CInt
type FT_UInt  = CUInt
type FT_Byte  = CUChar
type FT_ULong = CULong
type FT_Error = CInt

foreign import ccall "FT_Init_FreeType"
  c_FT_Init_FreeType :: Ptr FT_Library -> IO FT_Error

data FT_Library = FT_Library (Ptr FT_Library)

instance Storable FT_Library where
  sizeOf _  = (#size FT_Library)
  alignment = sizeOf

ft_Init_FreeType :: IO (FT_Library, FT_Error)
ft_Init_FreeType = do
  p <- malloc
  e <- c_FT_Init_FreeType p
  return (FT_Library p, e)

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
    fT_LCD_FILTER_NONE    = FT_LCD_FILTER_NONE
  , fT_LCD_FILTER_DEFAULT = FT_LCD_FILTER_DEFAULT
  , fT_LCD_FILTER_LIGHT   = FT_LCD_FILTER_LIGHT
  , fT_LCD_FILTER_LEGACY  = FT_LCD_FILTER_LEGACY
  , fT_LCD_FILTER_MAX     = FT_LCD_FILTER_MAX
  }

#{enum FT_Render_Mode, FT_Render_Mode
    fT_RENDER_MODE_NORMAL = FT_RENDER_MODE_NORMAL
  , fT_RENDER_MODE_LIGHT  = FT_RENDER_MODE_LIGHT
  , fT_RENDER_MODE_MONO   = FT_RENDER_MODE_MONO
  , fT_RENDER_MODE_LCD    = FT_RENDER_MODE_LCD
  , fT_RENDER_MODE_LCD_V  = FT_RENDER_MODE_LCD_V
  , fT_RENDER_MODE_MAX    = FT_RENDER_MODE_MAX
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
