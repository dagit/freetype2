module Graphics.Rendering.FreeType.Internal.Size
  {-# DEPRECATED "freetype2 bindings were rewritten from scratch. Please switch to FreeType.Raw" #-}
  ( FT_SizeRec_
  , FT_Size
  , face
  , generic
  , metrics
  ) where

import           FreeType.Raw.Core.Base (FT_SizeRec (..), FT_Size)

import Foreign

import Graphics.Rendering.FreeType.Internal.FaceType
import Graphics.Rendering.FreeType.Internal.SizeMetrics
import Graphics.Rendering.FreeType.Internal.Generic

#include "ft2build.h"
#include FT_FREETYPE_H

type FT_SizeRec_ = FT_SizeRec

face :: FT_Size -> Ptr FT_Face
face = #ptr struct FT_SizeRec_, face

generic :: FT_Size -> Ptr FT_Generic
generic = #ptr struct FT_SizeRec_, generic

metrics :: FT_Size -> Ptr FT_Size_Metrics
metrics = #ptr struct FT_SizeRec_, metrics

