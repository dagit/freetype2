{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE ForeignFunctionInterface #-}

module FreeType.Support.Scanline.Types where

import           FreeType.Core.Types.Types

import           Data.Int
import           Data.Function ((&))
import           Data.Word
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
    #{poke struct FT_Span_, x       } ptr $ val & sX
    #{poke struct FT_Span_, len     } ptr $ val & sLen
    #{poke struct FT_Span_, coverage} ptr $ val & sCoverage



type FT_SpanFunc = #{type int} -- ^ y
                -> #{type int} -- ^ count
                -> Ptr FT_Span -- ^ spans
                -> Ptr ()      -- ^ user
                -> IO ()

foreign import ccall "wrapper"
  ft_SpanFunc :: FT_SpanFunc -> IO (FunPtr FT_SpanFunc)

foreign import ccall "dynamic"
  ft_SpanFunc' :: FunPtr FT_SpanFunc -> FT_SpanFunc



data FT_Raster_Params = FT_Raster_Params
                          { rpTarget      :: Ptr FT_Bitmap
                          , rpSource      :: Ptr ()
                          , rpFlags       :: #type int
                          , rpGray_spans  :: FunPtr FT_SpanFunc
                          , rpBlack_spans :: FunPtr FT_SpanFunc
                          , rpBit_test    :: FunPtr FT_Raster_BitTest_Func
                          , rpBit_set     :: FunPtr FT_Raster_BitSet_Func
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
    #{poke struct FT_Raster_Params_, target     } ptr $ val & rpTarget
    #{poke struct FT_Raster_Params_, source     } ptr $ val & rpSource
    #{poke struct FT_Raster_Params_, flags      } ptr $ val & rpFlags
    #{poke struct FT_Raster_Params_, gray_spans } ptr $ val & rpGray_spans
    #{poke struct FT_Raster_Params_, black_spans} ptr $ val & rpBlack_spans
    #{poke struct FT_Raster_Params_, bit_test   } ptr $ val & rpBit_test
    #{poke struct FT_Raster_Params_, bit_set    } ptr $ val & rpBit_set
    #{poke struct FT_Raster_Params_, user       } ptr $ val & rpUser
    #{poke struct FT_Raster_Params_, clip_box   } ptr $ val & rpClip_box



type FT_Raster_NewFunc = Ptr ()        -- ^ raster
                      -> Ptr FT_Raster -- ^ memory
                      -> IO #type int

foreign import ccall "wrapper"
  ft_Raster_NewFunc :: FT_Raster_NewFunc -> IO (FunPtr FT_Raster_NewFunc)

foreign import ccall "dynamic"
  ft_Raster_NewFunc' :: FunPtr FT_Raster_NewFunc -> FT_Raster_NewFunc



type FT_Raster_DoneFunc = FT_Raster -- ^ raster
                       -> IO ()

foreign import ccall "wrapper"
  ft_Raster_DoneFunc :: FT_Raster_DoneFunc -> IO (FunPtr FT_Raster_DoneFunc)

foreign import ccall "dynamic"
  ft_Raster_DoneFunc' :: FunPtr FT_Raster_DoneFunc -> FT_Raster_DoneFunc



type FT_Raster_ResetFunc = FT_Raster                 -- ^ raster
                        -> Ptr #{type unsigned char} -- ^ pool_base
                        -> Ptr #{type unsigned long} -- ^ pool_size
                        -> IO ()

foreign import ccall "wrapper"
  ft_Raster_ResetFunc :: FT_Raster_ResetFunc -> IO (FunPtr FT_Raster_ResetFunc)

foreign import ccall "dynamic"
  ft_Raster_ResetFunc' :: FunPtr FT_Raster_ResetFunc -> FT_Raster_ResetFunc



type FT_Raster_SetModeFunc = FT_Raster             -- ^ raster
                          -> #{type unsigned long} -- ^ mode
                          -> Ptr ()                -- ^ args
                          -> IO #type int

foreign import ccall "wrapper"
  ft_Raster_SetModeFunc :: FT_Raster_SetModeFunc -> IO (FunPtr FT_Raster_SetModeFunc)

foreign import ccall "dynamic"
  ft_Raster_SetModeFunc' :: FunPtr FT_Raster_SetModeFunc -> FT_Raster_SetModeFunc



type FT_Raster_RenderFunc = FT_Raster            -- ^ raster
                         -> Ptr FT_Raster_Params -- ^ params
                         -> IO #type int

foreign import ccall "wrapper"
  ft_Raster_RenderFunc :: FT_Raster_RenderFunc -> IO (FunPtr FT_Raster_RenderFunc)

foreign import ccall "dynamic"
  ft_Raster_RenderFunc' :: FunPtr FT_Raster_RenderFunc -> FT_Raster_RenderFunc



data FT_Raster_Funcs = FT_Raster_Funcs
                         { rfGlyph_format    :: FT_Glyph_Format
                         , rfRaster_new      :: FunPtr FT_Raster_NewFunc
                         , rfRaster_reset    :: FunPtr FT_Raster_ResetFunc
                         , rfRaster_set_mode :: FunPtr FT_Raster_SetModeFunc
                         , rfRaster_render   :: FunPtr FT_Raster_RenderFunc
                         , rfRaster_done     :: FunPtr FT_Raster_DoneFunc
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
    #{poke struct FT_Raster_Funcs_, glyph_format   } ptr $ val & rfGlyph_format
    #{poke struct FT_Raster_Funcs_, raster_new     } ptr $ val & rfRaster_new
    #{poke struct FT_Raster_Funcs_, raster_reset   } ptr $ val & rfRaster_reset
    #{poke struct FT_Raster_Funcs_, raster_set_mode} ptr $ val & rfRaster_set_mode
    #{poke struct FT_Raster_Funcs_, raster_render  } ptr $ val & rfRaster_render
    #{poke struct FT_Raster_Funcs_, raster_done    } ptr $ val & rfRaster_done



type FT_Raster_BitTest_Func = #{type int} -- ^ y
                           -> #{type int} -- ^ x
                           -> Ptr ()      -- ^ user
                           -> IO #type int

foreign import ccall "wrapper"
  ft_Raster_BitTest_Func :: FT_Raster_BitTest_Func -> IO (FunPtr FT_Raster_BitTest_Func)

foreign import ccall "dynamic"
  ft_Raster_BitTest_Func' :: FunPtr FT_Raster_BitTest_Func -> FT_Raster_BitTest_Func



type FT_Raster_BitSet_Func = #{type int} -- ^ y
                          -> #{type int} -- ^ x
                          -> Ptr ()      -- ^ user
                          -> IO ()

foreign import ccall "wrapper"
  ft_Raster_BitSet_Func :: FT_Raster_BitSet_Func -> IO (FunPtr FT_Raster_BitSet_Func)

foreign import ccall "dynamic"
  ft_Raster_BitSet_Func' :: FunPtr FT_Raster_BitSet_Func -> FT_Raster_BitSet_Func
