{- | Please refer to the
     [Support API > Bitmap Handling](https://www.freetype.org/freetype2/docs/reference/ft2-bitmap_handling.html)
     chapter of the reference.

     Internal: "FreeType.Support.Bitmap.Internal".
 -}

module FreeType.Support.Bitmap
  ( -- ** FT_Bitmap_Init
    ft_Bitmap_Init
  , ft_Bitmap_With
    -- ** FT_Bitmap_Copy
  , ft_Bitmap_Copy
    -- ** FT_Bitmap_Embolden
  , ft_Bitmap_Embolden
    -- ** FT_Bitmap_Convert
  , ft_Bitmap_Convert
    -- ** FT_Bitmap_Blend
  , ft_Bitmap_Blend
    -- ** FT_GlyphSlot_Own_Bitmap
  , ft_GlyphSlot_Own_Bitmap
    -- ** FT_Bitmap_Done
  , ft_Bitmap_Done
  ) where

import           FreeType.Core.Base.Types
import           FreeType.Core.Color.Types
import           FreeType.Core.Types.Types
import           FreeType.Exception.Internal
import           FreeType.Support.Bitmap.Internal

import           Control.Exception
import           Foreign.Marshal.Alloc
import           Foreign.Marshal.Utils
import           Foreign.Ptr
import           Foreign.Storable

#include "ft2build.h"
#include FT_FREETYPE_H

-- | Newly created 'FT_Bitmap' is allocated using 'malloc' and thus must be 'free'd manually.
ft_Bitmap_Init :: IO (Ptr FT_Bitmap) -- ^ bitmap
ft_Bitmap_Init = do
  bitmapPtr <- malloc
  ft_Bitmap_Init' bitmapPtr
  return bitmapPtr



-- | 'bracket' over 'ft_Bitmap_Init' and 'ft_Bitmap_Done'.
--
--   The provided 'Ptr' 'FT_Bitmap' should not be used after this function terminates.
ft_Bitmap_With
  :: FT_Library              -- ^ library
  -> (Ptr FT_Bitmap -> IO a)
  -> IO a
ft_Bitmap_With lib f =
  alloca $ \bitmapPtr -> do
    ft_Bitmap_Init' bitmapPtr
    finally (f bitmapPtr) . ftError "ft_Bitmap_Done" $ ft_Bitmap_Done' lib bitmapPtr



ft_Bitmap_Copy
  :: FT_Library    -- ^ library
  -> Ptr FT_Bitmap -- ^ source
  -> Ptr FT_Bitmap -- ^ target
  -> IO ()
ft_Bitmap_Copy =
  autoError "ft_Bitmap_Copy" ft_Bitmap_Copy'



ft_Bitmap_Embolden
  :: FT_Library    -- ^ library
  -> Ptr FT_Bitmap -- ^ bitmap
  -> FT_Pos        -- ^ xStrength
  -> FT_Pos        -- ^ yStrength
  -> IO ()
ft_Bitmap_Embolden =
  autoError "ft_Bitmap_Embolden" ft_Bitmap_Embolden'



ft_Bitmap_Convert
  :: FT_Library    -- ^ library
  -> Ptr FT_Bitmap -- ^ source
  -> Ptr FT_Bitmap -- ^ target
  -> FT_Int        -- ^ alignment
  -> IO ()
ft_Bitmap_Convert =
  autoError "ft_Bitmap_Convert" ft_Bitmap_Convert'



ft_Bitmap_Blend
  :: FT_Library    -- ^ library
  -> Ptr FT_Bitmap -- ^ source
  -> FT_Vector     -- ^ source_offset
  -> Ptr FT_Bitmap -- ^ target
  -> FT_Vector     -- ^ target_offset
  -> FT_Color      -- ^ color 
  -> IO FT_Vector  -- ^ target_offset
ft_Bitmap_Blend lib source sourceOff target targetOff color =
  with sourceOff $ \sourceOffPtr ->
    with targetOff $ \targetOffPtr ->
      with color $ \colorPtr -> do
        ftError "ft_Bitmap_Blend"
          $ ft_Bitmap_Blend' lib source sourceOffPtr target targetOffPtr colorPtr
        peek targetOffPtr



ft_GlyphSlot_Own_Bitmap
  :: FT_GlyphSlot -- ^ slot
  -> IO ()
ft_GlyphSlot_Own_Bitmap =
  autoError "ft_GlyphSlot_Own_Bitmap" ft_GlyphSlot_Own_Bitmap'



-- | Additionally 'free's the passed pointer.
ft_Bitmap_Done
  :: FT_Library    -- ^ library
  -> Ptr FT_Bitmap -- ^ bitmap
  -> IO ()
ft_Bitmap_Done lib bitmapPtr = do
  ftError "ft_Bitmap_Done" $ ft_Bitmap_Done' lib bitmapPtr
  free bitmapPtr
