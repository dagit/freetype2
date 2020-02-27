{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE ForeignFunctionInterface #-}
{-# OPTIONS_HADDOCK hide #-}

module FreeType.Support.Scanline.Internal where

import           FreeType.Core.Types.Internal

import           Foreign.C.Types
import           Foreign.Ptr

#include "ft2build.h"
#include FT_FREETYPE_H

data FT_RasterRec
type FT_Raster = Ptr FT_RasterRec



data FT_Span = FT_Span
                 { sX        :: CShort
                 , sLen      :: CUShort
                 , sCoverage :: CUChar
                 }



type FT_SpanFunc = FunPtr (CInt -> CInt -> Ptr FT_Span -> Ptr () -> IO ())
type FT_Raster_Span_Func = FT_SpanFunc



data FT_Raster_Params = FT_Raster_Params
                          { rpTarget      :: Ptr FT_Bitmap
                          , rpSource      :: Ptr ()
                          , rpFlags       :: CInt
                          , rpGray_spans  :: FT_SpanFunc
                          , rpBlack_spans :: FT_SpanFunc
                          , rpBit_test    :: FT_Raster_BitTest_Func
                          , rpBit_set     :: FT_Raster_BitSet_Func
                          , rpUser        :: Ptr ()
                          , rpClip_box    :: FT_BBox
                          }



newtype FT_Raster_Flag = FT_Raster_Flag { unFT_Raster_Flag :: CInt }

#{enum FT_Raster_Flag, FT_Raster_Flag
 , ft_Raster_Flag_Default = FT_RASTER_FLAG_DEFAULT
 , ft_Raster_Flag_Aa      = FT_RASTER_FLAG_AA
 , ft_Raster_Flag_Direct  = FT_RASTER_FLAG_DIRECT
 , ft_Raster_Flag_Clip    = FT_RASTER_FLAG_CLIP
 }



type FT_Raster_NewFunc = FunPtr (Ptr () -> Ptr FT_Raster -> IO CInt)
type FT_Raster_New_Func = FT_Raster_NewFunc



type FT_Raster_DoneFunc = FunPtr (FT_Raster -> IO ())
type FT_Raster_Done_Func = FT_Raster_DoneFunc



type FT_Raster_ResetFunc = FunPtr (FT_Raster -> Ptr CUChar -> Ptr CULong -> IO ())
type FT_Raster_Reset_Func = FT_Raster_ResetFunc



type FT_Raster_SetModeFunc = FunPtr (FT_Raster -> CULong -> Ptr () -> IO CInt)
type FT_Raster_SetMode_Func = FT_Raster_SetModeFunc



type FT_Raster_RenderFunc = FunPtr (FT_Raster -> Ptr FT_Raster_Params -> IO CInt)
type FT_Raster_Render_Func = FT_Raster_RenderFunc



data FT_Raster_Funcs = FT_Raster_Funcs
                         { rfGlyph_format    :: FT_Glyph_Format
                         , rfRaster_new      :: FT_Raster_NewFunc
                         , rfRaster_reset    :: FT_Raster_ResetFunc
                         , rfRaster_set_mode :: FT_Raster_SetModeFunc
                         , rfRaster_render   :: FT_Raster_RenderFunc
                         , rfRaster_done     :: FT_Raster_DoneFunc
                         }

type FT_Raster_BitTest_Func = FunPtr (CInt -> CInt -> Ptr () -> IO CInt)

type FT_Raster_BitSet_Func = FunPtr (CInt -> CInt -> Ptr () -> IO ())
