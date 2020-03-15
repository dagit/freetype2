{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}

{- | Please refer to the
     [Format-Specific API > BDF and PCF Files](https://www.freetype.org/freetype2/docs/reference/ft2-bdf_fonts.html)
     chapter of the reference.

     Internal: "FreeType.Format.BDF.Internal".
 -}

module FreeType.Format.BDF
  ( -- ** BDF_PropertyType
    BDF_PropertyType
  , pattern BDF_PROPERTY_TYPE_NONE
  , pattern BDF_PROPERTY_TYPE_ATOM
  , pattern BDF_PROPERTY_TYPE_INTEGER
  , pattern BDF_PROPERTY_TYPE_CARDINAL
    -- ** BDF_Property
  , BDF_Property
    -- ** BDF_PropertyRec
  , BDF_PropertyRec (..)
    -- ** FT_Get_BDF_Charset_ID
  , ft_Get_BDF_Charset_ID
    -- ** FT_Get_BDF_Property
  , ft_Get_BDF_Property
  ) where

import           FreeType.Core.Base.Types
import           FreeType.Exception.Internal
import           FreeType.Format.BDF.Internal
import           FreeType.Format.BDF.Types

import           Foreign.C.String
import           Foreign.Marshal.Alloc
import           Foreign.Ptr
import           Foreign.Storable

#include "ft2build.h"
#include FT_BDF_H

ft_Get_BDF_Charset_ID
  :: FT_Face             -- ^ face
  -> IO (String, String) -- ^ (charset_encoding, charset_registry)
ft_Get_BDF_Charset_ID face =
  alloca $ \encodingPtr ->
    alloca $ \registryPtr -> do
      ftError "ft_Get_BDF_Charset_ID"
        $ ft_Get_BDF_Charset_ID' face encodingPtr registryPtr
      (,)
        <$> (peekCString . castPtr =<< peek encodingPtr)
        <*> (peekCString . castPtr =<< peek registryPtr)



ft_Get_BDF_Property
  :: FT_Face            -- ^ face
  -> String             -- ^ prop_name
  -> IO BDF_PropertyRec -- ^ property
ft_Get_BDF_Property face name =
  withCString name $ \namePtr ->
    alloca $ \propPtr -> do
      ftError "ft_Get_BDF_Property"
        $ ft_Get_BDF_Property' face (castPtr namePtr) propPtr
      peek propPtr
