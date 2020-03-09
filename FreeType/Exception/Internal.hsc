{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}

module FreeType.Exception.Internal where

import           FreeType.Exception.Types

import           Control.Monad (unless)
import           Control.Exception
import           Foreign.Ptr
import           Foreign.Marshal.Alloc
import           Foreign.Storable
import           Language.Haskell.TH (Name, nameBase)

#include "ft2build.h"
#include FT_FREETYPE_H

-- | An internal function for throwing 'FtError's
ftError :: Name -> IO FT_Error -> IO ()
ftError name action = do
  code <- action
  unless (code == 0)
    . throwIO $ FtError (nameBase name) code



class AutoError a b where
  -- | @
  --     autoError name f = \a b c ... ->
  --       ftError name $ f a b c ...
  --   @
  autoError :: Name -> a -> b

instance AutoError (a -> IO FT_Error)
                   (a -> IO ()) where
  autoError name f = ftError name . f

instance AutoError (a -> b -> IO FT_Error)
                   (a -> b -> IO ()) where
  autoError name f = \a -> ftError name . f a

instance AutoError (a -> b -> c -> IO FT_Error)
                   (a -> b -> c -> IO ()) where
  autoError name f = \a b -> ftError name . f a b

instance AutoError (a -> b -> c -> d -> IO FT_Error)
                   (a -> b -> c -> d -> IO ()) where
  autoError name f = \a b c -> ftError name . f a b c

instance AutoError (a -> b -> c -> d -> e -> IO FT_Error)
                   (a -> b -> c -> d -> e -> IO ()) where
  autoError name f = \a b c d -> ftError name . f a b c d

instance AutoError (a -> b -> c -> d -> e -> f -> IO FT_Error)
                   (a -> b -> c -> d -> e -> f -> IO ()) where
  autoError name f = \a b c d e -> ftError name . f a b c d e

instance AutoError (a -> b -> c -> d -> e -> f -> g -> IO FT_Error)
                   (a -> b -> c -> d -> e -> f -> g -> IO ()) where
  autoError name f = \a b c d e f' -> ftError name . f a b c d e f'



class AutoAllocaError a b where
  -- | @
  --     autoAllocaError name f = \a b c -> 
  --       alloca $ \ptr -> do
  --         ftError name $ f a b c ... ptr
  --         peek ptr
  --   @
  autoAllocaError :: Name -> a -> b

instance Storable a
      => AutoAllocaError (Ptr a -> IO FT_Error)
                         (IO a) where
  autoAllocaError name f =
    alloca $ \ptr -> do
      ftError name $ f ptr
      peek ptr

instance Storable b
      => AutoAllocaError (a -> Ptr b -> IO FT_Error)
                         (a -> IO b) where
  autoAllocaError name f = \a ->
    alloca $ \ptr -> do
      ftError name $ f a ptr
      peek ptr

instance Storable c
      => AutoAllocaError (a -> b -> Ptr c -> IO FT_Error)
                         (a -> b -> IO c) where
  autoAllocaError name f = \a b ->
    alloca $ \ptr -> do
      ftError name $ f a b ptr
      peek ptr

instance Storable d
      => AutoAllocaError (a -> b -> c -> Ptr d -> IO FT_Error)
                         (a -> b -> c -> IO d) where
  autoAllocaError name f = \a b c ->
    alloca $ \ptr -> do
      ftError name $ f a b c ptr
      peek ptr

instance Storable e
      => AutoAllocaError (a -> b -> c -> d -> Ptr e -> IO FT_Error)
                         (a -> b -> c -> d -> IO e) where
  autoAllocaError name f = \a b c d ->
    alloca $ \ptr -> do
      ftError name $ f a b c d ptr
      peek ptr

instance Storable f
      => AutoAllocaError (a -> b -> c -> d -> e -> Ptr f -> IO FT_Error)
                         (a -> b -> c -> d -> e -> IO f) where
  autoAllocaError name f = \a b c d e ->
    alloca $ \ptr -> do
      ftError name $ f a b c d e ptr
      peek ptr

instance Storable g
      => AutoAllocaError (a -> b -> c -> d -> e -> f -> Ptr g -> IO FT_Error)
                         (a -> b -> c -> d -> e -> f -> IO g) where
  autoAllocaError name f = \a b c d e f' ->
    alloca $ \ptr -> do
      ftError name $ f a b c d e f' ptr
      peek ptr
