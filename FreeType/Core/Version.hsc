{-# LANGUAGE ForeignFunctionInterface
           , PatternSynonyms #-}

{- | Please refer to the
     [Core API > FreeType Version](https://www.freetype.org/freetype2/docs/reference/ft2-version.html)
     chapter of the reference.
-}

module FreeType.Core.Version
  ( -- ** FT_Library_Version
    ft_Library_Version
    -- ** FT_Face_CheckTrueTypePatents
  , ft_Face_CheckTrueTypePatents
    -- ** FT_Face_SetUnpatentedHinting
  , ft_Face_SetUnpatentedHinting
    -- ** FREETYPE_XXX
  , pattern FREETYPE_MINOR
  , pattern FREETYPE_MAJOR
  , pattern FREETYPE_PATCH
  )
where

import           FreeType.Core.Base.Types
import           FreeType.Core.Types.Types

import           Foreign.Ptr

#include "ft2build.h"
#include FT_FREETYPE_H

foreign import ccall "FT_Library_Version"
  ft_Library_Version
    :: FT_Library -- ^ library
    -> Ptr FT_Int -- ^ amajor
    -> Ptr FT_Int -- ^ aminor
    -> Ptr FT_Int -- ^ apatch
    -> IO ()



foreign import ccall "FT_Face_CheckTrueTypePatents"
  ft_Face_CheckTrueTypePatents
    :: FT_Face    -- ^ face
    -> IO FT_Bool



foreign import ccall "FT_Face_SetUnpatentedHinting"
  ft_Face_SetUnpatentedHinting
    :: FT_Face    -- ^ face
    -> FT_Bool    -- ^ value
    -> IO FT_Bool



pattern FREETYPE_MAJOR
      , FREETYPE_MINOR
      , FREETYPE_PATCH
     :: (Eq a, Num a) => a
pattern FREETYPE_MAJOR = #const FREETYPE_MAJOR
pattern FREETYPE_MINOR = #const FREETYPE_MINOR
pattern FREETYPE_PATCH = #const FREETYPE_PATCH
