{-# LANGUAGE CApiFFI
           , CPP
           , ForeignFunctionInterface
           , PatternSynonyms #-}

{- | Please refer to the
     [Core API > Glyph Management](https://www.freetype.org/freetype2/docs/reference/ft2-glyph_management.html)
     chapter of the reference.
-}

module FreeType.Core.Glyph
  ( -- ** FT_Glyph
    FT_Glyph
    -- ** FT_GlyphRec
  , FT_Glyph_Class
  , FT_GlyphRec (..)
    -- ** FT_BitmapGlyph
  , FT_BitmapGlyph
    -- ** FT_BitmapGlyphRec
  , FT_BitmapGlyphRec (..)
    -- ** FT_OutlineGlyph
  , FT_OutlineGlyph
    -- ** FT_OutlineGlyphRec
  , FT_OutlineGlyphRec (..)
    -- ** FT_New_Glyph
  , ft_New_Glyph
    -- ** FT_Get_Glyph
  , ft_Get_Glyph
    -- ** FT_Glyph_Copy
  , ft_Glyph_Copy
    -- ** FT_Glyph_Transform
  , ft_Glyph_Transform
    -- ** FT_Glyph_BBox_Mode
  , pattern FT_GLYPH_BBOX_UNSCALED
  , pattern FT_GLYPH_BBOX_SUBPIXELS
  , pattern FT_GLYPH_BBOX_GRIDFIT
  , pattern FT_GLYPH_BBOX_TRUNCATE
  , pattern FT_GLYPH_BBOX_PIXELS
    -- ** FT_Glyph_Get_CBox
  , ft_Glyph_Get_CBox
    -- ** FT_Glyph_To_Bitmap
  , ft_Glyph_To_Bitmap
    -- ** FT_Done_Glyph
  , ft_Done_Glyph
  ) where

import           FreeType.Core.Base.Types
import           FreeType.Core.Glyph.Types
import           FreeType.Core.Types.Types

import           Foreign.Ptr

#include "ft2build.h"
#include FT_GLYPH_H

foreign import CALLCV "freetype/ftglyph.h FT_New_Glyph"
  ft_New_Glyph
    :: FT_Library      -- ^ library
    -> FT_Glyph_Format -- ^ format
    -> Ptr FT_Glyph    -- ^ aglyph
    -> IO FT_Error



foreign import CALLCV "freetype/ftglyph.h FT_Get_Glyph"
  ft_Get_Glyph
    :: FT_GlyphSlot -- ^ slot
    -> Ptr FT_Glyph -- ^ aglyph
    -> IO FT_Error



foreign import CALLCV "freetype/ftglyph.h FT_Glyph_Copy"
  ft_Glyph_Copy
    :: FT_Glyph     -- ^ source
    -> Ptr FT_Glyph -- ^ target
    -> IO FT_Error



foreign import CALLCV "freetype/ftglyph.h FT_Glyph_Transform"
  ft_Glyph_Transform
    :: FT_Glyph      -- ^ glyph
    -> Ptr FT_Matrix -- ^ matrix
    -> Ptr FT_Vector -- ^ delta
    -> IO FT_Error



pattern FT_GLYPH_BBOX_UNSCALED
      , FT_GLYPH_BBOX_SUBPIXELS
      , FT_GLYPH_BBOX_GRIDFIT
      , FT_GLYPH_BBOX_TRUNCATE
      , FT_GLYPH_BBOX_PIXELS
     :: (Eq a, Num a) => a
pattern FT_GLYPH_BBOX_UNSCALED  = #const FT_GLYPH_BBOX_UNSCALED
pattern FT_GLYPH_BBOX_SUBPIXELS = #const FT_GLYPH_BBOX_SUBPIXELS
pattern FT_GLYPH_BBOX_GRIDFIT   = #const FT_GLYPH_BBOX_GRIDFIT
pattern FT_GLYPH_BBOX_TRUNCATE  = #const FT_GLYPH_BBOX_TRUNCATE
pattern FT_GLYPH_BBOX_PIXELS    = #const FT_GLYPH_BBOX_PIXELS



foreign import CALLCV "freetype/ftglyph.h FT_Glyph_Get_CBox"
  ft_Glyph_Get_CBox
    :: FT_Glyph    -- ^ glyph
    -> FT_UInt     -- ^ bbox_mode
    -> Ptr FT_BBox -- ^ acbox
    -> IO ()



foreign import CALLCV "freetype/ftglyph.h FT_Glyph_To_Bitmap"
  ft_Glyph_To_Bitmap
    :: Ptr FT_Glyph   -- ^ the_glyph
    -> FT_Render_Mode -- ^ render_mode
    -> Ptr FT_Vector  -- ^ origin
    -> FT_Bool        -- ^ destroy
    -> IO FT_Error



foreign import CALLCV "freetype/ftglyph.h FT_Done_Glyph"
  ft_Done_Glyph
    :: FT_Glyph -- ^ glyph
    -> IO ()
