{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}

module Graphics.FreeType.Bindings.Support.Module
  ( FT_ModuleRec
  , FT_Module

  , FT_Module_Constructor
  , FT_Module_Destructor
  , FT_Module_Requester

  , FT_Module_Class (..)

  , ft_Add_Module
  , ft_Get_Module
  , ft_Remove_Module
  , ft_Add_Default_Modules
  , ft_Property_Set
  , ft_Property_Get
  , ft_Set_Default_Properties
  , ft_New_Library
  , ft_Done_Library
  , ft_Reference_Library

  , FT_RendererRec
  , FT_Renderer

  , FT_Renderer_Class (..)

  , ft_Get_Renderer
  , ft_Set_Renderer
  , ft_Set_Debug_Hook

  , FT_DriverRec
  , FT_Driver

  , FT_DebugHook_Func

  , pattern FT_DEBUG_HOOK_TRUETYPE
  ) where

import           Graphics.FreeType.Bindings.Circular ( FT_ModuleRec, FT_Module
                                                     , FT_DriverRec, FT_Driver
                                                     )
import           Graphics.FreeType.Bindings.Core.Base
import           Graphics.FreeType.Bindings.Core.Types
import           Graphics.FreeType.Bindings.Support.Scanline
import           Graphics.FreeType.Bindings.Support.System

import           Foreign.C.Types
import           Foreign.Ptr
import           Foreign.Storable

#include "ft2build.h"
#include FT_FREETYPE_H

#include "freetype/ftmodapi.h"
#include "freetype/ftrender.h"

type FT_Module_Constructor = FunPtr (FT_Module -> IO FT_Error)



type FT_Module_Destructor = FunPtr (FT_Module -> IO ())



type FT_Module_Interface = FT_Pointer
type FT_Module_Requester = FunPtr (FT_Module -> Ptr CChar -> IO FT_Module_Interface)



data FT_Module_Class = FT_Module_Class
                         { mcModule_flags     :: FT_ULong
                         , mcModule_size      :: FT_Long
                         , mcModule_name      :: Ptr FT_String
                         , mcModule_version   :: FT_Fixed
                         , mcModule_requires  :: FT_Fixed
                         , mcModule_interface :: Ptr ()
                         , mcModule_init      :: FT_Module_Constructor
                         , mcModule_done      :: FT_Module_Destructor
                         , mcGet_interface    :: FT_Module_Requester
                         }

instance Storable FT_Module_Class where
  sizeOf _    = #size      struct FT_Module_Class_
  alignment _ = #alignment struct FT_Module_Class_

  peek ptr =
    FT_Module_Class
      <$> #{peek struct FT_Module_Class_, module_flags    } ptr
      <*> #{peek struct FT_Module_Class_, module_size     } ptr
      <*> #{peek struct FT_Module_Class_, module_name     } ptr
      <*> #{peek struct FT_Module_Class_, module_version  } ptr
      <*> #{peek struct FT_Module_Class_, module_requires } ptr
      <*> #{peek struct FT_Module_Class_, module_interface} ptr
      <*> #{peek struct FT_Module_Class_, module_init     } ptr
      <*> #{peek struct FT_Module_Class_, module_done     } ptr
      <*> #{peek struct FT_Module_Class_, get_interface   } ptr

  poke ptr val = do
    #{poke struct FT_Module_Class_, module_flags    } ptr $ mcModule_flags     val
    #{poke struct FT_Module_Class_, module_size     } ptr $ mcModule_size      val
    #{poke struct FT_Module_Class_, module_name     } ptr $ mcModule_name      val
    #{poke struct FT_Module_Class_, module_version  } ptr $ mcModule_version   val
    #{poke struct FT_Module_Class_, module_requires } ptr $ mcModule_requires  val
    #{poke struct FT_Module_Class_, module_interface} ptr $ mcModule_interface val
    #{poke struct FT_Module_Class_, module_init     } ptr $ mcModule_init      val
    #{poke struct FT_Module_Class_, module_done     } ptr $ mcModule_done      val
    #{poke struct FT_Module_Class_, get_interface   } ptr $ mcGet_interface    val



foreign import ccall "FT_Add_Module"
  ft_Add_Module :: FT_Library -> Ptr FT_Module_Class -> IO FT_Error



foreign import ccall "FT_Get_Module"
  ft_Get_Module :: FT_Library -> Ptr CChar -> IO FT_Module



foreign import ccall "FT_Remove_Module"
  ft_Remove_Module :: FT_Library -> FT_Module -> IO FT_Error



foreign import ccall "FT_Add_Default_Modules"
  ft_Add_Default_Modules :: FT_Library -> IO ()



foreign import ccall "FT_Property_Set"
  ft_Property_Set :: FT_Library -> Ptr FT_String -> Ptr FT_String -> Ptr () -> IO FT_Error



foreign import ccall "FT_Property_Get"
  ft_Property_Get :: FT_Library -> Ptr FT_String -> Ptr FT_String -> Ptr () -> IO FT_Error



foreign import ccall "FT_Set_Default_Properties"
  ft_Set_Default_Properties :: FT_Library -> IO ()



foreign import ccall "FT_New_Library"
  ft_New_Library :: FT_Memory -> FT_Library -> IO FT_Error



foreign import ccall "FT_Done_Library"
  ft_Done_Library :: FT_Library -> IO FT_Error



foreign import ccall "FT_Reference_Library"
  ft_Reference_Library :: FT_Library -> IO FT_Error



data FT_RendererRec
type FT_Renderer = Ptr FT_RendererRec



type FT_Renderer_RenderFunc = FunPtr (FT_Renderer -> FT_GlyphSlot -> FT_Render_Mode -> Ptr FT_Vector -> IO FT_Error)

type FT_Renderer_TransformFunc = FunPtr (FT_Renderer -> FT_GlyphSlot -> Ptr FT_Matrix -> Ptr FT_Vector -> IO FT_Error)

type FT_Renderer_GetCBoxFunc = FunPtr (FT_Renderer -> FT_GlyphSlot -> Ptr FT_BBox -> IO ())

type FT_Renderer_SetModeFunc = FunPtr (FT_Renderer -> FT_ULong -> FT_Pointer -> IO FT_Error)

data FT_Renderer_Class = FT_Renderer_Class
                           { rcRoot            :: FT_Module_Class
                           , rcGlyph_format    :: FT_Glyph_Format
                           , rcRender_glyph    :: FT_Renderer_RenderFunc
                           , rcTransform_glyph :: FT_Renderer_TransformFunc
                           , rcGet_glyph_cbox  :: FT_Renderer_GetCBoxFunc
                           , rcSet_mode        :: FT_Renderer_SetModeFunc
                           , rcRaster_class    :: Ptr FT_Raster_Funcs
                           }

instance Storable FT_Renderer_Class where
  sizeOf _    = #size      struct FT_Renderer_Class_
  alignment _ = #alignment struct FT_Renderer_Class_

  peek ptr =
    FT_Renderer_Class
      <$> #{peek struct FT_Renderer_Class_, root           } ptr
      <*> #{peek struct FT_Renderer_Class_, glyph_format   } ptr
      <*> #{peek struct FT_Renderer_Class_, render_glyph   } ptr
      <*> #{peek struct FT_Renderer_Class_, transform_glyph} ptr
      <*> #{peek struct FT_Renderer_Class_, get_glyph_cbox } ptr
      <*> #{peek struct FT_Renderer_Class_, set_mode       } ptr
      <*> #{peek struct FT_Renderer_Class_, raster_class   } ptr

  poke ptr val = do
    #{poke struct FT_Renderer_Class_, root           } ptr $ rcRoot            val
    #{poke struct FT_Renderer_Class_, glyph_format   } ptr $ rcGlyph_format    val
    #{poke struct FT_Renderer_Class_, render_glyph   } ptr $ rcRender_glyph    val
    #{poke struct FT_Renderer_Class_, transform_glyph} ptr $ rcTransform_glyph val
    #{poke struct FT_Renderer_Class_, get_glyph_cbox } ptr $ rcGet_glyph_cbox  val
    #{poke struct FT_Renderer_Class_, set_mode       } ptr $ rcSet_mode        val
    #{poke struct FT_Renderer_Class_, raster_class   } ptr $ rcRaster_class    val



foreign import ccall "FT_Get_Renderer"
  ft_Get_Renderer :: FT_Library -> FT_Glyph_Format -> IO FT_Renderer



foreign import ccall "FT_Set_Renderer"
  ft_Set_Renderer :: FT_Library -> FT_Renderer -> FT_UInt -> Ptr FT_Parameter -> IO FT_Error



foreign import ccall "FT_Set_Debug_Hook"
  ft_Set_Debug_Hook :: FT_Library -> FT_UInt -> FT_DebugHook_Func -> IO ()



type FT_DebugHook_Func = FunPtr (Ptr () -> IO FT_Error)



pattern FT_DEBUG_HOOK_TRUETYPE
     :: FT_UInt
pattern FT_DEBUG_HOOK_TRUETYPE = #const FT_DEBUG_HOOK_TRUETYPE
