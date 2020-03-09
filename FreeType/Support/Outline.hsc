{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE TemplateHaskell #-}

{- | Please refer to the
     [Support API > Outline Processing](https://www.freetype.org/freetype2/docs/reference/ft2-outline_processing.html)
     chapter of the reference.

     Internal: "FreeType.Support.Outline.Internal".
 -}

module FreeType.Support.Outline
  ( -- ** FT_Outline
    FT_Outline (..)
    -- ** FT_Outline_New
  , ft_Outline_New
  , ft_Outline_With
    -- ** FT_Outline_Done
  , ft_Outline_Done
    -- ** FT_Outline_Copy
  , ft_Outline_Copy
    -- ** FT_Outline_Translate
  , ft_Outline_Translate
    -- ** FT_Outline_Transform
  , ft_Outline_Transform
    -- ** FT_Outline_Embolden
  , ft_Outline_Embolden
    -- ** FT_Outline_EmboldenXY
  , ft_Outline_EmboldenXY
    -- ** FT_Outline_Reverse
  , ft_Outline_Reverse
    -- ** FT_Outline_Check
  , ft_Outline_Check
    -- ** FT_Outline_Get_CBox
  , ft_Outline_Get_CBox
    -- ** FT_Outline_Get_BBox
  , ft_Outline_Get_BBox
    -- ** FT_Outline_Get_Bitmap
  , ft_Outline_Get_Bitmap
    -- ** FT_Outline_Render
  , ft_Outline_Render
    -- ** FT_Outline_Decompose
  , ft_Outline_Decompose
    -- ** FT_Outline_Funcs
  , FT_Outline_Funcs (..)
    -- ** FT_Outline_MoveToFunc
  , FT_Outline_MoveToFunc
    -- ** FT_Outline_LineToFunc
  , FT_Outline_LineToFunc
    -- ** FT_Outline_ConicToFunc
  , FT_Outline_ConicToFunc
    -- ** FT_Outline_CubicToFunc
  , FT_Outline_CubicToFunc
    -- ** FT_Orientation
  , FT_Orientation
  , pattern FT_ORIENTATION_TRUETYPE
  , pattern FT_ORIENTATION_POSTSCRIPT
  , pattern FT_ORIENTATION_FILL_RIGHT
  , pattern FT_ORIENTATION_FILL_LEFT
  , pattern FT_ORIENTATION_NONE
    -- ** FT_Outline_Get_Orientation
  , ft_Outline_Get_Orientation
    -- ** FT_OUTLINE_XXX
  , pattern FT_OUTLINE_NONE
  , pattern FT_OUTLINE_OWNER
  , pattern FT_OUTLINE_EVEN_ODD_FILL
  , pattern FT_OUTLINE_REVERSE_FILL
  , pattern FT_OUTLINE_IGNORE_DROPOUTS
  , pattern FT_OUTLINE_SMART_DROPOUTS
  , pattern FT_OUTLINE_INCLUDE_STUBS
  , pattern FT_OUTLINE_HIGH_PRECISION
  , pattern FT_OUTLINE_SINGLE_PASS
  ) where

import           FreeType.Circular.Types
import           FreeType.Core.Types.Types
import           FreeType.Exception.Internal
import           FreeType.Support.Outline.Internal
import           FreeType.Support.Outline.Types
import           FreeType.Support.Scanline.Types

import           Control.Exception
import           Data.Int
import           Foreign.Marshal.Alloc
import           Foreign.Marshal.Utils
import           Foreign.Ptr
import           Foreign.Storable

#include "ft2build.h"
#include FT_IMAGE_H
#include FT_OUTLINE_H

-- | Newly created 'FT_Outline' is allocated using 'malloc' and thus must be 'free'd manually.
ft_Outline_New
  :: FT_Library          -- ^ library
  -> FT_UInt             -- ^ numPoints
  -> FT_Int              -- ^ numContours
  -> IO (Ptr FT_Outline) -- ^ outline
ft_Outline_New lib points contours = do
  outlinePtr <- malloc
  ftError 'ft_Outline_New $ ft_Outline_New' lib points contours outlinePtr
  return outlinePtr



-- | 'bracket' over 'ft_Outline_New' and 'ft_Outline_Done'.
--
--   The provided 'Ptr' 'FT_Outline' should not be used after this function terminates.
ft_Outline_With
  :: FT_Library          -- ^ library
  -> FT_UInt             -- ^ numPoints
  -> FT_Int              -- ^ numContours
  -> (Ptr FT_Outline -> IO a)
  -> IO a
ft_Outline_With lib points contours f =
  alloca $ \outlinePtr -> do
    ftError 'ft_Outline_New $ ft_Outline_New' lib points contours outlinePtr
    finally (f outlinePtr) . ftError 'ft_Outline_Done $ ft_Outline_Done' lib outlinePtr



-- | Additionally 'free's the passed pointer.
ft_Outline_Done
  :: FT_Library     -- ^ library
  -> Ptr FT_Outline -- ^ outline
  -> IO ()
ft_Outline_Done lib outlinePtr = do
  ftError 'ft_Outline_Done $ ft_Outline_Done' lib outlinePtr
  free outlinePtr



ft_Outline_Copy
  :: Ptr FT_Outline -- ^ source
  -> Ptr FT_Outline -- ^ target
  -> IO ()
ft_Outline_Copy =
  autoError 'ft_Outline_Copy ft_Outline_Copy'



foreign import ccall "FT_Outline_Translate"
  ft_Outline_Translate
    :: Ptr FT_Outline -- ^ outline
    -> FT_Pos         -- ^ xOffset
    -> FT_Pos         -- ^ yOffset
    -> IO ()



ft_Outline_Transform
  :: Ptr FT_Outline   -- ^ outline
  -> FT_Matrix        -- ^ matrix
  -> IO ()
ft_Outline_Transform outlinePtr mat =
  with mat $ \matPtr ->
    ft_Outline_Transform' outlinePtr matPtr



ft_Outline_Embolden
  :: Ptr FT_Outline -- ^ outline
  -> FT_Pos         -- ^ strength
  -> IO ()
ft_Outline_Embolden =
  autoError 'ft_Outline_Embolden ft_Outline_Embolden'



ft_Outline_EmboldenXY
  :: Ptr FT_Outline -- ^ outline
  -> FT_Pos         -- ^ xstrength
  -> FT_Pos         -- ^ ystrength
  -> IO ()
ft_Outline_EmboldenXY =
  autoError 'ft_Outline_EmboldenXY ft_Outline_EmboldenXY'



foreign import ccall "FT_Outline_Reverse"
  ft_Outline_Reverse
    :: Ptr FT_Outline -- ^ outline
    -> IO ()



ft_Outline_Check
  :: Ptr FT_Outline -- ^ outline
  -> IO ()
ft_Outline_Check =
  autoError 'ft_Outline_Check ft_Outline_Check'



ft_Outline_Get_CBox
  :: Ptr FT_Outline -- ^ outline
  -> IO FT_BBox     -- ^ cbox
ft_Outline_Get_CBox outlinePtr =
  alloca $ \bboxPtr -> do
    ft_Outline_Get_CBox' outlinePtr bboxPtr
    peek bboxPtr



ft_Outline_Get_BBox
  :: Ptr FT_Outline -- ^ outline
  -> IO FT_BBox     -- ^ bbox
ft_Outline_Get_BBox outlinePtr =
  alloca $ \bboxPtr -> do
    ftError 'ft_Outline_Get_BBox $ ft_Outline_Get_BBox' outlinePtr bboxPtr
    peek bboxPtr



ft_Outline_Get_Bitmap
  :: FT_Library     -- ^ library
  -> Ptr FT_Outline -- ^ outline
  -> Ptr FT_Bitmap  -- ^ bitmap
  -> IO ()
ft_Outline_Get_Bitmap =
  autoError 'ft_Outline_Get_Bitmap ft_Outline_Get_Bitmap'



ft_Outline_Render
  :: FT_Library           -- ^ library
  -> Ptr FT_Outline       -- ^ outline
  -> Ptr FT_Raster_Params -- ^ params
  -> IO ()
ft_Outline_Render =
  autoError 'ft_Outline_Render ft_Outline_Render'



-- | 'FT_Outline_Funcs' is only used as an argument (and this is the only function using
--   it), so it's silently converted to 'FT_Outline_Funcs'' inside.
ft_Outline_Decompose
  :: Ptr FT_Outline   -- ^ outline
  -> FT_Outline_Funcs -- ^ func_interface
  -> Ptr ()           -- ^ user
  -> IO ()
ft_Outline_Decompose outlinePtr funcs dataPtr =
  with funcs $ \funcsPtr ->
    ftError 'ft_Outline_Decompose $ ft_Outline_Decompose' outlinePtr funcsPtr dataPtr



pattern FT_ORIENTATION_TRUETYPE
      , FT_ORIENTATION_POSTSCRIPT
      , FT_ORIENTATION_FILL_RIGHT
      , FT_ORIENTATION_FILL_LEFT
      , FT_ORIENTATION_NONE
     :: FT_Orientation
pattern FT_ORIENTATION_TRUETYPE   = #const FT_ORIENTATION_TRUETYPE
pattern FT_ORIENTATION_POSTSCRIPT = #const FT_ORIENTATION_POSTSCRIPT
pattern FT_ORIENTATION_FILL_RIGHT = #const FT_ORIENTATION_FILL_RIGHT
pattern FT_ORIENTATION_FILL_LEFT  = #const FT_ORIENTATION_FILL_LEFT
pattern FT_ORIENTATION_NONE       = #const FT_ORIENTATION_NONE



foreign import ccall "FT_Outline_Get_Orientation"
  ft_Outline_Get_Orientation
    :: Ptr FT_Outline    -- ^ outline
    -> IO FT_Orientation



pattern FT_OUTLINE_NONE
      , FT_OUTLINE_OWNER
      , FT_OUTLINE_EVEN_ODD_FILL
      , FT_OUTLINE_REVERSE_FILL
      , FT_OUTLINE_IGNORE_DROPOUTS
      , FT_OUTLINE_SMART_DROPOUTS
      , FT_OUTLINE_INCLUDE_STUBS
      , FT_OUTLINE_HIGH_PRECISION
      , FT_OUTLINE_SINGLE_PASS
     :: #type int
pattern FT_OUTLINE_NONE            = #const FT_OUTLINE_NONE
pattern FT_OUTLINE_OWNER           = #const FT_OUTLINE_OWNER
pattern FT_OUTLINE_EVEN_ODD_FILL   = #const FT_OUTLINE_EVEN_ODD_FILL
pattern FT_OUTLINE_REVERSE_FILL    = #const FT_OUTLINE_REVERSE_FILL
pattern FT_OUTLINE_IGNORE_DROPOUTS = #const FT_OUTLINE_IGNORE_DROPOUTS
pattern FT_OUTLINE_SMART_DROPOUTS  = #const FT_OUTLINE_SMART_DROPOUTS
pattern FT_OUTLINE_INCLUDE_STUBS   = #const FT_OUTLINE_INCLUDE_STUBS
pattern FT_OUTLINE_HIGH_PRECISION  = #const FT_OUTLINE_HIGH_PRECISION
pattern FT_OUTLINE_SINGLE_PASS     = #const FT_OUTLINE_SINGLE_PASS
