{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE TemplateHaskell #-}

{- | Please refer to the
     [Miscellaneous > TrueTypeGX/AAT Validation](https://www.freetype.org/freetype2/docs/reference/ft2-gx_validation.html)
     chapter of the reference.

     Internal: "FreeType.Miscellaneous.TrueTypeGX.Internal".
 -}

module FreeType.Miscellaneous.TrueTypeGX
  ( -- ** FT_TrueTypeGX_Validate
    ft_TrueTypeGX_Validate
    -- ** FT_TrueTypeGX_Free
  , ft_TrueTypeGX_Free
    -- ** FT_ClassicKern_Validate
  , ft_ClassicKern_Validate
    -- ** FT_ClassicKern_Free
  , ft_ClassicKern_Free
    -- ** FT_VALIDATE_GX_LENGTH
  , pattern FT_VALIDATE_GX_LENGTH
    -- ** FT_VALIDATE_GXXXX
  , pattern FT_VALIDATE_feat
  , pattern FT_VALIDATE_mort
  , pattern FT_VALIDATE_morx
  , pattern FT_VALIDATE_bsln
  , pattern FT_VALIDATE_just
  , pattern FT_VALIDATE_kern
  , pattern FT_VALIDATE_opbd
  , pattern FT_VALIDATE_trak
  , pattern FT_VALIDATE_prop
  , pattern FT_VALIDATE_lcar
  , pattern FT_VALIDATE_GX
    -- ** FT_VALIDATE_CKERNXXX
  , pattern FT_VALIDATE_MS
  , pattern FT_VALIDATE_APPLE
  , pattern FT_VALIDATE_CKERN
  ) where

import           FreeType.Core.Base.Types
import           FreeType.Core.Types.Types
import           FreeType.Exception.Internal
import           FreeType.Miscellaneous.TrueTypeGX.Internal

import           Foreign.Ptr

#include "ft2build.h"
#include FT_GX_VALIDATE_H

ft_TrueTypeGX_Validate
  :: FT_Face      -- ^ face
  -> FT_UInt      -- ^ validation_flags
  -> Ptr FT_Bytes -- ^ tables
  -> FT_UInt      -- ^ table_length
  -> IO ()
ft_TrueTypeGX_Validate =
  autoError 'ft_TrueTypeGX_Validate ft_TrueTypeGX_Validate'



foreign import ccall "FT_TrueTypeGX_Free"
  ft_TrueTypeGX_Free
    :: FT_Face  -- ^ face
    -> FT_Bytes -- ^ table
    -> IO ()



ft_ClassicKern_Validate
  :: FT_Face      -- ^ face
  -> FT_UInt      -- ^ validation_flags
  -> Ptr FT_Bytes -- ^ ckern_table
  -> IO ()
ft_ClassicKern_Validate =
  autoError 'ft_ClassicKern_Validate ft_ClassicKern_Validate'



foreign import ccall "FT_ClassicKern_Free"
  ft_ClassicKern_Free
    :: FT_Face  -- ^ face
    -> FT_Bytes -- ^ table
    -> IO ()



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



pattern FT_VALIDATE_MS
      , FT_VALIDATE_APPLE
      , FT_VALIDATE_CKERN
     :: FT_UInt
pattern FT_VALIDATE_MS    = #const FT_VALIDATE_MS
pattern FT_VALIDATE_APPLE = #const FT_VALIDATE_APPLE
pattern FT_VALIDATE_CKERN = #const FT_VALIDATE_CKERN
