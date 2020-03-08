{-# LANGUAGE TemplateHaskell #-}

module FreeType.Support.GZIP
  ( -- ** FT_Stream_OpenGzip
    ft_Stream_OpenGzip
    -- ** FT_Gzip_Uncompress
  , ft_Gzip_Uncompress
  ) where

import           FreeType.Core.Types.Types
import           FreeType.Exception.Internal
import           FreeType.Support.GZIP.Internal
import           FreeType.Support.System.Types

import           Foreign.Marshal.Utils
import           Foreign.Ptr
import           Foreign.Storable

ft_Stream_OpenGzip
  :: FT_Stream -- ^ stream
  -> FT_Stream -- ^ source
  -> IO ()
ft_Stream_OpenGzip =
  autoError 'ft_Stream_OpenGzip ft_Stream_OpenGzip'



ft_Gzip_Uncompress
  :: FT_Memory   -- ^ memory
  -> Ptr FT_Byte -- ^ output
  -> FT_ULong    -- ^ output_len
  -> Ptr FT_Byte -- ^ input
  -> FT_ULong    -- ^ input_len
  -> IO FT_ULong
ft_Gzip_Uncompress memory output outputLen input inputLen =
  with outputLen $ \outputLenPtr -> do
    ftError 'ft_Gzip_Uncompress
      $ ft_Gzip_Uncompress' memory output outputLenPtr input inputLen
    peek outputLenPtr
