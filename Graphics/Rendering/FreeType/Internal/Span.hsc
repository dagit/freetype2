{-# LANGUAGE ForeignFunctionInterface #-}
module Graphics.Rendering.FreeType.Internal.Span
( FT_Span(..)
) where

import Foreign
import Foreign.C.Types

#include <stddef.h>
#let alignment t = "%lu", (unsigned long)offsetof(struct {char x__; t (y__); }, y__)

#include "ft2build.h"
#include FT_FREETYPE_H

#include "freetype/ftimage.h"

data FT_Span = FT_Span
  { x        :: CShort
  , len      :: CUShort
  , coverage :: CUChar
  }
  deriving (Read, Show, Eq)

instance Storable FT_Span where
  sizeOf    _ = #size FT_Span
  alignment _ = #alignment FT_Span
  peek ptr = do
    x'        <- (#peek FT_Span, x) ptr
    len'      <- (#peek FT_Span, len) ptr
    coverage' <- (#peek FT_Span, coverage) ptr
    return $ FT_Span
      { x = x'
      , len = len'
      , coverage = coverage'
      }
  poke ptr val = do
    (#poke FT_Span, x) ptr (x val)
    (#poke FT_Span, len) ptr (len val)
    (#poke FT_Span, coverage) ptr (coverage val)

