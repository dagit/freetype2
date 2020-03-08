{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE TemplateHaskell #-}

module FreeType.Support.List
  ( -- ** FT_List
    FT_List
    -- ** FT_ListNode
  , FT_ListNode
    -- ** FT_ListRec
  , FT_ListRec (..)
    -- ** FT_ListNodeRec
  , FT_ListNodeRec (..)
    -- ** FT_List_Add
  , ft_List_Add
    -- ** FT_List_Insert
  , ft_List_Insert
    -- ** FT_List_Find
  , ft_List_Find
    -- ** FT_List_Remove
  , ft_List_Remove
    -- ** FT_List_Up
  , ft_List_Up
    -- ** FT_List_Iterate
  , ft_List_Iterate
    -- ** FT_List_Iterator
  , FT_List_Iterator
    -- ** FT_List_Finalize
  , ft_List_Finalize
    -- ** FT_List_Destructor
  , FT_List_Destructor
  ) where

import           FreeType.Exception.Internal
import           FreeType.Support.List.Internal
import           FreeType.Support.List.Types
import           FreeType.Support.System

import           Control.Exception
import           Foreign.Ptr

#include "ft2build.h"
#include FT_FREETYPE_H

foreign import ccall "FT_List_Add"
  ft_List_Add :: FT_List -> FT_ListNode -> IO ()



foreign import ccall "FT_List_Insert"
  ft_List_Insert :: FT_List -> FT_ListNode -> IO ()



ft_List_Find :: FT_List -> Ptr () -> IO (Maybe FT_ListNode)
ft_List_Find list data_ = do
  result <- ft_List_Find' list data_
  return $ if result == nullPtr
             then Nothing
             else Just result



foreign import ccall "FT_List_Remove"
  ft_List_Remove :: FT_List -> FT_ListNode -> IO ()



foreign import ccall "FT_List_Up"
  ft_List_Up :: FT_List -> FT_ListNode -> IO ()



ft_List_Iterate :: FT_List -> FT_List_Iterator -> Ptr () -> IO ()
ft_List_Iterate list iterator user = do
  bracket (ft_List_Iterator iterator)
          freeHaskellFunPtr
        $ \funterator -> ftError 'ft_List_Iterate $ ft_List_Iterate' list funterator user



ft_List_Finalize :: FT_List -> FT_List_Destructor -> FT_Memory -> Ptr () -> IO ()
ft_List_Finalize list destroy memory user = do
  bracket (ft_List_Destructor destroy)
          freeHaskellFunPtr
        $ \funstroy -> ft_List_Finalize' list funstroy memory user
