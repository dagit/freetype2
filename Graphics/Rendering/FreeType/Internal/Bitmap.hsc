module Graphics.Rendering.FreeType.Internal.Bitmap
  {-# DEPRECATED "freetype2 bindings were rewritten from scratch. Please switch to FreeType.Raw" #-}
  ( FT_Bitmap (FT_Bitmap)
  , module Graphics.Rendering.FreeType.Internal.Bitmap
  ) where

import           FreeType.Raw.Core.Types (FT_Bitmap (..))

import           Foreign.C.Types
import           Foreign.Ptr



rows :: FT_Bitmap -> CInt
rows = bRows

width :: FT_Bitmap -> CInt
width = bWidth

pitch :: FT_Bitmap -> CInt
pitch = bPitch

buffer :: FT_Bitmap -> Ptr CChar
buffer = bBuffer

num_grays :: FT_Bitmap -> CShort
num_grays = bNum_grays

pixel_mode   :: FT_Bitmap -> CChar
pixel_mode = bPixel_mode

palette_mode :: FT_Bitmap -> CChar
palette_mode = bPalette_mode

palette      :: FT_Bitmap -> Ptr ()
palette = bPalette
