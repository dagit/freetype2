{-# OPTIONS_GHC -fno-warn-orphans #-}

module FreeType.Format.Multiple
  ( module FreeType.Format.Multiple.Internal
  ) where

import           FreeType.Format.Multiple.Internal
import           FreeType.Lens

import           Foreign.Storable
import           Lens.Micro ((^.))

#include "ft2build.h"
#include FT_MULTIPLE_MASTERS_H

instance Storable FT_MM_Axis where
  sizeOf _    = #size      struct FT_MM_Axis_
  alignment _ = #alignment struct FT_MM_Axis_

  peek ptr =
    FT_MM_Axis
      <$> #{peek struct FT_MM_Axis_, name   } ptr
      <*> #{peek struct FT_MM_Axis_, minimum} ptr
      <*> #{peek struct FT_MM_Axis_, maximum} ptr

  poke ptr val = do
    #{poke struct FT_MM_Axis_, name   } ptr $ val^.name
    #{poke struct FT_MM_Axis_, minimum} ptr $ val^.minimum_
    #{poke struct FT_MM_Axis_, maximum} ptr $ val^.maximum_



instance Storable FT_Multi_Master where
  sizeOf _    = #size      struct FT_Multi_Master_
  alignment _ = #alignment struct FT_Multi_Master_

  peek ptr =
    FT_Multi_Master
      <$> #{peek struct FT_Multi_Master_, num_axis   } ptr
      <*> #{peek struct FT_Multi_Master_, num_designs} ptr
      <*> #{peek struct FT_Multi_Master_, axis       } ptr

  poke ptr val = do
    #{poke struct FT_Multi_Master_, num_axis   } ptr $ val^.num_axis
    #{poke struct FT_Multi_Master_, num_designs} ptr $ val^.num_designs
    #{poke struct FT_Multi_Master_, axis       } ptr $ val^.axis



instance Storable FT_Var_Axis where
  sizeOf _    = #size      struct FT_Var_Axis_
  alignment _ = #alignment struct FT_Var_Axis_

  peek ptr =
    FT_Var_Axis
      <$> #{peek struct FT_Var_Axis_, name   } ptr
      <*> #{peek struct FT_Var_Axis_, minimum} ptr
      <*> #{peek struct FT_Var_Axis_, def    } ptr
      <*> #{peek struct FT_Var_Axis_, maximum} ptr
      <*> #{peek struct FT_Var_Axis_, tag    } ptr
      <*> #{peek struct FT_Var_Axis_, strid  } ptr

  poke ptr val = do
    #{poke struct FT_Var_Axis_, name   } ptr $ val^.name
    #{poke struct FT_Var_Axis_, minimum} ptr $ val^.minimum_
    #{poke struct FT_Var_Axis_, def    } ptr $ val^.def
    #{poke struct FT_Var_Axis_, maximum} ptr $ val^.maximum_
    #{poke struct FT_Var_Axis_, tag    } ptr $ val^.tag
    #{poke struct FT_Var_Axis_, strid  } ptr $ val^.strid



instance Storable FT_Var_Named_Style where
  sizeOf _    = #size      struct FT_Var_Named_Style_
  alignment _ = #alignment struct FT_Var_Named_Style_

  peek ptr =
    FT_Var_Named_Style
      <$> #{peek struct FT_Var_Named_Style_, coords} ptr
      <*> #{peek struct FT_Var_Named_Style_, strid } ptr
      <*> #{peek struct FT_Var_Named_Style_, psid  } ptr

  poke ptr val = do
    #{poke struct FT_Var_Named_Style_, coords} ptr $ val^.coords
    #{poke struct FT_Var_Named_Style_, strid } ptr $ val^.strid
    #{poke struct FT_Var_Named_Style_, psid  } ptr $ val^.psid



instance Storable FT_MM_Var where
  sizeOf _    = #size      struct FT_MM_Var_
  alignment _ = #alignment struct FT_MM_Var_

  peek ptr =
    FT_MM_Var
      <$> #{peek struct FT_MM_Var_, num_axis       } ptr
      <*> #{peek struct FT_MM_Var_, num_designs    } ptr
      <*> #{peek struct FT_MM_Var_, num_namedstyles} ptr
      <*> #{peek struct FT_MM_Var_, axis           } ptr
      <*> #{peek struct FT_MM_Var_, namedstyle     } ptr

  poke ptr val = do
    #{poke struct FT_MM_Var_, num_axis       } ptr $ val^.num_axis
    #{poke struct FT_MM_Var_, num_designs    } ptr $ val^.num_designs
    #{poke struct FT_MM_Var_, num_namedstyles} ptr $ val^.num_namedstyles
    #{poke struct FT_MM_Var_, axis           } ptr $ val^.axis
    #{poke struct FT_MM_Var_, namedstyle     } ptr $ val^.namedstyle
