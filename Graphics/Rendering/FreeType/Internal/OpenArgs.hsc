module Graphics.Rendering.FreeType.Internal.OpenArgs
  {-# DEPRECATED "freetype2 bindings were rewritten from scratch. Please switch to Graphics.FreeType.Bindings" #-}
  ( FT_Open_Args (FT_Open_Args)
  , module Graphics.Rendering.FreeType.Internal.OpenArgs
  ) where

import           Graphics.FreeType.Bindings.Core.Base (FT_Open_Args (..))

import           Graphics.Rendering.FreeType.Internal.PrimitiveTypes
import           Graphics.Rendering.FreeType.Internal.Stream
import           Graphics.Rendering.FreeType.Internal.Module
import           Graphics.Rendering.FreeType.Internal.Parameter

import           Foreign.C.String
import           Foreign.Ptr



flags :: FT_Open_Args -> FT_UInt
flags = oaFlags

memory_base :: FT_Open_Args -> FT_Bytes
memory_base = oaMemory_base

memory_size :: FT_Open_Args -> FT_Long
memory_size = oaMemory_size

pathname :: FT_Open_Args -> CString
pathname = oaPathname

stream :: FT_Open_Args -> FT_Stream
stream = oaStream

driver :: FT_Open_Args -> FT_Module
driver = oaDriver

num_params :: FT_Open_Args -> FT_Int
num_params = oaNum_params

params :: FT_Open_Args -> Ptr FT_Parameter
params = oaParams

