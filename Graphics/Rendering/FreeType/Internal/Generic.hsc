{-# LANGUAGE ForeignFunctionInterface #-}
module Graphics.Rendering.FreeType.Internal.Generic
( FT_Generic(..)
, FT_Generic_Finalizer
) where

import Foreign
import Foreign.Storable

#include <stddef.h>
#let alignment t = "%lu", (unsigned long)offsetof(struct {char x__; t (y__); }, y__)

#include "ft2build.h"
#include FT_FREETYPE_H

type FT_Generic_Finalizer = FunPtr (Ptr () -> IO ())

data FT_Generic = FT_Generic
  { data_ :: Ptr ()
  , finalizer :: FT_Generic_Finalizer
  }

instance Storable FT_Generic where
  sizeOf    _ = #size FT_Generic
  alignment _ = #alignment FT_Generic
  -- Is peek/poke defined correctly given that data is a void*
  -- and finalizer is a function pointer?
  peek ptr = do
    data_'     <- (#peek FT_Generic, data) ptr
    finalizer' <- (#peek FT_Generic, finalizer) ptr
    return $ FT_Generic
      { data_ = data_'
      , finalizer = finalizer'
      }
  poke ptr val = do
    (#poke FT_Generic, data) ptr (data_ val)
    (#poke FT_Generic, finalizer) ptr (finalizer val) 
