{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}

module FreeType.Raw.Support.Computations where

import           FreeType.Raw.Core.Types

import           Foreign.C.Types
import           Foreign.Ptr

#include "ft2build.h"
#include FT_FREETYPE_H

#include "freetype/fttrigon.h"

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



foreign import ccall "FT_Vector_Transform"
  ft_Vector_Transform :: Ptr FT_Vector -> Ptr FT_Matrix -> IO ()



foreign import ccall "FT_Matrix_Multiply"
  ft_Matrix_Multiply :: Ptr FT_Matrix -> Ptr FT_Matrix -> IO ()



foreign import ccall "FT_Matrix_Invert"
  ft_Matrix_Invert :: Ptr FT_Matrix -> IO FT_Error



type FT_Angle = FT_UInt

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



foreign import ccall "FT_Vector_Unit"
  ft_Vector_Unit :: Ptr FT_Vector -> FT_Angle -> IO ()



foreign import ccall "FT_Vector_Rotate"
  ft_Vector_Rotate :: Ptr FT_Vector -> FT_Angle -> IO ()



foreign import ccall "FT_Vector_Length"
  ft_Vector_Length :: Ptr FT_Vector -> IO FT_Fixed



foreign import ccall "FT_Vector Polarize"
  ft_Vector_Polarize :: Ptr FT_Vector -> FT_Fixed -> FT_Angle -> IO ()



foreign import ccall "FT_Vector_From_Polar"
  ft_Vector_From_Polar :: Ptr FT_Vector -> FT_Fixed -> FT_Angle -> IO ()
