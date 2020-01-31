{-# LANGUAGE ForeignFunctionInterface #-}
module Graphics.Rendering.FreeType.Internal
  {-# DEPRECATED "freetype2 bindings were rewritten from scratch. Please switch to Graphics.FreeType.Bindings" #-}
  where

import qualified Graphics.FreeType.Bindings.Core.Base as New
import qualified Graphics.FreeType.Bindings.Core.Size as New
import qualified Graphics.FreeType.Bindings.Core.Glyph as New
import qualified Graphics.FreeType.Bindings.Core.Unicode as New
import qualified Graphics.FreeType.Bindings.Core.Version as New
import qualified Graphics.FreeType.Bindings.Support.Outline as New

import           Graphics.Rendering.FreeType.Internal.PrimitiveTypes
import           Graphics.Rendering.FreeType.Internal.Library
import           Graphics.Rendering.FreeType.Internal.Face
import           Graphics.Rendering.FreeType.Internal.Matrix
import           Graphics.Rendering.FreeType.Internal.Vector
import           Graphics.Rendering.FreeType.Internal.Glyph
import           Graphics.Rendering.FreeType.Internal.GlyphSlot
import           Graphics.Rendering.FreeType.Internal.OpenArgs
import           Graphics.Rendering.FreeType.Internal.SizeRequest
import           Graphics.Rendering.FreeType.Internal.CharMap
import           Graphics.Rendering.FreeType.Internal.Outline
import           Graphics.Rendering.FreeType.Internal.BBox
import           Graphics.Rendering.FreeType.Internal.Bitmap
import           Graphics.Rendering.FreeType.Internal.RasterParams
import           Graphics.Rendering.FreeType.Internal.Size

import           Foreign.C.String
import           Foreign.Ptr



ft_Init_FreeType :: Ptr FT_Library -> IO FT_Error
ft_Init_FreeType = New.ft_Init_FreeType

ft_New_Face :: FT_Library  -> CString -> FT_Long -> Ptr FT_Face -> IO FT_Error
ft_New_Face = New.ft_New_Face

ft_Set_Char_Size :: FT_Face -> FT_F26Dot6 -> FT_F26Dot6 -> FT_UInt -> FT_UInt -> IO FT_Error
ft_Set_Char_Size = New.ft_Set_Char_Size

ft_Set_Pixel_Sizes :: FT_Face -> FT_UInt -> FT_UInt -> IO FT_Error
ft_Set_Pixel_Sizes = New.ft_Set_Pixel_Sizes

ft_Get_Char_Index :: FT_Face -> FT_ULong -> IO FT_UInt
ft_Get_Char_Index = New.ft_Get_Char_Index

ft_Set_Transform :: FT_Face -> Ptr FT_Matrix -> Ptr FT_Vector -> IO ()
ft_Set_Transform = New.ft_Set_Transform

ft_Load_Char :: FT_Face -> FT_ULong -> FT_Int32 -> IO FT_Error
ft_Load_Char = New.ft_Load_Char

ft_Done_Face :: FT_Face -> IO FT_Error
ft_Done_Face = New.ft_Done_Face

ft_Done_FreeType :: FT_Library -> IO FT_Error
ft_Done_FreeType = New.ft_Done_FreeType

ft_Load_Glyph :: FT_Face -> FT_UInt -> FT_Int32 -> IO FT_Error
ft_Load_Glyph = New.ft_Load_Glyph

ft_Get_Glyph :: FT_GlyphSlot -> Ptr FT_Glyph -> IO FT_Error
ft_Get_Glyph = New.ft_Get_Glyph

ft_Done_Glyph :: FT_Glyph -> IO ()
ft_Done_Glyph = New.ft_Done_Glyph

ft_Glyph_To_Bitmap :: Ptr FT_Glyph  -> FT_Render_Mode -> Ptr FT_Vector -> FT_Bool -> IO FT_Error
ft_Glyph_To_Bitmap a = New.ft_Glyph_To_Bitmap a . fromIntegral

ft_Library_Version :: FT_Library -> Ptr FT_Int -> Ptr FT_Int -> Ptr FT_Int -> IO ()
ft_Library_Version = New.ft_Library_Version

-- | This is just here for completeness,
-- TrueType hinting is no longer patented
ft_Face_CheckTrueTypePatents :: FT_Face -> IO FT_Bool
ft_Face_CheckTrueTypePatents = fmap fromIntegral . New.ft_Face_CheckTrueTypePatents

-- | This is just here for completeness,
-- TrueType hinting is no longer patented.
ft_Face_SetUnpatentedHinting :: FT_Face -> FT_Bool -> IO FT_Bool
ft_Face_SetUnpatentedHinting = New.ft_Face_SetUnpatentedHinting

ft_New_Memory_Face :: FT_Library -> FT_Bytes -> FT_Long -> FT_Long -> Ptr FT_Face -> IO FT_Error
ft_New_Memory_Face = New.ft_New_Memory_Face

ft_Open_Face :: FT_Library -> Ptr FT_Open_Args -> FT_Long -> Ptr FT_Face -> IO FT_Error
ft_Open_Face = New.ft_Open_Face

ft_Attach_File :: FT_Face -> CString -> IO FT_Error
ft_Attach_File = New.ft_Attach_File

ft_Attach_Stream :: FT_Face -> Ptr FT_Open_Args -> IO FT_Error
ft_Attach_Stream = New.ft_Attach_Stream

ft_Reference_Face :: FT_Face -> IO FT_Error
ft_Reference_Face = New.ft_Reference_Face

ft_Select_Size :: FT_Face -> FT_Int -> IO FT_Error
ft_Select_Size = New.ft_Select_Size

ft_Request_Size :: FT_Face -> FT_Size_Request -> IO FT_Error
ft_Request_Size = New.ft_Request_Size

ft_Render_Glyph :: FT_GlyphSlot -> FT_Render_Mode -> IO FT_Error
ft_Render_Glyph gslot = New.ft_Render_Glyph gslot . fromIntegral

ft_Get_Kerning :: FT_Face -> FT_UInt -> FT_UInt -> FT_UInt -> Ptr FT_Vector -> IO FT_Error
ft_Get_Kerning = New.ft_Get_Kerning

ft_Get_Track_Kerning :: FT_Face -> FT_Fixed -> FT_Int -> Ptr FT_Fixed -> IO FT_Error
ft_Get_Track_Kerning = New.ft_Get_Track_Kerning

ft_Get_Glyph_Name :: FT_Face -> FT_UInt -> FT_Pointer -> FT_UInt -> IO FT_Error
ft_Get_Glyph_Name = New.ft_Get_Glyph_Name

ft_Get_Postscript_Name :: FT_Face -> IO CString
ft_Get_Postscript_Name = New.ft_Get_Postscript_Name

ft_Select_Charmap :: FT_Face -> FT_Encoding -> IO FT_Error
ft_Select_Charmap fae = New.ft_Select_Charmap fae . fromIntegral

ft_Set_Charmap :: FT_Face -> FT_CharMap -> IO FT_Error
ft_Set_Charmap = New.ft_Set_Charmap

ft_Get_Charmap_Index :: FT_CharMap -> IO FT_Int
ft_Get_Charmap_Index = New.ft_Get_Charmap_Index

ft_Get_First_Char :: FT_Face -> Ptr FT_UInt -> IO FT_ULong 
ft_Get_First_Char = New.ft_Get_First_Char

ft_Get_Next_Char :: FT_Face -> FT_ULong -> Ptr FT_UInt -> IO FT_ULong
ft_Get_Next_Char = New.ft_Get_Next_Char

ft_Get_Name_Index :: FT_Face -> CString -> IO FT_UInt
ft_Get_Name_Index = New.ft_Get_Name_Index

ft_Get_SubGlyph_Info :: FT_GlyphSlot -> FT_UInt -> Ptr FT_Int -> Ptr FT_UInt -> Ptr FT_Int -> Ptr FT_Int -> Ptr FT_Matrix -> IO FT_Error
ft_Get_SubGlyph_Info = New.ft_Get_SubGlyph_Info

ft_Get_FSType_Flags :: FT_Face -> IO FT_UShort
ft_Get_FSType_Flags = fmap fromIntegral . New.ft_Get_FSType_Flags

ft_Face_GetCharVariantIndex :: FT_Face -> FT_ULong -> FT_ULong -> IO FT_UInt
ft_Face_GetCharVariantIndex = New.ft_Face_GetCharVariantIndex

ft_Face_GetCharVariantIsDefault :: FT_Face -> FT_ULong -> FT_ULong -> IO FT_Int
ft_Face_GetCharVariantIsDefault = New.ft_Face_GetCharVariantIsDefault

ft_Face_GetVariantSelectors :: FT_Face -> IO (Ptr FT_UInt32)
ft_Face_GetVariantSelectors = New.ft_Face_GetVariantSelectors

ft_Face_GetVariantsOfChar :: FT_Face -> FT_ULong -> IO (Ptr FT_UInt32)
ft_Face_GetVariantsOfChar = New.ft_Face_GetVariantsOfChar

ft_Face_GetCharsOfVariant :: FT_Face -> FT_ULong -> IO (Ptr FT_UInt32)
ft_Face_GetCharsOfVariant = New.ft_Face_GetCharsOfVariant

ft_Outline_New :: FT_Library -> FT_UInt -> FT_Int -> Ptr FT_Outline -> IO FT_Error
ft_Outline_New = New.ft_Outline_New
{-
ft_Outline_New_Internal :: FT_Memory -> FT_UInt -> FT_Int -> Ptr FT_Outline -> IO FT_Error
ft_Outline_New_Internal = New.ft_Outline_New_Internal
-}
ft_Outline_Done :: FT_Library -> Ptr FT_Outline -> IO FT_Error
ft_Outline_Done = New.ft_Outline_Done
{-
ft_Outline_Done_Internal :: FT_Memory -> Ptr FT_Outline -> IO FT_Error
ft_Outline_Done_Internal = New.ft_Outline_Done_Internal
-}
ft_Outline_Copy :: Ptr FT_Outline -> Ptr FT_Outline -> IO FT_Error
ft_Outline_Copy = New.ft_Outline_Copy

ft_Outline_Translate :: Ptr FT_Outline -> FT_Pos -> FT_Pos -> IO ()
ft_Outline_Translate = New.ft_Outline_Translate

ft_Outline_Transform :: Ptr FT_Outline -> Ptr FT_Matrix -> IO ()
ft_Outline_Transform = New.ft_Outline_Transform

ft_Outline_Embolden :: Ptr FT_Outline -> FT_Pos -> IO FT_Error
ft_Outline_Embolden = New.ft_Outline_Embolden

ft_Outline_Reverse :: Ptr FT_Outline -> IO ()
ft_Outline_Reverse = New.ft_Outline_Reverse

ft_Outline_Check :: Ptr FT_Outline -> IO FT_Error
ft_Outline_Check = New.ft_Outline_Check

ft_Outline_Get_BBox :: Ptr FT_Outline -> Ptr FT_BBox -> IO FT_Error
ft_Outline_Get_BBox = New.ft_Outline_Get_BBox

ft_Outline_Decompose :: Ptr FT_Outline -> Ptr FT_Outline_Funcs -> Ptr a -> IO FT_Error
ft_Outline_Decompose ol olFuncs = New.ft_Outline_Decompose ol olFuncs . castPtr

ft_Outline_Get_CBox :: Ptr FT_Outline -> Ptr FT_BBox -> IO ()
ft_Outline_Get_CBox = New.ft_Outline_Get_CBox

ft_Outline_Get_Bitmap :: FT_Library -> Ptr FT_Outline -> Ptr FT_Bitmap -> IO FT_Error
ft_Outline_Get_Bitmap = New.ft_Outline_Get_Bitmap

ft_Outline_Render :: FT_Library -> Ptr FT_Outline -> Ptr FT_Raster_Params -> IO FT_Error
ft_Outline_Render = New.ft_Outline_Render

ft_Outline_Get_Orientation :: Ptr FT_Outline -> IO FT_Orientation
ft_Outline_Get_Orientation = fmap fromIntegral . New.ft_Outline_Get_Orientation

ft_New_Size :: FT_Face -> Ptr FT_Size -> IO FT_Error
ft_New_Size = New.ft_New_Size

ft_Done_Size :: FT_Size -> IO FT_Error
ft_Done_Size = New.ft_Done_Size

ft_Activate_Size :: FT_Size -> IO FT_Error
ft_Activate_Size = New.ft_Activate_Size

