{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE UndecidableInstances #-}

module Dynamic.Report where

#if __GLASGOW_HASKELL__ < 804
import           Data.Monoid
#endif
import           Data.Int
import           Data.Proxy
import           Data.Word
import           Foreign.C.Types
import           Foreign.Ptr



report' :: String -> IO a -> IO a
report' name action = do
  result <- action
  putStrLn $ "✓ " <> name
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
  report :: String -> a -> IO z

instance Report (IO z) z where
  report = report'

instance Def a => Report (a -> IO z) z where
  report name f = report' name $ f def

instance (Def a, Report (b -> c) z) => Report (a -> b -> c) z where
  report name f = report name $ f def



report0 :: String -> z -> IO z
report0 name = report' name . return

report1 :: Def a => String -> (a -> z) -> IO z
report1 name f = report' name . return $ f def

report2 :: (Def a, Def b) => String -> (a -> b -> z) -> IO z
report2 name f = report' name . return $ f def def

report3 :: (Def a, Def b, Def c) => String -> (a -> b -> c -> z) -> IO z
report3 name f = report' name . return $ f def def def

report4 :: (Def a, Def b, Def c, Def d)
        => String -> (a -> b -> c -> d -> z) -> IO z
report4 name f = report' name . return $ f def def def def

report5 :: (Def a, Def b, Def c, Def d, Def e)
        => String -> (a -> b -> c -> d -> e -> z) -> IO z
report5 name f = report' name . return $ f def def def def def
