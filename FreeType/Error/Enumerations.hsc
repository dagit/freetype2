module FreeType.Error.Enumerations
  ( -- ** FT_Error_String
    ft_Error_String
  ) where

import           FreeType.Core.Types.Types
import           FreeType.Error.Enumerations.Internal

import           Foreign.C.String
import           Foreign.Ptr
import           System.IO.Unsafe



ft_Error_String :: FT_Error -> Maybe String
ft_Error_String err =
  unsafePerformIO $ do
    ptr <- ft_Error_String' err
    if ptr == nullPtr
      then return Nothing
      else Just <$> peekCString (castPtr ptr)
