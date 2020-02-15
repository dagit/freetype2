module Graphics.Rendering.FreeType.Internal.Parameter
  {-# DEPRECATED "freetype2 bindings were rewritten from scratch. Please switch to FreeType.Raw" #-}
  ( FT_Parameter (FT_Parameter)
  , module Graphics.Rendering.FreeType.Internal.Parameter
  ) where

import           FreeType.Raw.Core.Base (FT_Parameter (..))

import           Graphics.Rendering.FreeType.Internal.PrimitiveTypes

tag :: FT_Parameter -> FT_ULong
tag = pTag

data_:: FT_Parameter -> FT_Pointer
data_ = pData
