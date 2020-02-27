{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}
{-# OPTIONS_HADDOCK hide #-}

module FreeType.Format.Multiple.Internal where

import           FreeType.Core.Base.Internal
import           FreeType.Core.Types.Internal

import           Foreign.C.Types
import           Foreign.Ptr

#include "ft2build.h"
#include FT_MULTIPLE_MASTERS_H

data FT_MM_Axis = FT_MM_Axis
                    { mmaName    :: Ptr FT_String
                    , mmaMinimum :: FT_Long
                    , mmaMaximum :: FT_Long
                    }



data FT_Multi_Master = FT_Multi_Master
                         { mmNum_axis    :: FT_UInt
                         , mmNum_designs :: FT_UInt
                         , mmAxis        :: Ptr FT_MM_Axis
                         }



data FT_Var_Axis = FT_Var_Axis
                     { vaName    :: Ptr FT_String
                     , vaMinimum :: FT_Fixed
                     , vaDef     :: FT_Fixed
                     , vaMaximum :: FT_Fixed
                     , vaTag     :: FT_ULong
                     , vaStrid   :: FT_UInt
                     }



data FT_Var_Named_Style = FT_Var_Named_Style
                            { vnsCoords :: Ptr FT_Fixed
                            , vnsStrid  :: FT_UInt
                            , vnsPsid   :: FT_UInt
                            }



data FT_MM_Var = FT_MM_Var
                   { mmvNum_axis        :: FT_UInt
                   , mmvNum_designs     :: FT_UInt
                   , mmvNum_namedstyles :: FT_UInt
                   , mmvAxis            :: Ptr FT_Var_Axis
                   , mmvNamedstyle      :: Ptr FT_Var_Named_Style
                   }



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



foreign import ccall "FT_Get_MM_Blend_Coordinates"    
  ft_Get_MM_Blend_Coordinates :: FT_Face -> FT_UInt -> Ptr FT_Fixed -> IO FT_Error    
    
    
    
foreign import ccall "FT_Set_Var_Blend_Coordinates"    
  ft_Set_Var_Blend_Coordinates :: FT_Face -> FT_UInt -> Ptr FT_Fixed -> IO FT_Error



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
