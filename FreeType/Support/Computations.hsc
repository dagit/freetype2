{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}

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
import           FreeType.Support.Computations.Internal
import           FreeType.Support.Computations.Types

import           Foreign.Marshal.Alloc
import           Foreign.Marshal.Utils
import           Foreign.Storable
import           System.IO.Unsafe

#include "ft2build.h"
#include FT_FREETYPE_H
#include FT_TRIGONOMETRY_H

foreign import ccall "FT_MulDiv"
  ft_MulDiv :: FT_Long -> FT_Long -> FT_Long -> FT_Long



foreign import ccall "FT_MulFix"
  ft_MulFix :: FT_Long -> FT_Long -> FT_Long



foreign import ccall "FT_DivFix"
  ft_DivFix :: FT_Long -> FT_Long -> FT_Long



foreign import ccall "FT_RoundFix"
  ft_RoundFix :: FT_Fixed -> FT_Fixed



foreign import ccall "FT_CeilFix"
  ft_CeilFix :: FT_Fixed -> FT_Fixed



foreign import ccall "FT_FloorFix"
  ft_FloorFix :: FT_Fixed -> FT_Fixed



ft_Vector_Transform :: FT_Matrix -> FT_Vector -> FT_Vector
ft_Vector_Transform mat vec =
  unsafePerformIO
    . with mat $ \matPtr ->
        with vec $ \vecPtr -> do
          ft_Vector_Transform' vecPtr matPtr
          peek vecPtr



ft_Matrix_Multiply :: FT_Matrix -> FT_Matrix -> FT_Matrix
ft_Matrix_Multiply mat1 mat2 =
  unsafePerformIO
    . with mat1 $ \mat1Ptr ->
        with mat2 $ \mat2Ptr -> do
          ft_Matrix_Multiply' mat1Ptr mat2Ptr
          peek mat2Ptr



ft_Matrix_Invert :: FT_Matrix -> Maybe FT_Matrix
ft_Matrix_Invert mat =
  unsafePerformIO
    . with mat $ \matPtr -> do
        err <- ft_Matrix_Invert' matPtr
        case err of
          0 -> Just <$> peek matPtr
          _ -> return Nothing



pattern FT_ANGLE_PI
      , FT_ANGLE_2PI
      , FT_ANGLE_PI2
      , FT_ANGLE_PI4
     :: FT_Angle
pattern FT_ANGLE_PI  = #const FT_ANGLE_PI
pattern FT_ANGLE_2PI = #const FT_ANGLE_2PI
pattern FT_ANGLE_PI2 = #const FT_ANGLE_PI2
pattern FT_ANGLE_PI4 = #const FT_ANGLE_PI4



foreign import ccall "FT_Sin"
  ft_Sin :: FT_Angle -> FT_Fixed



foreign import ccall "FT_Cos"
  ft_Cos :: FT_Angle -> FT_Fixed



foreign import ccall "FT_Tan"
  ft_Tan :: FT_Angle -> FT_Fixed



foreign import ccall "FT_Atan2"
  ft_Atan2 :: FT_Fixed -> FT_Fixed -> FT_Angle



foreign import ccall "FT_Angle_Diff"
  ft_Angle_Diff :: FT_Angle -> FT_Angle -> FT_Angle



ft_Vector_Unit :: FT_Angle -> FT_Vector
ft_Vector_Unit angle =
  unsafePerformIO $
    alloca $ \ptr -> do
      ft_Vector_Unit' ptr angle
      peek ptr



ft_Vector_Rotate :: FT_Angle -> FT_Vector -> FT_Vector
ft_Vector_Rotate angle vec =
  unsafePerformIO
    . with vec $ \vecPtr -> do
        ft_Vector_Rotate' vecPtr angle
        peek vecPtr



ft_Vector_Length :: FT_Vector -> FT_Fixed
ft_Vector_Length vec =
  unsafePerformIO
    . with vec
        $ ft_Vector_Length'



ft_Vector_Polarize :: FT_Vector -> (FT_Fixed, FT_Angle)
ft_Vector_Polarize vec =
  unsafePerformIO
    . with vec $ \vecPtr ->
        alloca $ \lengthPtr ->
          alloca $ \anglePtr -> do
            ft_Vector_Polarize' vecPtr lengthPtr anglePtr
            (,)
              <$> peek lengthPtr
              <*> peek anglePtr



ft_Vector_From_Polar :: FT_Fixed -> FT_Angle -> FT_Vector
ft_Vector_From_Polar length_ angle =
  unsafePerformIO
    . alloca $ \vecPtr -> do
        ft_Vector_From_Polar' vecPtr length_ angle
        peek vecPtr
