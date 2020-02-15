{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}

module FreeType.Raw.Format.Multiple where

import           FreeType.Raw.Core.Base
import           FreeType.Raw.Core.Types

import           Foreign.C.Types
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
    #{poke struct FT_MM_Axis_, name   } ptr $ mmaName    val
    #{poke struct FT_MM_Axis_, minimum} ptr $ mmaMinimum val
    #{poke struct FT_MM_Axis_, maximum} ptr $ mmaMaximum val



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
    #{poke struct FT_Multi_Master_, num_axis   } ptr $ mmNum_axis    val
    #{poke struct FT_Multi_Master_, num_designs} ptr $ mmNum_designs val
    #{poke struct FT_Multi_Master_, axis       } ptr $ mmAxis        val



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
    #{poke struct FT_Var_Axis_, name   } ptr $ vaName    val
    #{poke struct FT_Var_Axis_, minimum} ptr $ vaMinimum val
    #{poke struct FT_Var_Axis_, def    } ptr $ vaDef     val
    #{poke struct FT_Var_Axis_, maximum} ptr $ vaMaximum val
    #{poke struct FT_Var_Axis_, tag    } ptr $ vaTag     val
    #{poke struct FT_Var_Axis_, strid  } ptr $ vaStrid   val
    


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
    #{poke struct FT_Var_Named_Style_, coords} ptr $ vnsCoords val
    #{poke struct FT_Var_Named_Style_, strid } ptr $ vnsStrid  val
    #{poke struct FT_Var_Named_Style_, psid  } ptr $ vnsPsid   val



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
    #{poke struct FT_MM_Var_, num_axis       } ptr $ mmvNum_axis        val
    #{poke struct FT_MM_Var_, num_designs    } ptr $ mmvNum_designs     val
    #{poke struct FT_MM_Var_, num_namedstyles} ptr $ mmvNum_namedstyles val
    #{poke struct FT_MM_Var_, axis           } ptr $ mmvAxis            val
    #{poke struct FT_MM_Var_, namedstyle     } ptr $ mmvNamedstyle      val



foreign import ccall "FT_Get_Multi_Master"
  ft_Get_Multi_Master :: FT_Face -> Ptr FT_Multi_Master -> IO FT_Error



foreign import ccall "FT_Get_MM_Var"
  ft_Get_MM_Var :: FT_Face -> Ptr (Ptr FT_MM_Var) -> IO FT_Error



foreign import ccall "FT_Done_MM_Var"
  ft_Done_MM_Var :: FT_Library -> Ptr FT_MM_Var -> IO FT_Error



foreign import ccall "FT_Set_MM_Design_Coordinates"
  ft_Set_MM_Design_Coordinates :: FT_Face -> FT_UInt -> Ptr FT_Long -> IO FT_Error



foreign import ccall "FT_Set_Var_Design_Coordinates"
  ft_Set_Var_Design_Coordinates :: FT_Face -> FT_UInt -> Ptr FT_Fixed -> IO FT_Error



foreign import ccall "FT_Get_Var_Design_Coordinates"
  ft_Get_Var_Design_Coordinates :: FT_Face -> FT_UInt -> Ptr FT_Fixed -> IO FT_Error



foreign import ccall "FT_Set_MM_Blend_Coordinates"
  ft_Set_MM_Blend_Coordinates :: FT_Face -> FT_UInt -> Ptr FT_Fixed -> IO FT_Error



foreign import ccall "FT_Get_Var_Blend_Coordinates"
  ft_Get_Var_Blend_Coordinates :: FT_Face -> FT_UInt -> Ptr FT_Fixed -> IO FT_Error



foreign import ccall "FT_Set_MM_WeightVector"
  ft_Set_MM_WeightVector :: FT_Face -> FT_UInt -> Ptr FT_Fixed -> IO FT_Error



foreign import ccall "FT_Get_MM_WeightVector"      
  ft_Get_MM_WeightVector :: FT_Face -> FT_UInt -> Ptr FT_Fixed -> IO FT_Error     



pattern FT_VAR_AXIS_FLAG_HIDDEN
     :: FT_Int32
pattern FT_VAR_AXIS_FLAG_HIDDEN = #const FT_VAR_AXIS_FLAG_HIDDEN



foreign import ccall "FT_Get_Var_Axis_Flags"
  ft_Get_Var_Axis_Flags :: Ptr FT_MM_Var -> FT_UInt -> Ptr FT_UInt -> IO FT_Error



foreign import ccall "FT_Set_Named_Instance"
  ft_Set_Named_Instance :: FT_Face -> FT_UInt -> IO FT_Error
