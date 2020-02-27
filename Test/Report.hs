{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE UndecidableInstances #-}

module Test.Report where

import           Language.Haskell.TH

import           Data.Int (Int32)
import           Data.Proxy
import           Data.Word (Word32)
import           Foreign.C.Types
import           Foreign.Ptr



report' :: Name -> IO a -> IO a
report' name action = do
  result <- action
  putStrLn $ "✓ " <> nameBase name
  return result



class Def a where
  def :: a

instance Def CUChar where
  def = 0

instance Def CChar where
  def = 0

instance Def CInt where
  def = 0

instance Def CUInt where
  def = 0

instance Def CShort where
  def = 0

instance Def CUShort where
  def = 0

instance Def Int32 where
  def = 0

instance Def Word32 where
  def = 0

instance Def CLong where
  def = 0

instance Def CULong where
  def = 0

instance Def CSize where
  def = 0

instance Def CPtrdiff where
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
