{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE TemplateHaskell #-}

module FreeType.Format.SFNT
  ( -- ** FT_SfntName
    FT_SfntName (..)
    -- ** FT_Get_Sfnt_Name_Count
  , ft_Get_Sfnt_Name_Count
    -- ** FT_Get_Sfnt_Name
  , ft_Get_Sfnt_Name
    -- ** FT_SfntLangTag
  , FT_SfntLangTag (..)
    -- ** FT_Get_Sfnt_LangTag
  , ft_Get_Sfnt_LangTag
  ) where

import           FreeType.Core.Base.Types
import           FreeType.Core.Types.Types
import           FreeType.Exception.Internal
import           FreeType.Format.SFNT.Internal
import           FreeType.Format.SFNT.Types

#include "ft2build.h"
#include FT_SFNT_NAMES_H

foreign import ccall "FT_Get_Sfnt_Name_Count"
  ft_Get_Sfnt_Name_Count :: FT_Face -> IO FT_UInt



ft_Get_Sfnt_Name
  :: FT_Face        -- ^ face
  -> FT_UInt        -- ^ idx
  -> IO FT_SfntName -- ^ name
ft_Get_Sfnt_Name =
  autoAllocaError 'ft_Get_Sfnt_Name ft_Get_Sfnt_Name'



ft_Get_Sfnt_LangTag
  :: FT_Face           -- ^ face
  -> FT_UInt           -- ^ langID
  -> IO FT_SfntLangTag -- ^ langTag
ft_Get_Sfnt_LangTag =
  autoAllocaError 'ft_Get_Sfnt_LangTag ft_Get_Sfnt_LangTag'
