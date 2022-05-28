{-# LANGUAGE DataKinds
           , ForeignFunctionInterface
           , MultiParamTypeClasses
           , PatternSynonyms
           , TypeApplications #-}

module FreeType.Format.BDF.Types where

import           FreeType.Core.Types.Types

import           Data.Int
import           Data.Word
import           Foreign.Ptr
import           Foreign.Storable
import           Foreign.Storable.Offset

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

instance Offset "prType"     BDF_PropertyRec where rawOffset = #{offset struct BDF_PropertyRec_, type      }
instance Offset "prAtom"     BDF_PropertyRec where rawOffset = #{offset struct BDF_PropertyRec_, u.atom    }
instance Offset "prInteger"  BDF_PropertyRec where rawOffset = #{offset struct BDF_PropertyRec_, u.integer }
instance Offset "prCardinal" BDF_PropertyRec where rawOffset = #{offset struct BDF_PropertyRec_, u.cardinal}



instance Storable BDF_PropertyRec where
  sizeOf _    = #size struct BDF_PropertyRec_
  alignment _ = #size struct BDF_PropertyRec_

  peek ptr =
    BDF_PropertyRec
      <$> peek (offset @"prType"     ptr)
      <*> peek (offset @"prAtom"     ptr)
      <*> peek (offset @"prInteger"  ptr)
      <*> peek (offset @"prCardinal" ptr)

  poke ptr val = do
    pokeField @"prType" ptr val
    case prType val of
      BDF_PROPERTY_TYPE_ATOM     -> pokeField @"prAtom"     ptr val
      BDF_PROPERTY_TYPE_INTEGER  -> pokeField @"prInteger"  ptr val
      BDF_PROPERTY_TYPE_CARDINAL -> pokeField @"prCardinal" ptr val
      _                          -> return ()
