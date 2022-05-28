{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}

{- | All of the functions in this module that get/set coordinates automatically
     set @num_coords@ based on list size and send 'nullPtr' as pointer if the
     array is 'null'.

     Please refer to the
     [Format-Specific API > Multiple Masters](https://www.freetype.org/freetype2/docs/reference/ft2-multiple_masters.html)
     chapter of the reference.

     Internal: "FreeType.Format.Multiple.Internal".
 -}

module FreeType.Format.Multiple
  ( -- ** FT_MM_Axis
    FT_MM_Axis (..)
    -- ** FT_Multi_Master
  , FT_Multi_Master (..)
    -- ** FT_Var_Axis
  , FT_Var_Axis (..)
    -- ** FT_Var_Named_Style
  , FT_Var_Named_Style (..)
    -- ** FT_MM_Var
  , FT_MM_Var (..)
    -- ** FT_Get_Multi_Master
  , ft_Get_Multi_Master
    -- ** FT_Get_MM_Var
  , ft_Get_MM_Var
    -- ** FT_Done_MM_Var
  , ft_Done_MM_Var
    -- ** FT_Set_MM_Design_Coordinates
  , ft_Set_MM_Design_Coordinates
    -- ** FT_Set_Var_Design_Coordinates
  , ft_Set_Var_Design_Coordinates
    -- ** FT_Get_Var_Design_Coordinates
  , ft_Get_Var_Design_Coordinates
    -- ** FT_Set_MM_Blend_Coordinates
  , ft_Set_MM_Blend_Coordinates
    -- ** FT_Get_MM_Blend_Coordinates
  , ft_Get_MM_Blend_Coordinates
    -- ** FT_Set_Var_Blend_Coordinates
  , ft_Set_Var_Blend_Coordinates
    -- ** FT_Get_Var_Blend_Coordinates
  , ft_Get_Var_Blend_Coordinates
    -- ** FT_Set_MM_WeightVector
  , ft_Set_MM_WeightVector
    -- ** FT_Get_MM_WeightVector
  , ft_Get_MM_WeightVector
    -- ** FT_VAR_AXIS_FLAG_XXX
  , pattern FT_VAR_AXIS_FLAG_HIDDEN
    -- ** FT_Get_Var_Axis_Flags
  , ft_Get_Var_Axis_Flags
    -- ** FT_Set_Named_Instance
  , ft_Set_Named_Instance
  ) where

import           FreeType.Core.Base.Types
import           FreeType.Core.Types.Types
import           FreeType.Error.Values
import           FreeType.Exception.Internal
import           FreeType.Format.Multiple.Internal
import           FreeType.Format.Multiple.Types

import           Foreign.Marshal.Array
import           Foreign.Marshal.Utils
import           Foreign.Ptr
import           Foreign.Storable

#include "ft2build.h"
#include FT_MULTIPLE_MASTERS_H

ft_Get_Multi_Master
  :: FT_Face            -- ^ face
  -> IO FT_Multi_Master -- ^ master
ft_Get_Multi_Master =
  autoAllocaError "ft_Get_Multi_Master" ft_Get_Multi_Master'


ft_Get_MM_Var
  :: FT_Face            -- ^ face
  -> IO (Ptr FT_MM_Var) -- ^ master
ft_Get_MM_Var =
  autoAllocaError "ft_Get_MM_Var" ft_Get_MM_Var'



ft_Done_MM_Var
  :: FT_Library    -- ^ library
  -> Ptr FT_MM_Var -- ^ master
  -> IO ()
ft_Done_MM_Var =
  autoError "ft_Done_MM_Var" ft_Done_MM_Var'



setCoords
  :: Storable a
  => String
  -> (FT_Face -> FT_UInt -> Ptr a -> IO FT_Error)
  -> (FT_Face -> [a] -> IO ())
setCoords name f face []     =
  ftError name $ f face 0 nullPtr

setCoords name f face coords =
  withArray coords $ ftError name . f face (fromIntegral $ length coords)



getCoords
  :: Storable a
  => String
  -> (FT_Face -> FT_UInt -> Ptr a -> IO FT_Error)
  -> (FT_Face -> FT_UInt -> IO [a])
getCoords name f = \face num ->
  allocaArray (fromIntegral num) $ \coordsPtr -> do
    ftError name $ f face num coordsPtr
    peekArray (fromIntegral num) coordsPtr



ft_Set_MM_Design_Coordinates
  :: FT_Face   -- ^ face
  -> [FT_Long] -- ^ coords
  -> IO ()
ft_Set_MM_Design_Coordinates =
  setCoords "ft_Set_MM_Design_Coordinates" ft_Set_MM_Design_Coordinates'



ft_Set_Var_Design_Coordinates
  :: FT_Face    -- ^ face
  -> [FT_Fixed] -- ^ coords
  -> IO ()
ft_Set_Var_Design_Coordinates =
  setCoords "ft_Set_Var_Design_Coordinates" ft_Set_Var_Design_Coordinates'



ft_Get_Var_Design_Coordinates
  :: FT_Face       -- ^ face
  -> FT_UInt       -- ^ num_coords
  -> IO [FT_Fixed] -- ^ coords
ft_Get_Var_Design_Coordinates =
  getCoords "ft_Get_Var_Design_Coordinates" ft_Get_Var_Design_Coordinates'



ft_Set_MM_Blend_Coordinates
  :: FT_Face    -- ^ face,
  -> [FT_Fixed] -- ^ coords
  -> IO ()
ft_Set_MM_Blend_Coordinates =
  setCoords "ft_Set_MM_Blend_Coordinates" ft_Set_MM_Blend_Coordinates'



ft_Get_MM_Blend_Coordinates
  :: FT_Face       -- ^ face
  -> FT_UInt       -- ^ num_coords
  -> IO [FT_Fixed] -- ^ coords
ft_Get_MM_Blend_Coordinates =
  getCoords "ft_Get_MM_Blend_Coordinates" ft_Get_MM_Blend_Coordinates'



ft_Set_Var_Blend_Coordinates
  :: FT_Face    -- ^ face,
  -> [FT_Fixed] -- ^ coords
  -> IO ()
ft_Set_Var_Blend_Coordinates =
  setCoords "ft_Set_Var_Blend_Coordinates" ft_Set_Var_Blend_Coordinates'



ft_Get_Var_Blend_Coordinates
  :: FT_Face       -- ^ face
  -> FT_UInt       -- ^ num_coords
  -> IO [FT_Fixed] -- ^ coords
ft_Get_Var_Blend_Coordinates =
  getCoords "ft_Get_Var_Blend_Coordinates" ft_Get_Var_Blend_Coordinates'



ft_Set_MM_WeightVector
  :: FT_Face    -- ^ face
  -> [FT_Fixed] -- ^ weightvector
  -> IO ()
ft_Set_MM_WeightVector =
  setCoords "ft_Set_MM_WeightVector" ft_Set_MM_WeightVector'



-- | If 'ft_Get_MM_WeightVector' throws 'FT_Err_Invalid_Argument' (because
--   @len@ provided was too small), it is automatically called again
--   with the correct value.
ft_Get_MM_WeightVector
  :: FT_Face       -- ^ face
  -> FT_UInt       -- ^ len
  -> IO [FT_Fixed] -- ^ weightvector
ft_Get_MM_WeightVector face len =
  with len $ \lenPtr ->
    allocaArray (fromIntegral len) $ \coordsPtr -> do
      ftError "ft_Get_MM_WeightVector" $ do
        err <- ft_Get_MM_WeightVector' face lenPtr coordsPtr
        case err of
          FT_Err_Invalid_Argument -> ft_Get_MM_WeightVector' face lenPtr coordsPtr
          _                       -> return err
      peekArray (fromIntegral len) coordsPtr



pattern FT_VAR_AXIS_FLAG_HIDDEN
     :: FT_UInt
pattern FT_VAR_AXIS_FLAG_HIDDEN = #const FT_VAR_AXIS_FLAG_HIDDEN



ft_Get_Var_Axis_Flags
  :: Ptr FT_MM_Var -- ^ master
  -> FT_UInt       -- ^ axis_index
  -> IO FT_UInt    -- ^ flags
ft_Get_Var_Axis_Flags =
  autoAllocaError "ft_Get_Var_Axis_Flags" ft_Get_Var_Axis_Flags'



ft_Set_Named_Instance
  :: FT_Face -- ^ face
  -> FT_UInt -- ^ instance_index
  -> IO ()
ft_Set_Named_Instance =
  autoError "ft_Set_Named_Instance" ft_Set_Named_Instance'
