{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE ForeignFunctionInterface #-}

module FreeType.Support.Module.Types
  ( module FreeType.Support.Module.Types
  , FT_Module
  , FT_ModuleRec
  , FT_Driver
  , FT_DriverRec
  ) where

import           FreeType.Circular.Types ( FT_ModuleRec, FT_Module
                                         , FT_DriverRec, FT_Driver
                                         )
import           FreeType.Core.Types.Types
import           FreeType.Support.Scanline.Types

import           Data.Int
import           Data.Function ((&))
import           Foreign.Ptr
import           Foreign.Storable

#include "ft2build.h"
#include FT_MODULE_H
#include FT_RENDER_H

type FT_Module_Constructor = FT_Module   -- ^ module
                          -> IO FT_Error

foreign import ccall "wrapper"
  ft_Module_Constructor :: FT_Module_Constructor -> IO (FunPtr FT_Module_Constructor)

foreign import ccall "dynamic"
  ft_Module_Constructor' :: FunPtr FT_Module_Constructor -> FT_Module_Constructor



type FT_Module_Destructor = FT_Module -- ^ module
                         -> IO ()

foreign import ccall "wrapper"
  ft_Module_Destructor :: FT_Module_Destructor -> IO (FunPtr FT_Module_Destructor)

foreign import ccall "dynamic"
  ft_Module_Destructor' :: FunPtr FT_Module_Destructor -> FT_Module_Destructor




type FT_Module_Interface = ()

type FT_Module_Requester = FT_Module              -- ^ module
                        -> Ptr #{type char}       -- ^ name
                        -> IO FT_Module_Interface

foreign import ccall "wrapper"
  ft_Module_Requester :: FT_Module_Requester -> IO (FunPtr FT_Module_Requester)

foreign import ccall "dynamic"
  ft_Module_Requester' :: FunPtr FT_Module_Requester -> FT_Module_Requester




data FT_Module_Class = FT_Module_Class
                         { mcModule_flags     :: FT_ULong
                         , mcModule_size      :: FT_Long
                         , mcModule_name      :: Ptr FT_String
                         , mcModule_version   :: FT_Fixed
                         , mcModule_requires  :: FT_Fixed
                         , mcModule_interface :: Ptr ()
                         , mcModule_init      :: FunPtr FT_Module_Constructor
                         , mcModule_done      :: FunPtr FT_Module_Destructor
                         , mcGet_interface    :: FunPtr FT_Module_Requester
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
    #{poke struct FT_Module_Class_, module_flags    } ptr $ val & mcModule_flags
    #{poke struct FT_Module_Class_, module_size     } ptr $ val & mcModule_size
    #{poke struct FT_Module_Class_, module_name     } ptr $ val & mcModule_name
    #{poke struct FT_Module_Class_, module_version  } ptr $ val & mcModule_version
    #{poke struct FT_Module_Class_, module_requires } ptr $ val & mcModule_requires
    #{poke struct FT_Module_Class_, module_interface} ptr $ val & mcModule_interface
    #{poke struct FT_Module_Class_, module_init     } ptr $ val & mcModule_init
    #{poke struct FT_Module_Class_, module_done     } ptr $ val & mcModule_done
    #{poke struct FT_Module_Class_, get_interface   } ptr $ val & mcGet_interface



data FT_RendererRec
type FT_Renderer = Ptr FT_RendererRec



type FT_Renderer_RenderFunc = ()

type FT_Renderer_TransformFunc = ()

type FT_Renderer_GetCBoxFunc = ()

type FT_Renderer_SetModeFunc = ()

data FT_Renderer_Class = FT_Renderer_Class
                           { rcRoot            :: FT_Module_Class
                           , rcGlyph_format    :: FT_Glyph_Format
                           , rcRender_glyph    :: FunPtr FT_Renderer_RenderFunc
                           , rcTransform_glyph :: FunPtr FT_Renderer_TransformFunc
                           , rcGet_glyph_cbox  :: FunPtr FT_Renderer_GetCBoxFunc
                           , rcSet_mode        :: FunPtr FT_Renderer_SetModeFunc
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
    #{poke struct FT_Renderer_Class_, root           } ptr $ val & rcRoot
    #{poke struct FT_Renderer_Class_, glyph_format   } ptr $ val & rcGlyph_format
    #{poke struct FT_Renderer_Class_, render_glyph   } ptr $ val & rcRender_glyph
    #{poke struct FT_Renderer_Class_, transform_glyph} ptr $ val & rcTransform_glyph
    #{poke struct FT_Renderer_Class_, get_glyph_cbox } ptr $ val & rcGet_glyph_cbox
    #{poke struct FT_Renderer_Class_, set_mode       } ptr $ val & rcSet_mode
    #{poke struct FT_Renderer_Class_, raster_class   } ptr $ val & rcRaster_class



type FT_DebugHook_Func = Ptr ()      -- ^ arg
                      -> IO FT_Error

foreign import ccall "wrapper"
  ft_DebugHook_Func :: FT_DebugHook_Func -> IO (FunPtr FT_DebugHook_Func)

foreign import ccall "dynamic"
  ft_DebugHook_Func' :: FunPtr FT_DebugHook_Func -> FT_DebugHook_Func
