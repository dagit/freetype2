module FreeType.Error.Enumerations
  ( -- ** FT_Error_String
    ft_Error_String
  ) where

import           FreeType.Core.Types.Types
import           FreeType.Error.Enumerations.Internal

import           Foreign.C.String
import           Foreign.Ptr
import           System.IO.Unsafe



-- | Always returns @Nothing@.
--
--   If you need this function working, you can fork the repository and uncomment
--   @#define FT_CONFIG_OPTION_ERROR_STRINGS@ in
--   @/freetype2/include/freetype/config/ftoption.h@
ft_Error_String
  :: FT_Error     -- ^ error_code
  -> Maybe String
ft_Error_String err =
  unsafePerformIO $ do
    ptr <- ft_Error_String' err
    if ptr == nullPtr
      then return Nothing
      else Just <$> peekCString (castPtr ptr)
