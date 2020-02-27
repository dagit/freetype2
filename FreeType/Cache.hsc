{-# OPTIONS_GHC -fno-warn-orphans #-}

module FreeType.Cache
  ( module FreeType.Cache.Internal
  ) where

import           FreeType.Cache.Internal
import           FreeType.Lens

import           Foreign.Storable
import           Lens.Micro ((^.))

#include "ft2build.h"
#include FT_CACHE_H

instance Storable FTC_ScalerRec where
  sizeOf _    = #size      struct FTC_ScalerRec_
  alignment _ = #alignment struct FTC_ScalerRec_

  peek ptr =
    FTC_ScalerRec
      <$> #{peek struct FTC_ScalerRec_, face_id} ptr
      <*> #{peek struct FTC_ScalerRec_, width  } ptr
      <*> #{peek struct FTC_ScalerRec_, height } ptr
      <*> #{peek struct FTC_ScalerRec_, pixel  } ptr
      <*> #{peek struct FTC_ScalerRec_, x_res  } ptr
      <*> #{peek struct FTC_ScalerRec_, y_res  } ptr

  poke ptr val = do
    #{poke struct FTC_ScalerRec_, face_id} ptr $ val^.face_id
    #{poke struct FTC_ScalerRec_, width  } ptr $ val^.width
    #{poke struct FTC_ScalerRec_, height } ptr $ val^.height
    #{poke struct FTC_ScalerRec_, pixel  } ptr $ val^.pixel
    #{poke struct FTC_ScalerRec_, x_res  } ptr $ val^.x_res
    #{poke struct FTC_ScalerRec_, y_res  } ptr $ val^.y_res



instance Storable FTC_ImageTypeRec where
  sizeOf _    = #size      struct FTC_ImageTypeRec_
  alignment _ = #alignment struct FTC_ImageTypeRec_

  peek ptr =
    FTC_ImageTypeRec
      <$> #{peek struct FTC_ImageTypeRec_, face_id} ptr
      <*> #{peek struct FTC_ImageTypeRec_, width  } ptr
      <*> #{peek struct FTC_ImageTypeRec_, height } ptr
      <*> #{peek struct FTC_ImageTypeRec_, flags  } ptr

  poke ptr val = do
    #{poke struct FTC_ImageTypeRec_, face_id} ptr $ val^.face_id
    #{poke struct FTC_ImageTypeRec_, width  } ptr $ val^.width
    #{poke struct FTC_ImageTypeRec_, height } ptr $ val^.height
    #{poke struct FTC_ImageTypeRec_, flags  } ptr $ val^.flags



instance Storable FTC_SBitRec where
  sizeOf _    = #size      struct FTC_SBitRec_
  alignment _ = #alignment struct FTC_SBitRec_

  peek ptr =
    FTC_SBitRec
      <$> #{peek struct FTC_SBitRec_, width    } ptr
      <*> #{peek struct FTC_SBitRec_, height   } ptr
      <*> #{peek struct FTC_SBitRec_, left     } ptr
      <*> #{peek struct FTC_SBitRec_, top      } ptr
      <*> #{peek struct FTC_SBitRec_, format   } ptr
      <*> #{peek struct FTC_SBitRec_, max_grays} ptr
      <*> #{peek struct FTC_SBitRec_, pitch    } ptr
      <*> #{peek struct FTC_SBitRec_, xadvance } ptr
      <*> #{peek struct FTC_SBitRec_, yadvance } ptr
      <*> #{peek struct FTC_SBitRec_, buffer   } ptr

  poke ptr val = do
    #{poke struct FTC_SBitRec_, width    } ptr $ val^.width
    #{poke struct FTC_SBitRec_, height   } ptr $ val^.height
    #{poke struct FTC_SBitRec_, left     } ptr $ val^.left
    #{poke struct FTC_SBitRec_, top      } ptr $ val^.top
    #{poke struct FTC_SBitRec_, format   } ptr $ val^.format
    #{poke struct FTC_SBitRec_, max_grays} ptr $ val^.max_grays
    #{poke struct FTC_SBitRec_, pitch    } ptr $ val^.pitch
    #{poke struct FTC_SBitRec_, xadvance } ptr $ val^.xadvance
    #{poke struct FTC_SBitRec_, yadvance } ptr $ val^.yadvance
    #{poke struct FTC_SBitRec_, buffer   } ptr $ val^.buffer
