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
  ft_Vector_Transform' :: Ptr FT_Vector -> Ptr FT_Matrix -> IO ()



foreign import ccall "FT_Matrix_Multiply"
  ft_Matrix_Multiply' :: Ptr FT_Matrix -> Ptr FT_Matrix -> IO ()



foreign import ccall "FT_Matrix_Invert"
  ft_Matrix_Invert' :: Ptr FT_Matrix -> IO FT_Error



foreign import ccall "FT_Vector_Unit"
  ft_Vector_Unit' :: Ptr FT_Vector -> FT_Angle -> IO ()



foreign import ccall "FT_Vector_Rotate"
  ft_Vector_Rotate' :: Ptr FT_Vector -> FT_Angle -> IO ()



foreign import ccall "FT_Vector_Length"
  ft_Vector_Length' :: Ptr FT_Vector -> IO FT_Fixed



foreign import ccall "FT_Vector Polarize"
  ft_Vector_Polarize' :: Ptr FT_Vector -> Ptr FT_Fixed -> Ptr FT_Angle -> IO ()



foreign import ccall "FT_Vector_From_Polar"
  ft_Vector_From_Polar' :: Ptr FT_Vector -> FT_Fixed -> FT_Angle -> IO ()
