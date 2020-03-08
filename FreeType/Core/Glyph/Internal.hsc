{-# LANGUAGE ForeignFunctionInterface #-}

module FreeType.Core.Glyph.Internal
  ( -- ** FT_New_Glyph
    ft_New_Glyph'
    -- ** FT_Get_Glyph
  , ft_Get_Glyph'
    -- ** FT_Glyph_Copy
  , ft_Glyph_Copy'
    -- ** FT_Glyph_Transform
  , ft_Glyph_Transform'
    -- ** FT_Glyph_Get_CBox
  , ft_Glyph_Get_CBox'
    -- ** FT_Glyph_To_Bitmap
  , ft_Glyph_To_Bitmap'
  ) where

import           FreeType.Core.Base.Types
import           FreeType.Core.Glyph.Types
import           FreeType.Core.Types.Types

import           Foreign.Ptr

#include "ft2build.h"
#include FT_GLYPH_H

foreign import ccall "FT_New_Glyph"
  ft_New_Glyph' :: FT_Library -> FT_Glyph_Format -> Ptr FT_Glyph -> IO FT_Error



foreign import ccall "FT_Get_Glyph"
  ft_Get_Glyph' :: FT_GlyphSlot -> Ptr FT_Glyph -> IO FT_Error



foreign import ccall "FT_Glyph_Copy"
  ft_Glyph_Copy' :: FT_Glyph -> Ptr FT_Glyph -> IO FT_Error



foreign import ccall "FT_Glyph_Transform"
  ft_Glyph_Transform' :: FT_Glyph -> Ptr FT_Matrix -> Ptr FT_Vector -> IO FT_Error



foreign import ccall "FT_Glyph_Get_CBox"
  ft_Glyph_Get_CBox' :: FT_Glyph -> FT_UInt -> Ptr FT_BBox -> IO ()



foreign import ccall "FT_Glyph_To_Bitmap"
  ft_Glyph_To_Bitmap' :: Ptr FT_Glyph -> FT_Render_Mode -> Ptr FT_Vector -> FT_Bool -> IO FT_Error
