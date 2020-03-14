{-# LANGUAGE TemplateHaskell #-}

module Main where

import           Test.Report

import           FreeType
import           FreeType.Internal

import           Foreign.ForeignPtr
import           Foreign.Ptr
import           Foreign.Storable



-- | Tests whether all of the @foreign import ccall@s refer to correct function names.
--   You do not need to actually launch the test to know that the names are correctly
--   bound -- that is figured out at compilation time.
--   However it completing proves that all Internal functions are bound, as pretty
--   much any function that throws an exception __will__ throw one here.
main :: IO ()
main = do
  putStrLn "\n"

  putStrLn "FreeType.Core.Version"
  report 'ft_Library_Version'          ft_Library_Version'
  report 'ft_Face_CheckTrueTypePatents ft_Face_CheckTrueTypePatents
  report 'ft_Face_SetUnpatentedHinting ft_Face_SetUnpatentedHinting

  putStrLn "FreeType.Core.Base"
  flib <- mallocForeignPtr
  withForeignPtr flib $ \libPtr -> do
    report' 'ft_Init_FreeType' $ ft_Init_FreeType' libPtr
    report' 'ft_Done_FreeType' $ ft_Done_FreeType' =<< peek libPtr
  report 'ft_New_Face'            ft_New_Face'
  report 'ft_Done_Face'           ft_Done_Face'
  report 'ft_Reference_Face'      ft_Reference_Face'
  report 'ft_New_Memory_Face'     ft_New_Memory_Face'
  report 'ft_Face_Properties'     ft_Face_Properties'
  report 'ft_Open_Face'           ft_Open_Face'
  report 'ft_Attach_File'         ft_Attach_File'
  report 'ft_Attach_Stream'       ft_Attach_Stream'
  report 'ft_Set_Char_Size'       ft_Set_Char_Size'
  report 'ft_Set_Pixel_Sizes'     ft_Set_Pixel_Sizes'
  report 'ft_Request_Size'        ft_Request_Size'
  report 'ft_Select_Size'         ft_Select_Size'
  report 'ft_Set_Transform'       ft_Set_Transform'
  report 'ft_Load_Glyph'          ft_Load_Glyph'
  report 'ft_Get_Char_Index       ft_Get_Char_Index
  report 'ft_Get_First_Char'      ft_Get_First_Char'
  report 'ft_Get_Next_Char'       ft_Get_Next_Char'
  report 'ft_Get_Name_Index       ft_Get_Name_Index
  report 'ft_Load_Char'           ft_Load_Char'
  report 'ft_Render_Glyph'        ft_Render_Glyph'
  report 'ft_Get_Kerning'         ft_Get_Kerning'
  report 'ft_Get_Track_Kerning'   ft_Get_Track_Kerning'
  report 'ft_Get_Glyph_Name'      ft_Get_Glyph_Name'
  report 'ft_Get_Postscript_Name' ft_Get_Postscript_Name'
  report 'ft_Select_Charmap'      ft_Select_Charmap'
  report 'ft_Set_Charmap'         ft_Set_Charmap'
  report 'ft_Get_Charmap_Index    ft_Get_Charmap_Index

  putStrLn "FreeType.Core.Unicode"
  report 'ft_Face_GetCharVariantIndex     ft_Face_GetCharVariantIndex
  report 'ft_Face_GetCharVariantIsDefault ft_Face_GetCharVariantIsDefault
  report 'ft_Face_GetVariantSelectors     ft_Face_GetVariantSelectors
  report 'ft_Face_GetVariantsOfChar       ft_Face_GetVariantsOfChar
  report 'ft_Face_GetCharsOfVariant       ft_Face_GetCharsOfVariant

  putStrLn "FreeType.Core.Color"
  report 'ft_Palette_Data_Get'             ft_Palette_Data_Get'
  report 'ft_Palette_Select                ft_Palette_Select
  report 'ft_Palette_Set_Foreground_Color' ft_Palette_Set_Foreground_Color'

  putStrLn "FreeType.Core.Layer"
  report 'ft_Get_Color_Glyph_Layer  ft_Get_Color_Glyph_Layer

  putStrLn "FreeType.Core.Glyph"
  report 'ft_New_Glyph'       ft_New_Glyph'
  report 'ft_Get_Glyph'       ft_Get_Glyph'
  report 'ft_Glyph_Copy'      ft_Glyph_Copy'
  report 'ft_Glyph_Transform' ft_Glyph_Transform'
  report 'ft_Glyph_Get_CBox'  ft_Glyph_Get_CBox'
  report 'ft_Glyph_To_Bitmap' ft_Glyph_To_Bitmap'
  report 'ft_Done_Glyph       ft_Done_Glyph

  putStrLn "FreeType.Core.Mac"
{-
  report 'ft_New_Face_From_FOND'            ft_New_Face_From_FOND'
  report 'ft_GetFile_From_Mac_Name'         ft_GetFile_From_Mac_Name'
  report 'ft_GetFile_From_Mac_ATS_Name'     ft_GetFile_From_Mac_ATS_Name'
  report 'ft_GetFilePath_From_Mac_ATS_Name' ft_GetFilePath_From_Mac_ATS_Name'
  report 'ft_New_Face_From_FSSpec'          ft_New_Face_From_FSSpec'
  report 'ft_New_Face_From_FSRef'           ft_New_Face_From_FSRef'
-}
  putStrLn "FreeType.Core.Size"
  report 'ft_New_Size'      ft_New_Size'
  report 'ft_Done_Size'     ft_Done_Size'
  report 'ft_Activate_Size' ft_Activate_Size'

  putStrLn "FreeType.Format.Multiple"
  report 'ft_Get_Multi_Master'           ft_Get_Multi_Master'
  report 'ft_Get_MM_Var'                 ft_Get_MM_Var'
  report 'ft_Done_MM_Var'                ft_Done_MM_Var'
  report 'ft_Set_MM_Design_Coordinates'  ft_Set_MM_Design_Coordinates'
  report 'ft_Set_Var_Design_Coordinates' ft_Set_Var_Design_Coordinates'
  report 'ft_Get_Var_Design_Coordinates' ft_Get_Var_Design_Coordinates'
  report 'ft_Set_MM_Blend_Coordinates'   ft_Set_MM_Blend_Coordinates'
  report 'ft_Get_MM_Blend_Coordinates'   ft_Get_MM_Blend_Coordinates'
  report 'ft_Set_Var_Blend_Coordinates'  ft_Set_Var_Blend_Coordinates'
  report 'ft_Get_Var_Blend_Coordinates'  ft_Get_Var_Blend_Coordinates'
  report 'ft_Set_MM_WeightVector'        ft_Set_MM_WeightVector'
  report 'ft_Get_MM_WeightVector'        ft_Get_MM_WeightVector'
  report 'ft_Get_Var_Axis_Flags'         ft_Get_Var_Axis_Flags'
  report 'ft_Set_Named_Instance'         ft_Set_Named_Instance'

  putStrLn "FreeType.Format.TrueType"
  report 'ft_Get_Sfnt_Table'      ft_Get_Sfnt_Table'
  report 'ft_Load_Sfnt_Table'     ft_Load_Sfnt_Table'
  report 'ft_Sfnt_Table_Info'     ft_Sfnt_Table_Info'
  report 'ft_Get_CMap_Language_ID ft_Get_CMap_Language_ID
  report 'ft_Get_CMap_Format      ft_Get_CMap_Format

  putStrLn "FreeType.Format.Type1"
  report 'ft_Has_PS_Glyph_Names   ft_Has_PS_Glyph_Names
  report 'ft_Get_PS_Font_Info'    ft_Get_PS_Font_Info'
  report 'ft_Get_PS_Font_Private' ft_Get_PS_Font_Private'
  report 'ft_Get_PS_Font_Value    ft_Get_PS_Font_Value

  putStrLn "FreeType.Format.Sfnt"
  report 'ft_Get_Sfnt_Name_Count ft_Get_Sfnt_Name_Count
  report 'ft_Get_Sfnt_Name'      ft_Get_Sfnt_Name'
  report 'ft_Get_Sfnt_LangTag'   ft_Get_Sfnt_LangTag'

  putStrLn "FreeType.Format.BDF"
  report 'ft_Get_BDF_Charset_ID' ft_Get_BDF_Charset_ID'
  report 'ft_Get_BDF_Property'   ft_Get_BDF_Property'

  putStrLn "FreeType.Format.CID"
  report 'ft_Get_CID_Registry_Ordering_Supplement' ft_Get_CID_Registry_Ordering_Supplement'
  report 'ft_Get_CID_Is_Internally_CID_Keyed'      ft_Get_CID_Is_Internally_CID_Keyed'
  report 'ft_Get_CID_From_Glyph_Index'             ft_Get_CID_From_Glyph_Index'

  putStrLn "FreeType.Format.PFR" 
  report 'ft_Get_PFR_Metrics' ft_Get_PFR_Metrics'
  report 'ft_Get_PFR_Kerning' ft_Get_PFR_Kerning'
  report 'ft_Get_PFR_Advance' ft_Get_PFR_Advance'

  putStrLn "FreeType.Format.WinFNT"
  report 'ft_Get_WinFNT_Header' ft_Get_WinFNT_Header'

  putStrLn "FreeType.Format.Font"
  report 'ft_Get_Font_Format' ft_Get_Font_Format'

  putStrLn "FreeType.Format.Gasp"
  report 'ft_Get_Gasp ft_Get_Gasp

  putStrLn "FreeType.Control.Subpixel"
  report 'ft_Library_SetLcdFilter'        ft_Library_SetLcdFilter'
  report 'ft_Library_SetLcdFilterWeights' ft_Library_SetLcdFilterWeights'
  report 'ft_Library_SetLcdGeometry'      ft_Library_SetLcdGeometry'

  putStrLn "FreeType.Cache"
  report 'ftc_Manager_New'             ftc_Manager_New'
  report 'ftc_Manager_Reset            ftc_Manager_Reset
  report 'ftc_Manager_Done             ftc_Manager_Done
  report 'ftc_Manager_LookupFace'      ftc_Manager_LookupFace'
  report 'ftc_Manager_LookupSize'      ftc_Manager_LookupSize'
  report 'ftc_Manager_RemoveFaceID     ftc_Manager_RemoveFaceID
  report 'ftc_Node_Unref               ftc_Node_Unref
  report 'ftc_ImageCache_New'          ftc_ImageCache_New'
  report 'ftc_ImageCache_Lookup'       ftc_ImageCache_Lookup'
  report 'ftc_SBitCache_New'           ftc_SBitCache_New'
  report 'ftc_SBitCache_Lookup'        ftc_SBitCache_Lookup'
  report 'ftc_CMapCache_New'           ftc_CMapCache_New'
  report 'ftc_CMapCache_Lookup         ftc_CMapCache_Lookup
  report 'ftc_ImageCache_LookupScaler' ftc_ImageCache_LookupScaler'
  report 'ftc_SBitCache_LookupScaler'  ftc_SBitCache_LookupScaler'

  putStrLn "FreeType.Support.Computations"
  report3 'ft_MulDiv             ft_MulDiv
  report2 'ft_MulFix             ft_MulFix
  report2 'ft_DivFix             ft_DivFix
  report1 'ft_RoundFix           ft_RoundFix
  report1 'ft_CeilFix            ft_CeilFix
  report1 'ft_FloorFix           ft_FloorFix
  report2 'ft_Vector_Transform'  ft_Vector_Transform'
  report2 'ft_Matrix_Multiply'   ft_Matrix_Multiply'
  report1 'ft_Matrix_Invert'     ft_Matrix_Invert'
  report1 'ft_Sin                ft_Sin
  report1 'ft_Cos                ft_Cos
  report1 'ft_Tan                ft_Tan
  report2 'ft_Atan2              ft_Atan2
  report2 'ft_Angle_Diff         ft_Angle_Diff
  report2 'ft_Vector_Unit'       ft_Vector_Unit'
  report2 'ft_Vector_Rotate'     ft_Vector_Rotate'
  report1 'ft_Vector_Length'     ft_Vector_Length'
  report3 'ft_Vector_Polarize'   ft_Vector_Polarize'
  report3 'ft_Vector_From_Polar' ft_Vector_From_Polar'

  putStrLn "FreeType.Support.List"
  report 'ft_List_Add       ft_List_Add
  report 'ft_List_Insert    ft_List_Insert
  report 'ft_List_Find'     ft_List_Find'
  report 'ft_List_Remove    ft_List_Remove
  report 'ft_List_Up        ft_List_Up
  report 'ft_List_Iterate'  ft_List_Iterate'
  report 'ft_List_Finalize' ft_List_Finalize'

  putStrLn "FreeType.Support.Outline"
  report 'ft_Outline_New'            ft_Outline_New'
  report 'ft_Outline_Done'           ft_Outline_Done'
  report 'ft_Outline_Copy'           ft_Outline_Copy'
  report 'ft_Outline_Translate       ft_Outline_Translate
  report 'ft_Outline_Transform'      ft_Outline_Transform'
  report 'ft_Outline_Embolden'       ft_Outline_Embolden'
  report 'ft_Outline_EmboldenXY'     ft_Outline_EmboldenXY'
  report 'ft_Outline_Reverse         ft_Outline_Reverse
  report 'ft_Outline_Check'          ft_Outline_Check'
  report 'ft_Outline_Get_CBox'       ft_Outline_Get_CBox'
  report 'ft_Outline_Get_BBox'       ft_Outline_Get_BBox'
  report 'ft_Outline_Get_Bitmap'     ft_Outline_Get_Bitmap'
  report 'ft_Outline_Render'         ft_Outline_Render'
  report 'ft_Outline_Decompose'      ft_Outline_Decompose'
  report 'ft_Outline_Get_Orientation ft_Outline_Get_Orientation

  putStrLn "FreeType.Support.Advance"
  report 'ft_Get_Advance'  ft_Get_Advance'
  report 'ft_Get_Advances' ft_Get_Advances'

  putStrLn "FreeType.Support.Bitmap"
  report 'ft_Bitmap_Init'          ft_Bitmap_Init'
  report 'ft_Bitmap_Copy'          ft_Bitmap_Copy'
  report 'ft_Bitmap_Embolden'      ft_Bitmap_Embolden'
  report 'ft_Bitmap_Convert'       ft_Bitmap_Convert'
  report 'ft_Bitmap_Blend'         ft_Bitmap_Blend'
  report 'ft_GlyphSlot_Own_Bitmap' ft_GlyphSlot_Own_Bitmap'
  report 'ft_Bitmap_Done'          ft_Bitmap_Done'

  putStrLn "FreeType.Support.Glyph"
  report 'ft_Outline_GetInsideBorder  ft_Outline_GetInsideBorder
  report 'ft_Outline_GetOutsideBorder ft_Outline_GetOutsideBorder
  report 'ft_Glyph_Stroke'            ft_Glyph_Stroke'
  report 'ft_Glyph_StrokeBorder'      ft_Glyph_StrokeBorder'
  report 'ft_Stroker_New'             ft_Stroker_New'
  report 'ft_Stroker_Set              ft_Stroker_Set
  report 'ft_Stroker_Rewind           ft_Stroker_Rewind
  report 'ft_Stroker_ParseOutline'    ft_Stroker_ParseOutline'
  report 'ft_Stroker_Done             ft_Stroker_Done
  report 'ft_Stroker_BeginSubPath'    ft_Stroker_BeginSubPath'
  report 'ft_Stroker_EndSubPath'      ft_Stroker_EndSubPath'
  report 'ft_Stroker_LineTo'          ft_Stroker_LineTo'
  report 'ft_Stroker_ConicTo'         ft_Stroker_ConicTo'
  report 'ft_Stroker_CubicTo'         ft_Stroker_CubicTo'
  report 'ft_Stroker_GetBorderCounts' ft_Stroker_GetBorderCounts'
  report 'ft_Stroker_ExportBorder     ft_Stroker_ExportBorder
  report 'ft_Stroker_GetCounts'       ft_Stroker_GetCounts'
  report 'ft_Stroker_Export           ft_Stroker_Export

  putStrLn "FreeType.Support.Module"
  report 'ft_Add_Module'            ft_Add_Module'
  report 'ft_Get_Module'            ft_Get_Module'
  report 'ft_Remove_Module'         ft_Remove_Module'
  report 'ft_Add_Default_Modules    ft_Add_Default_Modules
  report 'ft_Property_Set'          ft_Property_Set'
  report 'ft_Property_Get'          ft_Property_Get'
  report 'ft_Set_Default_Properties ft_Set_Default_Properties
  report 'ft_New_Library'           ft_New_Library'
  report 'ft_Done_Library'          ft_Done_Library'
  report 'ft_Reference_Library'     ft_Reference_Library'
  report 'ft_Get_Renderer'          ft_Get_Renderer'
  report 'ft_Set_Renderer'          ft_Set_Renderer'
  report 'ft_Set_Debug_Hook'        ft_Set_Debug_Hook'

  putStrLn "FreeType.Support.GZIP"
  report 'ft_Stream_OpenGzip' ft_Stream_OpenGzip'
  report 'ft_Gzip_Uncompress' ft_Gzip_Uncompress'

  putStrLn "FreeType.Support.LZW"
  report 'ft_Stream_OpenLZW' ft_Stream_OpenLZW'

  putStrLn "FreeType.Support.BZIP2"
  report 'ft_Stream_OpenBzip2' ft_Stream_OpenBzip2'

  putStrLn "FreeType.Error.Enumerations"
  report1 'ft_Error_String' ft_Error_String'

  putStrLn "FreeType.Miscellaneous.OpenType"
  report 'ft_OpenType_Validate' ft_OpenType_Validate'
  report 'ft_OpenType_Free      ft_OpenType_Free

  putStrLn "FreeType.Miscellaneous.TrueType"
  report 'ft_Get_TrueType_Engine_Type ft_Get_TrueType_Engine_Type

  putStrLn "FreeType.Miscellaneous.TrueTypeGX"
  report 'ft_TrueTypeGX_Validate'  ft_TrueTypeGX_Validate'
  report 'ft_TrueTypeGX_Free       ft_TrueTypeGX_Free
  report 'ft_ClassicKern_Validate' ft_ClassicKern_Validate'
  report 'ft_ClassicKern_Free      ft_ClassicKern_Free

  putStrLn "✓ All clear ✓"
