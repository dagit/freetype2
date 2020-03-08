{-# LANGUAGE TemplateHaskell #-}

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
  autoError 'ft_Stream_OpenLZW ft_Stream_OpenLZW'
