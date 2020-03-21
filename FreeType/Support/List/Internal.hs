{-# LANGUAGE ForeignFunctionInterface #-}

module FreeType.Support.List.Internal
  ( -- ** FT_List_Find
    ft_List_Find'
    -- ** FT_List_Iterate
  , ft_List_Iterate'
    -- ** FT_List_Iterator
  , ft_List_Iterator
  , ft_List_Iterator'
    -- ** FT_List_Destructor
  , ft_List_Destructor
  , ft_List_Destructor'
    -- ** FT_List_Finalize
  , ft_List_Finalize'
  )where

import           FreeType.Core.Types.Types
import           FreeType.Support.List.Types
import           FreeType.Support.System

import           Foreign.Ptr



foreign import ccall "FT_List_Find"    
  ft_List_Find'
    :: FT_List -- ^ list
    -> Ptr ()  -- ^ data
    -> IO FT_ListNode



foreign import ccall "FT_List_Iterate"    
  ft_List_Iterate'
    :: FT_List                 -- ^ list
    -> FunPtr FT_List_Iterator -- ^ iterator
    -> Ptr ()                  -- ^ user
    -> IO FT_Error    



foreign import ccall "wrapper"
  ft_List_Iterator
    :: FT_List_Iterator -> IO (FunPtr FT_List_Iterator)



foreign import ccall "dynamic"
  ft_List_Iterator'
    :: FunPtr FT_List_Iterator -> FT_List_Iterator



foreign import ccall "wrapper"
  ft_List_Destructor
    :: FT_List_Destructor -> IO (FunPtr FT_List_Destructor)



foreign import ccall "dynamic"
  ft_List_Destructor'
    :: FunPtr FT_List_Destructor -> FT_List_Destructor

foreign import ccall "FT_List_Finalize"
  ft_List_Finalize'
    :: FT_List                   -- ^ list
    -> FunPtr FT_List_Destructor -- ^ destroy
    -> FT_Memory                 -- ^ memory
    -> Ptr ()                    -- ^ user
    -> IO ()
