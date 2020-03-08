{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE TemplateHaskell #-}

{- | Please refer to the
     [Support API > Quick retrieval of advance values](https://www.freetype.org/freetype2/docs/reference/ft2-quick_advance.html)
     chapter of the reference.

     Internal: "FreeType.Support.Advance.Internal".
 -}

module FreeType.Support.Advance
  ( -- ** FT_Get_Advance
    ft_Get_Advance
    -- ** FT_Get_Advances
  , ft_Get_Advances
    -- ** FT_ADVANCE_FLAG_FAST_ONLY
  , pattern FT_ADVANCE_FLAG_FAST_ONLY
  ) where

import           FreeType.Core.Base
import           FreeType.Core.Types.Types
import           FreeType.Exception.Internal
import           FreeType.Support.Advance.Internal

#include "ft2build.h"
#include FT_ADVANCES_H

ft_Get_Advance
  :: FT_Face     -- ^ face
  -> FT_UInt     -- ^ gindex
  -> FT_Int32    -- ^ load_flags
  -> IO FT_Fixed -- ^ advance
ft_Get_Advance =
  autoAllocaError 'ft_Get_Advance ft_Get_Advance'



ft_Get_Advances
  :: FT_Face     -- ^ face
  -> FT_UInt     -- ^ start
  -> FT_UInt     -- ^ count
  -> FT_Int32    -- ^ load_flags
  -> IO FT_Fixed -- ^ advances
ft_Get_Advances =
  autoAllocaError 'ft_Get_Advances ft_Get_Advances'



pattern FT_ADVANCE_FLAG_FAST_ONLY
     :: FT_Fixed
pattern FT_ADVANCE_FLAG_FAST_ONLY = #const FT_ADVANCE_FLAG_FAST_ONLY
