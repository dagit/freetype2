{-# LANGUAGE ForeignFunctionInterface #-}
module Graphics.Rendering.FreeType.Internal.Memory
( FT_MemoryRec(..)
, FT_Memory
) where

import Foreign hiding (free, realloc)
import Foreign.C.Types
import Foreign.Storable

#include <stddef.h>
#let alignment t = "%lu", (unsigned long)offsetof(struct {char x__; t (y__); }, y__)

#include "ft2build.h"
#include FT_FREETYPE_H

type FT_Alloc_Func   = FunPtr (FT_Memory -> CLong -> IO (Ptr ()))
type FT_Free_Func    = FunPtr (FT_Memory -> Ptr () -> IO ())
type FT_Realloc_Func = FunPtr
  (FT_Memory -> CLong -> CLong -> Ptr () -> IO (Ptr ()))
                     

type FT_Memory = Ptr FT_MemoryRec
data FT_MemoryRec = FT_MemoryRec
  { user    :: Ptr ()
  , alloc   :: FT_Alloc_Func
  , free    :: FT_Free_Func
  , realloc :: FT_Realloc_Func
  }

instance Storable FT_MemoryRec where
  sizeOf    _ = #size struct FT_MemoryRec_
  alignment _ = #alignment struct FT_MemoryRec_
  peek ptr = do
    user'    <- (#peek struct FT_MemoryRec_, user) ptr
    alloc'   <- (#peek struct FT_MemoryRec_, alloc) ptr
    free'    <- (#peek struct FT_MemoryRec_, free) ptr
    realloc'  <- (#peek struct FT_MemoryRec_, realloc) ptr
    return $ FT_MemoryRec
      { user = user'
      , alloc = alloc'
      , free = free'
      , realloc = realloc'
      }
  poke ptr val = do
    (#poke struct FT_MemoryRec_, user) ptr (user val)
    (#poke struct FT_MemoryRec_, alloc) ptr (alloc val)
    (#poke struct FT_MemoryRec_, free) ptr (free val)
    (#poke struct FT_MemoryRec_, realloc) ptr (realloc val)
