{-# OPTIONS_GHC -fno-warn-orphans #-}

module FreeType.Support.Scanline
  ( module FreeType.Support.Scanline.Internal
  ) where

import           FreeType.Circular ()
import           FreeType.Support.Scanline.Internal
import           FreeType.Lens

import           Foreign.Storable
import           Lens.Micro ((^.))

#include "ft2build.h"
#include FT_FREETYPE_H

instance Storable FT_Span where
  sizeOf    _ = #size      struct FT_Span_
  alignment _ = #alignment struct FT_Span_

  peek ptr =
    FT_Span
      <$> #{peek struct FT_Span_, x       } ptr
      <*> #{peek struct FT_Span_, len     } ptr
      <*> #{peek struct FT_Span_, coverage} ptr

  poke ptr val = do
    #{poke struct FT_Span_, x       } ptr $ val^.x
    #{poke struct FT_Span_, len     } ptr $ val^.len
    #{poke struct FT_Span_, coverage} ptr $ val^.coverage



instance Storable FT_Raster_Params where
  sizeOf    _ = #size      struct FT_Raster_Params_
  alignment _ = #alignment struct FT_Raster_Params_

  peek ptr =
    FT_Raster_Params
      <$> #{peek struct FT_Raster_Params_, target     } ptr
      <*> #{peek struct FT_Raster_Params_, source     } ptr
      <*> #{peek struct FT_Raster_Params_, flags      } ptr
      <*> #{peek struct FT_Raster_Params_, gray_spans } ptr
      <*> #{peek struct FT_Raster_Params_, black_spans} ptr
      <*> #{peek struct FT_Raster_Params_, bit_test   } ptr
      <*> #{peek struct FT_Raster_Params_, bit_set    } ptr
      <*> #{peek struct FT_Raster_Params_, user       } ptr
      <*> #{peek struct FT_Raster_Params_, clip_box   } ptr

  poke ptr val = do
    #{poke struct FT_Raster_Params_, target     } ptr $ val^.target
    #{poke struct FT_Raster_Params_, source     } ptr $ val^.source
    #{poke struct FT_Raster_Params_, flags      } ptr $ val^.flags
    #{poke struct FT_Raster_Params_, gray_spans } ptr $ val^.gray_spans
    #{poke struct FT_Raster_Params_, black_spans} ptr $ val^.black_spans
    #{poke struct FT_Raster_Params_, bit_test   } ptr $ val^.bit_test
    #{poke struct FT_Raster_Params_, bit_set    } ptr $ val^.bit_set
    #{poke struct FT_Raster_Params_, user       } ptr $ val^.user
    #{poke struct FT_Raster_Params_, clip_box   } ptr $ val^.clip_box



instance Storable FT_Raster_Funcs where
  sizeOf    _ = #size      struct FT_Raster_Funcs_
  alignment _ = #alignment struct FT_Raster_Funcs_

  peek ptr =
    FT_Raster_Funcs
      <$> #{peek struct FT_Raster_Funcs_, glyph_format   } ptr
      <*> #{peek struct FT_Raster_Funcs_, raster_new     } ptr
      <*> #{peek struct FT_Raster_Funcs_, raster_reset   } ptr
      <*> #{peek struct FT_Raster_Funcs_, raster_set_mode} ptr
      <*> #{peek struct FT_Raster_Funcs_, raster_render  } ptr
      <*> #{peek struct FT_Raster_Funcs_, raster_done    } ptr

  poke ptr val = do
    #{poke struct FT_Raster_Funcs_, glyph_format   } ptr $ val^.glyph_format
    #{poke struct FT_Raster_Funcs_, raster_new     } ptr $ val^.raster_new
    #{poke struct FT_Raster_Funcs_, raster_reset   } ptr $ val^.raster_reset
    #{poke struct FT_Raster_Funcs_, raster_set_mode} ptr $ val^.raster_set_mode
    #{poke struct FT_Raster_Funcs_, raster_render  } ptr $ val^.raster_render
    #{poke struct FT_Raster_Funcs_, raster_done    } ptr $ val^.raster_done
