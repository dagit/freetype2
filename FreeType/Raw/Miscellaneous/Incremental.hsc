{-# LANGUAGE EmptyDataDecls #-}

module FreeType.Raw.Miscellaneous.Incremental where

import           FreeType.Raw.Core.Types

import           Foreign.Ptr
import           Foreign.Storable

#include "ft2build.h"
#include FT_FREETYPE_H

#include "freetype/ftincrem.h"

data FT_IncrementalRec
type FT_Incremental = Ptr FT_IncrementalRec



data FT_Incremental_MetricsRec = FT_Incremental_MetricsRec
                                   { imrBearing_x :: FT_Long
                                   , imrBearing_y :: FT_Long
                                   , imrAdvance   :: FT_Long
                                   , imrAdvance_v :: FT_Long
                                   }

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
    #{poke struct FT_Incremental_MetricsRec_, bearing_x} ptr $ imrBearing_x val
    #{poke struct FT_Incremental_MetricsRec_, bearing_y} ptr $ imrBearing_y val
    #{poke struct FT_Incremental_MetricsRec_, advance  } ptr $ imrAdvance   val
    #{poke struct FT_Incremental_MetricsRec_, advance_v} ptr $ imrAdvance_v val



type FT_Incremental_Metrics = Ptr FT_Incremental_MetricsRec



type FT_Incremental_GetGlyphDataFunc = FunPtr (FT_Incremental -> FT_UInt -> Ptr FT_Data -> IO FT_Error)



type FT_Incremental_FreeGlyphDataFunc = FunPtr (FT_Incremental -> Ptr FT_Data -> IO ())



type FT_Incremental_GetGlyphMetricsFunc = FunPtr (FT_Incremental -> FT_UInt -> FT_Bool -> Ptr FT_Incremental_MetricsRec -> IO FT_Error)



data FT_Incremental_FuncsRec = FT_Incremental_FuncsRec
                                 { ifrGet_glyph_data    :: FT_Incremental_GetGlyphDataFunc
                                 , ifrFree_glyph_data   :: FT_Incremental_FreeGlyphDataFunc
                                 , ifrGet_glyph_metrics :: FT_Incremental_GetGlyphMetricsFunc
                                 }

instance Storable FT_Incremental_FuncsRec where
  sizeOf _    = #size      struct FT_Incremental_FuncsRec_
  alignment _ = #alignment struct FT_Incremental_FuncsRec_

  peek ptr =
    FT_Incremental_FuncsRec
      <$> #{peek struct FT_Incremental_FuncsRec_, get_glyph_data    } ptr
      <*> #{peek struct FT_Incremental_FuncsRec_, free_glyph_data   } ptr
      <*> #{peek struct FT_Incremental_FuncsRec_, get_glyph_metrics } ptr
  
  poke ptr val = do
    #{poke struct FT_Incremental_FuncsRec_, get_glyph_data    } ptr $ ifrGet_glyph_data    val
    #{poke struct FT_Incremental_FuncsRec_, free_glyph_data   } ptr $ ifrFree_glyph_data   val
    #{poke struct FT_Incremental_FuncsRec_, get_glyph_metrics } ptr $ ifrGet_glyph_metrics val



data FT_Incremental_InterfaceRec = FT_Incremental_InterfaceRec
                                 { iirFuncs  :: Ptr FT_Incremental_FuncsRec
                                 , iirObject :: FT_Incremental
                                 }

instance Storable FT_Incremental_InterfaceRec where
  sizeOf _    = #size      struct FT_Incremental_InterfaceRec_
  alignment _ = #alignment struct FT_Incremental_InterfaceRec_

  peek ptr =
    FT_Incremental_InterfaceRec
      <$> #{peek struct FT_Incremental_InterfaceRec_, funcs } ptr
      <*> #{peek struct FT_Incremental_InterfaceRec_, object} ptr

  poke ptr val = do
    #{poke struct FT_Incremental_InterfaceRec_, funcs } ptr $ iirFuncs  val
    #{poke struct FT_Incremental_InterfaceRec_, object} ptr $ iirObject val



type FT_Incremental_Interface = Ptr FT_Incremental_InterfaceRec
