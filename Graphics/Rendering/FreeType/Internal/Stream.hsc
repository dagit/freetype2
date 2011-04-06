{-# LANGUAGE ForeignFunctionInterface, EmptyDataDecls #-}
module Graphics.Rendering.FreeType.Internal.Stream
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

import Prelude hiding (read)

import Foreign
import Foreign.C.Types

import Graphics.Rendering.FreeType.Internal.Memory

#include <stddef.h>
#let alignment t = "%lu", (unsigned long)offsetof(struct {char x__; t (y__); }, y__)

#include "ft2build.h"
#include FT_FREETYPE_H

#include "freetype/ftsystem.h"

-- We don't have FILE* in Haskell, so we cheat and only
-- consider the long part of the FT_StreamDesc union...
type FT_StreamDesc = CLong

type FT_Stream_IoFunc = FunPtr
  (FT_Stream -> CULong -> Ptr CUChar -> CULong -> IO CULong)

type FT_Stream_CloseFunc = FunPtr (FT_Stream -> IO ())

data FT_StreamRec_
type FT_Stream = Ptr FT_StreamRec_

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
