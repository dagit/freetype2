{-# LANGUAGE ForeignFunctionInterface #-}

module Graphics.FreeType.Bindings.Support.List
  ( FT_List
  , FT_ListNode
  , FT_ListRec (..)
  , FT_ListNodeRec (..)

  , ft_List_Add
  , ft_List_Insert
  , ft_List_Find
  , ft_List_Remove
  , ft_List_Up
  , ft_List_Iterate
  , FT_List_Iterator
  , ft_List_Finalize
  , FT_List_Destructor
  ) where

import           Graphics.FreeType.Bindings.Circular ( FT_List
                                                     , FT_ListNode
                                                     , FT_ListRec (..)
                                                     , FT_ListNodeRec (..)
                                                     )
import           Graphics.FreeType.Bindings.Core.Types
import           Graphics.FreeType.Bindings.Support.System

import           Foreign.C.Types
import           Foreign.Ptr

#include "ft2build.h"
#include FT_FREETYPE_H

foreign import ccall "FT_List_Add"
  ft_List_Add :: FT_List -> FT_ListNode -> IO ()



foreign import ccall "FT_List_Insert"
  ft_List_Insert :: FT_List -> FT_ListNode -> IO ()



foreign import ccall "FT_List_Find"
  ft_List_Find :: FT_List -> Ptr () -> IO FT_ListNode



foreign import ccall "FT_List_Remove"
  ft_List_Remove :: FT_List -> FT_ListNode -> IO ()



foreign import ccall "FT_List_Up"
  ft_List_Up :: FT_List -> FT_ListNode -> IO ()



foreign import ccall "FT_List_Iterate"
  ft_List_Iterate :: FT_List -> FT_List_Iterator -> Ptr () -> IO FT_Error



type FT_List_Iterator = FunPtr (FT_ListNode -> Ptr () -> IO ())



foreign import ccall "FT_List_Finalize"
  ft_List_Finalize :: FT_List -> FT_List_Destructor -> FT_Memory -> Ptr () -> IO ()



type FT_List_Destructor = FunPtr (FT_Memory -> Ptr () -> Ptr () -> IO ())
