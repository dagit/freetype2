{-# LANGUAGE DataKinds
           , EmptyDataDecls
           , FlexibleInstances
           , ForeignFunctionInterface
           , MultiParamTypeClasses
           , TypeApplications #-}

module FreeType.Miscellaneous.Incremental.Types where

import           FreeType.Core.Types.Types

import           Foreign.Ptr
import           Foreign.Storable
import           Foreign.Storable.Offset

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

instance Offset "imrBearing_x" FT_Incremental_MetricsRec where rawOffset = #{offset struct FT_Incremental_MetricsRec_, bearing_x}
instance Offset "imrBearing_y" FT_Incremental_MetricsRec where rawOffset = #{offset struct FT_Incremental_MetricsRec_, bearing_y}
instance Offset "imrAdvance"   FT_Incremental_MetricsRec where rawOffset = #{offset struct FT_Incremental_MetricsRec_, advance  }
instance Offset "imrAdvance_v" FT_Incremental_MetricsRec where rawOffset = #{offset struct FT_Incremental_MetricsRec_, advance_v}

instance Storable FT_Incremental_MetricsRec where
  sizeOf _    = #size      struct FT_Incremental_MetricsRec_
  alignment _ = #alignment struct FT_Incremental_MetricsRec_

  peek ptr =
    FT_Incremental_MetricsRec
      <$> peek (offset @"imrBearing_x" ptr)
      <*> peek (offset @"imrBearing_y" ptr)
      <*> peek (offset @"imrAdvance"   ptr)
      <*> peek (offset @"imrAdvance_v" ptr)

  poke ptr val = do
    pokeField @"imrBearing_x" ptr val
    pokeField @"imrBearing_y" ptr val
    pokeField @"imrAdvance"   ptr val
    pokeField @"imrAdvance_v" ptr val



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

instance Offset "ifrGet_glyph_data"    FT_Incremental_FuncsRec where rawOffset = #{offset struct FT_Incremental_FuncsRec_, get_glyph_data    }
instance Offset "ifrFree_glyph_data"   FT_Incremental_FuncsRec where rawOffset = #{offset struct FT_Incremental_FuncsRec_, free_glyph_data   }
instance Offset "ifrGet_glyph_metrics" FT_Incremental_FuncsRec where rawOffset = #{offset struct FT_Incremental_FuncsRec_, get_glyph_metrics }


instance Storable FT_Incremental_FuncsRec where
  sizeOf _    = #size      struct FT_Incremental_FuncsRec_
  alignment _ = #alignment struct FT_Incremental_FuncsRec_

  peek ptr =
    FT_Incremental_FuncsRec
      <$> peek (offset @"ifrGet_glyph_data"    ptr)
      <*> peek (offset @"ifrFree_glyph_data"   ptr)
      <*> peek (offset @"ifrGet_glyph_metrics" ptr)

  poke ptr val = do
    pokeField @"ifrGet_glyph_data"    ptr val
    pokeField @"ifrFree_glyph_data"   ptr val
    pokeField @"ifrGet_glyph_metrics" ptr val



data FT_Incremental_InterfaceRec = FT_Incremental_InterfaceRec
                                 { iirFuncs  :: Ptr (FunPtr FT_Incremental_FuncsRec)
                                 , iirObject :: FT_Incremental
                                 }

instance Offset "iirFuncs"  FT_Incremental_InterfaceRec where rawOffset = #{offset struct FT_Incremental_InterfaceRec_, funcs }
instance Offset "iirObject" FT_Incremental_InterfaceRec where rawOffset = #{offset struct FT_Incremental_InterfaceRec_, object}

instance Storable FT_Incremental_InterfaceRec where
  sizeOf _    = #size      struct FT_Incremental_InterfaceRec_
  alignment _ = #alignment struct FT_Incremental_InterfaceRec_

  peek ptr =
    FT_Incremental_InterfaceRec
      <$> peek (offset @"iirFuncs"  ptr)
      <*> peek (offset @"iirObject" ptr)
 
  poke ptr val = do
    pokeField @"iirFuncs"  ptr val
    pokeField @"iirObject" ptr val



type FT_Incremental_Interface = Ptr FT_Incremental_InterfaceRec
