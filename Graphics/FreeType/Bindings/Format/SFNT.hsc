{-# LANGUAGE ForeignFunctionInterface #-}

module Graphics.FreeType.Bindings.Format.SFNT where

import           Graphics.FreeType.Bindings.Core.Base
import           Graphics.FreeType.Bindings.Core.Types

import           Foreign.C.Types
import           Foreign.Ptr
import           Foreign.Storable

#include "ft2build.h"
#include FT_SFNT_NAMES_H

data FT_SfntName = FT_SfntName
                     { snPlatform_id :: FT_UShort
                     , snEncoding_id :: FT_UShort
                     , snLanguage_id :: FT_UShort
                     , snName_id     :: FT_UShort
                     , snString      :: Ptr FT_Byte
                     , snString_len  :: FT_UInt
                     }

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
    #{poke struct FT_SfntName_, platform_id} ptr $ snPlatform_id val
    #{poke struct FT_SfntName_, encoding_id} ptr $ snEncoding_id val
    #{poke struct FT_SfntName_, language_id} ptr $ snLanguage_id val
    #{poke struct FT_SfntName_, name_id    } ptr $ snName_id     val
    #{poke struct FT_SfntName_, string     } ptr $ snString      val
    #{poke struct FT_SfntName_, string_len } ptr $ snString_len  val



foreign import ccall "FT_Get_Sfnt_Name_Count"
  ft_Get_Sfnt_Name_Count :: FT_Face -> IO FT_UInt



foreign import ccall "FT_Get_Sfnt_Name"
  ft_Get_Sfnt_Name :: FT_Face -> FT_UInt -> Ptr FT_SfntName -> IO FT_Error



data FT_SfntLangTag = FT_SfntLangTag
                        { sltString     :: Ptr FT_Byte
                        , sltString_len :: FT_UInt
                        }

instance Storable FT_SfntLangTag where
  sizeOf _    = #size      struct FT_SfntLangTag_
  alignment _ = #alignment struct FT_SfntLangTag_

  peek ptr =
    FT_SfntLangTag
      <$> #{peek struct FT_SfntLangTag_, string     } ptr
      <*> #{peek struct FT_SfntLangTag_, string_len } ptr

  poke ptr val = do
    #{poke struct FT_SfntLangTag_, string     } ptr $ sltString     val
    #{poke struct FT_SfntLangTag_, string_len } ptr $ sltString_len val



foreign import ccall "FT_Get_Sfnt_LangTag"
  ft_Get_Sfnt_LangTag :: FT_Face -> FT_UInt -> Ptr FT_SfntLangTag -> IO FT_Error
