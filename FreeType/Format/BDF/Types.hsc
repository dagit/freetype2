{-# LANGUAGE DataKinds
           , DuplicateRecordFields
           , FlexibleInstances
           , ForeignFunctionInterface
           , MultiParamTypeClasses #-}
#if __GLASGOW_HASKELL__ >= 902
{-# LANGUAGE NoFieldSelectors #-}
#endif
{-# LANGUAGE PatternSynonyms
           , TypeApplications #-}

module FreeType.Format.BDF.Types where

import           FreeType.Core.Types.Types

#ifndef aarch64_HOST_ARCH
import           Data.Int
#endif
import           Data.Word
import           Foreign.Ptr
import           Foreign.Storable
import           Foreign.Storable.Offset
import           GHC.Records

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
                         { type_ :: BDF_PropertyType
                         }

instance Offset "type"     BDF_PropertyRec where rawOffset = #{offset struct BDF_PropertyRec_, type      }
instance Offset "atom"     BDF_PropertyRec where rawOffset = #{offset struct BDF_PropertyRec_, u.atom    }
instance Offset "integer"  BDF_PropertyRec where rawOffset = #{offset struct BDF_PropertyRec_, u.integer }
instance Offset "cardinal" BDF_PropertyRec where rawOffset = #{offset struct BDF_PropertyRec_, u.cardinal}

instance Offset "type_" BDF_PropertyRec where
  rawOffset = rawOffset @"type" @BDF_PropertyRec

instance HasField "type" BDF_PropertyRec BDF_PropertyType where
  getField = getField @"type_" @BDF_PropertyRec

instance HasField "atom" BDF_PropertyRec (Ptr #{type char}) where
  getField = errorWithoutStackTrace "BDF_PropertyRec.atom.getField: union field"

instance HasField "integer" BDF_PropertyRec FT_Int where
  getField = errorWithoutStackTrace "BDF_PropertyRec.integer.getField: union field"

instance HasField "cardinal" BDF_PropertyRec FT_UInt where
  getField = errorWithoutStackTrace "BDF_PropertyRec.cardinal.getField: union field"

instance Storable BDF_PropertyRec where
  sizeOf _    = #size      struct BDF_PropertyRec_
  alignment _ = #alignment struct BDF_PropertyRec_

  peek ptr =
    BDF_PropertyRec
      <$> peek (offset @"type" ptr)

  poke ptr val =
    pokeField @"type" ptr val
