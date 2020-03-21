module Fields.Lens where

import           Data.Char
#if __GLASGOW_HASKELL__ < 804
import           Data.Monoid
#endif
import           Language.Haskell.TH



testFieldsFT :: Name -> ExpQ
testFieldsFT dt = do
  dec <- reify dt
  case dec of
    TyConI (DataD _ dtName _ _ cons _) ->
      stringE . mappend (nameBase dt <> "\n") . mconcat . flip fmap cons $ \con ->
        case con of
          RecC _ vars ->
            mconcat . flip fmap vars $ \(varName, _, _) ->
              "✓ " <> synthesize id (nameBase dt) (nameBase varName) <> "\n"
          _ -> error $ "Not all constructors of " <> nameBase dt <> " have record fields"
    _ -> error $ nameBase dt <> " is not a plain type constructor"



synthesize :: (String -> String) -> String -> String -> String
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
                         else name



strip :: String -> String
strip str =
  let caps = filter (\a -> isUpper a || a == '\'') . drop 1 $ dropWhile (/= '_') str
  in if last caps == '\''
       then init (fmap toLower caps) <> "t"
       else fmap toLower caps



first :: (a -> a) -> [a] -> [a]
first _ []     = []
first f (a:as) = f a : as
