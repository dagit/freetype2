{-# LANGUAGE EmptyDataDecls #-}

module FreeType.Support.Glyph.Types where

import           Data.Word
import           Foreign.Ptr

#include "ft2build.h"
#include FT_STROKER_H

data {-# CTYPE "extra/ftinternal.h" "FT_StrokerRec" #-} FT_StrokerRec
type FT_Stroker = Ptr FT_StrokerRec


type FT_Stroker_LineJoin = #type enum FT_Stroker_LineJoin_



type FT_Stroker_LineCap = #type enum FT_Stroker_LineCap_



type FT_StrokerBorder = #type enum FT_StrokerBorder_
