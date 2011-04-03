{-# LANGUAGE ForeignFunctionInterface #-}
module Graphics.Rendering.FreeType.Internal where

import Foreign
import Foreign.C.String

import Graphics.Rendering.FreeType.Internal.PrimitiveTypes
import Graphics.Rendering.FreeType.Internal.Library
import Graphics.Rendering.FreeType.Internal.Face
import Graphics.Rendering.FreeType.Internal.Matrix
import Graphics.Rendering.FreeType.Internal.Vector

#include "ft2build.h"
#include FT_FREETYPE_H

foreign import ccall "FT_Init_FreeType"
  ft_Init_FreeType :: Ptr FT_Library -> IO FT_Error

foreign import ccall "FT_New_Face"
  ft_New_Face :: FT_Library  -> CString -> FT_Long
              -> Ptr FT_Face -> IO FT_Error

foreign import ccall "FT_Set_Char_Size"
  ft_Set_Char_Size :: FT_Face -> FT_F26Dot6 -> FT_F26Dot6
                   -> FT_UInt -> FT_UInt    -> IO FT_Error

foreign import ccall "FT_Set_Pixel_Sizes"
  ft_Set_Pixel_Sizes :: FT_Face -> FT_UInt -> FT_UInt
                     -> IO FT_Error

foreign import ccall "FT_Get_Char_Index"
  ft_Get_Char_Index :: FT_Face -> FT_ULong -> IO FT_UInt

foreign import ccall "FT_Set_Transform"
  ft_Set_Transform :: FT_Face -> Ptr FT_Matrix
                   -> Ptr FT_Vector -> IO ()

foreign import ccall "FT_Load_Char"
  ft_Load_Char :: FT_Face -> FT_ULong -> FT_Int32 -> IO FT_Error

foreign import ccall "FT_Done_Face"
  ft_Done_Face :: FT_Face -> IO FT_Error

foreign import ccall "FT_Done_FreeType"
  ft_Done_FreeType :: FT_Library -> IO FT_Error



