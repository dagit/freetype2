{-# LANGUAGE DataKinds
           , DuplicateRecordFields
           , EmptyDataDecls
           , FlexibleInstances
           , ForeignFunctionInterface
           , MultiParamTypeClasses #-}
#if __GLASGOW_HASKELL__ >= 902
{-# LANGUAGE NoFieldSelectors #-}
#endif
{-# LANGUAGE TypeApplications #-}

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
                                   { bearing_x :: FT_Long
                                   , bearing_y :: FT_Long
                                   , advance   :: FT_Long
                                   , advance_v :: FT_Long
                                   }

instance Offset "bearing_x" FT_Incremental_MetricsRec where rawOffset = #{offset struct FT_Incremental_MetricsRec_, bearing_x}
instance Offset "bearing_y" FT_Incremental_MetricsRec where rawOffset = #{offset struct FT_Incremental_MetricsRec_, bearing_y}
instance Offset "advance"   FT_Incremental_MetricsRec where rawOffset = #{offset struct FT_Incremental_MetricsRec_, advance  }
instance Offset "advance_v" FT_Incremental_MetricsRec where rawOffset = #{offset struct FT_Incremental_MetricsRec_, advance_v}

instance Storable FT_Incremental_MetricsRec where
  sizeOf _    = #size      struct FT_Incremental_MetricsRec_
  alignment _ = #alignment struct FT_Incremental_MetricsRec_

  peek ptr =
    FT_Incremental_MetricsRec
      <$> peek (offset @"bearing_x" ptr)
      <*> peek (offset @"bearing_y" ptr)
      <*> peek (offset @"advance"   ptr)
      <*> peek (offset @"advance_v" ptr)

  poke ptr val = do
    pokeField @"bearing_x" ptr val
    pokeField @"bearing_y" ptr val
    pokeField @"advance"   ptr val
    pokeField @"advance_v" ptr val



type FT_Incremental_Metrics = Ptr FT_Incremental_MetricsRec



type FT_Incremental_GetGlyphDataFunc = FT_Incremental -- ^ incremental
                                    -> FT_UInt        -- ^ glyph_index
                                    -> Ptr FT_Data    -- ^ data
                                    -> IO FT_Error



type FT_Incremental_FreeGlyphDataFunc = FT_Incremental -- ^ incremental
                                     -> Ptr FT_Data    -- ^ data
                                     -> IO ()



type FT_Incremental_GetGlyphMetricsFunc = FT_Incremental                -- ^ incremental
                                       -> FT_UInt                       -- ^ glyph_index
                                       -> FT_Bool                       -- ^ vertical
                                       -> Ptr FT_Incremental_MetricsRec -- ^ metrics
                                       -> IO FT_Error



data FT_Incremental_FuncsRec = FT_Incremental_FuncsRec
                                 { get_glyph_data    :: FunPtr FT_Incremental_GetGlyphDataFunc
                                 , free_glyph_data   :: FunPtr FT_Incremental_FreeGlyphDataFunc
                                 , get_glyph_metrics :: FunPtr FT_Incremental_GetGlyphMetricsFunc
                                 }

instance Offset "get_glyph_data"    FT_Incremental_FuncsRec where rawOffset = #{offset struct FT_Incremental_FuncsRec_, get_glyph_data    }
instance Offset "free_glyph_data"   FT_Incremental_FuncsRec where rawOffset = #{offset struct FT_Incremental_FuncsRec_, free_glyph_data   }
instance Offset "get_glyph_metrics" FT_Incremental_FuncsRec where rawOffset = #{offset struct FT_Incremental_FuncsRec_, get_glyph_metrics }


instance Storable FT_Incremental_FuncsRec where
  sizeOf _    = #size      struct FT_Incremental_FuncsRec_
  alignment _ = #alignment struct FT_Incremental_FuncsRec_

  peek ptr =
    FT_Incremental_FuncsRec
      <$> peek (offset @"get_glyph_data"    ptr)
      <*> peek (offset @"free_glyph_data"   ptr)
      <*> peek (offset @"get_glyph_metrics" ptr)

  poke ptr val = do
    pokeField @"get_glyph_data"    ptr val
    pokeField @"free_glyph_data"   ptr val
    pokeField @"get_glyph_metrics" ptr val



data FT_Incremental_InterfaceRec = FT_Incremental_InterfaceRec
                                 { funcs  :: Ptr (FunPtr FT_Incremental_FuncsRec)
                                 , object :: FT_Incremental
                                 }

instance Offset "funcs"  FT_Incremental_InterfaceRec where rawOffset = #{offset struct FT_Incremental_InterfaceRec_, funcs }
instance Offset "object" FT_Incremental_InterfaceRec where rawOffset = #{offset struct FT_Incremental_InterfaceRec_, object}

instance Storable FT_Incremental_InterfaceRec where
  sizeOf _    = #size      struct FT_Incremental_InterfaceRec_
  alignment _ = #alignment struct FT_Incremental_InterfaceRec_

  peek ptr =
    FT_Incremental_InterfaceRec
      <$> peek (offset @"funcs"  ptr)
      <*> peek (offset @"object" ptr)
 
  poke ptr val = do
    pokeField @"funcs"  ptr val
    pokeField @"object" ptr val



type FT_Incremental_Interface = Ptr FT_Incremental_InterfaceRec
