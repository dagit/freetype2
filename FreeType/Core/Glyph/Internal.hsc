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
  ft_New_Glyph'
    :: FT_Library      -- ^ library
    -> FT_Glyph_Format -- ^ format
    -> Ptr FT_Glyph    -- ^ aglyph
    -> IO FT_Error



foreign import ccall "FT_Get_Glyph"
  ft_Get_Glyph'
    :: FT_GlyphSlot -- ^ slot
    -> Ptr FT_Glyph -- ^ aglyph
    -> IO FT_Error



foreign import ccall "FT_Glyph_Copy"
  ft_Glyph_Copy'
    :: FT_Glyph     -- ^ source
    -> Ptr FT_Glyph -- ^ target
    -> IO FT_Error



foreign import ccall "FT_Glyph_Transform"
  ft_Glyph_Transform'
    :: FT_Glyph      -- ^ glyph
    -> Ptr FT_Matrix -- ^ matrix
    -> Ptr FT_Vector -- ^ delta
    -> IO FT_Error



foreign import ccall "FT_Glyph_Get_CBox"
  ft_Glyph_Get_CBox'
    :: FT_Glyph    -- ^ glyph
    -> FT_UInt     -- ^ bbox_mode
    -> Ptr FT_BBox -- ^ acbox
    -> IO ()



foreign import ccall "FT_Glyph_To_Bitmap"
  ft_Glyph_To_Bitmap'
    :: Ptr FT_Glyph   -- ^ the_glyph
    -> FT_Render_Mode -- ^ render_mode
    -> Ptr FT_Vector  -- ^ origin
    -> FT_Bool        -- ^ destroy
    -> IO FT_Error
