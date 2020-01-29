{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE ForeignFunctionInterface #-}

module Graphics.FreeType.Bindings.Support.Scanline where

import           Graphics.FreeType.Bindings.Core.Types

import           Foreign.C.Types
import           Foreign.Ptr
import           Foreign.Storable

#include "ft2build.h"
#include FT_FREETYPE_H

data FT_RasterRec
type FT_Raster = Ptr FT_RasterRec



data FT_Span = FT_Span
                 { sX        :: CShort
                 , sLen      :: CUShort
                 , sCoverage :: CUChar
                 }

instance Storable FT_Span where
  sizeOf    _ = #size      struct FT_Span_
  alignment _ = #alignment struct FT_Span_

  peek ptr =
    FT_Span
      <$> #{peek struct FT_Span_, x       } ptr
      <*> #{peek struct FT_Span_, len     } ptr
      <*> #{peek struct FT_Span_, coverage} ptr

  poke ptr val = do
    #{poke struct FT_Span_, x       } ptr $ sX        val
    #{poke struct FT_Span_, len     } ptr $ sLen      val
    #{poke struct FT_Span_, coverage} ptr $ sCoverage val



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
    #{poke struct FT_Raster_Params_, target     } ptr $ rpTarget      val
    #{poke struct FT_Raster_Params_, source     } ptr $ rpSource      val
    #{poke struct FT_Raster_Params_, flags      } ptr $ rpFlags       val
    #{poke struct FT_Raster_Params_, gray_spans } ptr $ rpGray_spans  val
    #{poke struct FT_Raster_Params_, black_spans} ptr $ rpBlack_spans val
    #{poke struct FT_Raster_Params_, bit_test   } ptr $ rpBit_test    val
    #{poke struct FT_Raster_Params_, bit_set    } ptr $ rpBit_set     val
    #{poke struct FT_Raster_Params_, user       } ptr $ rpUser        val
    #{poke struct FT_Raster_Params_, clip_box   } ptr $ rpClip_box    val



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
    #{poke struct FT_Raster_Funcs_, glyph_format   } ptr $ rfGlyph_format    val
    #{poke struct FT_Raster_Funcs_, raster_new     } ptr $ rfRaster_new      val
    #{poke struct FT_Raster_Funcs_, raster_reset   } ptr $ rfRaster_reset    val
    #{poke struct FT_Raster_Funcs_, raster_set_mode} ptr $ rfRaster_set_mode val
    #{poke struct FT_Raster_Funcs_, raster_render  } ptr $ rfRaster_render   val
    #{poke struct FT_Raster_Funcs_, raster_done    } ptr $ rfRaster_done     val

type FT_Raster_BitTest_Func = FunPtr (CInt -> CInt -> Ptr () -> IO CInt)

type FT_Raster_BitSet_Func = FunPtr (CInt -> CInt -> Ptr () -> IO ())
