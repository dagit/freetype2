{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

module FreeType.Raw.Support.Module
  ( module FreeType.Raw.Support.Module.Internal
  ) where

import           FreeType.Raw.Support.Module.Internal
import           FreeType.Lens

import           Foreign.Storable
import           Lens.Micro ((^.))

#include "ft2build.h"
#include FT_MODULE_H
#include FT_RENDER_H

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
    #{poke struct FT_Module_Class_, module_flags    } ptr $ val^.module_flags
    #{poke struct FT_Module_Class_, module_size     } ptr $ val^.module_size
    #{poke struct FT_Module_Class_, module_name     } ptr $ val^.module_name
    #{poke struct FT_Module_Class_, module_version  } ptr $ val^.module_version
    #{poke struct FT_Module_Class_, module_requires } ptr $ val^.module_requires
    #{poke struct FT_Module_Class_, module_interface} ptr $ val^.module_interface
    #{poke struct FT_Module_Class_, module_init     } ptr $ val^.module_init
    #{poke struct FT_Module_Class_, module_done     } ptr $ val^.module_done
    #{poke struct FT_Module_Class_, get_interface   } ptr $ val^.get_interface



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
    #{poke struct FT_Renderer_Class_, root           } ptr $ val^.root
    #{poke struct FT_Renderer_Class_, glyph_format   } ptr $ val^.glyph_format
    #{poke struct FT_Renderer_Class_, render_glyph   } ptr $ val^.render_glyph
    #{poke struct FT_Renderer_Class_, transform_glyph} ptr $ val^.transform_glyph
    #{poke struct FT_Renderer_Class_, get_glyph_cbox } ptr $ val^.get_glyph_cbox
    #{poke struct FT_Renderer_Class_, set_mode       } ptr $ val^.set_mode
    #{poke struct FT_Renderer_Class_, raster_class   } ptr $ val^.raster_class
