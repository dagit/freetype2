{- | Please refer to the
     [Support API > System Interface](https://www.freetype.org/freetype2/docs/reference/ft2-system_interface.html)
     chapter of the reference.

     Internal: "FreeType.Support.System.Internal".
 -}

module FreeType.Support.System
  ( -- ** FT_Memory
    FT_Memory
    -- ** FT_Alloc_Func
  , FT_Alloc_Func
    -- ** FT_Free_Func
  , FT_Free_Func
    -- ** FT_Realloc_Func
  , FT_Realloc_Func
    -- ** FT_MemoryRec
  , FT_MemoryRec (..)
    -- ** FT_Stream
  , FT_Stream
    -- ** FT_StreamDesc
  , FT_StreamDesc (..)
    -- ** FT_Stream_IoFunc
  , FT_Stream_IoFunc
    -- ** FT_Stream_CloseFunc
  , FT_Stream_CloseFunc
    -- ** FT_StreamRec
  , FT_StreamRec (..)
  ) where

import           FreeType.Circular.Types
