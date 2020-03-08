{-# LANGUAGE ForeignFunctionInterface #-}

module FreeType.Format.SFNT.Internal
  ( -- ** FT_Get_Sfnt_Name
    ft_Get_Sfnt_Name'
    -- ** FT_Get_Sfnt_LangTag
  , ft_Get_Sfnt_LangTag'
  ) where

import           FreeType.Core.Base.Types
import           FreeType.Core.Types.Types
import           FreeType.Format.SFNT.Types

import           Foreign.Ptr

#include "ft2build.h"
#include FT_SFNT_NAMES_H

foreign import ccall "FT_Get_Sfnt_Name"
  ft_Get_Sfnt_Name'
    :: FT_Face         -- ^ face
    -> FT_UInt         -- ^ idx
    -> Ptr FT_SfntName -- ^ aname
    -> IO FT_Error



foreign import ccall "FT_Get_Sfnt_LangTag"
  ft_Get_Sfnt_LangTag'
    :: FT_Face            -- ^ face
    -> FT_UInt            -- ^ langID
    -> Ptr FT_SfntLangTag -- ^ alangTag
    -> IO FT_Error
