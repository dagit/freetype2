{-# LANGUAGE ForeignFunctionInterface #-}
module Graphics.Rendering.FreeType.Internal.SizeRequest
( FT_Size_RequestRec(..)
, FT_Size_Request
) where

import Foreign

import Graphics.Rendering.FreeType.Internal.PrimitiveTypes

#include <stddef.h>
#let alignment t = "%lu", (unsigned long)offsetof(struct {char x__; t (y__); }, y__)

#include "ft2build.h"
#include FT_FREETYPE_H

type FT_Size_Request = Ptr FT_Size_RequestRec

data FT_Size_RequestRec = FT_Size_RequestRec
  { type_  :: FT_Size_Request_Type
  , width  :: FT_Long
  , height :: FT_Long
  , horiResolution :: FT_UInt
  , vertResolution :: FT_UInt
  }

instance Storable FT_Size_RequestRec where
  sizeOf    _ = #size FT_Size_RequestRec
  alignment _ = #alignment FT_Size_RequestRec
  peek ptr = do
    type_'          <- (#peek FT_Size_RequestRec, type) ptr
    width'          <- (#peek FT_Size_RequestRec, width) ptr
    height'         <- (#peek FT_Size_RequestRec, height) ptr
    horiResolution' <- (#peek FT_Size_RequestRec, horiResolution) ptr
    vertResolution' <- (#peek FT_Size_RequestRec, vertResolution) ptr
    return $ FT_Size_RequestRec
      { type_ = type_'
      , width = width'
      , height = height'
      , horiResolution = horiResolution'
      , vertResolution = vertResolution'
      }
  poke ptr val = do
    (#poke FT_Size_RequestRec, type) ptr (type_ val)
    (#poke FT_Size_RequestRec, height) ptr (height val)
    (#poke FT_Size_RequestRec, horiResolution) ptr (horiResolution val)
    (#poke FT_Size_RequestRec, vertResolution) ptr (vertResolution val)
