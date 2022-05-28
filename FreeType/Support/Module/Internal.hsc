{-# LANGUAGE ForeignFunctionInterface #-}

module FreeType.Support.Module.Internal
  ( FT_ModuleRec
  , FT_RendererRec
  , FT_Renderer_RenderFunc
  , FT_Renderer_TransformFunc
  , FT_Renderer_GetCBoxFunc
  , FT_Renderer_SetModeFunc
  , FT_DriverRec
    -- ** FT_Add_Module
  , ft_Add_Module'
    -- ** FT_Get_Module
  , ft_Get_Module'
    -- ** FT_Remove_Module
  , ft_Remove_Module'
    -- ** FT_Property_Set
  , ft_Property_Set'
    -- ** FT_Property_Get
  , ft_Property_Get'
    -- ** FT_New_Library
  , ft_New_Library'
    -- ** FT_Done_Library
  , ft_Done_Library'
    -- ** FT_Reference_Library
  , ft_Reference_Library'
    -- ** FT_Get_Renderer
  , ft_Get_Renderer'
    -- ** FT_Set_Renderer
  , ft_Set_Renderer'
    -- ** FT_Set_Debug_Hook
  , ft_Set_Debug_Hook'
  ) where

import           FreeType.Core.Base.Types
import           FreeType.Core.Types.Types
import           FreeType.Support.Module.Types
import           FreeType.Support.System.Types

import           Data.Int
import           Foreign.Ptr

#include "ft2build.h"
#include FT_MODULE_H
#include FT_RENDER_H

foreign import ccall "FT_Add_Module"
  ft_Add_Module'
    :: FT_Library          -- ^ library
    -> Ptr FT_Module_Class -- ^ clazz
    -> IO FT_Error



foreign import ccall "FT_Get_Module"
  ft_Get_Module'
    :: FT_Library       -- ^ library
    -> Ptr #{type char} -- ^ module_name
    -> IO FT_Module



foreign import ccall "FT_Remove_Module"
  ft_Remove_Module'
    :: FT_Library  -- ^ library
    -> FT_Module   -- ^ module
    -> IO FT_Error



foreign import ccall "FT_Property_Set"
  ft_Property_Set'
    :: FT_Library    -- ^ library
    -> Ptr FT_String -- ^ module_name
    -> Ptr FT_String -- ^ property_name
    -> Ptr ()        -- ^ value
    -> IO FT_Error



foreign import ccall "FT_Property_Get"
  ft_Property_Get'
    :: FT_Library    -- ^ library
    -> Ptr FT_String -- ^ module_name
    -> Ptr FT_String -- ^ property_name
    -> Ptr ()        -- ^ value
    -> IO FT_Error



foreign import ccall "FT_New_Library"
  ft_New_Library'
    :: FT_Memory      -- ^ memory
    -> Ptr FT_Library -- ^ alibrary
    -> IO FT_Error



foreign import ccall "FT_Done_Library"
  ft_Done_Library'
    :: FT_Library  -- ^ library
    -> IO FT_Error



foreign import ccall "FT_Reference_Library"
  ft_Reference_Library'
    :: FT_Library  -- ^ library
    -> IO FT_Error



foreign import ccall "FT_Get_Renderer"
  ft_Get_Renderer'
    :: FT_Library      -- ^ library
    -> FT_Glyph_Format -- ^ format
    -> IO FT_Renderer



foreign import ccall "FT_Set_Renderer"
  ft_Set_Renderer'
    :: FT_Library       -- ^ library
    -> FT_Renderer      -- ^ renderer
    -> FT_UInt          -- ^ num_params
    -> Ptr FT_Parameter -- ^ parameters
    -> IO FT_Error



foreign import ccall "FT_Set_Debug_Hook"
  ft_Set_Debug_Hook'
    :: FT_Library               -- ^ library
    -> FT_UInt                  -- ^ hook_index
    -> FunPtr FT_DebugHook_Func -- ^ debug_hook
    -> IO ()
