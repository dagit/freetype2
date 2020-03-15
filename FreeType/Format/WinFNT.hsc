{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE TemplateHaskell #-}

{- | Please refer to the
     [Format-Specific API > Window FNT Files](https://www.freetype.org/freetype2/docs/reference/ft2-winfnt_fonts.html)
     chapter of the reference.

     Internal: "FreeType.Format.WinFNT.Internal".
 -}

module FreeType.Format.WinFNT
  ( -- ** FT_WinFNT_ID_XXX
    pattern FT_WinFNT_ID_CP1252
  , pattern FT_WinFNT_ID_DEFAULT
  , pattern FT_WinFNT_ID_SYMBOL
  , pattern FT_WinFNT_ID_MAC
  , pattern FT_WinFNT_ID_CP932
  , pattern FT_WinFNT_ID_CP949
  , pattern FT_WinFNT_ID_CP1361
  , pattern FT_WinFNT_ID_CP936
  , pattern FT_WinFNT_ID_CP950
  , pattern FT_WinFNT_ID_CP1253
  , pattern FT_WinFNT_ID_CP1254
  , pattern FT_WinFNT_ID_CP1258
  , pattern FT_WinFNT_ID_CP1255
  , pattern FT_WinFNT_ID_CP1256
  , pattern FT_WinFNT_ID_CP1257
  , pattern FT_WinFNT_ID_CP1251
  , pattern FT_WinFNT_ID_CP874
  , pattern FT_WinFNT_ID_CP1250
  , pattern FT_WinFNT_ID_OEM
    -- ** FT_WinFNT_HeaderRec
  , FT_WinFNT_HeaderRec (..)
    -- ** FT_WinFNT_Header
  , FT_WinFNT_Header
    -- ** FT_Get_WinFNT_Header
  , ft_Get_WinFNT_Header
  ) where

import           FreeType.Core.Base.Types
import           FreeType.Exception.Internal
import           FreeType.Format.WinFNT.Internal
import           FreeType.Format.WinFNT.Types

#include "ft2build.h"
#include FT_WINFONTS_H

pattern FT_WinFNT_ID_CP1252
      , FT_WinFNT_ID_DEFAULT
      , FT_WinFNT_ID_SYMBOL
      , FT_WinFNT_ID_MAC
      , FT_WinFNT_ID_CP932
      , FT_WinFNT_ID_CP949
      , FT_WinFNT_ID_CP1361
      , FT_WinFNT_ID_CP936
      , FT_WinFNT_ID_CP950
      , FT_WinFNT_ID_CP1253
      , FT_WinFNT_ID_CP1254
      , FT_WinFNT_ID_CP1258
      , FT_WinFNT_ID_CP1255
      , FT_WinFNT_ID_CP1256
      , FT_WinFNT_ID_CP1257
      , FT_WinFNT_ID_CP1251
      , FT_WinFNT_ID_CP874
      , FT_WinFNT_ID_CP1250
      , FT_WinFNT_ID_OEM
     :: (Eq a, Num a) => a
pattern FT_WinFNT_ID_CP1252  = #const FT_WinFNT_ID_CP1252
pattern FT_WinFNT_ID_DEFAULT = #const FT_WinFNT_ID_DEFAULT
pattern FT_WinFNT_ID_SYMBOL  = #const FT_WinFNT_ID_SYMBOL
pattern FT_WinFNT_ID_MAC     = #const FT_WinFNT_ID_MAC
pattern FT_WinFNT_ID_CP932   = #const FT_WinFNT_ID_CP932
pattern FT_WinFNT_ID_CP949   = #const FT_WinFNT_ID_CP949
pattern FT_WinFNT_ID_CP1361  = #const FT_WinFNT_ID_CP1361
pattern FT_WinFNT_ID_CP936   = #const FT_WinFNT_ID_CP936
pattern FT_WinFNT_ID_CP950   = #const FT_WinFNT_ID_CP950
pattern FT_WinFNT_ID_CP1253  = #const FT_WinFNT_ID_CP1253
pattern FT_WinFNT_ID_CP1254  = #const FT_WinFNT_ID_CP1254
pattern FT_WinFNT_ID_CP1258  = #const FT_WinFNT_ID_CP1258
pattern FT_WinFNT_ID_CP1255  = #const FT_WinFNT_ID_CP1255
pattern FT_WinFNT_ID_CP1256  = #const FT_WinFNT_ID_CP1256
pattern FT_WinFNT_ID_CP1257  = #const FT_WinFNT_ID_CP1257
pattern FT_WinFNT_ID_CP1251  = #const FT_WinFNT_ID_CP1251
pattern FT_WinFNT_ID_CP874   = #const FT_WinFNT_ID_CP874
pattern FT_WinFNT_ID_CP1250  = #const FT_WinFNT_ID_CP1250
pattern FT_WinFNT_ID_OEM     = #const FT_WinFNT_ID_OEM




ft_Get_WinFNT_Header
  :: FT_Face                -- ^ face
  -> IO FT_WinFNT_HeaderRec -- ^ header
ft_Get_WinFNT_Header =
  autoAllocaError 'ft_Get_WinFNT_Header ft_Get_WinFNT_Header'
