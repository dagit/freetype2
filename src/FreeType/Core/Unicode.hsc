{-# LANGUAGE CApiFFI
           , CPP
           , ForeignFunctionInterface #-}

{- | Please refer to the
     [Core API > Unicode Variation Sequences](https://www.freetype.org/freetype2/docs/reference/ft2-glyph_variants.html)
     chapter of the reference.
-}

module FreeType.Core.Unicode
  ( -- ** FT_Face_GetCharVariantIndex
    ft_Face_GetCharVariantIndex
    -- ** FT_Face_GetCharVariantIsDefault
  , ft_Face_GetCharVariantIsDefault
    -- ** FT_Face_GetVariantSelectors
  , ft_Face_GetVariantSelectors
    -- ** FT_Face_GetVariantsOfChar
  , ft_Face_GetVariantsOfChar
    -- ** FT_Face_GetCharsOfVariant
  , ft_Face_GetCharsOfVariant
  ) where

import           FreeType.Circular.Types
import           FreeType.Core.Types.Types

import           Foreign.Ptr

#include "ft2build.h"
#include FT_FREETYPE_H

foreign import CALLCV "freetype/freetype.h FT_Face_GetCharVariantIndex"
  ft_Face_GetCharVariantIndex
    :: FT_Face    -- ^ face
    -> FT_ULong   -- ^ charcode
    -> FT_ULong   -- ^ variantSelector
    -> IO FT_UInt



foreign import CALLCV "freetype/freetype.h FT_Face_GetCharVariantIsDefault"
  ft_Face_GetCharVariantIsDefault
    :: FT_Face   -- ^ face
    -> FT_ULong  -- ^ charcode
    -> FT_ULong  -- ^ variantSelector
    -> IO FT_Int



foreign import CALLCV "freetype/freetype.h FT_Face_GetVariantSelectors"
  ft_Face_GetVariantSelectors
    :: FT_Face            -- ^ face
    -> IO (Ptr FT_UInt32)



foreign import CALLCV "freetype/freetype.h FT_Face_GetVariantsOfChar"
  ft_Face_GetVariantsOfChar
    :: FT_Face            -- ^ face
    -> FT_ULong           -- ^ charcode
    -> IO (Ptr FT_UInt32)



foreign import CALLCV "freetype/freetype.h FT_Face_GetCharsOfVariant"
  ft_Face_GetCharsOfVariant
    :: FT_Face            -- ^ face
    -> FT_ULong           -- ^ variantSelector
    -> IO (Ptr FT_UInt32)
