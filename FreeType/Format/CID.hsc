{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE TemplateHaskell #-}

{- | Please refer to the
     [Format-Specific API > CID Fonts](https://www.freetype.org/freetype2/docs/reference/ft2-cid_fonts.html)
     chapter of the reference.

     Internal: "FreeType.Format.CID.Internal".
 -}

module FreeType.Format.CID
  ( -- ** FT_Get_CID_Registry_Ordering_Supplement
    ft_Get_CID_Registry_Ordering_Supplement
    -- ** FT_Get_CID_Is_Internally_CID_Keyed
  , ft_Get_CID_Is_Internally_CID_Keyed
    -- ** FT_Get_CID_From_Glyph_Index
  , ft_Get_CID_From_Glyph_Index
  ) where

import           FreeType.Core.Base
import           FreeType.Core.Types.Types
import           FreeType.Exception.Internal
import           FreeType.Format.CID.Internal

import           Foreign.C.String
import           Foreign.Marshal.Alloc
import           Foreign.Ptr
import           Foreign.Storable

#include "ft2build.h"
#include FT_CID_H

ft_Get_CID_Registry_Ordering_Supplement
  :: FT_Face                     -- ^ face
  -> IO (String, String, FT_Int) -- ^ (registry, ordering, supplement)
ft_Get_CID_Registry_Ordering_Supplement face =
  alloca $ \registryPtr ->
    alloca $ \orderingPtr ->
      alloca $ \supplementPtr -> do
        ftError 'ft_Get_CID_Registry_Ordering_Supplement $
          ft_Get_CID_Registry_Ordering_Supplement' face registryPtr orderingPtr supplementPtr
        (,,)
          <$> (peekCString . castPtr =<< peek registryPtr)
          <*> (peekCString . castPtr =<< peek orderingPtr)
          <*> peek supplementPtr



ft_Get_CID_Is_Internally_CID_Keyed
  :: FT_Face -- ^ face
  -> IO Bool -- ^ is_cid
ft_Get_CID_Is_Internally_CID_Keyed face =
  alloca $ \isCidPtr -> do
    ftError 'ft_Get_CID_Is_Internally_CID_Keyed
      $ ft_Get_CID_Is_Internally_CID_Keyed' face isCidPtr
    isCid <- peek isCidPtr
    return $ if isCid == 1
               then True
               else False



ft_Get_CID_From_Glyph_Index
  :: FT_Face    -- ^ face
  -> FT_UInt    -- ^ glyph_index
  -> IO FT_UInt -- ^ cid
ft_Get_CID_From_Glyph_Index =
  autoAllocaError 'ft_Get_CID_From_Glyph_Index ft_Get_CID_From_Glyph_Index'
