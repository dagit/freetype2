{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}

module FreeType.Miscellaneous.TrueTypeGX where

import           FreeType.Core.Base
import           FreeType.Core.Types

import           Foreign.C.Types
import           Foreign.Ptr

#include "ft2build.h"
#include FT_FREETYPE_H

#include "freetype/ftgxval.h"

foreign import ccall "FT_TrueTypeGX_Validate"
  ft_TrueTypeGX_Validate :: FT_Face -> FT_UInt -> Ptr FT_Bytes -> FT_UInt -> IO FT_Error



foreign import ccall "FT_TrueTypeGX_Free"
  ft_TrueTypeGX_Free :: FT_Face -> FT_Bytes -> IO ()



foreign import ccall "FT_ClassicKern_Validate"
  ft_ClassicKern_Validate :: FT_Face -> FT_UInt -> Ptr FT_Bytes -> IO FT_Error



foreign import ccall "FT_ClassicKern_Free"
  ft_ClassicKern_Free :: FT_Face -> FT_Bytes -> IO ()



pattern FT_VALIDATE_GX_LENGTH
     :: FT_UInt
pattern FT_VALIDATE_GX_LENGTH = #const FT_VALIDATE_GX_LENGTH



pattern FT_VALIDATE_feat
      , FT_VALIDATE_mort
      , FT_VALIDATE_morx
      , FT_VALIDATE_bsln
      , FT_VALIDATE_just
      , FT_VALIDATE_kern
      , FT_VALIDATE_opbd
      , FT_VALIDATE_trak
      , FT_VALIDATE_prop
      , FT_VALIDATE_lcar
      , FT_VALIDATE_GX
     :: FT_UInt
pattern FT_VALIDATE_feat = #const FT_VALIDATE_feat
pattern FT_VALIDATE_mort = #const FT_VALIDATE_mort
pattern FT_VALIDATE_morx = #const FT_VALIDATE_morx
pattern FT_VALIDATE_bsln = #const FT_VALIDATE_bsln
pattern FT_VALIDATE_just = #const FT_VALIDATE_just
pattern FT_VALIDATE_kern = #const FT_VALIDATE_kern
pattern FT_VALIDATE_opbd = #const FT_VALIDATE_opbd
pattern FT_VALIDATE_trak = #const FT_VALIDATE_trak
pattern FT_VALIDATE_prop = #const FT_VALIDATE_prop
pattern FT_VALIDATE_lcar = #const FT_VALIDATE_lcar
pattern FT_VALIDATE_GX   = #const FT_VALIDATE_GX



pattern VALIDATE_MS
      , VALIDATE_APPLE
      , VALIDATE_CKERN
     :: FT_UInt
pattern VALIDATE_MS    = #const FT_VALIDATE_MS
pattern VALIDATE_APPLE = #const FT_VALIDATE_APPLE
pattern VALIDATE_CKERN = #const FT_VALIDATE_CKERN
