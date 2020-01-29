{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}

module Graphics.FreeType.Bindings.Format.BDF where

import           Graphics.FreeType.Bindings.Core.Base
import           Graphics.FreeType.Bindings.Core.Types

import           Foreign.C.Types
import           Foreign.Ptr
import           Foreign.Storable

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



data BDF_PropertyRec = BDF_PropertyRecNone
                     | BDF_PropertyRecAtom (Ptr CChar)
                     | BDF_PropertyRecInteger FT_Int32
                     | BDF_PropertyRecCardinal FT_UInt32

instance Storable BDF_PropertyRec where
  sizeOf _    = #size struct BDF_PropertyRec_
  alignment _ = #size struct BDF_PropertyRec_

  peek ptr = do
    type_ <- #{peek struct BDF_PropertyRec_, type} $ castPtr ptr :: IO BDF_PropertyType
    case () of
      () | type_ == BDF_PROPERTY_TYPE_ATOM     ->
             BDF_PropertyRecAtom     <$> #{peek struct BDF_PropertyRec_, u} ptr
         | type_ == BDF_PROPERTY_TYPE_INTEGER  ->
             BDF_PropertyRecInteger  <$> #{peek struct BDF_PropertyRec_, u} ptr
         | type_ == BDF_PROPERTY_TYPE_CARDINAL ->
             BDF_PropertyRecCardinal <$> #{peek struct BDF_PropertyRec_, u} ptr
         | otherwise                           ->
             return BDF_PropertyRecNone

  poke ptr BDF_PropertyRecNone           =
    #{poke struct BDF_PropertyRec_, type} ptr BDF_PROPERTY_TYPE_NONE
  poke ptr (BDF_PropertyRecAtom     val) = do
    #{poke struct BDF_PropertyRec_, type} ptr BDF_PROPERTY_TYPE_ATOM
    #{poke struct BDF_PropertyRec_, u   } ptr val
  poke ptr (BDF_PropertyRecInteger  val) = do
    #{poke struct BDF_PropertyRec_, type} ptr BDF_PROPERTY_TYPE_INTEGER
    #{poke struct BDF_PropertyRec_, u   } ptr val
  poke ptr (BDF_PropertyRecCardinal val) = do
    #{poke struct BDF_PropertyRec_, type} ptr BDF_PROPERTY_TYPE_CARDINAL
    #{poke struct BDF_PropertyRec_, u   } ptr val




foreign import ccall "FT_Get_BDF_Charset_ID"
  ft_Get_BDF_Charset_ID :: FT_Face -> Ptr (Ptr CChar) -> Ptr (Ptr CChar) -> IO FT_Error



foreign import ccall "FT_Get_BDF_Property"
  ft_Get_BDF_Property :: FT_Face -> Ptr CChar -> Ptr BDF_PropertyRec -> IO FT_Error
