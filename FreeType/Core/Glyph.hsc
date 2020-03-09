{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE PatternSynonyms #-}

{- | Please refer to the
     [Core API > Glyph Management](https://www.freetype.org/freetype2/docs/reference/ft2-glyph_management.html)
     chapter of the reference.

     Internal: "FreeType.Core.Glyph.Internal".
-}

module FreeType.Core.Glyph
  ( -- ** FT_Glyph
    FT_Glyph
    -- ** FT_GlyphRec
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
  , ft_With_Glyph
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
import           FreeType.Core.Glyph.Internal
import           FreeType.Core.Glyph.Types
import           FreeType.Core.Types.Types
import           FreeType.Exception.Internal

import           Control.Exception
import           Data.Bool (bool)
import           Foreign.Marshal.Alloc
import           Foreign.Marshal.Utils
import           Foreign.Ptr
import           Foreign.Storable

#include "ft2build.h"
#include FT_GLYPH_H

ft_New_Glyph
  :: FT_Library      -- ^ library
  -> FT_Glyph_Format -- ^ format
  -> IO FT_Glyph     -- ^ glyph
ft_New_Glyph =
  autoAllocaError 'ft_New_Glyph ft_New_Glyph'


-- | 'bracket' over 'ft_New_Glyph' and 'ft_With_Glyph'.
--
--   The provided 'FT_Glyph' should not be used after this function terminates.
ft_With_Glyph
  :: FT_Library         -- ^ library
  -> FT_Glyph_Format    -- ^ format
  -> (FT_Glyph -> IO a)
  -> IO a
ft_With_Glyph lib format = bracket (ft_New_Glyph lib format) ft_Done_Glyph



ft_Get_Glyph
  :: FT_GlyphSlot -- ^ slot
  -> IO FT_Glyph  -- ^ glyph
ft_Get_Glyph =
  autoAllocaError 'ft_Get_Glyph ft_Get_Glyph'



ft_Glyph_Copy
  :: FT_Glyph     -- ^ source
  -> Ptr FT_Glyph -- ^ target
  -> IO ()
ft_Glyph_Copy glyph =
  ftError 'ft_Glyph_Copy . ft_Glyph_Copy' glyph



ft_Glyph_Transform
  :: FT_Glyph  -- ^ glyph
  -> FT_Matrix -- ^ matrix
  -> FT_Vector -- ^ delta
  -> IO ()
ft_Glyph_Transform glyph mat vec =
  with mat $ \matPtr ->
    with vec $ \vecPtr ->
      ftError 'ft_Glyph_Transform $ ft_Glyph_Transform' glyph matPtr vecPtr



pattern FT_GLYPH_BBOX_UNSCALED
      , FT_GLYPH_BBOX_SUBPIXELS
      , FT_GLYPH_BBOX_GRIDFIT
      , FT_GLYPH_BBOX_TRUNCATE
      , FT_GLYPH_BBOX_PIXELS
 :: FT_UInt
pattern FT_GLYPH_BBOX_UNSCALED  = #const FT_GLYPH_BBOX_UNSCALED
pattern FT_GLYPH_BBOX_SUBPIXELS = #const FT_GLYPH_BBOX_SUBPIXELS
pattern FT_GLYPH_BBOX_GRIDFIT   = #const FT_GLYPH_BBOX_GRIDFIT
pattern FT_GLYPH_BBOX_TRUNCATE  = #const FT_GLYPH_BBOX_TRUNCATE
pattern FT_GLYPH_BBOX_PIXELS    = #const FT_GLYPH_BBOX_PIXELS



ft_Glyph_Get_CBox
  :: FT_Glyph   -- ^ glyph
  -> FT_UInt    -- ^ bbox_mode
  -> IO FT_BBox -- ^ cbox
ft_Glyph_Get_CBox glyph bbox_mode =
  alloca $ \ptr -> do
    ft_Glyph_Get_CBox' glyph bbox_mode ptr
    peek ptr



ft_Glyph_To_Bitmap
  :: Ptr FT_Glyph   -- ^ the_glyph
  -> FT_Render_Mode -- ^ render_mode
  -> Ptr FT_Vector  -- ^ origin
  -> Bool           -- ^ destroy
  -> IO ()
ft_Glyph_To_Bitmap glyph mode origin destroy =
  ftError 'ft_Glyph_To_Bitmap
    . ft_Glyph_To_Bitmap' glyph mode origin $ bool 0 1 destroy



foreign import ccall "FT_Done_Glyph"
  ft_Done_Glyph
    :: FT_Glyph -- ^ glyph
    -> IO ()
