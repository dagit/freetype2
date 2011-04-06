{-# LANGUAGE EmptyDataDecls #-}
module Graphics.Rendering.FreeType.Internal.Driver
( FT_DriverRec_
, FT_Driver
) where

import Foreign

data FT_DriverRec_
type FT_Driver = Ptr FT_DriverRec_
