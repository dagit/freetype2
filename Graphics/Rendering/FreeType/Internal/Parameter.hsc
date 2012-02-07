{-# LANGUAGE ForeignFunctionInterface #-}
module Graphics.Rendering.FreeType.Internal.Parameter
( FT_Parameter(..)
) where

import Foreign

import Graphics.Rendering.FreeType.Internal.PrimitiveTypes

#include <stddef.h>
#let alignment t = "%lu", (unsigned long)offsetof(struct {char x__; t (y__); }, y__)

#include "ft2build.h"
#include FT_FREETYPE_H

data FT_Parameter = FT_Parameter
  { tag   :: FT_ULong
  , data_ :: FT_Pointer
  }

instance Storable FT_Parameter where
  sizeOf    _ = #size FT_Parameter
  alignment _ = #alignment FT_Parameter
  peek ptr = do
    tag'   <- (#peek FT_Parameter, tag) ptr
    data_' <- (#peek FT_Parameter, data) ptr
    return $ FT_Parameter
      { tag = tag'
      , data_ = data_'
      }
  poke ptr val = do
    (#poke FT_Parameter, tag) ptr (tag val)
    (#poke FT_Parameter, data) ptr (data_ val)
