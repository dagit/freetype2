{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}
{-# OPTIONS_HADDOCK hide #-}

module FreeType.Format.BDF.Internal where

import           FreeType.Core.Base.Internal
import           FreeType.Core.Types.Internal

import           Foreign.C.Types
import           Foreign.Ptr

#include "ft2build.h"
#include FT_BDF_H

type BDF_PropertyType = FT_Int32

pattern BDF_PROPERTY_TYPE_NONE
      , BDF_PROPERTY_TYPE_ATOM
      , BDF_PROPERTY_TYPE_INTEGER
      , BDF_PROPERTY_TYPE_CARDINAL
     :: BDF_PropertyType
pattern BDF_PROPERTY_TYPE_NONE     = #const BDF_PROPERTY_TYPE_NONE
pattern BDF_PROPERTY_TYPE_ATOM     = #const BDF_PROPERTY_TYPE_ATOM
pattern BDF_PROPERTY_TYPE_INTEGER  = #const BDF_PROPERTY_TYPE_INTEGER
pattern BDF_PROPERTY_TYPE_CARDINAL = #const BDF_PROPERTY_TYPE_CARDINAL



type BDF_Property = Ptr BDF_PropertyRec



data BDF_PropertyRec = BDF_PropertyRec
                         { prType     :: BDF_PropertyType
                         , prAtom     :: Ptr CChar
                         , prInteger  :: FT_Int32
                         , prCardinal :: FT_UInt32
                         }



foreign import ccall "FT_Get_BDF_Charset_ID"
  ft_Get_BDF_Charset_ID :: FT_Face -> Ptr (Ptr CChar) -> Ptr (Ptr CChar) -> IO FT_Error



foreign import ccall "FT_Get_BDF_Property"
  ft_Get_BDF_Property :: FT_Face -> Ptr CChar -> Ptr BDF_PropertyRec -> IO FT_Error
