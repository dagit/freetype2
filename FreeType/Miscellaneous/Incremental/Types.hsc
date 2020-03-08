{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE ForeignFunctionInterface #-}

module FreeType.Miscellaneous.Incremental.Types where

import           FreeType.Core.Types.Types

import           Data.Function ((&))
import           Foreign.Ptr
import           Foreign.Storable

#include "ft2build.h"
#include FT_INCREMENTAL_H

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
    #{poke struct FT_Incremental_MetricsRec_, bearing_x} ptr $ val & imrBearing_x
    #{poke struct FT_Incremental_MetricsRec_, bearing_y} ptr $ val & imrBearing_y
    #{poke struct FT_Incremental_MetricsRec_, advance  } ptr $ val & imrAdvance
    #{poke struct FT_Incremental_MetricsRec_, advance_v} ptr $ val & imrAdvance_v



type FT_Incremental_Metrics = Ptr FT_Incremental_MetricsRec



type FT_Incremental_GetGlyphDataFunc = FT_Incremental -- ^ incremental
                                    -> FT_UInt        -- ^ glyph_index
                                    -> Ptr FT_Data    -- ^ data
                                    -> IO FT_Error

foreign import ccall "wrapper"
  ft_Incremental_GetGlyphDataFunc :: FT_Incremental_GetGlyphDataFunc -> IO (FunPtr FT_Incremental_GetGlyphDataFunc)

foreign import ccall "dynamic"
  ft_Incremental_GetGlyphDataFunc' :: FunPtr FT_Incremental_GetGlyphDataFunc -> FT_Incremental_GetGlyphDataFunc



type FT_Incremental_FreeGlyphDataFunc = FT_Incremental -- ^ incremental
                                     -> Ptr FT_Data    -- ^ data
                                     -> IO ()

foreign import ccall "wrapper"
  ft_Incremental_FreeGlyphDataFunc :: FT_Incremental_FreeGlyphDataFunc -> IO (FunPtr FT_Incremental_FreeGlyphDataFunc)

foreign import ccall "dynamic"
  ft_Incremental_FreeGlyphDataFunc' :: FunPtr FT_Incremental_FreeGlyphDataFunc -> FT_Incremental_FreeGlyphDataFunc



type FT_Incremental_GetGlyphMetricsFunc = FT_Incremental                -- ^ incremental
                                       -> FT_UInt                       -- ^ glyph_index
                                       -> FT_Bool                       -- ^ vertical
                                       -> Ptr FT_Incremental_MetricsRec -- ^ metrics
                                       -> IO FT_Error

foreign import ccall "wrapper"
  ft_Incremental_GetGlyphMetricsFunc :: FT_Incremental_GetGlyphMetricsFunc -> IO (FunPtr FT_Incremental_GetGlyphMetricsFunc)

foreign import ccall "dynamic"
  ft_Incremental_GetGlyphMetricsFunc' :: FunPtr FT_Incremental_GetGlyphMetricsFunc -> FT_Incremental_GetGlyphMetricsFunc



data FT_Incremental_FuncsRec = FT_Incremental_FuncsRec
                                 { ifrGet_glyph_data    :: FunPtr FT_Incremental_GetGlyphDataFunc
                                 , ifrFree_glyph_data   :: FunPtr FT_Incremental_FreeGlyphDataFunc
                                 , ifrGet_glyph_metrics :: FunPtr FT_Incremental_GetGlyphMetricsFunc
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
    #{poke struct FT_Incremental_FuncsRec_, get_glyph_data    } ptr $ val & ifrGet_glyph_data
    #{poke struct FT_Incremental_FuncsRec_, free_glyph_data   } ptr $ val & ifrFree_glyph_data
    #{poke struct FT_Incremental_FuncsRec_, get_glyph_metrics } ptr $ val & ifrGet_glyph_metrics



data FT_Incremental_InterfaceRec = FT_Incremental_InterfaceRec
                                 { iirFuncs  :: Ptr (FunPtr FT_Incremental_FuncsRec)
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
    #{poke struct FT_Incremental_InterfaceRec_, funcs } ptr $ val & iirFuncs
    #{poke struct FT_Incremental_InterfaceRec_, object} ptr $ val & iirObject




type FT_Incremental_Interface = Ptr FT_Incremental_InterfaceRec
