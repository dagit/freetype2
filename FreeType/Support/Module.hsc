{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE TemplateHaskell #-}

{- | Please refer to the
     [Support API > Module Management](https://www.freetype.org/freetype2/docs/reference/ft2-module_management.html)
     chapter of the reference.

     Internal: "FreeType.Support.Module.Internal".
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

import           FreeType.Core.Base.Types
import           FreeType.Core.Types.Types
import           FreeType.Exception.Internal
import           FreeType.Support.Module.Internal
import           FreeType.Support.Module.Types
import           FreeType.Support.System.Types

import           Foreign.C.String
import           Foreign.Ptr

#include "ft2build.h"
#include FT_MODULE_H
#include FT_RENDER_H

ft_Add_Module
  :: FT_Library          -- ^ library
  -> Ptr FT_Module_Class -- ^ clazz
  -> IO ()
ft_Add_Module =
  autoError "ft_Add_Module" ft_Add_Module'



ft_Get_Module
  :: FT_Library           -- ^ library
  -> String               -- ^ module_name
  -> IO (Maybe FT_Module)
ft_Get_Module lib name =
  withCString name $ \namePtr -> do
    modul <- ft_Get_Module' lib $ castPtr namePtr
    return $ if modul == nullPtr
               then Nothing
               else Just modul



ft_Remove_Module
  :: FT_Library -- ^ library
  -> FT_Module  -- ^ module
  -> IO ()
ft_Remove_Module =
  autoError "ft_Remove_Module" ft_Remove_Module'



foreign import ccall "FT_Add_Default_Modules"
  ft_Add_Default_Modules
    :: FT_Library -- ^ library
    -> IO ()



ft_Property_Set
  :: FT_Library -- ^ library
  -> String     -- ^ module_name
  -> String     -- ^ property_name
  -> Ptr ()     -- ^ value
  -> IO ()
ft_Property_Set lib modul prop valPtr =
  withCString modul $ \modulPtr ->
    withCString prop $ \propPtr ->
      ftError "ft_Property_Set"
        $ ft_Property_Set' lib (castPtr modulPtr) (castPtr propPtr) valPtr



ft_Property_Get
  :: FT_Library -- ^ library
  -> String     -- ^ module_name
  -> String     -- ^ property_name
  -> Ptr ()     -- ^ value
  -> IO ()
ft_Property_Get lib modul prop valPtr =
  withCString modul $ \modulPtr ->
    withCString prop $ \propPtr ->
      ftError "ft_Property_Get"
        $ ft_Property_Get' lib (castPtr modulPtr) (castPtr propPtr) valPtr



foreign import ccall "FT_Set_Default_Properties"
  ft_Set_Default_Properties
    :: FT_Library -- ^ library
    -> IO ()



ft_New_Library
  :: FT_Memory     -- ^ memory
  -> IO FT_Library -- ^ library
ft_New_Library =
  autoAllocaError "ft_New_Library" ft_New_Library'



ft_Done_Library
  :: FT_Library -- ^ library
  -> IO ()
ft_Done_Library =
  autoError "ft_Done_Library" ft_Done_Library'



ft_Reference_Library
  :: FT_Library -- ^ library
  -> IO ()
ft_Reference_Library =
  autoError "ft_Reference_Library" ft_Reference_Library'



ft_Get_Renderer
  :: FT_Library             -- ^ library
  -> FT_Glyph_Format        -- ^ format
  -> IO (Maybe FT_Renderer)
ft_Get_Renderer lib format = do
  renderer <- ft_Get_Renderer' lib format
  return $ if renderer == nullPtr
             then Nothing
             else Just renderer



ft_Set_Renderer
  :: FT_Library       -- ^ library
  -> FT_Renderer      -- ^ renderer
  -> FT_UInt          -- ^ num_params
  -> Ptr FT_Parameter -- ^ parameters
  -> IO ()
ft_Set_Renderer =
  autoError "ft_Set_Renderer" ft_Set_Renderer'



ft_Set_Debug_Hook
  :: FT_Library         -- ^ library
  -> FT_UInt            -- ^ hook_index
  -> FT_DebugHook_Func  -- ^ debug_hook
  -> IO ()
ft_Set_Debug_Hook lib index hook = do
  hookPtr <- ft_DebugHook_Func hook
  ft_Set_Debug_Hook' lib index hookPtr
  freeHaskellFunPtr hookPtr



pattern FT_DEBUG_HOOK_TRUETYPE
     :: (Eq a, Num a) => a
pattern FT_DEBUG_HOOK_TRUETYPE = #const FT_DEBUG_HOOK_TRUETYPE
