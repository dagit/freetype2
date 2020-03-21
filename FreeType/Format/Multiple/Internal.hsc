{-# LANGUAGE ForeignFunctionInterface #-}

module FreeType.Format.Multiple.Internal
  ( -- ** FT_Get_Multi_Master
    ft_Get_Multi_Master'
    -- ** FT_Get_MM_Var
  , ft_Get_MM_Var'
    -- ** FT_Done_MM_Var
  , ft_Done_MM_Var'
    -- ** FT_Set_MM_Design_Coordinates
  , ft_Set_MM_Design_Coordinates'
    -- ** FT_Set_Var_Design_Coordinates
  , ft_Set_Var_Design_Coordinates'
    -- ** FT_Get_Var_Design_Coordinates
  , ft_Get_Var_Design_Coordinates'
    -- ** FT_Set_MM_Blend_Coordinates
  , ft_Set_MM_Blend_Coordinates'
    -- ** FT_Get_MM_Blend_Coordinates
  , ft_Get_MM_Blend_Coordinates'
    -- ** FT_Set_Var_Blend_Coordinates
  , ft_Set_Var_Blend_Coordinates'
    -- ** FT_Get_Var_Blend_Coordinates
  , ft_Get_Var_Blend_Coordinates'
    -- ** FT_Set_MM_WeightVector
  , ft_Set_MM_WeightVector'
    -- ** FT_Get_MM_WeightVector
  , ft_Get_MM_WeightVector'
    -- ** FT_Get_Var_Axis_Flags
  , ft_Get_Var_Axis_Flags'
    -- ** FT_Set_Named_Instance
  , ft_Set_Named_Instance'
  ) where

import           FreeType.Core.Base.Types
import           FreeType.Core.Types.Types
import           FreeType.Format.Multiple.Types

import           Foreign.Ptr

#include "ft2build.h"
#include FT_MULTIPLE_MASTERS_H

foreign import ccall "FT_Get_Multi_Master"
  ft_Get_Multi_Master'
    :: FT_Face             -- ^ face
    -> Ptr FT_Multi_Master -- ^ amaster
    -> IO FT_Error



foreign import ccall "FT_Get_MM_Var"
  ft_Get_MM_Var'
    :: FT_Face             -- ^ face
    -> Ptr (Ptr FT_MM_Var) -- ^ amaster
    -> IO FT_Error



foreign import ccall "FT_Done_MM_Var"
  ft_Done_MM_Var'
    :: FT_Library    -- ^ library
    -> Ptr FT_MM_Var -- ^ amaster
    -> IO FT_Error



foreign import ccall "FT_Set_MM_Design_Coordinates"
  ft_Set_MM_Design_Coordinates'
    :: FT_Face     -- ^ face
    -> FT_UInt     -- ^ num_coords
    -> Ptr FT_Long -- ^ coords
    -> IO FT_Error



foreign import ccall "FT_Set_Var_Design_Coordinates"
  ft_Set_Var_Design_Coordinates'
    :: FT_Face      -- ^ face
    -> FT_UInt      -- ^ num_coords
    -> Ptr FT_Fixed -- ^ coords
    -> IO FT_Error



foreign import ccall "FT_Get_Var_Design_Coordinates"
  ft_Get_Var_Design_Coordinates'
    :: FT_Face      -- ^ face
    -> FT_UInt      -- ^ num_coords
    -> Ptr FT_Fixed -- ^ coords
    -> IO FT_Error



foreign import ccall "FT_Set_MM_Blend_Coordinates"
  ft_Set_MM_Blend_Coordinates'
    :: FT_Face      -- ^ face
    -> FT_UInt      -- ^ num_coords
    -> Ptr FT_Fixed -- ^ coords
    -> IO FT_Error



foreign import ccall "FT_Get_MM_Blend_Coordinates"
  ft_Get_MM_Blend_Coordinates'
    :: FT_Face      -- ^ face
    -> FT_UInt      -- ^ num_coords
    -> Ptr FT_Fixed -- ^ coords
    -> IO FT_Error



foreign import ccall "FT_Set_Var_Blend_Coordinates"
  ft_Set_Var_Blend_Coordinates'
    :: FT_Face      -- ^ face
    -> FT_UInt      -- ^ num_coords
    -> Ptr FT_Fixed -- ^ coords
    -> IO FT_Error



foreign import ccall "FT_Get_Var_Blend_Coordinates"
  ft_Get_Var_Blend_Coordinates'
    :: FT_Face      -- ^ face
    -> FT_UInt      -- ^ num_coords
    -> Ptr FT_Fixed -- ^ coords
    -> IO FT_Error



foreign import ccall "FT_Set_MM_WeightVector"
  ft_Set_MM_WeightVector'
    :: FT_Face      -- ^ face
    -> FT_UInt      -- ^ len
    -> Ptr FT_Fixed -- ^ weightvector
    -> IO FT_Error



foreign import ccall "FT_Get_MM_WeightVector"
  ft_Get_MM_WeightVector'
    :: FT_Face      -- ^ face
    -> Ptr FT_UInt  -- ^ len
    -> Ptr FT_Fixed -- ^ weightvector
    -> IO FT_Error



foreign import ccall "FT_Get_Var_Axis_Flags"
  ft_Get_Var_Axis_Flags'
    :: Ptr FT_MM_Var -- ^ master
    -> FT_UInt       -- ^ axis_index
    -> Ptr FT_UInt   -- ^ flags
    -> IO FT_Error



foreign import ccall "FT_Set_Named_Instance"
  ft_Set_Named_Instance'
    :: FT_Face     -- ^ face
    -> FT_UInt     -- ^ instance_index
    -> IO FT_Error
