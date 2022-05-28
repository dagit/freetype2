{-# LANGUAGE DataKinds
           , ForeignFunctionInterface
           , MultiParamTypeClasses
           , TypeApplications #-}

module FreeType.Support.Outline.Types
  ( module FreeType.Support.Outline.Types
  , FT_Outline (..)
  ) where

import           FreeType.Circular.Types
import           FreeType.Core.Types.Types

import           Data.Int
import           Data.Word
import           Foreign.Storable
import           Foreign.Storable.Offset
import           Foreign.Ptr

#include "ft2build.h"
#include FT_IMAGE_H
#include FT_OUTLINE_H

type FT_Orientation = #type enum FT_Orientation_



data FT_Outline_Funcs = FT_Outline_Funcs
                          { ofMove_to  :: FT_Outline_MoveToFunc
                          , ofLine_to  :: FT_Outline_LineToFunc
                          , ofConic_to :: FT_Outline_ConicToFunc
                          , ofCubic_to :: FT_Outline_CubicToFunc
                          , ofShift    :: #type int
                          , ofDelta    :: FT_Pos
                          }

instance Storable FT_Outline_Funcs where
  sizeOf _    = sizeOf    (undefined :: FT_Outline_Funcs')
  alignment _ = alignment (undefined :: FT_Outline_Funcs')

  peek ptr = do
    FT_Outline_Funcs' move_to line_to conic_to cubic_to shift delta <- peek $ castPtr ptr
    return $ FT_Outline_Funcs
               { ofMove_to  = ft_Outline_MoveToFunc' move_to
               , ofLine_to  = ft_Outline_LineToFunc' line_to
               , ofConic_to = ft_Outline_ConicToFunc' conic_to
               , ofCubic_to = ft_Outline_CubicToFunc' cubic_to
               , ofShift    = shift
               , ofDelta    = delta
               }

  poke ptr (FT_Outline_Funcs move_to line_to conic_to cubic_to shift delta) = do
    move_toF  <- ft_Outline_MoveToFunc move_to
    line_toF  <- ft_Outline_LineToFunc line_to  
    conic_toF <- ft_Outline_ConicToFunc conic_to
    cubic_toF <- ft_Outline_CubicToFunc cubic_to
    poke (castPtr ptr) $ FT_Outline_Funcs'
                           { oftMove_to  = move_toF
                           , oftLine_to  = line_toF
                           , oftConic_to = conic_toF
                           , oftCubic_to = cubic_toF
                           , oftShift    = shift
                           , oftDelta    = delta
                           }
    freeHaskellFunPtr move_toF
    freeHaskellFunPtr line_toF
    freeHaskellFunPtr conic_toF
    freeHaskellFunPtr cubic_toF



data FT_Outline_Funcs' = FT_Outline_Funcs'
                           { oftMove_to  :: FunPtr FT_Outline_MoveToFunc
                           , oftLine_to  :: FunPtr FT_Outline_LineToFunc
                           , oftConic_to :: FunPtr FT_Outline_ConicToFunc
                           , oftCubic_to :: FunPtr FT_Outline_CubicToFunc
                           , oftShift    :: #type int
                           , oftDelta    :: FT_Pos
                           }

instance Offset "oftMove_to"  FT_Outline_Funcs' where rawOffset = #{offset struct FT_Outline_Funcs_, move_to }
instance Offset "oftLine_to"  FT_Outline_Funcs' where rawOffset = #{offset struct FT_Outline_Funcs_, line_to }
instance Offset "oftConic_to" FT_Outline_Funcs' where rawOffset = #{offset struct FT_Outline_Funcs_, conic_to}
instance Offset "oftCubic_to" FT_Outline_Funcs' where rawOffset = #{offset struct FT_Outline_Funcs_, cubic_to}
instance Offset "oftShift"    FT_Outline_Funcs' where rawOffset = #{offset struct FT_Outline_Funcs_, shift   }
instance Offset "oftDelta"    FT_Outline_Funcs' where rawOffset = #{offset struct FT_Outline_Funcs_, delta   }

instance Storable FT_Outline_Funcs' where
  sizeOf _    = #size      struct FT_Outline_Funcs_
  alignment _ = #alignment struct FT_Outline_Funcs_

  peek ptr =
    FT_Outline_Funcs'
      <$> peek (offset @"oftMove_to"  ptr)
      <*> peek (offset @"oftLine_to"  ptr)
      <*> peek (offset @"oftConic_to" ptr)
      <*> peek (offset @"oftCubic_to" ptr)
      <*> peek (offset @"oftShift"    ptr)
      <*> peek (offset @"oftDelta"    ptr)

  poke ptr val = do
    pokeField @"oftMove_to"  ptr val
    pokeField @"oftLine_to"  ptr val
    pokeField @"oftConic_to" ptr val
    pokeField @"oftCubic_to" ptr val
    pokeField @"oftShift"    ptr val
    pokeField @"oftDelta"    ptr val



type FT_Outline_MoveToFunc = Ptr FT_Vector -- ^ to
                          -> Ptr ()        -- ^ user
                          -> IO #type int

foreign import ccall "wrapper"
  ft_Outline_MoveToFunc :: FT_Outline_MoveToFunc -> IO (FunPtr FT_Outline_MoveToFunc)

foreign import ccall "dynamic"
  ft_Outline_MoveToFunc' :: FunPtr FT_Outline_MoveToFunc -> FT_Outline_MoveToFunc



type FT_Outline_LineToFunc = Ptr FT_Vector -- ^ to
                          -> Ptr ()        -- ^ user
                          -> IO #type int

foreign import ccall "wrapper"
  ft_Outline_LineToFunc :: FT_Outline_LineToFunc -> IO (FunPtr FT_Outline_LineToFunc)

foreign import ccall "dynamic"
  ft_Outline_LineToFunc' :: FunPtr FT_Outline_LineToFunc -> FT_Outline_LineToFunc



type FT_Outline_ConicToFunc = Ptr FT_Vector -- ^ control
                           -> Ptr FT_Vector -- ^ to
                           -> Ptr ()        -- ^ user
                           -> IO #type int

foreign import ccall "wrapper"
  ft_Outline_ConicToFunc :: FT_Outline_ConicToFunc -> IO (FunPtr FT_Outline_ConicToFunc)

foreign import ccall "dynamic"
  ft_Outline_ConicToFunc' :: FunPtr FT_Outline_ConicToFunc -> FT_Outline_ConicToFunc



type FT_Outline_CubicToFunc = Ptr FT_Vector -- ^ control1
                           -> Ptr FT_Vector -- ^ control2
                           -> Ptr FT_Vector -- ^ to
                           -> Ptr ()        -- ^ user
                           -> IO #type int

foreign import ccall "wrapper"
  ft_Outline_CubicToFunc :: FT_Outline_CubicToFunc -> IO (FunPtr FT_Outline_CubicToFunc)

foreign import ccall "dynamic"
  ft_Outline_CubicToFunc' :: FunPtr FT_Outline_CubicToFunc -> FT_Outline_CubicToFunc
