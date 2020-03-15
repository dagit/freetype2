{-# LANGUAGE FlexibleContexts #-}
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

instance AutoError (b -> c) (b -> d) => AutoError (a -> b -> c)
                                                  (a -> b -> d) where
  autoError name f = autoError name . f



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

instance AutoAllocaError (b -> c) (b -> d)
      => AutoAllocaError (a -> b -> c)
                         (a -> b -> d) where
  autoAllocaError name f = autoAllocaError name . f

