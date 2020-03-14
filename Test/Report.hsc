{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE FunctionalDependencies #-}

module Test.Report where

import           Language.Haskell.TH

#if __GLASGOW_HASKELL__ < 804
import           Data.Monoid
#endif
import           Data.Int
import           Data.Proxy
import           Data.Word
import           Foreign.C.Types
import           Foreign.Ptr



report' :: Name -> IO a -> IO a
report' name action = do
  result <- action
  putStrLn $ "✓ " <> nameBase name
  return result



class Def a where
  def :: a

instance Def Word8 where
  def = 0

instance Def Word16 where
  def = 0

instance Def Word32 where
  def = 0

instance Def Word64 where
  def = 0

instance Def Int8 where
  def = 0

instance Def Int16 where
  def = 0

instance Def Int32 where
  def = 0

instance Def Int64 where
  def = 0

instance Def (Ptr a) where
  def = nullPtr

instance Def (FunPtr a) where
  def = nullFunPtr



class Report a z | a -> z where
  report :: Name -> a -> IO z

instance Report (IO z) z where
  report = report'

instance Def a => Report (a -> IO z) z where
  report name f = report' name $ f def

instance (Def a, Def b) => Report (a -> b -> IO z) z where
  report name f = report' name $ f def def

instance (Def a, Def b, Def c) => Report (a -> b -> c -> IO z) z where
  report name f = report' name $ f def def def

instance (Def a, Def b, Def c, Def d)
      => Report (a -> b -> c -> d -> IO z) z where
  report name f = report' name $ f def def def def

instance (Def a, Def b, Def c, Def d, Def e)
      => Report (a -> b -> c -> d -> e -> IO z) z where
  report name f = report' name $ f def def def def def

instance (Def a, Def b, Def c, Def d, Def e, Def f)
      => Report (a -> b -> c -> d -> e -> f -> IO z) z where
  report name f = report' name $ f def def def def def def

instance (Def a, Def b, Def c, Def d, Def e, Def f, Def g)
      => Report (a -> b -> c -> d -> e -> f -> g -> IO z) z where
  report name f = report' name $ f def def def def def def def



report0 :: Name -> z -> IO z
report0 name = report' name . return

report1 :: Def a => Name -> (a -> z) -> IO z
report1 name f = report' name . return $ f def

report2 :: (Def a, Def b) => Name -> (a -> b -> z) -> IO z
report2 name f = report' name . return $ f def def

report3 :: (Def a, Def b, Def c) => Name -> (a -> b -> c -> z) -> IO z
report3 name f = report' name . return $ f def def def

report4 :: (Def a, Def b, Def c, Def d)
        => Name -> (a -> b -> c -> d -> z) -> IO z
report4 name f = report' name . return $ f def def def def

report5 :: (Def a, Def b, Def c, Def d, Def e)
        => Name -> (a -> b -> c -> d -> e -> z) -> IO z
report5 name f = report' name . return $ f def def def def def
