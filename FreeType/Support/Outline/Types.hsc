{-# LANGUAGE DataKinds
           , DuplicateRecordFields
           , MultiParamTypeClasses #-}
#if __GLASGOW_HASKELL__ >= 902
{-# LANGUAGE NoFieldSelectors #-}
#endif
{-# LANGUAGE TypeApplications #-}

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
                           { move_to  :: FunPtr FT_Outline_MoveToFunc
                           , line_to  :: FunPtr FT_Outline_LineToFunc
                           , conic_to :: FunPtr FT_Outline_ConicToFunc
                           , cubic_to :: FunPtr FT_Outline_CubicToFunc
                           , shift    :: #type int
                           , delta    :: FT_Pos
                           }

instance Offset "move_to"  FT_Outline_Funcs where rawOffset = #{offset struct FT_Outline_Funcs_, move_to }
instance Offset "line_to"  FT_Outline_Funcs where rawOffset = #{offset struct FT_Outline_Funcs_, line_to }
instance Offset "conic_to" FT_Outline_Funcs where rawOffset = #{offset struct FT_Outline_Funcs_, conic_to}
instance Offset "cubic_to" FT_Outline_Funcs where rawOffset = #{offset struct FT_Outline_Funcs_, cubic_to}
instance Offset "shift"    FT_Outline_Funcs where rawOffset = #{offset struct FT_Outline_Funcs_, shift   }
instance Offset "delta"    FT_Outline_Funcs where rawOffset = #{offset struct FT_Outline_Funcs_, delta   }

instance Storable FT_Outline_Funcs where
  sizeOf _    = #size      struct FT_Outline_Funcs_
  alignment _ = #alignment struct FT_Outline_Funcs_

  peek ptr =
    FT_Outline_Funcs
      <$> peek (offset @"move_to"  ptr)
      <*> peek (offset @"line_to"  ptr)
      <*> peek (offset @"conic_to" ptr)
      <*> peek (offset @"cubic_to" ptr)
      <*> peek (offset @"shift"    ptr)
      <*> peek (offset @"delta"    ptr)

  poke ptr val = do
    pokeField @"move_to"  ptr val
    pokeField @"line_to"  ptr val
    pokeField @"conic_to" ptr val
    pokeField @"cubic_to" ptr val
    pokeField @"shift"    ptr val
    pokeField @"delta"    ptr val



type FT_Outline_MoveToFunc = Ptr FT_Vector -- ^ to
                          -> Ptr ()        -- ^ user
                          -> IO #type int



type FT_Outline_LineToFunc = Ptr FT_Vector -- ^ to
                          -> Ptr ()        -- ^ user
                          -> IO #type int



type FT_Outline_ConicToFunc = Ptr FT_Vector -- ^ control
                           -> Ptr FT_Vector -- ^ to
                           -> Ptr ()        -- ^ user
                           -> IO #type int



type FT_Outline_CubicToFunc = Ptr FT_Vector -- ^ control1
                           -> Ptr FT_Vector -- ^ control2
                           -> Ptr FT_Vector -- ^ to
                           -> Ptr ()        -- ^ user
                           -> IO #type int
