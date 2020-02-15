module Graphics.Rendering.FreeType.Internal.Generic
  {-# DEPRECATED "freetype2 bindings were rewritten from scratch. Please switch to FreeType.Raw" #-}
  ( FT_Generic (FT_Generic)
  , FT_Generic_Finalizer
  , module Graphics.Rendering.FreeType.Internal.Generic
  ) where

import           FreeType.Raw.Core.Types

import           Foreign.Ptr



data_ :: FT_Generic -> Ptr ()
data_ = gData

finalizer :: FT_Generic -> FT_Generic_Finalizer
finalizer = gFinalizer
