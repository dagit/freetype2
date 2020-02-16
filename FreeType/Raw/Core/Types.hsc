{-# OPTIONS_GHC -fno-warn-orphans #-}

module FreeType.Raw.Core.Types
  ( module FreeType.Raw.Core.Types.Internal
  ) where

import           FreeType.Raw.Core.Types.Internal
import           FreeType.Lens

import           Foreign.Storable
import           Lens.Micro ((^.))

#include "ft2build.h"
#include FT_FREETYPE_H

instance Storable FT_Vector where
  sizeOf _    = #size      struct FT_Vector_
  alignment _ = #alignment struct FT_Vector_

  peek ptr =
    FT_Vector
      <$> #{peek struct FT_Vector_, x} ptr
      <*> #{peek struct FT_Vector_, y} ptr

  poke ptr val = do
    #{poke struct FT_Vector_, x} ptr $ val^.x
    #{poke struct FT_Vector_, y} ptr $ val^.y



instance Storable FT_BBox where
  sizeOf    _ = #size      struct FT_BBox_
  alignment _ = #alignment struct FT_BBox_

  peek ptr =
    FT_BBox
      <$> #{peek struct FT_BBox_, xMin} ptr
      <*> #{peek struct FT_BBox_, yMin} ptr
      <*> #{peek struct FT_BBox_, xMax} ptr
      <*> #{peek struct FT_BBox_, yMax} ptr

  poke ptr val = do
    #{poke struct FT_BBox_, xMin} ptr $ val^.xMin
    #{poke struct FT_BBox_, yMin} ptr $ val^.yMin
    #{poke struct FT_BBox_, xMax} ptr $ val^.xMax
    #{poke struct FT_BBox_, yMax} ptr $ val^.yMax



instance Storable FT_Matrix where
  sizeOf _    = #size      struct FT_Matrix_
  alignment _ = #alignment struct FT_Matrix_

  peek ptr =
    FT_Matrix
      <$> #{peek struct FT_Matrix_, xx} ptr
      <*> #{peek struct FT_Matrix_, xy} ptr
      <*> #{peek struct FT_Matrix_, yx} ptr
      <*> #{peek struct FT_Matrix_, yy} ptr

  poke ptr val = do
    #{poke struct FT_Matrix_, xx} ptr $ val^.xx
    #{poke struct FT_Matrix_, xy} ptr $ val^.xy
    #{poke struct FT_Matrix_, yx} ptr $ val^.yx
    #{poke struct FT_Matrix_, yy} ptr $ val^.yy



instance Storable FT_UnitVector where
  sizeOf _    = #size      struct FT_UnitVector_
  alignment _ = #alignment struct FT_UnitVector_

  peek ptr =
    FT_UnitVector
      <$> #{peek struct FT_UnitVector_, x} ptr
      <*> #{peek struct FT_UnitVector_, y} ptr

  poke ptr val = do
    #{poke struct FT_UnitVector_, x} ptr $ val^.x
    #{poke struct FT_UnitVector_, y} ptr $ val^.y



instance Storable FT_Data where
  sizeOf _    = #size      struct FT_Data_
  alignment _ = #alignment struct FT_Data_

  peek ptr =
    FT_Data
      <$> #{peek struct FT_Data_, pointer} ptr
      <*> #{peek struct FT_Data_, length } ptr

  poke ptr val = do
    #{poke struct FT_Data_, pointer} ptr $ val^.pointer
    #{poke struct FT_Data_, length } ptr $ val^.length_



instance Storable FT_Generic where
  sizeOf    _ = #size      struct FT_Generic_
  alignment _ = #alignment struct FT_Generic_

  peek ptr = do
    FT_Generic
      <$> #{peek struct FT_Generic_, data     } ptr
      <*> #{peek struct FT_Generic_, finalizer} ptr

  poke ptr val = do
    #{poke struct FT_Generic_, data     } ptr $ val^.data_
    #{poke struct FT_Generic_, finalizer} ptr $ val^.finalizer



instance Storable FT_Bitmap where
  sizeOf _    = #size      struct FT_Bitmap_
  alignment _ = #alignment struct FT_Bitmap_

  peek ptr =
    FT_Bitmap
      <$> #{peek struct FT_Bitmap_, rows        } ptr
      <*> #{peek struct FT_Bitmap_, width       } ptr
      <*> #{peek struct FT_Bitmap_, pitch       } ptr
      <*> #{peek struct FT_Bitmap_, buffer      } ptr
      <*> #{peek struct FT_Bitmap_, num_grays   } ptr
      <*> #{peek struct FT_Bitmap_, pixel_mode  } ptr
      <*> #{peek struct FT_Bitmap_, palette_mode} ptr
      <*> #{peek struct FT_Bitmap_, palette     } ptr

  poke ptr val = do
    #{poke struct FT_Bitmap_, rows        } ptr $ val^.rows
    #{poke struct FT_Bitmap_, width       } ptr $ val^.width
    #{poke struct FT_Bitmap_, pitch       } ptr $ val^.pitch
    #{poke struct FT_Bitmap_, buffer      } ptr $ val^.buffer
    #{poke struct FT_Bitmap_, num_grays   } ptr $ val^.num_grays
    #{poke struct FT_Bitmap_, pixel_mode  } ptr $ val^.pixel_mode
    #{poke struct FT_Bitmap_, palette_mode} ptr $ val^.palette_mode
    #{poke struct FT_Bitmap_, palette     } ptr $ val^.palette
