{-# LANGUAGE ForeignFunctionInterface #-}
{-# OPTIONS_HADDOCK hide #-}

module FreeType.Format.SFNT.Internal where

import           FreeType.Core.Base.Internal
import           FreeType.Core.Types.Internal

import           Foreign.C.Types
import           Foreign.Ptr

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



foreign import ccall "FT_Get_Sfnt_Name_Count"
  ft_Get_Sfnt_Name_Count :: FT_Face -> IO FT_UInt



foreign import ccall "FT_Get_Sfnt_Name"
  ft_Get_Sfnt_Name :: FT_Face -> FT_UInt -> Ptr FT_SfntName -> IO FT_Error



data FT_SfntLangTag = FT_SfntLangTag
                        { sltString     :: Ptr FT_Byte
                        , sltString_len :: FT_UInt
                        }



foreign import ccall "FT_Get_Sfnt_LangTag"
  ft_Get_Sfnt_LangTag :: FT_Face -> FT_UInt -> Ptr FT_SfntLangTag -> IO FT_Error
