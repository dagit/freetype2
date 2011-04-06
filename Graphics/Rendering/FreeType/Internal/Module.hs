{-# LANGUAGE EmptyDataDecls #-}
module Graphics.Rendering.FreeType.Internal.Module
( FT_ModuleRec_
, FT_Module
) where

import Foreign

data FT_ModuleRec_
type FT_Module = Ptr FT_ModuleRec_

