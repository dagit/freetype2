{- | Please refer to the
     [Support API > LZW Streams](https://www.freetype.org/freetype2/docs/reference/ft2-lzw.html)
     chapter of the reference.

     Internal: "FreeType.Support.LZW.Internal".
 -}

module FreeType.Support.LZW
  ( -- ** FT_Stream_OpenLZW
    ft_Stream_OpenLZW
  ) where

import           FreeType.Exception.Internal
import           FreeType.Support.LZW.Internal
import           FreeType.Support.System.Types



ft_Stream_OpenLZW
  :: FT_Stream -- ^ stream
  -> FT_Stream -- ^ source
  -> IO ()
ft_Stream_OpenLZW =
  autoError "ft_Stream_OpenLZW" ft_Stream_OpenLZW'
