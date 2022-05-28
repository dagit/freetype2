{-# LANGUAGE DataKinds
           , ForeignFunctionInterface
           , MultiParamTypeClasses
           , TypeApplications #-}

module FreeType.Format.Multiple.Types where

import           FreeType.Core.Types.Types

import           Foreign.Ptr
import           Foreign.Storable
import           Foreign.Storable.Offset

#include "ft2build.h"
#include FT_MULTIPLE_MASTERS_H

data FT_MM_Axis = FT_MM_Axis
                    { mmaName    :: Ptr FT_String
                    , mmaMinimum :: FT_Long
                    , mmaMaximum :: FT_Long
                    }

instance Offset "mmaName"    FT_MM_Axis where rawOffset = #{offset struct FT_MM_Axis_, name   }
instance Offset "mmaMinimum" FT_MM_Axis where rawOffset = #{offset struct FT_MM_Axis_, minimum}
instance Offset "mmaMaximum" FT_MM_Axis where rawOffset = #{offset struct FT_MM_Axis_, maximum}

instance Storable FT_MM_Axis where
  sizeOf _    = #size      struct FT_MM_Axis_
  alignment _ = #alignment struct FT_MM_Axis_

  peek ptr =
    FT_MM_Axis
      <$> peek (offset @"mmaName"    ptr)
      <*> peek (offset @"mmaMinimum" ptr)
      <*> peek (offset @"mmaMaximum" ptr)

  poke ptr val = do
    pokeField @"mmaName"    ptr val
    pokeField @"mmaMinimum" ptr val
    pokeField @"mmaMaximum" ptr val



data FT_Multi_Master = FT_Multi_Master
                         { mmNum_axis    :: FT_UInt
                         , mmNum_designs :: FT_UInt
                         , mmAxis        :: Ptr FT_MM_Axis
                         }

instance Offset "mmNum_axis"    FT_Multi_Master where rawOffset = #{offset struct FT_Multi_Master_, num_axis   }
instance Offset "mmNum_designs" FT_Multi_Master where rawOffset = #{offset struct FT_Multi_Master_, num_designs}
instance Offset "mmAxis"        FT_Multi_Master where rawOffset = #{offset struct FT_Multi_Master_, axis       }

instance Storable FT_Multi_Master where
  sizeOf _    = #size      struct FT_Multi_Master_
  alignment _ = #alignment struct FT_Multi_Master_

  peek ptr =
    FT_Multi_Master
      <$> peek (offset @"mmNum_axis"    ptr)
      <*> peek (offset @"mmNum_designs" ptr)
      <*> peek (offset @"mmAxis"        ptr)

  poke ptr val = do
    pokeField @"mmNum_axis"    ptr val
    pokeField @"mmNum_designs" ptr val
    pokeField @"mmAxis"        ptr val



data FT_Var_Axis = FT_Var_Axis
                     { vaName    :: Ptr FT_String
                     , vaMinimum :: FT_Fixed
                     , vaDef     :: FT_Fixed
                     , vaMaximum :: FT_Fixed
                     , vaTag     :: FT_ULong
                     , vaStrid   :: FT_UInt
                     }

instance Offset "vaName"    FT_Var_Axis where rawOffset = #{offset struct FT_Var_Axis_, name   }
instance Offset "vaMinimum" FT_Var_Axis where rawOffset = #{offset struct FT_Var_Axis_, minimum}
instance Offset "vaDef"     FT_Var_Axis where rawOffset = #{offset struct FT_Var_Axis_, def    }
instance Offset "vaMaximum" FT_Var_Axis where rawOffset = #{offset struct FT_Var_Axis_, maximum}
instance Offset "vaTag"     FT_Var_Axis where rawOffset = #{offset struct FT_Var_Axis_, tag    }
instance Offset "vaStrid"   FT_Var_Axis where rawOffset = #{offset struct FT_Var_Axis_, strid  }

instance Storable FT_Var_Axis where
  sizeOf _    = #size      struct FT_Var_Axis_
  alignment _ = #alignment struct FT_Var_Axis_

  peek ptr =
    FT_Var_Axis
      <$> peek (offset @"vaName"    ptr)
      <*> peek (offset @"vaMinimum" ptr)
      <*> peek (offset @"vaDef"     ptr)
      <*> peek (offset @"vaMaximum" ptr)
      <*> peek (offset @"vaTag"     ptr)
      <*> peek (offset @"vaStrid"   ptr)

  poke ptr val = do
    pokeField @"vaName"    ptr val
    pokeField @"vaMinimum" ptr val
    pokeField @"vaDef"     ptr val
    pokeField @"vaMaximum" ptr val
    pokeField @"vaTag"     ptr val
    pokeField @"vaStrid"   ptr val



data FT_Var_Named_Style = FT_Var_Named_Style
                            { vnsCoords :: Ptr FT_Fixed
                            , vnsStrid  :: FT_UInt
                            , vnsPsid   :: FT_UInt
                            }

instance Offset "vnsCoords" FT_Var_Named_Style where rawOffset = #{offset struct FT_Var_Named_Style_, coords}
instance Offset "vnsStrid"  FT_Var_Named_Style where rawOffset = #{offset struct FT_Var_Named_Style_, strid }
instance Offset "vnsPsid"   FT_Var_Named_Style where rawOffset = #{offset struct FT_Var_Named_Style_, psid  }

instance Storable FT_Var_Named_Style where
  sizeOf _    = #size      struct FT_Var_Named_Style_
  alignment _ = #alignment struct FT_Var_Named_Style_

  peek ptr =
    FT_Var_Named_Style
      <$> peek (offset @"vnsCoords" ptr)
      <*> peek (offset @"vnsStrid"  ptr)
      <*> peek (offset @"vnsPsid"   ptr)

  poke ptr val = do
    pokeField @"vnsCoords" ptr val
    pokeField @"vnsStrid"  ptr val
    pokeField @"vnsPsid"   ptr val



data FT_MM_Var = FT_MM_Var
                   { mmvNum_axis        :: FT_UInt
                   , mmvNum_designs     :: FT_UInt
                   , mmvNum_namedstyles :: FT_UInt
                   , mmvAxis            :: Ptr FT_Var_Axis
                   , mmvNamedstyle      :: Ptr FT_Var_Named_Style
                   }

instance Offset "mmvNum_axis"        FT_MM_Var where rawOffset = #{offset struct FT_MM_Var_, num_axis       }
instance Offset "mmvNum_designs"     FT_MM_Var where rawOffset = #{offset struct FT_MM_Var_, num_designs    }
instance Offset "mmvNum_namedstyles" FT_MM_Var where rawOffset = #{offset struct FT_MM_Var_, num_namedstyles}
instance Offset "mmvAxis"            FT_MM_Var where rawOffset = #{offset struct FT_MM_Var_, axis           }
instance Offset "mmvNamedstyle"      FT_MM_Var where rawOffset = #{offset struct FT_MM_Var_, namedstyle     }

instance Storable FT_MM_Var where
  sizeOf _    = #size      struct FT_MM_Var_
  alignment _ = #alignment struct FT_MM_Var_

  peek ptr =
    FT_MM_Var
      <$> peek (offset @"mmvNum_axis"        ptr)
      <*> peek (offset @"mmvNum_designs"     ptr)
      <*> peek (offset @"mmvNum_namedstyles" ptr)
      <*> peek (offset @"mmvAxis"            ptr)
      <*> peek (offset @"mmvNamedstyle"      ptr)

  poke ptr val = do
    pokeField @"mmvNum_axis"        ptr val
    pokeField @"mmvNum_designs"     ptr val
    pokeField @"mmvNum_namedstyles" ptr val
    pokeField @"mmvAxis"            ptr val
    pokeField @"mmvNamedstyle"      ptr val
