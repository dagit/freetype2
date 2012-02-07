{-# LANGUAGE ForeignFunctionInterface #-}
module Graphics.Rendering.FreeType.Internal.OpenArgs
( FT_Open_Args(..)
) where

import Foreign
import Foreign.C.String

import Graphics.Rendering.FreeType.Internal.PrimitiveTypes
import Graphics.Rendering.FreeType.Internal.Stream
import Graphics.Rendering.FreeType.Internal.Module
import Graphics.Rendering.FreeType.Internal.Parameter

#include <stddef.h>
#let alignment t = "%lu", (unsigned long)offsetof(struct {char x__; t (y__); }, y__)

#include "ft2build.h"
#include FT_FREETYPE_H

data FT_Open_Args = FT_Open_Args
  { flags       :: FT_UInt
  , memory_base :: FT_Bytes
  , memory_size :: FT_Long
  , pathname    :: CString
  , stream      :: FT_Stream
  , driver      :: FT_Module
  , num_params  :: FT_Int
  , params      :: Ptr FT_Parameter
  }

instance Storable FT_Open_Args where
  sizeOf    _ = #size FT_Open_Args
  alignment _ = #alignment FT_Open_Args
  peek ptr = do
    flags'       <- (#peek FT_Open_Args, flags) ptr
    memory_base' <- (#peek FT_Open_Args, memory_base) ptr
    memory_size' <- (#peek FT_Open_Args, memory_size) ptr
    pathname'    <- (#peek FT_Open_Args, pathname) ptr
    stream'      <- (#peek FT_Open_Args, stream) ptr
    driver'      <- (#peek FT_Open_Args, driver) ptr
    num_params'  <- (#peek FT_Open_Args, num_params) ptr
    params'      <- (#peek FT_Open_Args, params) ptr
    return $ FT_Open_Args
      { flags = flags'
      , memory_base = memory_base'
      , memory_size = memory_size'
      , pathname = pathname'
      , stream = stream'
      , driver = driver'
      , num_params = num_params'
      , params = params'
      }
