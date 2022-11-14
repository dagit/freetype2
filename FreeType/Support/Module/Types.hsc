{-# LANGUAGE DataKinds
           , DuplicateRecordFields
           , EmptyDataDecls
           , ForeignFunctionInterface
           , MultiParamTypeClasses #-}
#if __GLASGOW_HASKELL__ >= 902
{-# LANGUAGE NoFieldSelectors #-}
#endif
{-# LANGUAGE TypeApplications #-}

module FreeType.Support.Module.Types
  ( module FreeType.Support.Module.Types
  , FT_Module
  , FT_ModuleRec
  , FT_Driver
  , FT_DriverRec
  ) where

import           FreeType.Circular.Types
import           FreeType.Core.Types.Types
import           FreeType.Support.Scanline.Types

#ifdef aarch64_HOST_ARCH
import           Data.Word
#else
import           Data.Int
#endif
import           Foreign.Ptr
import           Foreign.Storable
import           Foreign.Storable.Offset

#include "ft2build.h"
#include FT_MODULE_H
#include FT_RENDER_H

type FT_Module_Constructor = FT_Module   -- ^ module
                          -> IO FT_Error



type FT_Module_Destructor = FT_Module -- ^ module
                         -> IO ()



type FT_Module_Interface = FT_Pointer

type FT_Module_Requester = FT_Module              -- ^ module
                        -> Ptr #{type char}       -- ^ name
                        -> IO FT_Module_Interface




data FT_Module_Class = FT_Module_Class
                         { module_flags     :: FT_ULong
                         , module_size      :: FT_Long
                         , module_name      :: Ptr FT_String
                         , module_version   :: FT_Fixed
                         , module_requires  :: FT_Fixed
                         , module_interface :: Ptr ()
                         , module_init      :: FunPtr FT_Module_Constructor
                         , module_done      :: FunPtr FT_Module_Destructor
                         , get_interface    :: FunPtr FT_Module_Requester
                         }

instance Offset "module_flags"     FT_Module_Class where rawOffset = #{offset struct FT_Module_Class_, module_flags    }
instance Offset "module_size"      FT_Module_Class where rawOffset = #{offset struct FT_Module_Class_, module_size     }
instance Offset "module_name"      FT_Module_Class where rawOffset = #{offset struct FT_Module_Class_, module_name     }
instance Offset "module_version"   FT_Module_Class where rawOffset = #{offset struct FT_Module_Class_, module_version  }
instance Offset "module_requires"  FT_Module_Class where rawOffset = #{offset struct FT_Module_Class_, module_requires }
instance Offset "module_interface" FT_Module_Class where rawOffset = #{offset struct FT_Module_Class_, module_interface}
instance Offset "module_init"      FT_Module_Class where rawOffset = #{offset struct FT_Module_Class_, module_init     }
instance Offset "module_done"      FT_Module_Class where rawOffset = #{offset struct FT_Module_Class_, module_done     }
instance Offset "get_interface"    FT_Module_Class where rawOffset = #{offset struct FT_Module_Class_, get_interface   }

instance Storable FT_Module_Class where
  sizeOf _    = #size      struct FT_Module_Class_
  alignment _ = #alignment struct FT_Module_Class_

  peek ptr =
    FT_Module_Class
      <$> peek (offset @"module_flags"     ptr)
      <*> peek (offset @"module_size"      ptr)
      <*> peek (offset @"module_name"      ptr)
      <*> peek (offset @"module_version"   ptr)
      <*> peek (offset @"module_requires"  ptr)
      <*> peek (offset @"module_interface" ptr)
      <*> peek (offset @"module_init"      ptr)
      <*> peek (offset @"module_done"      ptr)
      <*> peek (offset @"get_interface"    ptr)

  poke ptr val = do
    pokeField @"module_flags"     ptr val
    pokeField @"module_size"      ptr val
    pokeField @"module_name"      ptr val
    pokeField @"module_version"   ptr val
    pokeField @"module_requires"  ptr val
    pokeField @"module_interface" ptr val
    pokeField @"module_init"      ptr val
    pokeField @"module_done"      ptr val
    pokeField @"get_interface"    ptr val



data FT_RendererRec
type FT_Renderer = Ptr FT_RendererRec



data FT_Renderer_RenderFunc

data FT_Renderer_TransformFunc

data FT_Renderer_GetCBoxFunc

data FT_Renderer_SetModeFunc

data FT_Renderer_Class = FT_Renderer_Class
                           { root            :: FT_Module_Class
                           , glyph_format    :: FT_Glyph_Format
                           , render_glyph    :: FunPtr FT_Renderer_RenderFunc
                           , transform_glyph :: FunPtr FT_Renderer_TransformFunc
                           , get_glyph_cbox  :: FunPtr FT_Renderer_GetCBoxFunc
                           , set_mode        :: FunPtr FT_Renderer_SetModeFunc
                           , raster_class    :: Ptr FT_Raster_Funcs
                           }

instance Offset "root"            FT_Renderer_Class where rawOffset = #{offset struct FT_Renderer_Class_, root           }
instance Offset "glyph_format"    FT_Renderer_Class where rawOffset = #{offset struct FT_Renderer_Class_, glyph_format   }
instance Offset "render_glyph"    FT_Renderer_Class where rawOffset = #{offset struct FT_Renderer_Class_, render_glyph   }
instance Offset "transform_glyph" FT_Renderer_Class where rawOffset = #{offset struct FT_Renderer_Class_, transform_glyph}
instance Offset "get_glyph_cbox"  FT_Renderer_Class where rawOffset = #{offset struct FT_Renderer_Class_, get_glyph_cbox }
instance Offset "set_mode"        FT_Renderer_Class where rawOffset = #{offset struct FT_Renderer_Class_, set_mode       }
instance Offset "raster_class"    FT_Renderer_Class where rawOffset = #{offset struct FT_Renderer_Class_, raster_class   }


instance Storable FT_Renderer_Class where
  sizeOf _    = #size      struct FT_Renderer_Class_
  alignment _ = #alignment struct FT_Renderer_Class_

  peek ptr =
    FT_Renderer_Class
      <$> peek (offset @"root"            ptr)
      <*> peek (offset @"glyph_format"    ptr)
      <*> peek (offset @"render_glyph"    ptr)
      <*> peek (offset @"transform_glyph" ptr)
      <*> peek (offset @"get_glyph_cbox"  ptr)
      <*> peek (offset @"set_mode"        ptr)
      <*> peek (offset @"raster_class"    ptr)

  poke ptr val = do
    pokeField @"root"            ptr val
    pokeField @"glyph_format"    ptr val
    pokeField @"render_glyph"    ptr val
    pokeField @"transform_glyph" ptr val
    pokeField @"get_glyph_cbox"  ptr val
    pokeField @"set_mode"        ptr val
    pokeField @"raster_class"    ptr val



type FT_DebugHook_Func = Ptr ()      -- ^ arg
                      -> IO FT_Error
