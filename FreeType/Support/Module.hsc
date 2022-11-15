{-# LANGUAGE DataKinds
           , ForeignFunctionInterface
           , PatternSynonyms
           , TypeApplications #-}

{- | Please refer to the
     [Support API > Module Management](https://www.freetype.org/freetype2/docs/reference/ft2-module_management.html)
     chapter of the reference.
 -}

module FreeType.Support.Module
  ( -- ** FT_Module
    FT_Module
    -- ** FT_Module_Constructor
  , FT_Module_Constructor
    -- ** FT_Module_Destructor
  , FT_Module_Destructor
    -- ** FT_Module_Requester
  , FT_Module_Requester
  , FT_Module_Interface
    -- ** FT_Module_Class
  , FT_Module_Class (..)
    -- ** FT_Add_Module
  , ft_Add_Module
    -- ** FT_Get_Module
  , ft_Get_Module
    -- ** FT_Remove_Module
  , ft_Remove_Module
    -- ** FT_Add_Default_Modules
  , ft_Add_Default_Modules
    -- ** FT_FACE_DRIVER_NAME
  , pattern FT_FACE_DRIVER_NAME
    -- ** FT_Property_Set
  , ft_Property_Set
    -- ** FT_Property_Get
  , ft_Property_Get
    -- ** FT_Set_Default_Properties
  , ft_Set_Default_Properties
    -- ** FT_New_Library
  , ft_New_Library
    -- ** FT_Done_Library
  , ft_Done_Library
    -- ** FT_Reference_Library
  , ft_Reference_Library
    -- ** FT_Renderer
  , FT_Renderer
    -- ** FT_Renderer_Class
  , FT_Renderer_Class (..)
    -- ** FT_Get_Renderer
  , ft_Get_Renderer
    -- ** FT_Set_Renderer
  , ft_Set_Renderer
    -- ** FT_Set_Debug_Hook
  , ft_Set_Debug_Hook
    -- ** FT_Driver
  , FT_Driver
    -- ** FT_DebugHook_Func
  , FT_DebugHook_Func
    -- ** FT_DEBUG_HOOK_XXX
  , pattern FT_DEBUG_HOOK_TRUETYPE
  ) where

import           FreeType.Circular.Types
import           FreeType.Core.Base.Types
import           FreeType.Core.Types.Types
import           FreeType.Support.Module.Types

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



foreign import ccall "FT_Add_Module"
  ft_Add_Module
    :: FT_Library          -- ^ library
    -> Ptr FT_Module_Class -- ^ clazz
    -> IO FT_Error



foreign import ccall "FT_Get_Module"
  ft_Get_Module
    :: FT_Library       -- ^ library
    -> Ptr #{type char} -- ^ module_name
    -> IO FT_Module



foreign import ccall "FT_Remove_Module"
  ft_Remove_Module
    :: FT_Library  -- ^ library
    -> FT_Module   -- ^ module
    -> IO FT_Error



foreign import ccall "FT_Add_Default_Modules"
  ft_Add_Default_Modules
    :: FT_Library -- ^ library
    -> IO ()



pattern FT_FACE_DRIVER_NAME :: FT_Face -> IO (Ptr FT_String)
pattern FT_FACE_DRIVER_NAME <- _
  where
    FT_FACE_DRIVER_NAME fac = do
      drivr <- peek $ castPtr (offset @"driver" fac) :: IO (Ptr FT_Module_Class)
      peek $ offset @"module_name" drivr



foreign import ccall "FT_Property_Set"
  ft_Property_Set
    :: FT_Library    -- ^ library
    -> Ptr FT_String -- ^ module_name
    -> Ptr FT_String -- ^ property_name
    -> Ptr ()        -- ^ value
    -> IO FT_Error



foreign import ccall "FT_Property_Get"
  ft_Property_Get
    :: FT_Library    -- ^ library
    -> Ptr FT_String -- ^ module_name
    -> Ptr FT_String -- ^ property_name
    -> Ptr ()        -- ^ value
    -> IO FT_Error



foreign import ccall "FT_Set_Default_Properties"
  ft_Set_Default_Properties
    :: FT_Library -- ^ library
    -> IO ()



foreign import ccall "FT_New_Library"
  ft_New_Library
    :: FT_Memory      -- ^ memory
    -> Ptr FT_Library -- ^ alibrary
    -> IO FT_Error



foreign import ccall "FT_Done_Library"
  ft_Done_Library
    :: FT_Library  -- ^ library
    -> IO FT_Error



foreign import ccall "FT_Reference_Library"
  ft_Reference_Library
    :: FT_Library  -- ^ library
    -> IO FT_Error



foreign import ccall "FT_Get_Renderer"
  ft_Get_Renderer
    :: FT_Library      -- ^ library
    -> FT_Glyph_Format -- ^ format
    -> IO FT_Renderer



foreign import ccall "FT_Set_Renderer"
  ft_Set_Renderer
    :: FT_Library       -- ^ library
    -> FT_Renderer      -- ^ renderer
    -> FT_UInt          -- ^ num_params
    -> Ptr FT_Parameter -- ^ parameters
    -> IO FT_Error



foreign import ccall "FT_Set_Debug_Hook"
  ft_Set_Debug_Hook
    :: FT_Library               -- ^ library
    -> FT_UInt                  -- ^ hook_index
    -> FunPtr FT_DebugHook_Func -- ^ debug_hook
    -> IO ()



pattern FT_DEBUG_HOOK_TRUETYPE
     :: (Eq a, Num a) => a
pattern FT_DEBUG_HOOK_TRUETYPE = #const FT_DEBUG_HOOK_TRUETYPE
