{- | Please refer to the
     [Support API > BZIP2 Streams](https://www.freetype.org/freetype2/docs/reference/ft2-bzip2.html)
     chapter of the reference.

     Internal: "FreeType.Support.BZIP2.Internal".
 -}

module FreeType.Support.BZIP2
  ( -- ** FT_Stream_OpenBzip2
    ft_Stream_OpenBzip2
  ) where

import           FreeType.Exception.Internal
import           FreeType.Support.BZIP2.Internal
import           FreeType.Support.System.Types



ft_Stream_OpenBzip2
  :: FT_Stream -- ^ stream
  -> FT_Stream -- ^ source
  -> IO ()
ft_Stream_OpenBzip2 =
  autoError "ft_Stream_OpenBzip2" ft_Stream_OpenBzip2'
