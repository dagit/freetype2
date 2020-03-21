{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE PatternSynonyms #-}

{- | Sadly I could not figure out how to link this module properly on OS X.
     All of the code in this module is therefore commented out, so if you
     truly need this functionality, you should fork the
     [repo](https://github.com/dagit/freetype2)

     Please refer to the
     [Core API > Mac Specific Interface](https://www.freetype.org/freetype2/docs/reference/ft2-mac_specific.html)
     chapter of the reference.

     Internal: "FreeType.Core.Mac.Internal"
 -}

module FreeType.Core.Mac where
{-
#ifdef darwin_HOST_OS
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
#endif
-}
