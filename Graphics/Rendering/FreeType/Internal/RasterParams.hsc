module Graphics.Rendering.FreeType.Internal.RasterParams
  {-# DEPRECATED "freetype2 bindings were rewritten from scratch. Please switch to FreeType" #-}
  ( FT_Raster_Params
  , FT_SpanFunc
  , FT_Raster_BitTest_Func
  , FT_Raster_BitSet_Func
  , target
  , source
  , flags
  , gray_spans
  , user
  , clip_box
  ) where

import           FreeType.Support.Scanline

import           Graphics.Rendering.FreeType.Internal.BBox
import           Graphics.Rendering.FreeType.Internal.Bitmap

import           Foreign.C.Types
import           Foreign.Ptr



target :: FT_Raster_Params -> Ptr FT_Bitmap
target = rpTarget

source :: FT_Raster_Params -> Ptr ()
source = rpSource

flags :: FT_Raster_Params -> CInt
flags = rpFlags

gray_spans :: FT_Raster_Params -> FT_SpanFunc
gray_spans = rpGray_spans

user :: FT_Raster_Params -> Ptr ()
user = rpUser

clip_box :: FT_Raster_Params -> FT_BBox
clip_box = rpClip_box
