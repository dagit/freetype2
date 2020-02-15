{-# LANGUAGE ForeignFunctionInterface #-}

module FreeType.Raw.Core.Unicode where

import           FreeType.Raw.Circular
import           FreeType.Raw.Core.Types

import           Foreign.C.Types
import           Foreign.Ptr

#include "ft2build.h"
#include FT_FREETYPE_H

foreign import ccall "FT_Face_GetCharVariantIndex"
  ft_Face_GetCharVariantIndex :: FT_Face -> FT_ULong -> FT_ULong -> IO FT_UInt



foreign import ccall "FT_Face_GetCharVariantIsDefault"
  ft_Face_GetCharVariantIsDefault :: FT_Face -> FT_ULong -> FT_ULong -> IO FT_Int



foreign import ccall "FT_Face_GetVariantSelectors"
  ft_Face_GetVariantSelectors :: FT_Face -> IO (Ptr FT_UInt32)



foreign import ccall "FT_Face_GetVariantsOfChar"
  ft_Face_GetVariantsOfChar :: FT_Face -> FT_ULong -> IO (Ptr FT_UInt32)



foreign import ccall "FT_Face_GetCharsOfVariant"
  ft_Face_GetCharsOfVariant :: FT_Face -> FT_ULong -> IO (Ptr FT_UInt32)
