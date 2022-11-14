{-# LANGUAGE DataKinds
           , EmptyDataDecls
           , ForeignFunctionInterface
           , MultiParamTypeClasses #-}
#if __GLASGOW_HASKELL__ >= 902
{-# LANGUAGE NoFieldSelectors #-}
#endif
{-# LANGUAGE TypeApplications #-}

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
                 { x        :: CShort
                 , len      :: CUShort
                 , coverage :: CUChar
                 }

instance Offset "x"        FT_Span where rawOffset = #{offset struct FT_Span_, x       }
instance Offset "len"      FT_Span where rawOffset = #{offset struct FT_Span_, len     }
instance Offset "coverage" FT_Span where rawOffset = #{offset struct FT_Span_, coverage}

instance Storable FT_Span where
  sizeOf    _ = #size      struct FT_Span_
  alignment _ = #alignment struct FT_Span_

  peek ptr =
    FT_Span
      <$> peek (offset @"x"        ptr)
      <*> peek (offset @"len"      ptr)
      <*> peek (offset @"coverage" ptr)

  poke ptr val = do
    pokeField @"x"        ptr val
    pokeField @"len"      ptr val
    pokeField @"coverage" ptr val



type FT_SpanFunc = #{type int} -- ^ y
                -> #{type int} -- ^ count
                -> Ptr FT_Span -- ^ spans
                -> Ptr ()      -- ^ user
                -> IO ()



data FT_Raster_Params = FT_Raster_Params
                          { target      :: Ptr FT_Bitmap
                          , source      :: Ptr ()
                          , flags       :: #type int
                          , gray_spans  :: FunPtr FT_SpanFunc
                          , black_spans :: FunPtr FT_SpanFunc
                          , bit_test    :: FunPtr FT_Raster_BitTest_Func
                          , bit_set     :: FunPtr FT_Raster_BitSet_Func
                          , user        :: Ptr ()
                          , clip_box    :: FT_BBox
                          }

instance Offset "target"      FT_Raster_Params where rawOffset = #{offset struct FT_Raster_Params_, target     }
instance Offset "source"      FT_Raster_Params where rawOffset = #{offset struct FT_Raster_Params_, source     }
instance Offset "flags"       FT_Raster_Params where rawOffset = #{offset struct FT_Raster_Params_, flags      }
instance Offset "gray_spans"  FT_Raster_Params where rawOffset = #{offset struct FT_Raster_Params_, gray_spans }
instance Offset "black_spans" FT_Raster_Params where rawOffset = #{offset struct FT_Raster_Params_, black_spans}
instance Offset "bit_test"    FT_Raster_Params where rawOffset = #{offset struct FT_Raster_Params_, bit_test   }
instance Offset "bit_set"     FT_Raster_Params where rawOffset = #{offset struct FT_Raster_Params_, bit_set    }
instance Offset "user"        FT_Raster_Params where rawOffset = #{offset struct FT_Raster_Params_, user       }
instance Offset "clip_box"    FT_Raster_Params where rawOffset = #{offset struct FT_Raster_Params_, clip_box   }

instance Storable FT_Raster_Params where
  sizeOf    _ = #size      struct FT_Raster_Params_
  alignment _ = #alignment struct FT_Raster_Params_

  peek ptr =
    FT_Raster_Params
      <$> peek (offset @"target"      ptr)
      <*> peek (offset @"source"      ptr)
      <*> peek (offset @"flags"       ptr)
      <*> peek (offset @"gray_spans"  ptr)
      <*> peek (offset @"black_spans" ptr)
      <*> peek (offset @"bit_test"    ptr)
      <*> peek (offset @"bit_set"     ptr)
      <*> peek (offset @"user"        ptr)
      <*> peek (offset @"clip_box"    ptr)

  poke ptr val = do
    pokeField @"target"      ptr val
    pokeField @"source"      ptr val
    pokeField @"flags"       ptr val
    pokeField @"gray_spans"  ptr val
    pokeField @"black_spans" ptr val
    pokeField @"bit_test"    ptr val
    pokeField @"bit_set"     ptr val
    pokeField @"user"        ptr val
    pokeField @"clip_box"    ptr val



type FT_Raster_NewFunc = Ptr ()        -- ^ raster
                      -> Ptr FT_Raster -- ^ memory
                      -> IO #type int



type FT_Raster_DoneFunc = FT_Raster -- ^ raster
                       -> IO ()



type FT_Raster_ResetFunc = FT_Raster                 -- ^ raster
                        -> Ptr #{type unsigned char} -- ^ pool_base
                        -> Ptr #{type unsigned long} -- ^ pool_size
                        -> IO ()



type FT_Raster_SetModeFunc = FT_Raster             -- ^ raster
                          -> #{type unsigned long} -- ^ mode
                          -> Ptr ()                -- ^ args
                          -> IO #type int



type FT_Raster_RenderFunc = FT_Raster            -- ^ raster
                         -> Ptr FT_Raster_Params -- ^ params
                         -> IO #type int



data FT_Raster_Funcs = FT_Raster_Funcs
                         { glyph_format    :: FT_Glyph_Format
                         , raster_new      :: FunPtr FT_Raster_NewFunc
                         , raster_reset    :: FunPtr FT_Raster_ResetFunc
                         , raster_set_mode :: FunPtr FT_Raster_SetModeFunc
                         , raster_render   :: FunPtr FT_Raster_RenderFunc
                         , raster_done     :: FunPtr FT_Raster_DoneFunc
                         }

instance Offset "glyph_format"    FT_Raster_Funcs where rawOffset = #{offset struct FT_Raster_Funcs_, glyph_format   }
instance Offset "raster_new"      FT_Raster_Funcs where rawOffset = #{offset struct FT_Raster_Funcs_, raster_new     }
instance Offset "raster_reset"    FT_Raster_Funcs where rawOffset = #{offset struct FT_Raster_Funcs_, raster_reset   }
instance Offset "raster_set_mode" FT_Raster_Funcs where rawOffset = #{offset struct FT_Raster_Funcs_, raster_set_mode}
instance Offset "raster_render"   FT_Raster_Funcs where rawOffset = #{offset struct FT_Raster_Funcs_, raster_render  }
instance Offset "raster_done"     FT_Raster_Funcs where rawOffset = #{offset struct FT_Raster_Funcs_, raster_done    }

instance Storable FT_Raster_Funcs where
  sizeOf    _ = #size      struct FT_Raster_Funcs_
  alignment _ = #alignment struct FT_Raster_Funcs_

  peek ptr =
    FT_Raster_Funcs
      <$> peek (offset @"glyph_format"    ptr)
      <*> peek (offset @"raster_new"      ptr)
      <*> peek (offset @"raster_reset"    ptr)
      <*> peek (offset @"raster_set_mode" ptr)
      <*> peek (offset @"raster_render"   ptr)
      <*> peek (offset @"raster_done"     ptr)

  poke ptr val = do
    pokeField @"glyph_format"    ptr val
    pokeField @"raster_new"      ptr val
    pokeField @"raster_reset"    ptr val
    pokeField @"raster_set_mode" ptr val
    pokeField @"raster_render"   ptr val
    pokeField @"raster_done"     ptr val



type FT_Raster_BitTest_Func = #{type int} -- ^ y
                           -> #{type int} -- ^ x
                           -> Ptr ()      -- ^ user
                           -> IO #type int



type FT_Raster_BitSet_Func = #{type int} -- ^ y
                          -> #{type int} -- ^ x
                          -> Ptr ()      -- ^ user
                          -> IO ()
