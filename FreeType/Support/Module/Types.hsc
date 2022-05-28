{-# LANGUAGE DataKinds
           , EmptyDataDecls
           , ForeignFunctionInterface
           , MultiParamTypeClasses
           , TypeApplications #-}

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
import           Foreign.Ptr
import           Foreign.Storable
import           Foreign.Storable.Offset

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




type FT_Module_Interface = FT_Pointer

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

instance Offset "mcModule_flags"     FT_Module_Class where rawOffset = #{offset struct FT_Module_Class_, module_flags    }
instance Offset "mcModule_size"      FT_Module_Class where rawOffset = #{offset struct FT_Module_Class_, module_size     }
instance Offset "mcModule_name"      FT_Module_Class where rawOffset = #{offset struct FT_Module_Class_, module_name     }
instance Offset "mcModule_version"   FT_Module_Class where rawOffset = #{offset struct FT_Module_Class_, module_version  }
instance Offset "mcModule_requires"  FT_Module_Class where rawOffset = #{offset struct FT_Module_Class_, module_requires }
instance Offset "mcModule_interface" FT_Module_Class where rawOffset = #{offset struct FT_Module_Class_, module_interface}
instance Offset "mcModule_init"      FT_Module_Class where rawOffset = #{offset struct FT_Module_Class_, module_init     }
instance Offset "mcModule_done"      FT_Module_Class where rawOffset = #{offset struct FT_Module_Class_, module_done     }
instance Offset "mcGet_interface"    FT_Module_Class where rawOffset = #{offset struct FT_Module_Class_, get_interface   }

instance Storable FT_Module_Class where
  sizeOf _    = #size      struct FT_Module_Class_
  alignment _ = #alignment struct FT_Module_Class_

  peek ptr =
    FT_Module_Class
      <$> peek (offset @"mcModule_flags"     ptr)
      <*> peek (offset @"mcModule_size"      ptr)
      <*> peek (offset @"mcModule_name"      ptr)
      <*> peek (offset @"mcModule_version"   ptr)
      <*> peek (offset @"mcModule_requires"  ptr)
      <*> peek (offset @"mcModule_interface" ptr)
      <*> peek (offset @"mcModule_init"      ptr)
      <*> peek (offset @"mcModule_done"      ptr)
      <*> peek (offset @"mcGet_interface"    ptr)

  poke ptr val = do
    pokeField @"mcModule_flags"     ptr val
    pokeField @"mcModule_size"      ptr val
    pokeField @"mcModule_name"      ptr val
    pokeField @"mcModule_version"   ptr val
    pokeField @"mcModule_requires"  ptr val
    pokeField @"mcModule_interface" ptr val
    pokeField @"mcModule_init"      ptr val
    pokeField @"mcModule_done"      ptr val
    pokeField @"mcGet_interface"    ptr val



data FT_RendererRec
type FT_Renderer = Ptr FT_RendererRec



data FT_Renderer_RenderFunc

data FT_Renderer_TransformFunc

data FT_Renderer_GetCBoxFunc

data FT_Renderer_SetModeFunc

data FT_Renderer_Class = FT_Renderer_Class
                           { rcRoot            :: FT_Module_Class
                           , rcGlyph_format    :: FT_Glyph_Format
                           , rcRender_glyph    :: FunPtr FT_Renderer_RenderFunc
                           , rcTransform_glyph :: FunPtr FT_Renderer_TransformFunc
                           , rcGet_glyph_cbox  :: FunPtr FT_Renderer_GetCBoxFunc
                           , rcSet_mode        :: FunPtr FT_Renderer_SetModeFunc
                           , rcRaster_class    :: Ptr FT_Raster_Funcs
                           }

instance Offset "rcRoot"            FT_Renderer_Class where rawOffset = #{offset struct FT_Renderer_Class_, root           }
instance Offset "rcGlyph_format"    FT_Renderer_Class where rawOffset = #{offset struct FT_Renderer_Class_, glyph_format   }
instance Offset "rcRender_glyph"    FT_Renderer_Class where rawOffset = #{offset struct FT_Renderer_Class_, render_glyph   }
instance Offset "rcTransform_glyph" FT_Renderer_Class where rawOffset = #{offset struct FT_Renderer_Class_, transform_glyph}
instance Offset "rcGet_glyph_cbox"  FT_Renderer_Class where rawOffset = #{offset struct FT_Renderer_Class_, get_glyph_cbox }
instance Offset "rcSet_mode"        FT_Renderer_Class where rawOffset = #{offset struct FT_Renderer_Class_, set_mode       }
instance Offset "rcRaster_class"    FT_Renderer_Class where rawOffset = #{offset struct FT_Renderer_Class_, raster_class   }


instance Storable FT_Renderer_Class where
  sizeOf _    = #size      struct FT_Renderer_Class_
  alignment _ = #alignment struct FT_Renderer_Class_

  peek ptr =
    FT_Renderer_Class
      <$> peek (offset @"rcRoot"            ptr)
      <*> peek (offset @"rcGlyph_format"    ptr)
      <*> peek (offset @"rcRender_glyph"    ptr)
      <*> peek (offset @"rcTransform_glyph" ptr)
      <*> peek (offset @"rcGet_glyph_cbox"  ptr)
      <*> peek (offset @"rcSet_mode"        ptr)
      <*> peek (offset @"rcRaster_class"    ptr)

  poke ptr val = do
    pokeField @"rcRoot"            ptr val
    pokeField @"rcGlyph_format"    ptr val
    pokeField @"rcRender_glyph"    ptr val
    pokeField @"rcTransform_glyph" ptr val
    pokeField @"rcGet_glyph_cbox"  ptr val
    pokeField @"rcSet_mode"        ptr val
    pokeField @"rcRaster_class"    ptr val



type FT_DebugHook_Func = Ptr ()      -- ^ arg
                      -> IO FT_Error

foreign import ccall "wrapper"
  ft_DebugHook_Func :: FT_DebugHook_Func -> IO (FunPtr FT_DebugHook_Func)

foreign import ccall "dynamic"
  ft_DebugHook_Func' :: FunPtr FT_DebugHook_Func -> FT_DebugHook_Func
