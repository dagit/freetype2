module FreeType.Support.List.Types
  ( FT_List
  , FT_ListRec (..)
  , FT_ListNode
  , FT_ListNodeRec (..)
  , FT_List_Iterator
  , FT_List_Destructor
  ) where

import           FreeType.Circular.Types
import           FreeType.Core.Types.Types

import           Foreign.Ptr



type FT_List_Iterator = FT_ListNode -- ^ node
                     -> Ptr ()      -- ^ user
                     -> IO FT_Error



type FT_List_Destructor = FT_Memory -- ^ memory
                       -> Ptr ()    -- ^ data
                       -> Ptr ()    -- ^ user
                       -> IO ()
