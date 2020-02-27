{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

module FreeType.Core.Base
  ( module FreeType.Core.Base.Internal
  ) where

import           FreeType.Core.Base.Internal
import           FreeType.Lens

import           Foreign.Storable
import           Lens.Micro ((^.))

#include "ft2build.h"
#include FT_FREETYPE_H

instance Storable FT_Open_Args where
  sizeOf _    = #size      struct FT_Open_Args_
  alignment _ = #alignment struct FT_Open_Args_

  peek ptr =
    FT_Open_Args
      <$> #{peek struct FT_Open_Args_, flags      } ptr
      <*> #{peek struct FT_Open_Args_, memory_base} ptr
      <*> #{peek struct FT_Open_Args_, memory_size} ptr
      <*> #{peek struct FT_Open_Args_, pathname   } ptr
      <*> #{peek struct FT_Open_Args_, stream     } ptr
      <*> #{peek struct FT_Open_Args_, driver     } ptr
      <*> #{peek struct FT_Open_Args_, num_params } ptr
      <*> #{peek struct FT_Open_Args_, params     } ptr

  poke ptr val = do
    #{poke struct FT_Open_Args_, flags      } ptr $ val^.flags
    #{poke struct FT_Open_Args_, memory_base} ptr $ val^.memory_base
    #{poke struct FT_Open_Args_, memory_size} ptr $ val^.memory_size
    #{poke struct FT_Open_Args_, pathname   } ptr $ val^.pathname
    #{poke struct FT_Open_Args_, stream     } ptr $ val^.stream
    #{poke struct FT_Open_Args_, driver     } ptr $ val^.driver
    #{poke struct FT_Open_Args_, num_params } ptr $ val^.num_params
    #{poke struct FT_Open_Args_, params     } ptr $ val^.params



instance Storable FT_Parameter where
  sizeOf _    = #size      struct FT_Parameter_
  alignment _ = #alignment struct FT_Parameter_

  peek ptr =
    FT_Parameter
      <$> #{peek struct FT_Parameter_, tag } ptr
      <*> #{peek struct FT_Parameter_, data} ptr

  poke ptr val = do
    #{poke struct FT_Parameter_, tag } ptr $ val^.tag
    #{poke struct FT_Parameter_, data} ptr $ val^.data_



instance Storable FT_Size_RequestRec where
  sizeOf _    = #size      struct FT_Size_RequestRec_
  alignment _ = #alignment struct FT_Size_RequestRec_

  peek ptr =
    FT_Size_RequestRec
      <$> #{peek struct FT_Size_RequestRec_, type          } ptr
      <*> #{peek struct FT_Size_RequestRec_, width         } ptr
      <*> #{peek struct FT_Size_RequestRec_, height        } ptr
      <*> #{peek struct FT_Size_RequestRec_, horiResolution} ptr
      <*> #{peek struct FT_Size_RequestRec_, vertResolution} ptr

  poke ptr val = do
    #{poke struct FT_Size_RequestRec_, type          } ptr $ val^.type_
    #{poke struct FT_Size_RequestRec_, width         } ptr $ val^.width
    #{poke struct FT_Size_RequestRec_, height        } ptr $ val^.height
    #{poke struct FT_Size_RequestRec_, horiResolution} ptr $ val^.horiResolution
    #{poke struct FT_Size_RequestRec_, vertResolution} ptr $ val^.vertResolution
