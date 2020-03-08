{-# LANGUAGE ForeignFunctionInterface #-}

module FreeType.Format.Multiple.Types where

import           FreeType.Core.Types.Types

import           Data.Function ((&))
import           Foreign.Ptr
import           Foreign.Storable

#include "ft2build.h"
#include FT_MULTIPLE_MASTERS_H

data FT_MM_Axis = FT_MM_Axis
                    { mmaName    :: Ptr FT_String
                    , mmaMinimum :: FT_Long
                    , mmaMaximum :: FT_Long
                    }

instance Storable FT_MM_Axis where
  sizeOf _    = #size      struct FT_MM_Axis_
  alignment _ = #alignment struct FT_MM_Axis_

  peek ptr =
    FT_MM_Axis
      <$> #{peek struct FT_MM_Axis_, name   } ptr
      <*> #{peek struct FT_MM_Axis_, minimum} ptr
      <*> #{peek struct FT_MM_Axis_, maximum} ptr

  poke ptr val = do
    #{poke struct FT_MM_Axis_, name   } ptr $ val & mmaName
    #{poke struct FT_MM_Axis_, minimum} ptr $ val & mmaMinimum
    #{poke struct FT_MM_Axis_, maximum} ptr $ val & mmaMaximum



data FT_Multi_Master = FT_Multi_Master
                         { mmNum_axis    :: FT_UInt
                         , mmNum_designs :: FT_UInt
                         , mmAxis        :: Ptr FT_MM_Axis
                         }

instance Storable FT_Multi_Master where    
  sizeOf _    = #size      struct FT_Multi_Master_    
  alignment _ = #alignment struct FT_Multi_Master_    
    
  peek ptr =    
    FT_Multi_Master    
      <$> #{peek struct FT_Multi_Master_, num_axis   } ptr    
      <*> #{peek struct FT_Multi_Master_, num_designs} ptr    
      <*> #{peek struct FT_Multi_Master_, axis       } ptr    
    
  poke ptr val = do    
    #{poke struct FT_Multi_Master_, num_axis   } ptr $ val & mmNum_axis    
    #{poke struct FT_Multi_Master_, num_designs} ptr $ val & mmNum_designs    
    #{poke struct FT_Multi_Master_, axis       } ptr $ val & mmAxis



data FT_Var_Axis = FT_Var_Axis
                     { vaName    :: Ptr FT_String
                     , vaMinimum :: FT_Fixed
                     , vaDef     :: FT_Fixed
                     , vaMaximum :: FT_Fixed
                     , vaTag     :: FT_ULong
                     , vaStrid   :: FT_UInt
                     }

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
    #{poke struct FT_Var_Axis_, name   } ptr $ val & vaName
    #{poke struct FT_Var_Axis_, minimum} ptr $ val & vaMinimum
    #{poke struct FT_Var_Axis_, def    } ptr $ val & vaDef
    #{poke struct FT_Var_Axis_, maximum} ptr $ val & vaMaximum
    #{poke struct FT_Var_Axis_, tag    } ptr $ val & vaTag
    #{poke struct FT_Var_Axis_, strid  } ptr $ val & vaStrid



data FT_Var_Named_Style = FT_Var_Named_Style
                            { vnsCoords :: Ptr FT_Fixed
                            , vnsStrid  :: FT_UInt
                            , vnsPsid   :: FT_UInt
                            }

instance Storable FT_Var_Named_Style where
  sizeOf _    = #size      struct FT_Var_Named_Style_
  alignment _ = #alignment struct FT_Var_Named_Style_

  peek ptr =
    FT_Var_Named_Style
      <$> #{peek struct FT_Var_Named_Style_, coords} ptr
      <*> #{peek struct FT_Var_Named_Style_, strid } ptr
      <*> #{peek struct FT_Var_Named_Style_, psid  } ptr

  poke ptr val = do
    #{poke struct FT_Var_Named_Style_, coords} ptr $ val & vnsCoords
    #{poke struct FT_Var_Named_Style_, strid } ptr $ val & vnsStrid
    #{poke struct FT_Var_Named_Style_, psid  } ptr $ val & vnsPsid



data FT_MM_Var = FT_MM_Var
                   { mmvNum_axis        :: FT_UInt
                   , mmvNum_designs     :: FT_UInt
                   , mmvNum_namedstyles :: FT_UInt
                   , mmvAxis            :: Ptr FT_Var_Axis
                   , mmvNamedstyle      :: Ptr FT_Var_Named_Style
                   }

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
    #{poke struct FT_MM_Var_, num_axis       } ptr $ val & mmvNum_axis
    #{poke struct FT_MM_Var_, num_designs    } ptr $ val & mmvNum_designs
    #{poke struct FT_MM_Var_, num_namedstyles} ptr $ val & mmvNum_namedstyles
    #{poke struct FT_MM_Var_, axis           } ptr $ val & mmvAxis
    #{poke struct FT_MM_Var_, namedstyle     } ptr $ val & mmvNamedstyle
