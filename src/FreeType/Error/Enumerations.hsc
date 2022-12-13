{-# LANGUAGE CApiFFI
           , CPP
           , ForeignFunctionInterface #-}

{- | Please refer to the
     [Error Codes > Error Enumerations](https://www.freetype.org/freetype2/docs/reference/ft2-error_enumerations.html)
     chapter of the reference.
 -}

module FreeType.Error.Enumerations
  ( -- ** FT_Error_String
    ft_Error_String
  ) where

import           FreeType.Core.Types.Types

#ifdef aarch64_HOST_ARCH
import           Data.Word
#else
import           Data.Int
#endif
import           Foreign.Ptr

#include "ft2build.h"
#include FT_FREETYPE_H

-- | Default build does not set @FT_CONFIG_OPTION_ERROR_STRINGS@,
--   so this always returns @NULL@.
foreign import CALLCV "freetype/freetype.h FT_Error_String"
  ft_Error_String
    :: FT_Error              -- ^ error_code
    -> IO (Ptr #{type char})
