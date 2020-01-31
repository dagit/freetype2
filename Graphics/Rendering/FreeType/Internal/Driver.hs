module Graphics.Rendering.FreeType.Internal.Driver
  {-# DEPRECATED "freetype2 bindings were rewritten from scratch. Please switch to Graphics.FreeType.Bindings" #-}
  ( FT_DriverRec_
  , FT_Driver
  ) where

import           Graphics.FreeType.Bindings.Support.Module (FT_DriverRec, FT_Driver)



type FT_DriverRec_ = FT_DriverRec
