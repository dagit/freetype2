{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE TemplateHaskell #-}

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
import           FreeType.Core.Version.Internal

import           Foreign.Marshal.Alloc
import           Foreign.Storable

#include "ft2build.h"
#include FT_FREETYPE_H

ft_Library_Version
  :: FT_Library                  -- ^ library
  -> IO (FT_Int, FT_Int, FT_Int) -- ^ (major, minor, patch)
ft_Library_Version lib =
  alloca $ \majorPtr ->
    alloca $ \minorPtr ->
      alloca $ \patchPtr -> do
        ft_Library_Version' lib majorPtr minorPtr patchPtr
        (,,)
          <$> peek majorPtr
          <*> peek minorPtr
          <*> peek patchPtr



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
     :: FT_Int
pattern FREETYPE_MAJOR = #const FREETYPE_MAJOR
pattern FREETYPE_MINOR = #const FREETYPE_MINOR
pattern FREETYPE_PATCH = #const FREETYPE_PATCH
