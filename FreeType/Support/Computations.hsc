{-# LANGUAGE ForeignFunctionInterface
           , PatternSynonyms #-}

{- | Please refer to the
     [Support API > Computations](https://www.freetype.org/freetype2/docs/reference/ft2-computations.html)
     chapter of the reference.
 -}

module FreeType.Support.Computations
  ( -- ** FT_MulDiv
    ft_MulDiv
    -- ** FT_MulFix
  , ft_MulFix
    -- ** FT_DivFix
  , ft_DivFix
    -- ** FT_RoundFix
  , ft_RoundFix
    -- ** FT_CeilFix
  , ft_CeilFix
    -- ** FT_FloorFix
  , ft_FloorFix
    -- ** FT_Vector_Transform
  , ft_Vector_Transform
    -- ** FT_Matrix_Multiply
  , ft_Matrix_Multiply
    -- ** FT_Matrix_Invert
  , ft_Matrix_Invert
    -- ** FT_Angle
  , FT_Angle
    -- ** FT_ANGLE_PI
  , pattern FT_ANGLE_PI
    -- ** FT_ANGLE_2PI
  , pattern FT_ANGLE_2PI
    -- ** FT_ANGLE_PI2
  , pattern FT_ANGLE_PI2
    -- ** FT_ANGLE_PI4
  , pattern FT_ANGLE_PI4
    -- ** FT_Sin
  , ft_Sin
    -- ** FT_Cos
  , ft_Cos
    -- ** FT_Tan
  , ft_Tan
    -- ** FT_Atan2
  , ft_Atan2
    -- ** FT_Angle_Diff
  , ft_Angle_Diff
    -- ** FT_Vector_Unit
  , ft_Vector_Unit
    -- ** FT_Vector_Rotate
  , ft_Vector_Rotate
    -- ** FT_Vector_Length
  , ft_Vector_Length
    -- ** FT_Vector_Polarize
  , ft_Vector_Polarize
    -- ** FT_Vector_From_Polar
  , ft_Vector_From_Polar
  ) where

import           FreeType.Core.Types.Types
import           FreeType.Support.Computations.Types

import           Foreign.Ptr

#include "ft2build.h"
#include FT_FREETYPE_H
#include FT_TRIGONOMETRY_H

foreign import ccall unsafe "FT_MulDiv"
  ft_MulDiv
    :: FT_Long -- ^ a
    -> FT_Long -- ^ b
    -> FT_Long -- ^ c
    -> FT_Long



foreign import ccall unsafe "FT_MulFix"
  ft_MulFix
    :: FT_Long -- ^ a
    -> FT_Long -- ^ b
    -> FT_Long



foreign import ccall unsafe "FT_DivFix"
  ft_DivFix
    :: FT_Long -- ^ a
    -> FT_Long -- ^ b
    -> FT_Long



foreign import ccall unsafe "FT_RoundFix"
  ft_RoundFix
    :: FT_Fixed -- ^ a
    -> FT_Fixed



foreign import ccall unsafe "FT_CeilFix"
  ft_CeilFix
    :: FT_Fixed -- ^ a
    -> FT_Fixed



foreign import ccall unsafe "FT_FloorFix"
  ft_FloorFix
    :: FT_Fixed -- ^ a
    -> FT_Fixed



foreign import ccall unsafe "FT_Vector_Transform"
  ft_Vector_Transform
    :: Ptr FT_Vector -- ^ vector
    -> Ptr FT_Matrix -- ^ matrix
    -> IO ()



foreign import ccall unsafe "FT_Matrix_Multiply"
  ft_Matrix_Multiply
    :: Ptr FT_Matrix -- ^ a
    -> Ptr FT_Matrix -- ^ b
    -> IO ()



foreign import ccall unsafe "FT_Matrix_Invert"
  ft_Matrix_Invert
    :: Ptr FT_Matrix -- ^ matrix
    -> IO FT_Error



pattern FT_ANGLE_PI
      , FT_ANGLE_2PI
      , FT_ANGLE_PI2
      , FT_ANGLE_PI4
     :: (Eq a, Num a) => a
pattern FT_ANGLE_PI  = #const FT_ANGLE_PI
pattern FT_ANGLE_2PI = #const FT_ANGLE_2PI
pattern FT_ANGLE_PI2 = #const FT_ANGLE_PI2
pattern FT_ANGLE_PI4 = #const FT_ANGLE_PI4



foreign import ccall unsafe "FT_Sin"
  ft_Sin
    :: FT_Angle -- ^ angle
    -> FT_Fixed



foreign import ccall unsafe "FT_Cos"
  ft_Cos
    :: FT_Angle -- ^ angle
    -> FT_Fixed



foreign import ccall unsafe "FT_Tan"
  ft_Tan
    :: FT_Angle -- ^ angle
    -> FT_Fixed



foreign import ccall unsafe "FT_Atan2"
  ft_Atan2
    :: FT_Fixed -- ^ x
    -> FT_Fixed -- ^ y
    -> FT_Angle



foreign import ccall unsafe "FT_Angle_Diff"
  ft_Angle_Diff
    :: FT_Angle -- ^ angle1
    -> FT_Angle -- ^ angle2
    -> FT_Angle



foreign import ccall unsafe "FT_Vector_Unit"
  ft_Vector_Unit
    :: Ptr FT_Vector -- ^ vec
    -> FT_Angle      -- ^ angle
    -> IO ()



foreign import ccall unsafe "FT_Vector_Rotate"
  ft_Vector_Rotate
    :: Ptr FT_Vector -- ^ vec
    -> FT_Angle      -- ^ angle
    -> IO ()



foreign import ccall unsafe "FT_Vector_Length"
  ft_Vector_Length
    :: Ptr FT_Vector -- ^ vec
    -> IO FT_Fixed



foreign import ccall unsafe "FT_Vector_Polarize"
  ft_Vector_Polarize
    :: Ptr FT_Vector -- ^ vec
    -> Ptr FT_Fixed  -- ^ length
    -> Ptr FT_Angle  -- ^ angle
    -> IO ()



foreign import ccall unsafe "FT_Vector_From_Polar"
  ft_Vector_From_Polar
    :: Ptr FT_Vector -- ^ vec
    -> FT_Fixed      -- ^ length
    -> FT_Angle      -- ^ angle
    -> IO ()
