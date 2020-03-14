{-# LANGUAGE ForeignFunctionInterface #-}

module FreeType.Support.Computations.Internal
  ( -- ** FT_Vector_Transform
    ft_Vector_Transform'
    -- ** FT_Matrix_Multiply
  , ft_Matrix_Multiply'
    -- ** FT_Matrix_Invert
  , ft_Matrix_Invert'
    -- ** FT_Vector_Unit
  , ft_Vector_Unit'
    -- ** FT_Vector_Rotate
  , ft_Vector_Rotate'
    -- ** FT_Vector_Length
  , ft_Vector_Length'
    -- ** FT_Vector_Polarize
  , ft_Vector_Polarize'
    -- ** FT_Vector_From_Polar
  , ft_Vector_From_Polar'
  ) where

import           FreeType.Core.Types.Types
import           FreeType.Support.Computations.Types

import           Foreign.Ptr

#include "ft2build.h"
#include FT_FREETYPE_H
#include FT_TRIGONOMETRY_H

foreign import ccall "FT_Vector_Transform"
  ft_Vector_Transform'
    :: Ptr FT_Vector -- ^ vector
    -> Ptr FT_Matrix -- ^ matrix
    -> IO ()



foreign import ccall "FT_Matrix_Multiply"
  ft_Matrix_Multiply'
    :: Ptr FT_Matrix -- ^ a
    -> Ptr FT_Matrix -- ^ b
    -> IO ()



foreign import ccall "FT_Matrix_Invert"
  ft_Matrix_Invert'
    :: Ptr FT_Matrix -- ^ matrix
    -> IO FT_Error



foreign import ccall "FT_Vector_Unit"
  ft_Vector_Unit'
    :: Ptr FT_Vector -- ^ vec
    -> FT_Angle      -- ^ angle
    -> IO ()



foreign import ccall "FT_Vector_Rotate"
  ft_Vector_Rotate'
    :: Ptr FT_Vector -- ^ vec
    -> FT_Angle      -- ^ angle
    -> IO ()



foreign import ccall "FT_Vector_Length"
  ft_Vector_Length'
    :: Ptr FT_Vector -- ^ vec
    -> IO FT_Fixed



foreign import ccall "FT_Vector_Polarize"
  ft_Vector_Polarize'
    :: Ptr FT_Vector -- ^ vec
    -> Ptr FT_Fixed  -- ^ length
    -> Ptr FT_Angle  -- ^ angle
    -> IO ()



foreign import ccall "FT_Vector_From_Polar"
  ft_Vector_From_Polar'
    :: Ptr FT_Vector -- ^ vec
    -> FT_Fixed      -- ^ length
    -> FT_Angle      -- ^ angle
    -> IO ()
