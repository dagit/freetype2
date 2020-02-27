{-# LANGUAGE EmptyDataDecls #-}
{-# OPTIONS_HADDOCK hide #-}

module FreeType.Miscellaneous.Incremental.Internal where

import           FreeType.Core.Types.Internal

import           Foreign.Ptr

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



type FT_Incremental_Metrics = Ptr FT_Incremental_MetricsRec



type FT_Incremental_GetGlyphDataFunc = FunPtr (FT_Incremental -> FT_UInt -> Ptr FT_Data -> IO FT_Error)



type FT_Incremental_FreeGlyphDataFunc = FunPtr (FT_Incremental -> Ptr FT_Data -> IO ())



type FT_Incremental_GetGlyphMetricsFunc = FunPtr (FT_Incremental -> FT_UInt -> FT_Bool -> Ptr FT_Incremental_MetricsRec -> IO FT_Error)



data FT_Incremental_FuncsRec = FT_Incremental_FuncsRec
                                 { ifrGet_glyph_data    :: FT_Incremental_GetGlyphDataFunc
                                 , ifrFree_glyph_data   :: FT_Incremental_FreeGlyphDataFunc
                                 , ifrGet_glyph_metrics :: FT_Incremental_GetGlyphMetricsFunc
                                 }



data FT_Incremental_InterfaceRec = FT_Incremental_InterfaceRec
                                 { iirFuncs  :: Ptr FT_Incremental_FuncsRec
                                 , iirObject :: FT_Incremental
                                 }



type FT_Incremental_Interface = Ptr FT_Incremental_InterfaceRec
