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

module FreeType.Format.SFNT.Types where

import           FreeType.Core.Types.Types

import           Foreign.Ptr
import           Foreign.Storable
import           Foreign.Storable.Offset

#include "ft2build.h"
#include FT_SFNT_NAMES_H

data {-# CTYPE "freetype/ftsnames.h" "FT_SfntName" #-} FT_SfntName =
       FT_SfntName
         { platform_id :: FT_UShort
         , encoding_id :: FT_UShort
         , language_id :: FT_UShort
         , name_id     :: FT_UShort
         , string      :: Ptr FT_Byte
         , string_len  :: FT_UInt
         }

instance Offset "platform_id" FT_SfntName where rawOffset = #{offset struct FT_SfntName_, platform_id}
instance Offset "encoding_id" FT_SfntName where rawOffset = #{offset struct FT_SfntName_, encoding_id}
instance Offset "language_id" FT_SfntName where rawOffset = #{offset struct FT_SfntName_, language_id}
instance Offset "name_id"     FT_SfntName where rawOffset = #{offset struct FT_SfntName_, name_id    }
instance Offset "string"      FT_SfntName where rawOffset = #{offset struct FT_SfntName_, string     }
instance Offset "string_len"  FT_SfntName where rawOffset = #{offset struct FT_SfntName_, string_len }

instance Storable FT_SfntName where
  sizeOf _    = #size      struct FT_SfntName_
  alignment _ = #alignment struct FT_SfntName_

  peek ptr =
    FT_SfntName
      <$> peek (offset @"platform_id" ptr)
      <*> peek (offset @"encoding_id" ptr)
      <*> peek (offset @"language_id" ptr)
      <*> peek (offset @"name_id"     ptr)
      <*> peek (offset @"string"      ptr)
      <*> peek (offset @"string_len"  ptr)

  poke ptr val = do
    pokeField @"platform_id" ptr val
    pokeField @"encoding_id" ptr val
    pokeField @"language_id" ptr val
    pokeField @"name_id"     ptr val
    pokeField @"string"      ptr val
    pokeField @"string_len"  ptr val



data {-# CTYPE "freetype/ftsnames.h" "FT_SfntLangTag" #-} FT_SfntLangTag =
       FT_SfntLangTag
         { string     :: Ptr FT_Byte
         , string_len :: FT_UInt
         }

instance Offset "string"     FT_SfntLangTag where rawOffset = #{offset struct FT_SfntLangTag_, string     }
instance Offset "string_len" FT_SfntLangTag where rawOffset = #{offset struct FT_SfntLangTag_, string_len }

instance Storable FT_SfntLangTag where
  sizeOf _    = #size      struct FT_SfntLangTag_
  alignment _ = #alignment struct FT_SfntLangTag_

  peek ptr =
    FT_SfntLangTag
      <$> peek (offset @"string"     ptr)
      <*> peek (offset @"string_len" ptr)

  poke ptr val = do
    pokeField @"string"     ptr val
    pokeField @"string_len" ptr val
