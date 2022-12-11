{-# LANGUAGE CApiFFI
           , CPP
           , ForeignFunctionInterface #-}

{- | Please refer to the
     [Support API > List Processing](https://www.freetype.org/freetype2/docs/reference/ft2-list_processing.html)
     chapter of the reference.
 -}

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

import           FreeType.Core.Types.Types
import           FreeType.Support.List.Types
import           FreeType.Support.System

import           Foreign.Ptr

#include "ft2build.h"
#include FT_FREETYPE_H

foreign import CALLCV "freetype/ftlist.h FT_List_Add"
  ft_List_Add :: FT_List -> FT_ListNode -> IO ()



foreign import CALLCV "freetype/ftlist.h FT_List_Insert"
  ft_List_Insert :: FT_List -> FT_ListNode -> IO ()



foreign import CALLCV "freetype/ftlist.h FT_List_Find"
  ft_List_Find
    :: FT_List -- ^ list
    -> Ptr ()  -- ^ data
    -> IO FT_ListNode



foreign import CALLCV "freetype/ftlist.h FT_List_Remove"
  ft_List_Remove :: FT_List -> FT_ListNode -> IO ()



foreign import CALLCV "freetype/ftlist.h FT_List_Up"
  ft_List_Up :: FT_List -> FT_ListNode -> IO ()



foreign import CALLCV "freetype/ftlist.h FT_List_Iterate"
  ft_List_Iterate
    :: FT_List                 -- ^ list
    -> FunPtr FT_List_Iterator -- ^ iterator
    -> Ptr ()                  -- ^ user
    -> IO FT_Error



foreign import CALLCV "freetype/ftlist.h FT_List_Finalize"
  ft_List_Finalize
    :: FT_List                   -- ^ list
    -> FunPtr FT_List_Destructor -- ^ destroy
    -> FT_Memory                 -- ^ memory
    -> Ptr ()                    -- ^ user
    -> IO ()
