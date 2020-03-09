module FreeType.Exception.Types where

import           Control.Exception
import           Data.Data (Typeable)
#if __GLASGOW_HASKELL__ < 804
import           Data.Monoid
#endif

import           Data.Int

#include "ft2build.h"
#include FT_FREETYPE_H

type FT_Error = #type FT_Error

-- | This is thrown whenever a function returns 'FT_Error'.
data FtError = FtError
                 { feFunction :: [Char]
                 , feCode     :: FT_Error
                 }
               deriving Typeable
               
instance Show FtError where
  show (FtError name code) =
    "FreeType function " <> show name <> " returned error code " <> show code
    
instance Exception FtError
