{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}

module Graphics.FreeType.Bindings.Core.Base
  ( FT_LibraryRec
  , FT_Library
  , FT_Face
  , FT_Size
  , FT_GlyphSlot
  , FT_CharMap

  , FT_Encoding
  , pattern FT_ENCODING_NONE
  , pattern FT_ENCODING_MS_SYMBOL
  , pattern FT_ENCODING_UNICODE
  , pattern FT_ENCODING_SJIS
  , pattern FT_ENCODING_PRC
  , pattern FT_ENCODING_BIG5
  , pattern FT_ENCODING_WANSUNG
  , pattern FT_ENCODING_JOHAB
  , pattern FT_ENCODING_GB2312
  , pattern FT_ENCODING_MS_SJIS
  , pattern FT_ENCODING_MS_GB2312
  , pattern FT_ENCODING_MS_BIG5
  , pattern FT_ENCODING_MS_WANSUNG
  , pattern FT_ENCODING_MS_JOHAB
  , pattern FT_ENCODING_ADOBE_STANDARD
  , pattern FT_ENCODING_ADOBE_EXPERT
  , pattern FT_ENCODING_ADOBE_CUSTOM
  , pattern FT_ENCODING_ADOBE_LATIN_1
  , pattern FT_ENCODING_OLD_LATIN_2
  , pattern FT_ENCODING_APPLE_ROMAN

  , FT_FaceRec (..)

  , FT_SizeRec (..)
  , FT_Size_Metrics (..)
  , FT_GlyphSlotRec (..)
  , FT_Glyph_Metrics (..)
  , FT_SubGlyphRec
  , FT_SubGlyph
  , FT_Bitmap_Size (..)

  , ft_Init_FreeType
  , ft_Done_FreeType
  , ft_New_Face
  , ft_Done_Face
  , ft_Reference_Face
  , ft_New_Memory_Face
  , ft_Face_Properties
  , ft_Open_Face

  , FT_Open_Args (..)
  , FT_Parameter (..)

  , ft_Attach_File
  , ft_Attach_Stream
  , ft_Set_Char_Size
  , ft_Set_Pixel_Sizes
  , ft_Request_Size
  , ft_Select_Size

  , FT_Size_Request_Type
  , pattern FT_SIZE_REQUEST_TYPE_NOMINAL
  , pattern FT_SIZE_REQUEST_TYPE_REAL_DIM
  , pattern FT_SIZE_REQUEST_TYPE_BBOX
  , pattern FT_SIZE_REQUEST_TYPE_CELL
  , pattern FT_SIZE_REQUEST_TYPE_SCALES
  
  , FT_Size_RequestRec (..)
  , FT_Size_Request

  , ft_Set_Transform
  , ft_Load_Glyph
  , ft_Get_Char_Index
  , ft_Get_First_Char
  , ft_Get_Next_Char
  , ft_Get_Name_Index
  , ft_Load_Char
  , ft_Render_Glyph

  , FT_Render_Mode
  , pattern FT_RENDER_MODE_NORMAL
  , pattern FT_RENDER_MODE_LIGHT
  , pattern FT_RENDER_MODE_MONO
  , pattern FT_RENDER_MODE_LCD
  , pattern FT_RENDER_MODE_LCD_V

  , ft_Get_Kerning

  , pattern FT_KERNING_DEFAULT
  , pattern FT_KERNING_UNFITTED
  , pattern FT_KERNING_UNSCALED
  
  , ft_Get_Track_Kerning
  , ft_Get_Glyph_Name
  , ft_Get_Postscript_Name

  , FT_CharMapRec (..)

  , ft_Select_Charmap
  , ft_Set_Charmap
  , ft_Get_Charmap_Index
  , ft_Get_FSType_Flags
  , ft_Get_SubGlyph_Info
  , FT_Face_Internal
  , FT_Size_Internal
  , FT_Slot_Internal

  , pattern FT_FACE_FLAG_SCALABLE
  , pattern FT_FACE_FLAG_FIXED_SIZES
  , pattern FT_FACE_FLAG_FIXED_WIDTH
  , pattern FT_FACE_FLAG_SFNT
  , pattern FT_FACE_FLAG_HORIZONTAL
  , pattern FT_FACE_FLAG_VERTICAL
  , pattern FT_FACE_FLAG_KERNING
  , pattern FT_FACE_FLAG_FAST_GLYPHS
  , pattern FT_FACE_FLAG_MULTIPLE_MASTERS
  , pattern FT_FACE_FLAG_GLYPH_NAMES
  , pattern FT_FACE_FLAG_EXTERNAL_STREAM
  , pattern FT_FACE_FLAG_HINTER
  , pattern FT_FACE_FLAG_CID_KEYED
  , pattern FT_FACE_FLAG_TRICKY
  , pattern FT_FACE_FLAG_COLOR
  , pattern FT_FACE_FLAG_VARIATION

  , pattern FT_STYLE_FLAG_ITALIC
  , pattern FT_STYLE_FLAG_BOLD

  , pattern FT_OPEN_MEMORY
  , pattern FT_OPEN_STREAM
  , pattern FT_OPEN_PATHNAME
  , pattern FT_OPEN_DRIVER
  , pattern FT_OPEN_PARAMS

  , pattern FT_LOAD_DEFAULT
  , pattern FT_LOAD_NO_SCALE
  , pattern FT_LOAD_NO_HINTING
  , pattern FT_LOAD_RENDER
  , pattern FT_LOAD_NO_BITMAP
  , pattern FT_LOAD_VERTICAL_LAYOUT
  , pattern FT_LOAD_FORCE_AUTOHINT
  , pattern FT_LOAD_CROP_BITMAP
  , pattern FT_LOAD_PEDANTIC
  , pattern FT_LOAD_IGNORE_GLOBAL_ADVANCE_WIDTH
  , pattern FT_LOAD_NO_RECURSE
  , pattern FT_LOAD_IGNORE_TRANSFORM
  , pattern FT_LOAD_MONOCHROME
  , pattern FT_LOAD_LINEAR_DESIGN
  , pattern FT_LOAD_NO_AUTOHINT
  , pattern FT_LOAD_COLOR
  , pattern FT_LOAD_COMPUTE_METRICS
  , pattern FT_LOAD_BITMAP_METRICS_ONLY

  , pattern FT_LOAD_TARGET_NORMAL
  , pattern FT_LOAD_TARGET_LIGHT
  , pattern FT_LOAD_TARGET_MONO
  , pattern FT_LOAD_TARGET_LCD
  , pattern FT_LOAD_TARGET_LCD_V

  , pattern FT_SUBGLYPH_FLAG_ARGS_ARE_WORDS
  , pattern FT_SUBGLYPH_FLAG_ARGS_ARE_XY_VALUES
  , pattern FT_SUBGLYPH_FLAG_ROUND_XY_TO_GRID
  , pattern FT_SUBGLYPH_FLAG_SCALE
  , pattern FT_SUBGLYPH_FLAG_XY_SCALE
  , pattern FT_SUBGLYPH_FLAG_2X2
  , pattern FT_SUBGLYPH_FLAG_USE_MY_METRICS

  , pattern FT_FSTYPE_INSTALLABLE_EMBEDDING
  , pattern FT_FSTYPE_RESTRICTED_LICENSE_EMBEDDING
  , pattern FT_FSTYPE_PREVIEW_AND_PRINT_EMBEDDING
  , pattern FT_FSTYPE_EDITABLE_EMBEDDING
  , pattern FT_FSTYPE_NO_SUBSETTING
  , pattern FT_FSTYPE_BITMAP_EMBEDDING_ONLY
  ) where

import           Graphics.FreeType.Bindings.Circular
import           Graphics.FreeType.Bindings.Core.Types

import           Foreign.C.Types
import           Foreign.Ptr
import           Foreign.Storable

#include "ft2build.h"
#include FT_FREETYPE_H

foreign import ccall "FT_Init_FreeType"
  ft_Init_FreeType :: Ptr FT_Library -> IO FT_Error



foreign import ccall "FT_Done_FreeType"
  ft_Done_FreeType :: FT_Library -> IO FT_Error



foreign import ccall "FT_New_Face"
  ft_New_Face :: FT_Library -> Ptr CChar -> FT_Long -> Ptr FT_Face -> IO FT_Error



foreign import ccall "FT_Done_Face"
  ft_Done_Face :: FT_Face -> IO FT_Error



foreign import ccall "FT_Reference_Face"
  ft_Reference_Face :: FT_Face -> IO FT_Error



foreign import ccall "FT_New_Memory_Face"
  ft_New_Memory_Face :: FT_Library -> Ptr FT_Byte -> FT_Long -> FT_Long -> Ptr FT_Face -> IO FT_Error



foreign import ccall "FT_Face_Properties"
  ft_Face_Properties :: FT_Face -> FT_UInt -> Ptr FT_Parameter -> IO FT_Error



foreign import ccall "FT_Open_Face"
  ft_Open_Face :: FT_Library -> Ptr FT_Open_Args -> FT_Long -> Ptr FT_Face -> IO FT_Error



data FT_Open_Args = FT_Open_Args
                      { oaFlags       :: FT_UInt
                      , oaMemory_base :: Ptr FT_Byte
                      , oaMemory_size :: FT_Long
                      , oaPathname    :: Ptr FT_String
                      , oaStream      :: FT_Stream
                      , oaDriver      :: FT_Module
                      , oaNum_params  :: FT_Int
                      , oaParams      :: Ptr FT_Parameter
                      }

instance Storable FT_Open_Args where
  sizeOf _    = #size      struct FT_Open_Args_
  alignment _ = #alignment struct FT_Open_Args_

  peek ptr =
    FT_Open_Args
      <$> #{peek struct FT_Open_Args_, flags      } ptr
      <*> #{peek struct FT_Open_Args_, memory_base} ptr
      <*> #{peek struct FT_Open_Args_, memory_size} ptr
      <*> #{peek struct FT_Open_Args_, pathname   } ptr
      <*> #{peek struct FT_Open_Args_, stream     } ptr
      <*> #{peek struct FT_Open_Args_, driver     } ptr
      <*> #{peek struct FT_Open_Args_, num_params } ptr
      <*> #{peek struct FT_Open_Args_, params     } ptr

  poke ptr val = do
    #{poke struct FT_Open_Args_, flags      } ptr $ oaFlags       val
    #{poke struct FT_Open_Args_, memory_base} ptr $ oaMemory_base val
    #{poke struct FT_Open_Args_, memory_size} ptr $ oaMemory_size val
    #{poke struct FT_Open_Args_, pathname   } ptr $ oaPathname    val
    #{poke struct FT_Open_Args_, stream     } ptr $ oaStream      val
    #{poke struct FT_Open_Args_, driver     } ptr $ oaDriver      val
    #{poke struct FT_Open_Args_, num_params } ptr $ oaNum_params  val
    #{poke struct FT_Open_Args_, params     } ptr $ oaParams      val



data FT_Parameter = FT_Parameter
                      { pTag  :: FT_ULong
                      , pData :: FT_Pointer
                      }

instance Storable FT_Parameter where
  sizeOf _    = #size      struct FT_Parameter_
  alignment _ = #alignment struct FT_Parameter_

  peek ptr =
    FT_Parameter
      <$> #{peek struct FT_Parameter_, tag } ptr
      <*> #{peek struct FT_Parameter_, data} ptr

  poke ptr val = do
    #{poke struct FT_Parameter_, tag } ptr $ pTag  val
    #{poke struct FT_Parameter_, data} ptr $ pData val



foreign import ccall "FT_Attach_File"
  ft_Attach_File :: FT_Face -> Ptr CChar -> IO FT_Error



foreign import ccall "FT_Attach_Stream"
  ft_Attach_Stream :: FT_Face -> Ptr FT_Open_Args -> IO FT_Error



foreign import ccall "FT_Set_Char_Size"
  ft_Set_Char_Size :: FT_Face -> FT_F26Dot6 -> FT_F26Dot6 -> FT_UInt -> FT_UInt -> IO FT_Error



foreign import ccall "FT_Set_Pixel_Sizes"
  ft_Set_Pixel_Sizes :: FT_Face -> FT_UInt -> FT_UInt -> IO FT_Error



foreign import ccall "FT_Request_Size"
  ft_Request_Size :: FT_Face -> FT_Size_Request -> IO FT_Error



foreign import ccall "FT_Select_Size"
  ft_Select_Size :: FT_Face -> FT_Int -> IO FT_Error



type FT_Size_Request_Type = FT_UInt

pattern FT_SIZE_REQUEST_TYPE_NOMINAL
      , FT_SIZE_REQUEST_TYPE_REAL_DIM
      , FT_SIZE_REQUEST_TYPE_BBOX
      , FT_SIZE_REQUEST_TYPE_CELL
      , FT_SIZE_REQUEST_TYPE_SCALES
     :: FT_Size_Request_Type
pattern FT_SIZE_REQUEST_TYPE_NOMINAL  = #const FT_SIZE_REQUEST_TYPE_NOMINAL
pattern FT_SIZE_REQUEST_TYPE_REAL_DIM = #const FT_SIZE_REQUEST_TYPE_REAL_DIM
pattern FT_SIZE_REQUEST_TYPE_BBOX     = #const FT_SIZE_REQUEST_TYPE_BBOX
pattern FT_SIZE_REQUEST_TYPE_CELL     = #const FT_SIZE_REQUEST_TYPE_CELL
pattern FT_SIZE_REQUEST_TYPE_SCALES   = #const FT_SIZE_REQUEST_TYPE_SCALES



data FT_Size_RequestRec = FT_Size_RequestRec
                            { srrType           :: FT_Size_Request_Type
                            , srrWidth          :: FT_Long
                            , srrHeight         :: FT_Long
                            , srrHoriResolution :: FT_UInt
                            , srrVertResolution :: FT_UInt
                            }

instance Storable FT_Size_RequestRec where
  sizeOf _    = #size      struct FT_Size_RequestRec_
  alignment _ = #alignment struct FT_Size_RequestRec_

  peek ptr =
    FT_Size_RequestRec
      <$> #{peek struct FT_Size_RequestRec_, type          } ptr
      <*> #{peek struct FT_Size_RequestRec_, width         } ptr
      <*> #{peek struct FT_Size_RequestRec_, height        } ptr
      <*> #{peek struct FT_Size_RequestRec_, horiResolution} ptr
      <*> #{peek struct FT_Size_RequestRec_, vertResolution} ptr

  poke ptr val = do
    #{poke struct FT_Size_RequestRec_, type          } ptr $  srrType           val
    #{poke struct FT_Size_RequestRec_, width         } ptr $  srrWidth          val
    #{poke struct FT_Size_RequestRec_, height        } ptr $  srrHeight         val
    #{poke struct FT_Size_RequestRec_, horiResolution} ptr $  srrHoriResolution val
    #{poke struct FT_Size_RequestRec_, vertResolution} ptr $  srrVertResolution val



type FT_Size_Request = Ptr FT_Size_RequestRec



foreign import ccall "FT_Set_Transform"
  ft_Set_Transform :: FT_Face -> Ptr FT_Matrix -> Ptr FT_Vector -> IO ()



foreign import ccall "FT_Load_Glyph"
  ft_Load_Glyph :: FT_Face -> FT_UInt -> FT_Int32 -> IO FT_Error



foreign import ccall "FT_Get_Char_Index"
  ft_Get_Char_Index :: FT_Face -> FT_ULong -> IO FT_UInt



foreign import ccall "FT_Get_First_Char"
  ft_Get_First_Char :: FT_Face -> Ptr FT_UInt -> IO FT_ULong



foreign import ccall "FT_Get_Next_Char"
  ft_Get_Next_Char :: FT_Face -> FT_ULong -> Ptr FT_UInt -> IO FT_ULong



foreign import ccall "FT_Get_Name_Index"
  ft_Get_Name_Index :: FT_Face -> Ptr FT_String -> IO FT_UInt



foreign import ccall "FT_Load_Char"
  ft_Load_Char :: FT_Face -> FT_ULong -> FT_Int32 -> IO FT_Error



foreign import ccall "FT_Render_Glyph"
  ft_Render_Glyph :: FT_GlyphSlot -> FT_Render_Mode -> IO FT_Error



type FT_Render_Mode = FT_UInt

pattern FT_RENDER_MODE_NORMAL
      , FT_RENDER_MODE_LIGHT
      , FT_RENDER_MODE_MONO
      , FT_RENDER_MODE_LCD
      , FT_RENDER_MODE_LCD_V
     :: FT_Render_Mode
pattern FT_RENDER_MODE_NORMAL = #const FT_RENDER_MODE_NORMAL
pattern FT_RENDER_MODE_LIGHT  = #const FT_RENDER_MODE_LIGHT
pattern FT_RENDER_MODE_MONO   = #const FT_RENDER_MODE_MONO
pattern FT_RENDER_MODE_LCD    = #const FT_RENDER_MODE_LCD
pattern FT_RENDER_MODE_LCD_V  = #const FT_RENDER_MODE_LCD_V



foreign import ccall "FT_Get_Kerning"
  ft_Get_Kerning :: FT_Face -> FT_UInt -> FT_UInt -> FT_UInt -> Ptr FT_Vector -> IO FT_Error



pattern FT_KERNING_DEFAULT
      , FT_KERNING_UNFITTED
      , FT_KERNING_UNSCALED
     :: FT_UInt
pattern FT_KERNING_DEFAULT  = #const FT_KERNING_DEFAULT
pattern FT_KERNING_UNFITTED = #const FT_KERNING_UNFITTED
pattern FT_KERNING_UNSCALED = #const FT_KERNING_UNSCALED



foreign import ccall "FT_Get_Track_Kerning"
  ft_Get_Track_Kerning :: FT_Face -> FT_Fixed -> FT_Int -> Ptr FT_Fixed -> IO FT_Error



foreign import ccall "FT_Get_Glyph_Name"
  ft_Get_Glyph_Name :: FT_Face -> FT_UInt -> FT_Pointer -> FT_UInt -> IO FT_Error



foreign import ccall "FT_Get_Postscript_Name"
  ft_Get_Postscript_Name :: FT_Face -> IO (Ptr CChar)



foreign import ccall "FT_Select_Charmap"
  ft_Select_Charmap :: FT_Face -> FT_Encoding -> IO FT_Error



foreign import ccall "FT_Set_Charmap"
  ft_Set_Charmap :: FT_Face -> FT_CharMap -> IO FT_Error



foreign import ccall "FT_Get_Charmap_Index"
  ft_Get_Charmap_Index :: FT_CharMap -> IO FT_Int



foreign import ccall "FT_Get_FSType_Flags"
  ft_Get_FSType_Flags :: FT_Face -> IO FT_UShort



foreign import ccall "FT_Get_SubGlyph_Info"
  ft_Get_SubGlyph_Info :: FT_GlyphSlot -> FT_UInt -> Ptr FT_Int -> Ptr FT_UInt -> Ptr FT_Int -> Ptr FT_Int -> Ptr FT_Matrix -> IO FT_Error



pattern FT_FACE_FLAG_SCALABLE
      , FT_FACE_FLAG_FIXED_SIZES
      , FT_FACE_FLAG_FIXED_WIDTH
      , FT_FACE_FLAG_SFNT
      , FT_FACE_FLAG_HORIZONTAL
      , FT_FACE_FLAG_VERTICAL
      , FT_FACE_FLAG_KERNING
      , FT_FACE_FLAG_FAST_GLYPHS
      , FT_FACE_FLAG_MULTIPLE_MASTERS
      , FT_FACE_FLAG_GLYPH_NAMES
      , FT_FACE_FLAG_EXTERNAL_STREAM
      , FT_FACE_FLAG_HINTER
      , FT_FACE_FLAG_CID_KEYED
      , FT_FACE_FLAG_TRICKY
      , FT_FACE_FLAG_COLOR
      , FT_FACE_FLAG_VARIATION
     :: FT_UInt
pattern FT_FACE_FLAG_SCALABLE         = #const FT_FACE_FLAG_SCALABLE
pattern FT_FACE_FLAG_FIXED_SIZES      = #const FT_FACE_FLAG_FIXED_SIZES
pattern FT_FACE_FLAG_FIXED_WIDTH      = #const FT_FACE_FLAG_FIXED_WIDTH
pattern FT_FACE_FLAG_SFNT             = #const FT_FACE_FLAG_SFNT
pattern FT_FACE_FLAG_HORIZONTAL       = #const FT_FACE_FLAG_HORIZONTAL
pattern FT_FACE_FLAG_VERTICAL         = #const FT_FACE_FLAG_VERTICAL
pattern FT_FACE_FLAG_KERNING          = #const FT_FACE_FLAG_KERNING
pattern FT_FACE_FLAG_FAST_GLYPHS      = #const FT_FACE_FLAG_FAST_GLYPHS
pattern FT_FACE_FLAG_MULTIPLE_MASTERS = #const FT_FACE_FLAG_MULTIPLE_MASTERS
pattern FT_FACE_FLAG_GLYPH_NAMES      = #const FT_FACE_FLAG_GLYPH_NAMES
pattern FT_FACE_FLAG_EXTERNAL_STREAM  = #const FT_FACE_FLAG_EXTERNAL_STREAM
pattern FT_FACE_FLAG_HINTER           = #const FT_FACE_FLAG_HINTER
pattern FT_FACE_FLAG_CID_KEYED        = #const FT_FACE_FLAG_CID_KEYED
pattern FT_FACE_FLAG_TRICKY           = #const FT_FACE_FLAG_TRICKY
pattern FT_FACE_FLAG_COLOR            = #const FT_FACE_FLAG_COLOR
pattern FT_FACE_FLAG_VARIATION        = #const FT_FACE_FLAG_VARIATION



pattern FT_STYLE_FLAG_ITALIC
      , FT_STYLE_FLAG_BOLD
     :: FT_UInt
pattern FT_STYLE_FLAG_ITALIC = #const FT_STYLE_FLAG_ITALIC
pattern FT_STYLE_FLAG_BOLD   = #const FT_STYLE_FLAG_BOLD



pattern FT_OPEN_MEMORY
      , FT_OPEN_STREAM
      , FT_OPEN_PATHNAME
      , FT_OPEN_DRIVER
      , FT_OPEN_PARAMS
     :: FT_UInt
pattern FT_OPEN_MEMORY   = #const FT_OPEN_MEMORY
pattern FT_OPEN_STREAM   = #const FT_OPEN_STREAM
pattern FT_OPEN_PATHNAME = #const FT_OPEN_PATHNAME
pattern FT_OPEN_DRIVER   = #const FT_OPEN_DRIVER
pattern FT_OPEN_PARAMS   = #const FT_OPEN_PARAMS



pattern FT_LOAD_DEFAULT
      , FT_LOAD_NO_SCALE
      , FT_LOAD_NO_HINTING
      , FT_LOAD_RENDER
      , FT_LOAD_NO_BITMAP
      , FT_LOAD_VERTICAL_LAYOUT
      , FT_LOAD_FORCE_AUTOHINT
      , FT_LOAD_CROP_BITMAP
      , FT_LOAD_PEDANTIC
      , FT_LOAD_IGNORE_GLOBAL_ADVANCE_WIDTH
      , FT_LOAD_NO_RECURSE
      , FT_LOAD_IGNORE_TRANSFORM
      , FT_LOAD_MONOCHROME
      , FT_LOAD_LINEAR_DESIGN
      , FT_LOAD_NO_AUTOHINT
      , FT_LOAD_COLOR
      , FT_LOAD_COMPUTE_METRICS
      , FT_LOAD_BITMAP_METRICS_ONLY
     :: FT_Int32
pattern FT_LOAD_DEFAULT                     = #const FT_LOAD_DEFAULT
pattern FT_LOAD_NO_SCALE                    = #const FT_LOAD_NO_SCALE
pattern FT_LOAD_NO_HINTING                  = #const FT_LOAD_NO_HINTING
pattern FT_LOAD_RENDER                      = #const FT_LOAD_RENDER
pattern FT_LOAD_NO_BITMAP                   = #const FT_LOAD_NO_BITMAP
pattern FT_LOAD_VERTICAL_LAYOUT             = #const FT_LOAD_VERTICAL_LAYOUT
pattern FT_LOAD_FORCE_AUTOHINT              = #const FT_LOAD_FORCE_AUTOHINT
pattern FT_LOAD_CROP_BITMAP                 = #const FT_LOAD_CROP_BITMAP
pattern FT_LOAD_PEDANTIC                    = #const FT_LOAD_PEDANTIC
pattern FT_LOAD_IGNORE_GLOBAL_ADVANCE_WIDTH = #const FT_LOAD_IGNORE_GLOBAL_ADVANCE_WIDTH
pattern FT_LOAD_NO_RECURSE                  = #const FT_LOAD_NO_RECURSE
pattern FT_LOAD_IGNORE_TRANSFORM            = #const FT_LOAD_IGNORE_TRANSFORM
pattern FT_LOAD_MONOCHROME                  = #const FT_LOAD_MONOCHROME
pattern FT_LOAD_LINEAR_DESIGN               = #const FT_LOAD_LINEAR_DESIGN
pattern FT_LOAD_NO_AUTOHINT                 = #const FT_LOAD_NO_AUTOHINT
pattern FT_LOAD_COLOR                       = #const FT_LOAD_COLOR
pattern FT_LOAD_COMPUTE_METRICS             = #const FT_LOAD_COMPUTE_METRICS
pattern FT_LOAD_BITMAP_METRICS_ONLY         = #const FT_LOAD_BITMAP_METRICS_ONLY



pattern FT_LOAD_TARGET_NORMAL
      , FT_LOAD_TARGET_LIGHT
      , FT_LOAD_TARGET_MONO
      , FT_LOAD_TARGET_LCD
      , FT_LOAD_TARGET_LCD_V
     :: FT_Int32
pattern FT_LOAD_TARGET_NORMAL = #const FT_LOAD_TARGET_NORMAL
pattern FT_LOAD_TARGET_LIGHT  = #const FT_LOAD_TARGET_LIGHT
pattern FT_LOAD_TARGET_MONO   = #const FT_LOAD_TARGET_MONO
pattern FT_LOAD_TARGET_LCD    = #const FT_LOAD_TARGET_LCD
pattern FT_LOAD_TARGET_LCD_V  = #const FT_LOAD_TARGET_LCD_V



pattern FT_SUBGLYPH_FLAG_ARGS_ARE_WORDS
      , FT_SUBGLYPH_FLAG_ARGS_ARE_XY_VALUES
      , FT_SUBGLYPH_FLAG_ROUND_XY_TO_GRID
      , FT_SUBGLYPH_FLAG_SCALE
      , FT_SUBGLYPH_FLAG_XY_SCALE
      , FT_SUBGLYPH_FLAG_2X2
      , FT_SUBGLYPH_FLAG_USE_MY_METRICS
     :: FT_Int32
pattern FT_SUBGLYPH_FLAG_ARGS_ARE_WORDS     = #const FT_SUBGLYPH_FLAG_ARGS_ARE_WORDS
pattern FT_SUBGLYPH_FLAG_ARGS_ARE_XY_VALUES = #const FT_SUBGLYPH_FLAG_ARGS_ARE_XY_VALUES
pattern FT_SUBGLYPH_FLAG_ROUND_XY_TO_GRID   = #const FT_SUBGLYPH_FLAG_ROUND_XY_TO_GRID
pattern FT_SUBGLYPH_FLAG_SCALE              = #const FT_SUBGLYPH_FLAG_SCALE
pattern FT_SUBGLYPH_FLAG_XY_SCALE           = #const FT_SUBGLYPH_FLAG_XY_SCALE
pattern FT_SUBGLYPH_FLAG_2X2                = #const FT_SUBGLYPH_FLAG_2X2
pattern FT_SUBGLYPH_FLAG_USE_MY_METRICS     = #const FT_SUBGLYPH_FLAG_USE_MY_METRICS



pattern FT_FSTYPE_INSTALLABLE_EMBEDDING
      , FT_FSTYPE_RESTRICTED_LICENSE_EMBEDDING
      , FT_FSTYPE_PREVIEW_AND_PRINT_EMBEDDING
      , FT_FSTYPE_EDITABLE_EMBEDDING
      , FT_FSTYPE_NO_SUBSETTING
      , FT_FSTYPE_BITMAP_EMBEDDING_ONLY
     :: FT_Int32
pattern FT_FSTYPE_INSTALLABLE_EMBEDDING        = #const FT_FSTYPE_INSTALLABLE_EMBEDDING
pattern FT_FSTYPE_RESTRICTED_LICENSE_EMBEDDING = #const FT_FSTYPE_RESTRICTED_LICENSE_EMBEDDING
pattern FT_FSTYPE_PREVIEW_AND_PRINT_EMBEDDING  = #const FT_FSTYPE_PREVIEW_AND_PRINT_EMBEDDING
pattern FT_FSTYPE_EDITABLE_EMBEDDING           = #const FT_FSTYPE_EDITABLE_EMBEDDING
pattern FT_FSTYPE_NO_SUBSETTING                = #const FT_FSTYPE_NO_SUBSETTING
pattern FT_FSTYPE_BITMAP_EMBEDDING_ONLY        = #const FT_FSTYPE_BITMAP_EMBEDDING_ONLY
