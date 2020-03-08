{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}

module FreeType.Support.Outline.Internal
  ( -- ** FT_Outline_New
    ft_Outline_New'
    -- ** FT_Outline_Done
  , ft_Outline_Done'
    -- ** FT_Outline_Copy
  , ft_Outline_Copy'
    -- ** FT_Outline_Transform
  , ft_Outline_Transform'
    -- ** FT_Outline_Embolden
  , ft_Outline_Embolden'
    -- ** FT_Outline_EmboldenXY
  , ft_Outline_EmboldenXY'
    -- ** FT_Outline_Check
  , ft_Outline_Check'
    -- ** FT_Outline_Get_CBox
  , ft_Outline_Get_CBox'
    -- ** FT_Outline_Get_BBox
  , ft_Outline_Get_BBox'
    -- ** FT_Outline_Get_Bitmap
  , ft_Outline_Get_Bitmap'
    -- ** FT_Outline_Render
  , ft_Outline_Render'
    -- ** FT_Outline_Decompose
  , ft_Outline_Decompose'
    -- ** FT_Outline_Funcs
  , FT_Outline_Funcs'
    -- ** FT_Outline_MoveToFunc
  , ft_Outline_MoveToFunc
  , ft_Outline_MoveToFunc'
    -- ** FT_Outline_LineToFunc
  , ft_Outline_LineToFunc
  , ft_Outline_LineToFunc'
    -- ** FT_Outline_ConicToFunc
  , ft_Outline_ConicToFunc
  , ft_Outline_ConicToFunc'
    -- ** FT_Outline_CubicToFunc
  , ft_Outline_CubicToFunc
  , ft_Outline_CubicToFunc'
  ) where

import           FreeType.Circular.Types
import           FreeType.Core.Types.Types
import           FreeType.Support.Outline.Types
import           FreeType.Support.Scanline.Types

import           Foreign.Ptr

#include "ft2build.h"
#include FT_IMAGE_H
#include FT_OUTLINE_H

foreign import ccall "FT_Outline_New"
  ft_Outline_New' :: FT_Library -> FT_UInt -> FT_Int -> Ptr FT_Outline -> IO FT_Error



foreign import ccall "FT_Outline_Done"
  ft_Outline_Done' :: FT_Library -> Ptr FT_Outline -> IO FT_Error



foreign import ccall "FT_Outline_Copy"
  ft_Outline_Copy' :: Ptr FT_Outline -> Ptr FT_Outline -> IO FT_Error



foreign import ccall "FT_Outline_Transform"
  ft_Outline_Transform' :: Ptr FT_Outline -> Ptr FT_Matrix -> IO ()



foreign import ccall "FT_Outline_Embolden"
  ft_Outline_Embolden' :: Ptr FT_Outline -> FT_Pos -> IO FT_Error



foreign import ccall "FT_Outline_EmboldenXY"
  ft_Outline_EmboldenXY' :: Ptr FT_Outline -> FT_Pos -> FT_Pos -> IO FT_Error



foreign import ccall "FT_Outline_Check"
  ft_Outline_Check' :: Ptr FT_Outline -> IO FT_Error



foreign import ccall "FT_Outline_Get_CBox"
  ft_Outline_Get_CBox' :: Ptr FT_Outline -> Ptr FT_BBox -> IO ()



foreign import ccall "FT_Outline_Get_BBox"
  ft_Outline_Get_BBox' :: Ptr FT_Outline -> Ptr FT_BBox -> IO FT_Error



foreign import ccall "FT_Outline_Get_Bitmap"
  ft_Outline_Get_Bitmap' :: FT_Library -> Ptr FT_Outline -> Ptr FT_Bitmap -> IO FT_Error



foreign import ccall "FT_Outline_Render"
  ft_Outline_Render' :: FT_Library -> Ptr FT_Outline -> Ptr FT_Raster_Params -> IO FT_Error



foreign import ccall "FT_Outline_Decompose"
  ft_Outline_Decompose' :: Ptr FT_Outline -> Ptr FT_Outline_Funcs -> Ptr () -> IO FT_Error
