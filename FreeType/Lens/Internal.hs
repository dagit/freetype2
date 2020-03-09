{-# LANGUAGE CPP #-}

module FreeType.Lens.Internal
  ( makeFieldsFT
  , makeFieldsFT'
  ) where

import           Data.Char
#if __GLASGOW_HASKELL__ < 804
import           Data.Monoid
#endif
import           Lens.Micro
import           Lens.Micro.TH
import           Language.Haskell.TH



-- | Analogous to 'makeFields', but removes the prefix and aggressively checks for
--   whether the field prefix matches the name of the datatype.
--
--   E.g. in @FTC_SBitRec@ every field __has__ to be prefixed with @sbr@.
--
--   Note: datatypes with an asterisk at the end require an additional @t@ in the prefix, so
--         if there existed @FTC_SBitRec'@, the prefix would be @sbrt@.
makeFieldsFT :: Name -> DecsQ
makeFieldsFT = flip makeFieldsFT' id

-- | Same as 'makeFieldsFT' with an additional function passed that overrides lens names.
--  
--   Used like this:
--
-- @
--   makeFieldsFT' ''FT_Some_Datatype
--     $ \val -> case val of
--                 "data" -> "data_"
--                 _      -> val
-- @
makeFieldsFT' :: Name -> (String -> String) -> DecsQ
makeFieldsFT' name f =
  flip makeLensesWith name
    $ camelCaseFields
        & (lensField .~ (\dt _ this -> synthesize f (nameBase dt) (nameBase this)))




synthesize :: (String -> String) -> String -> String -> [DefName]
synthesize modify dt this =
  let prefixSize = length $ strip dt
      reference = "(" <> dt <> ", " <> this <> ")"
  in if take prefixSize this /= strip dt
       then error $ "Prefix does not match function name " <> reference
       else if isLower . head $ drop prefixSize this
              then error $ "Field prefix is larger than the datatype name " <> reference
              else let name = modify . first toLower $ drop prefixSize this
                   in if null name
                         then error $ "Nothing left after stripping prefix " <> reference
                         else [MethodName (mkName $ "Has" <> first toUpper name) (mkName name)]



strip :: String -> String
strip str =
  let caps = filter (\a -> isUpper a || a == '\'') . drop 1 $ dropWhile (/= '_') str
  in if last caps == '\''
       then init (fmap toLower caps) <> "t"
       else fmap toLower caps



first :: (a -> a) -> [a] -> [a]
first _ []     = []
first f (a:as) = f a : as
