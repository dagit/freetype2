module Graphics.Rendering.FreeType.Internal.Memory
  {-# DEPRECATED "freetype2 bindings were rewritten from scratch. Please switch to FreeType" #-}
  ( FT_MemoryRec (FT_MemoryRec)
  , FT_Memory
  , module Graphics.Rendering.FreeType.Internal.Memory
  ) where

import           FreeType.Support.System

import           Foreign.Ptr



user :: FT_MemoryRec -> Ptr ()
user = mrUser

alloc :: FT_MemoryRec -> FT_Alloc_Func
alloc = mrAlloc

free :: FT_MemoryRec -> FT_Free_Func
free = mrFree

realloc :: FT_MemoryRec -> FT_Realloc_Func
realloc = mrRealloc
