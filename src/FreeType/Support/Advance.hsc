{-# LANGUAGE CApiFFI
           , CPP
           , ForeignFunctionInterface
           , PatternSynonyms #-}

{- | Please refer to the
     [Support API > Quick retrieval of advance values](https://www.freetype.org/freetype2/docs/reference/ft2-quick_advance.html)
     chapter of the reference.
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

import           Foreign.Ptr

#include "ft2build.h"
#include FT_ADVANCES_H

foreign import CALLCV "freetype/ftadvanc.h FT_Get_Advance"
  ft_Get_Advance
    :: FT_Face      -- ^ face
    -> FT_UInt      -- ^ gindex
    -> FT_Int32     -- ^ load_flags
    -> Ptr FT_Fixed -- ^ padvance
    -> IO FT_Error



foreign import CALLCV "freetype/ftadvanc.h FT_Get_Advances"
  ft_Get_Advances
    :: FT_Face      -- ^ face
    -> FT_UInt      -- ^ start
    -> FT_UInt      -- ^ count
    -> FT_Int32     -- ^ load_flags
    -> Ptr FT_Fixed -- ^ padvances
    -> IO FT_Error



pattern FT_ADVANCE_FLAG_FAST_ONLY
     :: (Eq a, Num a) => a
pattern FT_ADVANCE_FLAG_FAST_ONLY = #const FT_ADVANCE_FLAG_FAST_ONLY
