{-# LANGUAGE CApiFFI
           , CPP
           , ForeignFunctionInterface
           , PatternSynonyms #-}

{- | Please refer to the
     [Format-Specific API > BDF and PCF Files](https://www.freetype.org/freetype2/docs/reference/ft2-bdf_fonts.html)
     chapter of the reference.
 -}

module FreeType.Format.BDF
  ( -- ** BDF_PropertyType
    BDF_PropertyType
  , pattern BDF_PROPERTY_TYPE_NONE
  , pattern BDF_PROPERTY_TYPE_ATOM
  , pattern BDF_PROPERTY_TYPE_INTEGER
  , pattern BDF_PROPERTY_TYPE_CARDINAL
    -- ** BDF_Property
  , BDF_Property
    -- ** BDF_PropertyRec
  , BDF_PropertyRec (..)
    -- ** FT_Get_BDF_Charset_ID
  , ft_Get_BDF_Charset_ID
    -- ** FT_Get_BDF_Property
  , ft_Get_BDF_Property
  ) where

import           FreeType.Core.Base.Types
import           FreeType.Core.Types.Types
import           FreeType.Format.BDF.Types

#ifdef aarch64_HOST_ARCH
import           Data.Word
#else
import           Data.Int
#endif
import           Foreign.Ptr

#include "ft2build.h"
#include FT_BDF_H

foreign import CALLCV "freetype/ftbdf.h FT_Get_BDF_Charset_ID"
  ft_Get_BDF_Charset_ID
    :: FT_Face                -- ^ face
    -> Ptr (Ptr #{type char}) -- ^ acharset_encoding
    -> Ptr (Ptr #{type char}) -- ^ acharset_registry
    -> IO FT_Error



foreign import CALLCV "freetype/ftbdf.h FT_Get_BDF_Property"
  ft_Get_BDF_Property
    :: FT_Face             -- ^ face
    -> Ptr #{type char}    -- ^ prop_name
    -> Ptr BDF_PropertyRec -- ^ aproperty
    -> IO FT_Error
