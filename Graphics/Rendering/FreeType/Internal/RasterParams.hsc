{-# LANGUAGE ForeignFunctionInterface #-}
module Graphics.Rendering.FreeType.Internal.RasterParams
( FT_Raster_Params(..)
, FT_SpanFunc
, FT_Raster_BitTest_Func
, FT_Raster_BitSet_Func
) where

import Foreign
import Foreign.C.Types
import Foreign.Storable

import Graphics.Rendering.FreeType.Internal.BBox
import Graphics.Rendering.FreeType.Internal.Bitmap
import Graphics.Rendering.FreeType.Internal.Span

#include <stddef.h>
#let alignment t = "%lu", (unsigned long)offsetof(struct {char x__; t (y__); }, y__)

#include "ft2build.h"
#include FT_FREETYPE_H

#include "freetype/ftimage.h"

data FT_Raster_Params = FT_Raster_Params
  { target      :: Ptr FT_Bitmap
  , source      :: Ptr ()
  , flags       :: CInt
  , gray_spans  :: FT_SpanFunc
  , black_spans :: FT_SpanFunc            -- doesn't work according to FT docs
  , bit_test    :: FT_Raster_BitTest_Func -- doesn't work according to FT docs
  , bit_set     :: FT_Raster_BitSet_Func  -- doesn't work according to FT docs
  , user        :: Ptr ()
  , clip_box    :: FT_BBox
  }

instance Storable FT_Raster_Params where
  sizeOf    _ = #size FT_Raster_Params
  alignment _ = #alignment FT_Raster_Params
  peek ptr = do
    target'      <- (#peek FT_Raster_Params, target) ptr
    source'      <- (#peek FT_Raster_Params, source) ptr
    flags'       <- (#peek FT_Raster_Params, flags) ptr
    gray_spans'  <- (#peek FT_Raster_Params, gray_spans) ptr
    black_spans' <- (#peek FT_Raster_Params, black_spans) ptr
    bit_test'    <- (#peek FT_Raster_Params, bit_test) ptr
    bit_set'     <- (#peek FT_Raster_Params, bit_set) ptr
    user'        <- (#peek FT_Raster_Params, user) ptr
    clip_box'    <- (#peek FT_Raster_Params, clip_box) ptr
    return $ FT_Raster_Params
      { target = target'
      , source = source'
      , flags = flags'
      , gray_spans = gray_spans'
      , black_spans = black_spans'
      , bit_test = bit_test'
      , bit_set = bit_set'
      , user = user'
      , clip_box = clip_box'
      }
  poke ptr val = do
    (#poke FT_Raster_Params, target) ptr (target val)
    (#poke FT_Raster_Params, source) ptr (source val)
    (#poke FT_Raster_Params, flags) ptr (flags val)
    (#poke FT_Raster_Params, gray_spans) ptr (gray_spans val)
    (#poke FT_Raster_Params, black_spans) ptr (black_spans val)
    (#poke FT_Raster_Params, bit_test) ptr (bit_test val)
    (#poke FT_Raster_Params, bit_set) ptr (bit_set val)
    (#poke FT_Raster_Params, user) ptr (user val)
    (#poke FT_Raster_Params, clip_box) ptr (clip_box val)

type FT_SpanFunc = FunPtr
  (CInt -> CInt -> Ptr FT_Span -> Ptr () -> IO ())

type FT_Raster_BitTest_Func = FunPtr
  (CInt -> CInt -> Ptr () -> IO CInt)

type FT_Raster_BitSet_Func = FunPtr
  (CInt -> CInt -> Ptr () -> IO ())
