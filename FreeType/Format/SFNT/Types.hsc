module FreeType.Format.SFNT.Types where

import           FreeType.Core.Types.Types

import           Data.Function ((&))
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
    #{poke struct FT_SfntName_, platform_id} ptr $ val & snPlatform_id    
    #{poke struct FT_SfntName_, encoding_id} ptr $ val & snEncoding_id    
    #{poke struct FT_SfntName_, language_id} ptr $ val & snLanguage_id    
    #{poke struct FT_SfntName_, name_id    } ptr $ val & snName_id    
    #{poke struct FT_SfntName_, string     } ptr $ val & snString    
    #{poke struct FT_SfntName_, string_len } ptr $ val & snString_len



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
    #{poke struct FT_SfntLangTag_, string     } ptr $ val & sltString    
    #{poke struct FT_SfntLangTag_, string_len } ptr $ val & sltString_len
