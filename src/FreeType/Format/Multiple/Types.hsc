{-# LANGUAGE DataKinds
           , DuplicateRecordFields
           , FlexibleInstances
           , ForeignFunctionInterface
           , MultiParamTypeClasses #-}
#if __GLASGOW_HASKELL__ >= 902
{-# LANGUAGE NoFieldSelectors #-}
#endif
{-# LANGUAGE TypeApplications #-}

module FreeType.Format.Multiple.Types where

import           FreeType.Core.Types.Types

import           Foreign.Ptr
import           Foreign.Storable
import           Foreign.Storable.Offset

#include "ft2build.h"
#include FT_MULTIPLE_MASTERS_H

data {-# CTYPE "freetype/ftmm.h" "FT_MM_Axis" #-} FT_MM_Axis =
       FT_MM_Axis
         { name    :: Ptr FT_String
         , minimum :: FT_Long
         , maximum :: FT_Long
         }

instance Offset "name"    FT_MM_Axis where rawOffset = #{offset struct FT_MM_Axis_, name   }
instance Offset "minimum" FT_MM_Axis where rawOffset = #{offset struct FT_MM_Axis_, minimum}
instance Offset "maximum" FT_MM_Axis where rawOffset = #{offset struct FT_MM_Axis_, maximum}

instance Storable FT_MM_Axis where
  sizeOf _    = #size      struct FT_MM_Axis_
  alignment _ = #alignment struct FT_MM_Axis_

  peek ptr =
    FT_MM_Axis
      <$> peek (offset @"name"    ptr)
      <*> peek (offset @"minimum" ptr)
      <*> peek (offset @"maximum" ptr)

  poke ptr val = do
    pokeField @"name"    ptr val
    pokeField @"minimum" ptr val
    pokeField @"maximum" ptr val



data {-# CTYPE "freetype/ftmm.h" "FT_Multi_Master" #-} FT_Multi_Master =
       FT_Multi_Master
         { num_axis    :: FT_UInt
         , num_designs :: FT_UInt
         , axis        :: Ptr FT_MM_Axis
         }

instance Offset "num_axis"    FT_Multi_Master where rawOffset = #{offset struct FT_Multi_Master_, num_axis   }
instance Offset "num_designs" FT_Multi_Master where rawOffset = #{offset struct FT_Multi_Master_, num_designs}
instance Offset "axis"        FT_Multi_Master where rawOffset = #{offset struct FT_Multi_Master_, axis       }

instance Storable FT_Multi_Master where
  sizeOf _    = #size      struct FT_Multi_Master_
  alignment _ = #alignment struct FT_Multi_Master_

  peek ptr =
    FT_Multi_Master
      <$> peek (offset @"num_axis"    ptr)
      <*> peek (offset @"num_designs" ptr)
      <*> peek (offset @"axis"        ptr)

  poke ptr val = do
    pokeField @"num_axis"    ptr val
    pokeField @"num_designs" ptr val
    pokeField @"axis"        ptr val



data {-# CTYPE "freetype/ftmm.h" "FT_Var_Axis" #-} FT_Var_Axis =
       FT_Var_Axis
         { name    :: Ptr FT_String
         , minimum :: FT_Fixed
         , def     :: FT_Fixed
         , maximum :: FT_Fixed
         , tag     :: FT_ULong
         , strid   :: FT_UInt
         }

instance Offset "name"    FT_Var_Axis where rawOffset = #{offset struct FT_Var_Axis_, name   }
instance Offset "minimum" FT_Var_Axis where rawOffset = #{offset struct FT_Var_Axis_, minimum}
instance Offset "def"     FT_Var_Axis where rawOffset = #{offset struct FT_Var_Axis_, def    }
instance Offset "maximum" FT_Var_Axis where rawOffset = #{offset struct FT_Var_Axis_, maximum}
instance Offset "tag"     FT_Var_Axis where rawOffset = #{offset struct FT_Var_Axis_, tag    }
instance Offset "strid"   FT_Var_Axis where rawOffset = #{offset struct FT_Var_Axis_, strid  }

instance Storable FT_Var_Axis where
  sizeOf _    = #size      struct FT_Var_Axis_
  alignment _ = #alignment struct FT_Var_Axis_

  peek ptr =
    FT_Var_Axis
      <$> peek (offset @"name"    ptr)
      <*> peek (offset @"minimum" ptr)
      <*> peek (offset @"def"     ptr)
      <*> peek (offset @"maximum" ptr)
      <*> peek (offset @"tag"     ptr)
      <*> peek (offset @"strid"   ptr)

  poke ptr l = do
    pokeField @"name"    ptr l
    pokeField @"minimum" ptr l
    pokeField @"def"     ptr l
    pokeField @"maximum" ptr l
    pokeField @"tag"     ptr l
    pokeField @"strid"   ptr l



data {-# CTYPE "freetype/ftmm.h" "FT_Var_Named_Style" #-} FT_Var_Named_Style =
       FT_Var_Named_Style
         { coords :: Ptr FT_Fixed
         , strid  :: FT_UInt
         , psid   :: FT_UInt
         }

instance Offset "coords" FT_Var_Named_Style where rawOffset = #{offset struct FT_Var_Named_Style_, coords}
instance Offset "strid"  FT_Var_Named_Style where rawOffset = #{offset struct FT_Var_Named_Style_, strid }
instance Offset "psid"   FT_Var_Named_Style where rawOffset = #{offset struct FT_Var_Named_Style_, psid  }

instance Storable FT_Var_Named_Style where
  sizeOf _    = #size      struct FT_Var_Named_Style_
  alignment _ = #alignment struct FT_Var_Named_Style_

  peek ptr =
    FT_Var_Named_Style
      <$> peek (offset @"coords" ptr)
      <*> peek (offset @"strid"  ptr)
      <*> peek (offset @"psid"   ptr)

  poke ptr val = do
    pokeField @"coords" ptr val
    pokeField @"strid"  ptr val
    pokeField @"psid"   ptr val



data {-# CTYPE "freetype/ftmm.h" "FT_MM_Var" #-} FT_MM_Var =
       FT_MM_Var
         { num_axis        :: FT_UInt
         , num_designs     :: FT_UInt
         , num_namedstyles :: FT_UInt
         , axis            :: Ptr FT_Var_Axis
         , namedstyle      :: Ptr FT_Var_Named_Style
         }

instance Offset "num_axis"        FT_MM_Var where rawOffset = #{offset struct FT_MM_Var_, num_axis       }
instance Offset "num_designs"     FT_MM_Var where rawOffset = #{offset struct FT_MM_Var_, num_designs    }
instance Offset "num_namedstyles" FT_MM_Var where rawOffset = #{offset struct FT_MM_Var_, num_namedstyles}
instance Offset "axis"            FT_MM_Var where rawOffset = #{offset struct FT_MM_Var_, axis           }
instance Offset "namedstyle"      FT_MM_Var where rawOffset = #{offset struct FT_MM_Var_, namedstyle     }

instance Storable FT_MM_Var where
  sizeOf _    = #size      struct FT_MM_Var_
  alignment _ = #alignment struct FT_MM_Var_

  peek ptr =
    FT_MM_Var
      <$> peek (offset @"num_axis"        ptr)
      <*> peek (offset @"num_designs"     ptr)
      <*> peek (offset @"num_namedstyles" ptr)
      <*> peek (offset @"axis"            ptr)
      <*> peek (offset @"namedstyle"      ptr)

  poke ptr val = do
    pokeField @"num_axis"        ptr val
    pokeField @"num_designs"     ptr val
    pokeField @"num_namedstyles" ptr val
    pokeField @"axis"            ptr val
    pokeField @"namedstyle"      ptr val
