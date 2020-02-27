{-# OPTIONS_GHC -fno-warn-orphans #-}

module FreeType.Format.SFNT
  ( module FreeType.Format.SFNT.Internal
  ) where

import           FreeType.Format.SFNT.Internal
import           FreeType.Lens

import           Foreign.Storable
import           Lens.Micro ((^.))

#include "ft2build.h"
#include FT_SFNT_NAMES_H

instance Storable FT_SfntName where
  sizeOf _    = #size      struct FT_SfntName_
  alignment _ = #alignment struct FT_SfntName_

  peek ptr =
    FT_SfntName
      <$> #{peek struct FT_SfntName_, platform_id} ptr
      <*> #{peek struct FT_SfntName_, encoding_id} ptr
      <*> #{peek struct FT_SfntName_, language_id} ptr
      <*> #{peek struct FT_SfntName_, name_id    } ptr
      <*> #{peek struct FT_SfntName_, string     } ptr
      <*> #{peek struct FT_SfntName_, string_len } ptr

  poke ptr val = do
    #{poke struct FT_SfntName_, platform_id} ptr $ val^.platform_id
    #{poke struct FT_SfntName_, encoding_id} ptr $ val^.encoding_id
    #{poke struct FT_SfntName_, language_id} ptr $ val^.language_id
    #{poke struct FT_SfntName_, name_id    } ptr $ val^.name_id
    #{poke struct FT_SfntName_, string     } ptr $ val^.string
    #{poke struct FT_SfntName_, string_len } ptr $ val^.string_len



instance Storable FT_SfntLangTag where
  sizeOf _    = #size      struct FT_SfntLangTag_
  alignment _ = #alignment struct FT_SfntLangTag_

  peek ptr =
    FT_SfntLangTag
      <$> #{peek struct FT_SfntLangTag_, string     } ptr
      <*> #{peek struct FT_SfntLangTag_, string_len } ptr

  poke ptr val = do
    #{poke struct FT_SfntLangTag_, string     } ptr $ val^.string
    #{poke struct FT_SfntLangTag_, string_len } ptr $ val^.string_len
