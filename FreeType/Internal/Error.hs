{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE TemplateHaskell #-}
{-# OPTIONS_HADDOCK not-home #-}

module FreeType.Internal.Error where

import           FreeType.Core.Types
import           FreeType.Error.Enumerations

import           Control.Monad (unless)
import           Control.Exception
import           Data.Data (Typeable)
import           Foreign.C.String
import           Foreign.Ptr (nullPtr)
import           Language.Haskell.TH (Name, nameBase)
import           Lens.Micro.TH (makeFields)
import           System.IO.Unsafe



-- | An error code with the name of the function that returned the error
data FtError = FtFunctionError   [Char] FT_Error
             | FtConversionError [Char] [Char]
               deriving Typeable
makeFields ''FtError

instance Show FtError where
  show (FtFunctionError name code) =
    "FreeType function " <> show name <> " returned error code " <> show code
      <> " (" <> errorString code <> ")"

  show (FtConversionError name value) =
    "Converting " <> show name <> " returned an unexpected value of " <> show value

instance Exception FtError




-- | Retrieve the message string for an error code.
--
--   If the message for the error type does not exist or the library has not
--   been compiled with FT_CONFIG_OPTION_ERROR_STRINGS, this will return an empty string
errorString :: FT_Error -> String
errorString code =
  let messagePtr = ft_Error_String code
  in if messagePtr == nullPtr
       then ""
       else unsafePerformIO $ peekCString messagePtr



-- | An internal function for throwing 'FtError's
ftFuncError :: Name -> IO FT_Error -> IO ()
ftFuncError name action = do
  code <- action
  unless (code == 0)
    . throwIO $ FtFunctionError (nameBase name) (fromIntegral code)

ftConvError :: (Show a, Integral a) => Name -> a -> IO b
ftConvError name value =
  throwIO $ FtConversionError (nameBase name) (show value)
