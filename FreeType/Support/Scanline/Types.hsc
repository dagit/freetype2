{-# LANGUAGE DataKinds
           , FlexibleInstances
           , EmptyDataDecls
           , ForeignFunctionInterface
           , MultiParamTypeClasses
           , TypeApplications #-}

module FreeType.Support.Scanline.Types where

import           FreeType.Core.Types.Types

import           Data.Int
import           Data.Word
import           Foreign.C.Types
import           Foreign.Ptr
import           Foreign.Storable
import           Foreign.Storable.Offset

#include "ft2build.h"
#include FT_FREETYPE_H

data FT_RasterRec
type FT_Raster = Ptr FT_RasterRec



data FT_Span = FT_Span
                 { sX        :: CShort
                 , sLen      :: CUShort
                 , sCoverage :: CUChar
                 }

instance Offset "sX"        FT_Span where rawOffset = #{offset struct FT_Span_, x       }
instance Offset "sLen"      FT_Span where rawOffset = #{offset struct FT_Span_, len     }
instance Offset "sCoverage" FT_Span where rawOffset = #{offset struct FT_Span_, coverage}

instance Storable FT_Span where
  sizeOf    _ = #size      struct FT_Span_
  alignment _ = #alignment struct FT_Span_

  peek ptr =
    FT_Span
      <$> peek (offset @"sX"        ptr)
      <*> peek (offset @"sLen"      ptr)
      <*> peek (offset @"sCoverage" ptr)

  poke ptr val = do
    pokeField @"sX"        ptr val
    pokeField @"sLen"      ptr val
    pokeField @"sCoverage" ptr val



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

instance Offset "rpTarget"      FT_Raster_Params where rawOffset = #{offset struct FT_Raster_Params_, target     }
instance Offset "rpSource"      FT_Raster_Params where rawOffset = #{offset struct FT_Raster_Params_, source     }
instance Offset "rpFlags"       FT_Raster_Params where rawOffset = #{offset struct FT_Raster_Params_, flags      }
instance Offset "rpGray_spans"  FT_Raster_Params where rawOffset = #{offset struct FT_Raster_Params_, gray_spans }
instance Offset "rpBlack_spans" FT_Raster_Params where rawOffset = #{offset struct FT_Raster_Params_, black_spans}
instance Offset "rpBit_test"    FT_Raster_Params where rawOffset = #{offset struct FT_Raster_Params_, bit_test   }
instance Offset "rpBit_set"     FT_Raster_Params where rawOffset = #{offset struct FT_Raster_Params_, bit_set    }
instance Offset "rpUser"        FT_Raster_Params where rawOffset = #{offset struct FT_Raster_Params_, user       }
instance Offset "rpClip_box"    FT_Raster_Params where rawOffset = #{offset struct FT_Raster_Params_, clip_box   }

instance Storable FT_Raster_Params where
  sizeOf    _ = #size      struct FT_Raster_Params_
  alignment _ = #alignment struct FT_Raster_Params_

  peek ptr =
    FT_Raster_Params
      <$> peek (offset @"rpTarget"      ptr)
      <*> peek (offset @"rpSource"      ptr)
      <*> peek (offset @"rpFlags"       ptr)
      <*> peek (offset @"rpGray_spans"  ptr)
      <*> peek (offset @"rpBlack_spans" ptr)
      <*> peek (offset @"rpBit_test"    ptr)
      <*> peek (offset @"rpBit_set"     ptr)
      <*> peek (offset @"rpUser"        ptr)
      <*> peek (offset @"rpClip_box"    ptr)

  poke ptr val = do
    pokeField @"rpTarget"      ptr val
    pokeField @"rpSource"      ptr val
    pokeField @"rpFlags"       ptr val
    pokeField @"rpGray_spans"  ptr val
    pokeField @"rpBlack_spans" ptr val
    pokeField @"rpBit_test"    ptr val
    pokeField @"rpBit_set"     ptr val
    pokeField @"rpUser"        ptr val
    pokeField @"rpClip_box"    ptr val



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

instance Offset "rfGlyph_format"    FT_Raster_Funcs where rawOffset = #{offset struct FT_Raster_Funcs_, glyph_format   }
instance Offset "rfRaster_new"      FT_Raster_Funcs where rawOffset = #{offset struct FT_Raster_Funcs_, raster_new     }
instance Offset "rfRaster_reset"    FT_Raster_Funcs where rawOffset = #{offset struct FT_Raster_Funcs_, raster_reset   }
instance Offset "rfRaster_set_mode" FT_Raster_Funcs where rawOffset = #{offset struct FT_Raster_Funcs_, raster_set_mode}
instance Offset "rfRaster_render"   FT_Raster_Funcs where rawOffset = #{offset struct FT_Raster_Funcs_, raster_render  }
instance Offset "rfRaster_done"     FT_Raster_Funcs where rawOffset = #{offset struct FT_Raster_Funcs_, raster_done    }

instance Storable FT_Raster_Funcs where
  sizeOf    _ = #size      struct FT_Raster_Funcs_
  alignment _ = #alignment struct FT_Raster_Funcs_

  peek ptr =
    FT_Raster_Funcs
      <$> peek (offset @"rfGlyph_format"    ptr)
      <*> peek (offset @"rfRaster_new"      ptr)
      <*> peek (offset @"rfRaster_reset"    ptr)
      <*> peek (offset @"rfRaster_set_mode" ptr)
      <*> peek (offset @"rfRaster_render"   ptr)
      <*> peek (offset @"rfRaster_done"     ptr)

  poke ptr val = do
    pokeField @"rfGlyph_format"    ptr val
    pokeField @"rfRaster_new"      ptr val
    pokeField @"rfRaster_reset"    ptr val
    pokeField @"rfRaster_set_mode" ptr val
    pokeField @"rfRaster_render"   ptr val
    pokeField @"rfRaster_done"     ptr val



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
