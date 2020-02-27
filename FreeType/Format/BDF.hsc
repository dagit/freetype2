{-# OPTIONS_GHC -fno-warn-orphans #-}

module FreeType.Format.BDF
  ( module FreeType.Format.BDF.Internal
  ) where

import           FreeType.Format.BDF.Internal
import           FreeType.Lens

import           Foreign.Storable
import           Lens.Micro ((^.))

#include "ft2build.h"
#include FT_BDF_H

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
    #{poke struct BDF_PropertyRec_, type} ptr $ val^.type_
    case () of
      () | val^.type_ == BDF_PROPERTY_TYPE_ATOM     ->
             #{poke struct BDF_PropertyRec_, u.atom    } ptr $ val^.atom
         | val^.type_ == BDF_PROPERTY_TYPE_INTEGER  ->
             #{poke struct BDF_PropertyRec_, u.integer } ptr $ val^.integer
         | val^.type_ == BDF_PROPERTY_TYPE_CARDINAL ->
             #{poke struct BDF_PropertyRec_, u.cardinal} ptr $ val^.cardinal
         | otherwise                                ->
             return ()
