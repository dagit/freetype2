{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}

module FreeType.Format.BDF.Types where

import           FreeType.Core.Types.Types

import           Data.Int
import           Data.Function ((&))
import           Data.Word
import           Foreign.Ptr
import           Foreign.Storable

#include "ft2build.h"
#include FT_BDF_H

type BDF_PropertyType = #type enum BDF_PropertyType_

pattern BDF_PROPERTY_TYPE_NONE
      , BDF_PROPERTY_TYPE_ATOM
      , BDF_PROPERTY_TYPE_INTEGER
      , BDF_PROPERTY_TYPE_CARDINAL
     :: (Eq a, Num a) => a
pattern BDF_PROPERTY_TYPE_NONE     = #const BDF_PROPERTY_TYPE_NONE
pattern BDF_PROPERTY_TYPE_ATOM     = #const BDF_PROPERTY_TYPE_ATOM
pattern BDF_PROPERTY_TYPE_INTEGER  = #const BDF_PROPERTY_TYPE_INTEGER
pattern BDF_PROPERTY_TYPE_CARDINAL = #const BDF_PROPERTY_TYPE_CARDINAL



type BDF_Property = Ptr BDF_PropertyRec



data BDF_PropertyRec = BDF_PropertyRec
                         { prType     :: BDF_PropertyType
                         , prAtom     :: Ptr #type char
                         , prInteger  :: FT_Int32
                         , prCardinal :: FT_UInt32
                         }

instance Storable BDF_PropertyRec where
  sizeOf _    = #size struct BDF_PropertyRec_
  alignment _ = #size struct BDF_PropertyRec_

  peek ptr =
    BDF_PropertyRec
      <$> #{peek struct BDF_PropertyRec_, type      } ptr
      <*> #{peek struct BDF_PropertyRec_, u.atom    } ptr
      <*> #{peek struct BDF_PropertyRec_, u.integer } ptr
      <*> #{peek struct BDF_PropertyRec_, u.cardinal} ptr

  poke ptr val = do
    #{poke struct BDF_PropertyRec_, type} ptr $ val & prType
    case prType val of
      BDF_PROPERTY_TYPE_ATOM     -> #{poke struct BDF_PropertyRec_, u.atom    } ptr $ val & prAtom
      BDF_PROPERTY_TYPE_INTEGER  -> #{poke struct BDF_PropertyRec_, u.integer } ptr $ val & prInteger
      BDF_PROPERTY_TYPE_CARDINAL -> #{poke struct BDF_PropertyRec_, u.cardinal} ptr $ val & prCardinal
      _                          -> return ()
