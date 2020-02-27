{-# OPTIONS_GHC -fno-warn-orphans #-}

module FreeType.Miscellaneous.Incremental
  ( module FreeType.Miscellaneous.Incremental.Internal
  ) where

import           FreeType.Miscellaneous.Incremental.Internal
import           FreeType.Lens

import           Foreign.Storable
import           Lens.Micro ((^.))

#include "ft2build.h"
#include FT_INCREMENTAL_H

instance Storable FT_Incremental_MetricsRec where
  sizeOf _    = #size      struct FT_Incremental_MetricsRec_
  alignment _ = #alignment struct FT_Incremental_MetricsRec_

  peek ptr =
    FT_Incremental_MetricsRec
      <$> #{peek struct FT_Incremental_MetricsRec_, bearing_x} ptr
      <*> #{peek struct FT_Incremental_MetricsRec_, bearing_y} ptr
      <*> #{peek struct FT_Incremental_MetricsRec_, advance  } ptr
      <*> #{peek struct FT_Incremental_MetricsRec_, advance_v} ptr

  poke ptr val = do
    #{poke struct FT_Incremental_MetricsRec_, bearing_x} ptr $ val^.bearing_x
    #{poke struct FT_Incremental_MetricsRec_, bearing_y} ptr $ val^.bearing_y
    #{poke struct FT_Incremental_MetricsRec_, advance  } ptr $ val^.advance
    #{poke struct FT_Incremental_MetricsRec_, advance_v} ptr $ val^.advance_v



instance Storable FT_Incremental_FuncsRec where
  sizeOf _    = #size      struct FT_Incremental_FuncsRec_
  alignment _ = #alignment struct FT_Incremental_FuncsRec_

  peek ptr =
    FT_Incremental_FuncsRec
      <$> #{peek struct FT_Incremental_FuncsRec_, get_glyph_data    } ptr
      <*> #{peek struct FT_Incremental_FuncsRec_, free_glyph_data   } ptr
      <*> #{peek struct FT_Incremental_FuncsRec_, get_glyph_metrics } ptr

  poke ptr val = do
    #{poke struct FT_Incremental_FuncsRec_, get_glyph_data    } ptr $ val^.get_glyph_data
    #{poke struct FT_Incremental_FuncsRec_, free_glyph_data   } ptr $ val^.free_glyph_data
    #{poke struct FT_Incremental_FuncsRec_, get_glyph_metrics } ptr $ val^.get_glyph_metrics



instance Storable FT_Incremental_InterfaceRec where
  sizeOf _    = #size      struct FT_Incremental_InterfaceRec_
  alignment _ = #alignment struct FT_Incremental_InterfaceRec_

  peek ptr =
    FT_Incremental_InterfaceRec
      <$> #{peek struct FT_Incremental_InterfaceRec_, funcs } ptr
      <*> #{peek struct FT_Incremental_InterfaceRec_, object} ptr

  poke ptr val = do
    #{poke struct FT_Incremental_InterfaceRec_, funcs } ptr $ val^.funcs
    #{poke struct FT_Incremental_InterfaceRec_, object} ptr $ val^.object
