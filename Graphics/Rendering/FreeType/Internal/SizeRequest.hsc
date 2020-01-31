module Graphics.Rendering.FreeType.Internal.SizeRequest
  {-# DEPRECATED "freetype2 bindings were rewritten from scratch. Please switch to Graphics.FreeType.Bindings" #-}
  ( FT_Size_RequestRec (FT_Size_RequestRec)
  , FT_Size_Request
  , module Graphics.Rendering.FreeType.Internal.SizeRequest
  ) where

import           Graphics.FreeType.Bindings.Core.Base (FT_Size_RequestRec (..), FT_Size_Request)

import           Graphics.Rendering.FreeType.Internal.PrimitiveTypes



type_ :: FT_Size_RequestRec -> FT_Size_Request_Type
type_ = fromIntegral . srrType

width :: FT_Size_RequestRec -> FT_Long
width = srrWidth

height :: FT_Size_RequestRec -> FT_Long
height = srrHeight

horiResolution :: FT_Size_RequestRec -> FT_UInt
horiResolution = srrHoriResolution

vertResolution :: FT_Size_RequestRec -> FT_UInt
vertResolution = srrVertResolution

