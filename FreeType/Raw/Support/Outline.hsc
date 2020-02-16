{-# OPTIONS_GHC -fno-warn-orphans #-}

module FreeType.Raw.Support.Outline
  ( module FreeType.Raw.Support.Outline.Internal
  ) where

import           FreeType.Raw.Support.Outline.Internal
import           FreeType.Lens

import           Foreign.Storable
import           Lens.Micro ((^.))

#include "ft2build.h"
#include FT_IMAGE_H
#include FT_OUTLINE_H

instance Storable FT_Outline_Funcs where
  sizeOf _    = #size      struct FT_Outline_Funcs_
  alignment _ = #alignment struct FT_Outline_Funcs_

  peek ptr =
    FT_Outline_Funcs
      <$> #{peek struct FT_Outline_Funcs_, move_to } ptr
      <*> #{peek struct FT_Outline_Funcs_, line_to } ptr
      <*> #{peek struct FT_Outline_Funcs_, conic_to} ptr
      <*> #{peek struct FT_Outline_Funcs_, cubic_to} ptr
      <*> #{peek struct FT_Outline_Funcs_, shift   } ptr
      <*> #{peek struct FT_Outline_Funcs_, delta   } ptr

  poke ptr val = do
    #{poke struct FT_Outline_Funcs_, move_to } ptr $ val^.move_to
    #{poke struct FT_Outline_Funcs_, line_to } ptr $ val^.line_to
    #{poke struct FT_Outline_Funcs_, conic_to} ptr $ val^.conic_to
    #{poke struct FT_Outline_Funcs_, cubic_to} ptr $ val^.cubic_to
    #{poke struct FT_Outline_Funcs_, shift   } ptr $ val^.shift
    #{poke struct FT_Outline_Funcs_, delta   } ptr $ val^.delta
