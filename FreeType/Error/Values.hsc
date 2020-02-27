{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}

module FreeType.Error.Values where

import           FreeType.Core.Types

#include "ft2build.h"
#include FT_FREETYPE_H



pattern FT_Err_Ok                            
      , FT_Err_Cannot_Open_Resource          
      , FT_Err_Unknown_File_Format           
      , FT_Err_Invalid_File_Format           
      , FT_Err_Invalid_Version               
      , FT_Err_Lower_Module_Version          
      , FT_Err_Invalid_Argument              
      , FT_Err_Unimplemented_Feature         
      , FT_Err_Invalid_Table                 
      , FT_Err_Invalid_Offset                
      , FT_Err_Array_Too_Large               
      , FT_Err_Missing_Module                
      , FT_Err_Missing_Property              
      , FT_Err_Invalid_Glyph_Index           
      , FT_Err_Invalid_Character_Code        
      , FT_Err_Invalid_Glyph_Format          
      , FT_Err_Cannot_Render_Glyph           
      , FT_Err_Invalid_Outline               
      , FT_Err_Invalid_Composite             
      , FT_Err_Too_Many_Hints                
      , FT_Err_Invalid_Pixel_Size            
      , FT_Err_Invalid_Handle                
      , FT_Err_Invalid_Library_Handle        
      , FT_Err_Invalid_Driver_Handle         
      , FT_Err_Invalid_Face_Handle           
      , FT_Err_Invalid_Size_Handle           
      , FT_Err_Invalid_Slot_Handle           
      , FT_Err_Invalid_CharMap_Handle        
      , FT_Err_Invalid_Cache_Handle          
      , FT_Err_Invalid_Stream_Handle         
      , FT_Err_Too_Many_Drivers              
      , FT_Err_Too_Many_Extensions           
      , FT_Err_Out_Of_Memory                 
      , FT_Err_Unlisted_Object               
      , FT_Err_Cannot_Open_Stream            
      , FT_Err_Invalid_Stream_Seek           
      , FT_Err_Invalid_Stream_Skip           
      , FT_Err_Invalid_Stream_Read           
      , FT_Err_Invalid_Stream_Operation      
      , FT_Err_Invalid_Frame_Operation       
      , FT_Err_Nested_Frame_Access           
      , FT_Err_Invalid_Frame_Read            
      , FT_Err_Raster_Uninitialized          
      , FT_Err_Raster_Corrupted              
      , FT_Err_Raster_Overflow               
      , FT_Err_Raster_Negative_Height        
      , FT_Err_Too_Many_Caches               
      , FT_Err_Invalid_Opcode                
      , FT_Err_Too_Few_Arguments             
      , FT_Err_Stack_Overflow                
      , FT_Err_Code_Overflow                 
      , FT_Err_Bad_Argument                  
      , FT_Err_Divide_By_Zero                
      , FT_Err_Invalid_Reference             
      , FT_Err_Debug_OpCode                  
      , FT_Err_ENDF_In_Exec_Stream           
      , FT_Err_Nested_DEFS                   
      , FT_Err_Invalid_CodeRange             
      , FT_Err_Execution_Too_Long            
      , FT_Err_Too_Many_Function_Defs        
      , FT_Err_Too_Many_Instruction_Defs     
      , FT_Err_Table_Missing                 
      , FT_Err_Horiz_Header_Missing          
      , FT_Err_Locations_Missing             
      , FT_Err_Name_Table_Missing            
      , FT_Err_CMap_Table_Missing            
      , FT_Err_Hmtx_Table_Missing            
      , FT_Err_Post_Table_Missing            
      , FT_Err_Invalid_Horiz_Metrics         
      , FT_Err_Invalid_CharMap_Format        
      , FT_Err_Invalid_PPem                  
      , FT_Err_Invalid_Vert_Metrics          
      , FT_Err_Could_Not_Find_Context        
      , FT_Err_Invalid_Post_Table_Format     
      , FT_Err_Invalid_Post_Table            
      , FT_Err_DEF_In_Glyf_Bytecode          
      , FT_Err_Missing_Bitmap                
      , FT_Err_Syntax_Error                  
      , FT_Err_Stack_Underflow               
      , FT_Err_Ignore                        
      , FT_Err_No_Unicode_Glyph_Name         
      , FT_Err_Glyph_Too_Big                 
      , FT_Err_Missing_Startfont_Field       
      , FT_Err_Missing_Font_Field            
      , FT_Err_Missing_Size_Field            
      , FT_Err_Missing_Fontboundingbox_Field 
      , FT_Err_Missing_Chars_Field           
      , FT_Err_Missing_Startchar_Field       
      , FT_Err_Missing_Encoding_Field        
      , FT_Err_Missing_Bbx_Field             
      , FT_Err_Bbx_Too_Big                   
      , FT_Err_Corrupted_Font_Header         
      , FT_Err_Corrupted_Font_Glyphs         
     :: FT_UInt
pattern FT_Err_Ok                            = #const FT_Err_Ok
pattern FT_Err_Cannot_Open_Resource          = #const FT_Err_Cannot_Open_Resource
pattern FT_Err_Unknown_File_Format           = #const FT_Err_Unknown_File_Format
pattern FT_Err_Invalid_File_Format           = #const FT_Err_Invalid_File_Format
pattern FT_Err_Invalid_Version               = #const FT_Err_Invalid_Version
pattern FT_Err_Lower_Module_Version          = #const FT_Err_Lower_Module_Version
pattern FT_Err_Invalid_Argument              = #const FT_Err_Invalid_Argument
pattern FT_Err_Unimplemented_Feature         = #const FT_Err_Unimplemented_Feature
pattern FT_Err_Invalid_Table                 = #const FT_Err_Invalid_Table
pattern FT_Err_Invalid_Offset                = #const FT_Err_Invalid_Offset
pattern FT_Err_Array_Too_Large               = #const FT_Err_Array_Too_Large
pattern FT_Err_Missing_Module                = #const FT_Err_Missing_Module
pattern FT_Err_Missing_Property              = #const FT_Err_Missing_Property
pattern FT_Err_Invalid_Glyph_Index           = #const FT_Err_Invalid_Glyph_Index
pattern FT_Err_Invalid_Character_Code        = #const FT_Err_Invalid_Character_Code
pattern FT_Err_Invalid_Glyph_Format          = #const FT_Err_Invalid_Glyph_Format
pattern FT_Err_Cannot_Render_Glyph           = #const FT_Err_Cannot_Render_Glyph
pattern FT_Err_Invalid_Outline               = #const FT_Err_Invalid_Outline
pattern FT_Err_Invalid_Composite             = #const FT_Err_Invalid_Composite
pattern FT_Err_Too_Many_Hints                = #const FT_Err_Too_Many_Hints
pattern FT_Err_Invalid_Pixel_Size            = #const FT_Err_Invalid_Pixel_Size
pattern FT_Err_Invalid_Handle                = #const FT_Err_Invalid_Handle
pattern FT_Err_Invalid_Library_Handle        = #const FT_Err_Invalid_Library_Handle
pattern FT_Err_Invalid_Driver_Handle         = #const FT_Err_Invalid_Driver_Handle
pattern FT_Err_Invalid_Face_Handle           = #const FT_Err_Invalid_Face_Handle
pattern FT_Err_Invalid_Size_Handle           = #const FT_Err_Invalid_Size_Handle
pattern FT_Err_Invalid_Slot_Handle           = #const FT_Err_Invalid_Slot_Handle
pattern FT_Err_Invalid_CharMap_Handle        = #const FT_Err_Invalid_CharMap_Handle
pattern FT_Err_Invalid_Cache_Handle          = #const FT_Err_Invalid_Cache_Handle
pattern FT_Err_Invalid_Stream_Handle         = #const FT_Err_Invalid_Stream_Handle
pattern FT_Err_Too_Many_Drivers              = #const FT_Err_Too_Many_Drivers
pattern FT_Err_Too_Many_Extensions           = #const FT_Err_Too_Many_Extensions
pattern FT_Err_Out_Of_Memory                 = #const FT_Err_Out_Of_Memory
pattern FT_Err_Unlisted_Object               = #const FT_Err_Unlisted_Object
pattern FT_Err_Cannot_Open_Stream            = #const FT_Err_Cannot_Open_Stream
pattern FT_Err_Invalid_Stream_Seek           = #const FT_Err_Invalid_Stream_Seek
pattern FT_Err_Invalid_Stream_Skip           = #const FT_Err_Invalid_Stream_Skip
pattern FT_Err_Invalid_Stream_Read           = #const FT_Err_Invalid_Stream_Read
pattern FT_Err_Invalid_Stream_Operation      = #const FT_Err_Invalid_Stream_Operation
pattern FT_Err_Invalid_Frame_Operation       = #const FT_Err_Invalid_Frame_Operation
pattern FT_Err_Nested_Frame_Access           = #const FT_Err_Nested_Frame_Access
pattern FT_Err_Invalid_Frame_Read            = #const FT_Err_Invalid_Frame_Read
pattern FT_Err_Raster_Uninitialized          = #const FT_Err_Raster_Uninitialized
pattern FT_Err_Raster_Corrupted              = #const FT_Err_Raster_Corrupted
pattern FT_Err_Raster_Overflow               = #const FT_Err_Raster_Overflow
pattern FT_Err_Raster_Negative_Height        = #const FT_Err_Raster_Negative_Height
pattern FT_Err_Too_Many_Caches               = #const FT_Err_Too_Many_Caches
pattern FT_Err_Invalid_Opcode                = #const FT_Err_Invalid_Opcode
pattern FT_Err_Too_Few_Arguments             = #const FT_Err_Too_Few_Arguments
pattern FT_Err_Stack_Overflow                = #const FT_Err_Stack_Overflow
pattern FT_Err_Code_Overflow                 = #const FT_Err_Code_Overflow
pattern FT_Err_Bad_Argument                  = #const FT_Err_Bad_Argument
pattern FT_Err_Divide_By_Zero                = #const FT_Err_Divide_By_Zero
pattern FT_Err_Invalid_Reference             = #const FT_Err_Invalid_Reference
pattern FT_Err_Debug_OpCode                  = #const FT_Err_Debug_OpCode
pattern FT_Err_ENDF_In_Exec_Stream           = #const FT_Err_ENDF_In_Exec_Stream
pattern FT_Err_Nested_DEFS                   = #const FT_Err_Nested_DEFS
pattern FT_Err_Invalid_CodeRange             = #const FT_Err_Invalid_CodeRange
pattern FT_Err_Execution_Too_Long            = #const FT_Err_Execution_Too_Long
pattern FT_Err_Too_Many_Function_Defs        = #const FT_Err_Too_Many_Function_Defs
pattern FT_Err_Too_Many_Instruction_Defs     = #const FT_Err_Too_Many_Instruction_Defs
pattern FT_Err_Table_Missing                 = #const FT_Err_Table_Missing
pattern FT_Err_Horiz_Header_Missing          = #const FT_Err_Horiz_Header_Missing
pattern FT_Err_Locations_Missing             = #const FT_Err_Locations_Missing
pattern FT_Err_Name_Table_Missing            = #const FT_Err_Name_Table_Missing
pattern FT_Err_CMap_Table_Missing            = #const FT_Err_CMap_Table_Missing
pattern FT_Err_Hmtx_Table_Missing            = #const FT_Err_Hmtx_Table_Missing
pattern FT_Err_Post_Table_Missing            = #const FT_Err_Post_Table_Missing
pattern FT_Err_Invalid_Horiz_Metrics         = #const FT_Err_Invalid_Horiz_Metrics
pattern FT_Err_Invalid_CharMap_Format        = #const FT_Err_Invalid_CharMap_Format
pattern FT_Err_Invalid_PPem                  = #const FT_Err_Invalid_PPem
pattern FT_Err_Invalid_Vert_Metrics          = #const FT_Err_Invalid_Vert_Metrics
pattern FT_Err_Could_Not_Find_Context        = #const FT_Err_Could_Not_Find_Context
pattern FT_Err_Invalid_Post_Table_Format     = #const FT_Err_Invalid_Post_Table_Format
pattern FT_Err_Invalid_Post_Table            = #const FT_Err_Invalid_Post_Table
pattern FT_Err_DEF_In_Glyf_Bytecode          = #const FT_Err_DEF_In_Glyf_Bytecode
pattern FT_Err_Missing_Bitmap                = #const FT_Err_Missing_Bitmap
pattern FT_Err_Syntax_Error                  = #const FT_Err_Syntax_Error
pattern FT_Err_Stack_Underflow               = #const FT_Err_Stack_Underflow
pattern FT_Err_Ignore                        = #const FT_Err_Ignore
pattern FT_Err_No_Unicode_Glyph_Name         = #const FT_Err_No_Unicode_Glyph_Name
pattern FT_Err_Glyph_Too_Big                 = #const FT_Err_Glyph_Too_Big
pattern FT_Err_Missing_Startfont_Field       = #const FT_Err_Missing_Startfont_Field
pattern FT_Err_Missing_Font_Field            = #const FT_Err_Missing_Font_Field
pattern FT_Err_Missing_Size_Field            = #const FT_Err_Missing_Size_Field
pattern FT_Err_Missing_Fontboundingbox_Field = #const FT_Err_Missing_Fontboundingbox_Field
pattern FT_Err_Missing_Chars_Field           = #const FT_Err_Missing_Chars_Field
pattern FT_Err_Missing_Startchar_Field       = #const FT_Err_Missing_Startchar_Field
pattern FT_Err_Missing_Encoding_Field        = #const FT_Err_Missing_Encoding_Field
pattern FT_Err_Missing_Bbx_Field             = #const FT_Err_Missing_Bbx_Field
pattern FT_Err_Bbx_Too_Big                   = #const FT_Err_Bbx_Too_Big
pattern FT_Err_Corrupted_Font_Header         = #const FT_Err_Corrupted_Font_Header
pattern FT_Err_Corrupted_Font_Glyphs         = #const FT_Err_Corrupted_Font_Glyphs
