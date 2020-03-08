{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}

module FreeType.Core.Base.Internal
  ( -- ** FT_Init_FreeType
    ft_Init_FreeType'
    -- ** FT_Done_FreeType
  , ft_Done_FreeType'
    -- ** FT_New_Face
  , ft_New_Face'
    -- ** FT_Done_Face
  , ft_Done_Face'
    -- ** FT_Reference_Face
  , ft_Reference_Face'
    -- ** FT_New_Memory_Face
  , ft_New_Memory_Face'
    -- ** FT_Face_Properties
  , ft_Face_Properties'
    -- ** FT_Open_Face
  , ft_Open_Face'
    -- ** FT_Attach_File
  , ft_Attach_File'
    -- ** FT_Attach_Stream
  , ft_Attach_Stream'
    -- ** FT_Set_Char_Size
  , ft_Set_Char_Size'
    -- ** FT_Set_Pixel_Sizes
  , ft_Set_Pixel_Sizes'
    -- ** FT_Request_Size
  , ft_Request_Size'
    -- ** FT_Select_Size
  , ft_Select_Size'
    -- ** FT_Set_Transform
  , ft_Set_Transform'
    -- ** FT_Load_Glyph
  , ft_Load_Glyph'
    -- ** FT_Get_First_Char
  , ft_Get_First_Char'
    -- ** FT_Get_Next_Char
  , ft_Get_Next_Char'
    -- ** FT_Load_Char
  , ft_Load_Char'
    -- ** FT_Render_Glyph
  , ft_Render_Glyph'
    -- ** FT_Get_Kerning
  , ft_Get_Kerning'
    -- ** FT_Get_Track_Kerning
  , ft_Get_Track_Kerning'
    -- ** FT_Get_Glyph_Name
  , ft_Get_Glyph_Name'
    -- ** FT_Get_Postscript_Name
  , ft_Get_Postscript_Name'
    -- ** FT_Select_Charmap
  , ft_Select_Charmap'
    -- ** FT_Set_Charmap
  , ft_Set_Charmap'
    -- ** FT_Get_SubGlyph_Info
  , ft_Get_SubGlyph_Info'
  ) where

import           FreeType.Circular.Types
import           FreeType.Core.Base.Types
import           FreeType.Core.Types.Types

import           Data.Int
import           Foreign.Ptr

#include "ft2build.h"
#include FT_FREETYPE_H

foreign import ccall "FT_Init_FreeType"
  ft_Init_FreeType'
    :: Ptr FT_Library -- ^ library
    -> IO FT_Error



foreign import ccall "FT_Done_FreeType"
  ft_Done_FreeType'
    :: FT_Library  -- ^ library
    -> IO FT_Error



foreign import ccall "FT_New_Face"
  ft_New_Face'
    :: FT_Library       -- ^ library
    -> Ptr #{type char} -- ^ filepathname
    -> FT_Long          -- ^ face_index
    -> Ptr FT_Face      -- ^ aface
    -> IO FT_Error



foreign import ccall "FT_Done_Face"
  ft_Done_Face'
    :: FT_Face     -- ^ face
    -> IO FT_Error



foreign import ccall "FT_Reference_Face"
  ft_Reference_Face'
    :: FT_Face     -- ^ face
    -> IO FT_Error



foreign import ccall "FT_New_Memory_Face"
  ft_New_Memory_Face'
    :: FT_Library  -- ^ library
    -> Ptr FT_Byte -- ^ file_base
    -> FT_Long     -- ^ file_size
    -> FT_Long     -- ^ face_index
    -> Ptr FT_Face -- ^ aface
    -> IO FT_Error



foreign import ccall "FT_Face_Properties"
  ft_Face_Properties'
    :: FT_Face          -- ^ face
    -> FT_UInt          -- ^ num_properties
    -> Ptr FT_Parameter -- ^ properties
    -> IO FT_Error



foreign import ccall "FT_Open_Face"
  ft_Open_Face'
    :: FT_Library       -- ^ library
    -> Ptr FT_Open_Args -- ^ args
    -> FT_Long          -- ^ face_index
    -> Ptr FT_Face      -- ^ aface
    -> IO FT_Error



foreign import ccall "FT_Attach_File"
  ft_Attach_File'
    :: FT_Face          
    -> Ptr #{type char} -- ^ face
    -> IO FT_Error      -- ^ filepathname



foreign import ccall "FT_Attach_Stream"
  ft_Attach_Stream'
    :: FT_Face          -- ^ face
    -> Ptr FT_Open_Args -- ^ parameters
    -> IO FT_Error



foreign import ccall "FT_Set_Char_Size"
  ft_Set_Char_Size'
    :: FT_Face    -- ^ face
    -> FT_F26Dot6 -- ^ char_width
    -> FT_F26Dot6 -- ^ char_height
    -> FT_UInt    -- ^ horz_resolution
    -> FT_UInt    -- ^ vert_resolution
    -> IO FT_Error



foreign import ccall "FT_Set_Pixel_Sizes"
  ft_Set_Pixel_Sizes'
    :: FT_Face     -- ^ face
    -> FT_UInt     -- ^ pixel_width
    -> FT_UInt     -- ^ pixel_height
    -> IO FT_Error



foreign import ccall "FT_Request_Size"
  ft_Request_Size'
    :: FT_Face         -- ^ face
    -> FT_Size_Request -- ^ req
    -> IO FT_Error



foreign import ccall "FT_Select_Size"
  ft_Select_Size'
    :: FT_Face     -- ^ face
    -> FT_Int      -- ^ strike_index
    -> IO FT_Error



foreign import ccall "FT_Set_Transform"
  ft_Set_Transform'
    :: FT_Face       -- ^ face
    -> Ptr FT_Matrix -- ^ matrix
    -> Ptr FT_Vector -- ^ delta
    -> IO ()



foreign import ccall "FT_Load_Glyph"
  ft_Load_Glyph'
    :: FT_Face     -- ^ face
    -> FT_UInt     -- ^ glyph_index
    -> FT_Int32    -- ^ load_flags
    -> IO FT_Error



foreign import ccall "FT_Get_First_Char"
  ft_Get_First_Char'
    :: FT_Face     -- ^ face
    -> Ptr FT_UInt -- ^ agindex
    -> IO FT_ULong



foreign import ccall "FT_Get_Next_Char"
  ft_Get_Next_Char'
    :: FT_Face     -- ^ face
    -> FT_ULong    -- ^ char_code
    -> Ptr FT_UInt -- ^ agindex
    -> IO FT_ULong



foreign import ccall "FT_Load_Char"
  ft_Load_Char'
    :: FT_Face     -- ^ face
    -> FT_ULong    -- ^ char_code
    -> FT_Int32    -- ^ load_flags
    -> IO FT_Error



foreign import ccall "FT_Render_Glyph"
  ft_Render_Glyph'
    :: FT_GlyphSlot   -- ^ slot
    -> FT_Render_Mode -- ^ render_mode
    -> IO FT_Error



foreign import ccall "FT_Get_Kerning"
  ft_Get_Kerning'
    :: FT_Face       -- ^ face
    -> FT_UInt       -- ^ left_glyph
    -> FT_UInt       -- ^ right_glyph
    -> FT_UInt       -- ^ kern_mode
    -> Ptr FT_Vector -- ^ akerning
    -> IO FT_Error



foreign import ccall "FT_Get_Track_Kerning"
  ft_Get_Track_Kerning'
    :: FT_Face      -- ^ face
    -> FT_Fixed     -- ^ point_size
    -> FT_Int       -- ^ degree
    -> Ptr FT_Fixed -- ^ akerning
    -> IO FT_Error



foreign import ccall "FT_Get_Glyph_Name"
  ft_Get_Glyph_Name'
    :: FT_Face     -- ^ face
    -> FT_UInt     -- ^ glyph_index
    -> FT_Pointer  -- ^ buffer
    -> FT_UInt     -- ^ buffer_max
    -> IO FT_Error



foreign import ccall "FT_Get_Postscript_Name"
  ft_Get_Postscript_Name'
    :: FT_Face               -- ^ face
    -> IO (Ptr #{type char})



foreign import ccall "FT_Select_Charmap"
  ft_Select_Charmap'
    :: FT_Face     -- ^ face
    -> FT_Encoding -- ^ encoding
    -> IO FT_Error



foreign import ccall "FT_Set_Charmap"
  ft_Set_Charmap'
    :: FT_Face     -- ^ face
    -> FT_CharMap  -- ^ charmap
    -> IO FT_Error



foreign import ccall "FT_Get_SubGlyph_Info"
  ft_Get_SubGlyph_Info'
    :: FT_GlyphSlot  -- ^ glyph
    -> FT_UInt       -- ^ sub_index
    -> Ptr FT_Int    -- ^ p_index
    -> Ptr FT_UInt   -- ^ p_flags
    -> Ptr FT_Int    -- ^ p_arg1
    -> Ptr FT_Int    -- ^ p_arg2
    -> Ptr FT_Matrix -- ^ p_transform
    -> IO FT_Error
