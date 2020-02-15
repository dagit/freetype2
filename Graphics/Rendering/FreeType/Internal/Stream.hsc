module Graphics.Rendering.FreeType.Internal.Stream
  {-# DEPRECATED "freetype2 bindings were rewritten from scratch. Please switch to FreeType.Raw" #-}
  ( FT_StreamRec_
  , FT_Stream
  , FT_StreamDesc
  , FT_Stream_IoFunc
  , FT_Stream_CloseFunc
  , base
  , size
  , pos
  , descriptor
  , read
  , close
  , memory
  , cursor
  , limit
  ) where

import           FreeType.Raw.Support.System hiding (FT_StreamDesc)

import           Foreign.C.Types
import           Foreign.Ptr
import           Prelude hiding (read)

#include "ft2build.h"
#include FT_FREETYPE_H


-- We don't have FILE* in Haskell, so we cheat and only
-- consider the long part of the FT_StreamDesc union...
type FT_StreamDesc = CLong

type FT_StreamRec_ = FT_StreamRec

base :: FT_Stream -> Ptr (Ptr CUChar)
base = #ptr struct FT_StreamRec_, base

size :: FT_Stream -> Ptr CULong
size = #ptr struct FT_StreamRec_, size

pos :: FT_Stream -> Ptr CULong
pos = #ptr struct FT_StreamRec_, pos 

descriptor :: FT_Stream -> Ptr FT_StreamDesc
descriptor = #ptr struct FT_StreamRec_, descriptor

read :: FT_Stream -> Ptr FT_Stream_IoFunc
read = #ptr struct FT_StreamRec_, read

close :: FT_Stream -> Ptr FT_Stream_CloseFunc
close = #ptr struct FT_StreamRec_, close

memory :: FT_Stream -> Ptr FT_Memory
memory = #ptr struct FT_StreamRec_, memory

cursor :: FT_Stream -> Ptr (Ptr CUChar)
cursor = #ptr struct FT_StreamRec_, cursor

limit :: FT_Stream -> Ptr (Ptr CUChar)
limit = #ptr struct FT_StreamRec_, limit
