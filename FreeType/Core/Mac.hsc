{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE PatternSynonyms #-}

{- | This module is only here for the sake of completeness, I don't know whether
     there exists a Haskell library that provides these Mac primitives ¯\_(ツ)_/¯

     If you're not on Macintosh every internal function is a dud that returns 'FT_Error_Unimplemented_Feature'.

     Please refer to the
     [Core API > Mac Specific Interface](https://www.freetype.org/freetype2/docs/reference/ft2-mac_specific.html)
     chapter of the reference.
 -}

module FreeType.Core.Mac
  ( -- ** FT_New_Face_From_FOND
    ft_New_Face_From_FOND
    -- ** FT_GetFile_From_Mac_Name
  , ft_GetFile_From_Mac_Name
    -- ** FT_GetFile_From_Mac_ATS_Name
  , ft_GetFile_From_Mac_ATS_Name
    -- ** FT_GetFilePath_From_Mac_ATS_Name
  , ft_GetFilePath_From_Mac_ATS_Name
    -- ** FT_New_Face_From_FSSpec
  , ft_New_Face_From_FSSpec
    -- ** FT_New_Face_From_FSRef
  , ft_New_Face_From_FSRef
    -- ** ???
  , Handle
  , FSSpec
  , FSRef
  ) where

import           FreeType.Core.Base.Types
import           FreeType.Core.Mac.Internal
import           FreeType.Core.Mac.Types
import           FreeType.Core.Types.Types
import           FreeType.Exception.Internal
import           FreeType.Error.Values (pattern FT_Err_Unimplemented_Feature)

import           Data.Word
import           Foreign.C.String
import           Foreign.Ptr





ft_New_Face_From_FOND
  :: FT_Library -- ^ library
  -> Handle     -- ^ fond
  -> FT_Long    -- ^ face_index
  -> IO FT_Face -- ^ face
ft_New_Face_From_FOND =
  autoAllocaError 'ft_New_Face_From_FOND ft_New_Face_From_FOND'



ft_GetFile_From_Mac_Name
  :: String      -- ^ fontName
  -> Ptr FSSpec   -- ^ pathSpec
  -> Ptr FT_Long -- ^ face_index
  -> IO ()
ft_GetFile_From_Mac_Name name pathPtr indexPtr =
  withCString name $ \namePtr ->
    ftError 'ft_GetFile_From_Mac_Name $ ft_GetFile_From_Mac_Name' namePtr pathPtr indexPtr



ft_GetFile_From_Mac_ATS_Name
  :: String      -- ^ fontName
  -> Ptr FSSpec  -- ^ pathSpec
  -> Ptr FT_Long -- ^ face_index
  -> IO ()
ft_GetFile_From_Mac_ATS_Name name pathPtr indexPtr =
  withCString name $ \namePtr ->
    ftError 'ft_GetFile_From_Mac_ATS_Name $ ft_GetFile_From_Mac_ATS_Name' namePtr pathPtr indexPtr



ft_GetFilePath_From_Mac_ATS_Name
  :: String      -- ^ fontName
  -> Ptr Word8   -- ^ path
  -> Word32      -- ^ maxPathSize
  -> Ptr FT_Long -- ^ face_index
  -> IO ()
ft_GetFilePath_From_Mac_ATS_Name name path size index =
  withCString name $ \namePtr ->
    ftError 'ft_GetFilePath_From_Mac_ATS_Name $ ft_GetFilePath_From_Mac_ATS_Name' namePtr path size index



ft_New_Face_From_FSSpec
  :: FT_Library -- ^ library
  -> Ptr FSSpec -- ^ spec
  -> FT_Long    -- ^ face_index
  -> IO FT_Face -- ^ face
ft_New_Face_From_FSSpec =
  autoAllocaError 'ft_New_Face_From_FSSpec ft_New_Face_From_FSSpec'



ft_New_Face_From_FSRef
  :: FT_Library -- ^ library
  -> Ptr FSRef  -- ^ ref
  -> FT_Long    -- ^ face_index
  -> IO FT_Face -- ^ face
ft_New_Face_From_FSRef =
  autoAllocaError 'ft_New_Face_From_FSRef ft_New_Face_From_FSRef'
