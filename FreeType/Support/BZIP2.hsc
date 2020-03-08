{-# LANGUAGE TemplateHaskell #-}

module FreeType.Support.BZIP2 where

import           FreeType.Exception.Internal
import           FreeType.Support.BZIP2.Internal
import           FreeType.Support.System.Types



ft_Stream_OpenBzip2
  :: FT_Stream -- ^ stream
  -> FT_Stream -- ^ source
  -> IO ()
ft_Stream_OpenBzip2 =
  autoError 'ft_Stream_OpenBzip2 ft_Stream_OpenBzip2'
