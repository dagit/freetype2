{-# LANGUAGE ForeignFunctionInterface #-}
module Graphics.Rendering.FreeType.Internal where

import Foreign
import Foreign.C.String

import Graphics.Rendering.FreeType.Internal.PrimitiveTypes
import Graphics.Rendering.FreeType.Internal.Library
import Graphics.Rendering.FreeType.Internal.Face
import Graphics.Rendering.FreeType.Internal.Matrix
import Graphics.Rendering.FreeType.Internal.Vector
import Graphics.Rendering.FreeType.Internal.Glyph
import Graphics.Rendering.FreeType.Internal.GlyphSlot
import Graphics.Rendering.FreeType.Internal.OpenArgs
import Graphics.Rendering.FreeType.Internal.SizeRequest
import Graphics.Rendering.FreeType.Internal.CharMap

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

foreign import ccall "FT_Load_Glyph"
  ft_Load_Glyph :: FT_Face -> FT_UInt -> FT_Int32 -> IO FT_Error

foreign import ccall "FT_Get_Glyph"
  ft_Get_Glyph :: FT_GlyphSlot -> Ptr FT_Glyph -> IO FT_Error

foreign import ccall "FT_Done_Glyph"
  ft_Done_Glyph :: FT_Glyph -> IO ()

foreign import ccall "FT_Glyph_To_Bitmap"
  ft_Glyph_To_Bitmap :: Ptr FT_Glyph  -> FT_Render_Mode
                     -> Ptr FT_Vector -> FT_Bool -> IO FT_Error

foreign import ccall "FT_Library_Version"
  ft_Library_Version :: FT_Library -> Ptr FT_Int
                     -> Ptr FT_Int -> Ptr FT_Int -> IO ()

-- | This is just here for completeness,
-- TrueType hinting is no longer patented
foreign import ccall "FT_Face_CheckTrueTypePatents"
  ft_Face_CheckTrueTypePatents :: FT_Face -> IO FT_Bool

-- | This is just here for completeness,
-- TrueType hinting is no longer patented.
foreign import ccall "FT_Face_SetUnpatentedHinting"
  ft_Face_SetUnpatentedHinting :: FT_Face -> FT_Bool -> IO FT_Bool

foreign import ccall "FT_New_Memory_Face"
  ft_New_Memory_Face :: FT_Library -> FT_Bytes -> FT_Long
                     -> FT_Long -> Ptr FT_Face -> IO FT_Error

foreign import ccall "FT_Open_Face"
  ft_Open_Face :: FT_Library -> Ptr FT_Open_Args
               -> FT_Long -> Ptr FT_Face -> IO FT_Error

foreign import ccall "FT_Attach_File"
  ft_Attach_File :: FT_Face -> CString -> IO FT_Error

foreign import ccall "FT_Attach_Stream"
  ft_Attach_Stream :: FT_Face -> Ptr FT_Open_Args -> IO FT_Error

foreign import ccall "FT_Reference_Face"
  ft_Reference_Face :: FT_Face -> IO FT_Error

foreign import ccall "FT_Select_Size"
  ft_Select_Size :: FT_Face -> FT_Int -> IO FT_Error

foreign import ccall "FT_Request_Size"
  ft_Request_Size :: FT_Face -> FT_Size_Request -> IO FT_Error

foreign import ccall "FT_Render_Glyph"
  ft_Render_Glyph :: FT_GlyphSlot -> FT_Render_Mode -> IO FT_Error

foreign import ccall "FT_Get_Kerning"
  ft_Get_Kerning :: FT_Face -> FT_UInt -> FT_UInt -> FT_UInt
                 -> Ptr FT_Vector -> IO FT_Error

foreign import ccall "FT_Get_Track_Kerning"
  ft_Get_Track_Kerning :: FT_Face -> FT_Fixed -> FT_Int
                       -> Ptr FT_Fixed -> IO FT_Error

foreign import ccall "FT_Get_Glyph_Name"
  ft_Get_Glyph_Name :: FT_Face -> FT_UInt -> FT_Pointer
                    -> FT_UInt -> IO FT_Error

foreign import ccall "FT_Get_Postscript_Name"
  ft_Get_Postscript_Name :: FT_Face -> IO CString

foreign import ccall "FT_Select_Charmap"
  ft_Select_Charmap :: FT_Face -> FT_Encoding -> IO FT_Error

foreign import ccall "FT_Set_Charmap"
  ft_Set_Charmap :: FT_Face -> FT_CharMap -> IO FT_Error

foreign import ccall "FT_Get_Charmap_Index"
  ft_Get_Charmap_Index :: FT_CharMap -> IO FT_Int

foreign import ccall "FT_Get_First_Char"
  ft_Get_First_Char :: FT_Face -> Ptr FT_UInt -> IO FT_ULong 

foreign import ccall "FT_Get_Next_Char"
  ft_Get_Next_Char :: FT_Face -> FT_ULong -> Ptr FT_UInt -> IO FT_ULong

foreign import ccall "FT_Get_Name_Index"
  ft_Get_Name_Index :: FT_Face -> CString -> IO FT_UInt

foreign import ccall "FT_Get_SubGlyph_Info"
  ft_Get_SubGlyph_Info :: FT_GlyphSlot -> FT_UInt
                       -> Ptr FT_Int -> Ptr FT_UInt
                       -> Ptr FT_Int -> Ptr FT_Int
                       -> Ptr FT_Matrix -> IO FT_Error

foreign import ccall "FT_Get_FSType_Flags"
  ft_Get_FSType_Flags :: FT_Face -> IO FT_UShort
