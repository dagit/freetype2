module Graphics.Rendering.FreeType.Internal.Outline
  {-# DEPRECATED "freetype2 bindings were rewritten from scratch. Please switch to FreeType" #-}
  ( FT_Outline(FT_Outline)
  , FT_Outline_MoveToFunc
  , FT_Outline_LineToFunc
  , FT_Outline_ConicToFunc
  , FT_Outline_CubicToFunc
  , FT_Outline_Funcs(FT_Outline_Funcs)
  , module Graphics.Rendering.FreeType.Internal.Outline
  ) where

import           FreeType.Support.Outline

import           Graphics.Rendering.FreeType.Internal.PrimitiveTypes
import           Graphics.Rendering.FreeType.Internal.Vector

import           Foreign.C.Types
import           Foreign.C.String
import           Foreign.Ptr



n_contours :: FT_Outline -> CShort
n_contours = oN_contours

n_points :: FT_Outline -> CShort
n_points = oN_points

points :: FT_Outline -> Ptr FT_Vector
points = oPoints

tags :: FT_Outline -> CString
tags = oTags

contours :: FT_Outline -> Ptr CShort
contours = oContours

flags :: FT_Outline -> FT_OUTLINE_FLAGS
flags = FT_OUTLINE_FLAGS . fromIntegral . oFlags



move_to :: FT_Outline_Funcs -> FT_Outline_MoveToFunc
move_to = ofMove_to

line_to :: FT_Outline_Funcs -> FT_Outline_LineToFunc
line_to = ofLine_to

conic_to :: FT_Outline_Funcs -> FT_Outline_ConicToFunc
conic_to = ofConic_to

cubic_to :: FT_Outline_Funcs -> FT_Outline_CubicToFunc
cubic_to = ofCubic_to

shift :: FT_Outline_Funcs -> CInt
shift = ofShift

delta :: FT_Outline_Funcs -> FT_Pos
delta = ofDelta
