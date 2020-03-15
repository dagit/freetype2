{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}

{- | Please refer to the
     [Core API > Base Interface](https://www.freetype.org/freetype2/docs/reference/ft2-base_interface.html)
     chapter of the reference.

     Internal: "FreeType.Core.Base.Internal".
-}

module FreeType.Core.Base
  ( -- ** FT_Library
    FT_Library
    -- ** FT_Face
  , FT_Face
    -- ** FT_Size
  , FT_Size
    -- ** FT_GlyphSlot
  , FT_GlyphSlot
    -- ** FT_CharMap
  , FT_CharMap
    -- ** FT_Encoding
  , FT_Encoding
  , pattern FT_ENCODING_NONE
  , pattern FT_ENCODING_MS_SYMBOL
  , pattern FT_ENCODING_UNICODE
  , pattern FT_ENCODING_SJIS
  , pattern FT_ENCODING_PRC
  , pattern FT_ENCODING_BIG5
  , pattern FT_ENCODING_WANSUNG
  , pattern FT_ENCODING_JOHAB
  , pattern FT_ENCODING_ADOBE_STANDARD
  , pattern FT_ENCODING_ADOBE_EXPERT
  , pattern FT_ENCODING_ADOBE_CUSTOM
  , pattern FT_ENCODING_ADOBE_LATIN_1
  , pattern FT_ENCODING_OLD_LATIN_2
  , pattern FT_ENCODING_APPLE_ROMAN
    -- ** FT_ENC_TAG
    -- | [FT_ENC_TAG](https://www.freetype.org/freetype2/docs/reference/ft2-base_interface.html#ft_enc_tag) is the same as [FT_IMAGE_TAG](https://www.freetype.org/freetype2/docs/reference/ft2-basic_types.html#ft_image_tag). See 'FT_MAKE_TAG'
    -- ** FT_FaceRec
  , FT_FaceRec (..)
    -- ** FT_HAS_HORIZONTAL
  , pattern FT_HAS_HORIZONTAL
    -- ** FT_HAS_VERTICAL
  , pattern FT_HAS_VERTICAL
    -- ** FT_HAS_KERNING
  , pattern FT_HAS_KERNING
    -- ** FT_HAS_FIXED_SIZES
  , pattern FT_HAS_FIXED_SIZES
    -- ** FT_HAS_GLYPH_NAMES
  , pattern FT_HAS_GLYPH_NAMES
    -- ** FT_HAS_COLOR
  , pattern FT_HAS_COLOR
    -- ** FT_HAS_MULTIPLE_MASTERS
  , pattern FT_HAS_MULTIPLE_MASTERS
    -- ** FT_IS_SFNT
  , pattern FT_IS_SFNT
    -- ** FT_IS_SCALABLE
  , pattern FT_IS_SCALABLE
    -- ** FT_IS_FIXED_WIDTH
  , pattern FT_IS_FIXED_WIDTH
    -- ** FT_IS_CID_KEYED
  , pattern FT_IS_CID_KEYED
    -- ** FT_IS_TRICKY
  , pattern FT_IS_TRICKY
    -- ** FT_IS_NAMED_INSTANCE
  , pattern FT_IS_NAMED_INSTANCE
    -- ** FT_IS_VARIATION
  , pattern FT_IS_VARIATION
    -- ** FT_SizeRec
  , FT_SizeRec (..)
    -- ** FT_Size_Metrics
  , FT_Size_Metrics (..)
    -- ** FT_GlyphSlotRec
  , FT_GlyphSlotRec (..)
    -- ** FT_Glyph_Metrics
  , FT_Glyph_Metrics (..)
    -- ** FT_SubGlyph
  , FT_SubGlyph
    -- ** FT_Bitmap_Size
  , FT_Bitmap_Size (..)
    -- ** FT_Init_FreeType
  , ft_Init_FreeType
  , ft_With_FreeType
    -- ** FT_Done_FreeType
  , ft_Done_FreeType
    -- ** FT_New_Face
  , ft_New_Face
  , ft_With_Face
    -- ** FT_Done_Face
  , ft_Done_Face
    -- ** FT_Reference_Face
  , ft_Reference_Face
    -- ** FT_New_Memory_Face
  , ft_New_Memory_Face
  , ft_With_Memory_Face
    -- ** FT_Face_Properties
  , ft_Face_Properties
    -- ** FT_Open_Face
  , ft_Open_Face
    -- ** FT_Open_Args
  , FT_Open_Args (..)
    -- ** FT_Parameter
  , FT_Parameter (..)
    -- ** FT_Attach_File
  , ft_Attach_File
    -- ** FT_Attach_Stream
  , ft_Attach_Stream
    -- ** FT_Set_Char_Size
  , ft_Set_Char_Size
    -- ** FT_Set_Pixel_Sizes
  , ft_Set_Pixel_Sizes
    -- ** FT_Request_Size
  , ft_Request_Size
    -- ** FT_Select_Size
  , ft_Select_Size
    -- ** FT_Size_Request_Type
  , FT_Size_Request_Type
  , pattern FT_SIZE_REQUEST_TYPE_NOMINAL
  , pattern FT_SIZE_REQUEST_TYPE_REAL_DIM
  , pattern FT_SIZE_REQUEST_TYPE_BBOX
  , pattern FT_SIZE_REQUEST_TYPE_CELL
  , pattern FT_SIZE_REQUEST_TYPE_SCALES
    -- ** FT_Size_RequestRec
  , FT_Size_RequestRec (..)
    -- ** FT_Size_Request
  , FT_Size_Request
    -- ** FT_Set_Transform
  , ft_Set_Transform
    -- ** FT_Load_Glyph
  , ft_Load_Glyph
    -- ** FT_Get_Char_Index
  , ft_Get_Char_Index
    -- ** FT_Get_First_Char
    -- | Fused into 'ft_Get_Next_Char'.

    -- ** FT_Get_Next_Char
  , ft_Get_Next_Char
    -- ** FT_Get_Name_Index
  , ft_Get_Name_Index
    -- ** FT_Load_Char
  , ft_Load_Char
    -- ** FT_LOAD_TARGET_MODE
  , pattern FT_LOAD_TARGET_MODE
    -- ** FT_Render_Glyph
  , ft_Render_Glyph
    -- ** FT_Render_Mode
  , FT_Render_Mode
  , pattern FT_RENDER_MODE_NORMAL
  , pattern FT_RENDER_MODE_LIGHT
  , pattern FT_RENDER_MODE_MONO
  , pattern FT_RENDER_MODE_LCD
  , pattern FT_RENDER_MODE_LCD_V
    -- ** FT_Get_Kerning
  , ft_Get_Kerning
    -- ** FT_Kerning_Mode
  , FT_Kerning_Mode
  , pattern FT_KERNING_DEFAULT
  , pattern FT_KERNING_UNFITTED
  , pattern FT_KERNING_UNSCALED
    -- ** FT_Get_Track_Kerning
  , ft_Get_Track_Kerning
    -- ** FT_Get_Glyph_Name
  , ft_Get_Glyph_Name
    -- ** FT_Get_Postscript_Name
  , ft_Get_Postscript_Name
    -- ** FT_CharMapRec
  , FT_CharMapRec (..)
    -- ** FT_Select_Charmap
  , ft_Select_Charmap
    -- ** FT_Set_Charmap
  , ft_Set_Charmap
    -- ** FT_Get_Charmap_Index
  , ft_Get_Charmap_Index
    -- ** FT_Get_FSType_Flags
  , ft_Get_FSType_Flags
    -- ** FT_Get_SubGlyph_Info
  , ft_Get_SubGlyph_Info
    -- ** FT_Face_Internal
  , FT_Face_Internal
    -- ** FT_Size_Internal
  , FT_Size_Internal
    -- ** FT_Slot_Internal
  , FT_Slot_Internal
    -- ** FT_FACE_FLAG_XXX
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
    -- ** FT_STYLE_FLAG_XXX
  , pattern FT_STYLE_FLAG_ITALIC
  , pattern FT_STYLE_FLAG_BOLD
    -- ** FT_OPEN_XXX
  , pattern FT_OPEN_MEMORY
  , pattern FT_OPEN_STREAM
  , pattern FT_OPEN_PATHNAME
  , pattern FT_OPEN_DRIVER
  , pattern FT_OPEN_PARAMS
    -- ** FT_LOAD_XXX
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
    -- ** FT_LOAD_TARGET_XXX
  , pattern FT_LOAD_TARGET_NORMAL
  , pattern FT_LOAD_TARGET_LIGHT
  , pattern FT_LOAD_TARGET_MONO
  , pattern FT_LOAD_TARGET_LCD
  , pattern FT_LOAD_TARGET_LCD_V
    -- ** FT_SUBGLYPH_FLAG_XXX
  , pattern FT_SUBGLYPH_FLAG_ARGS_ARE_WORDS
  , pattern FT_SUBGLYPH_FLAG_ARGS_ARE_XY_VALUES
  , pattern FT_SUBGLYPH_FLAG_ROUND_XY_TO_GRID
  , pattern FT_SUBGLYPH_FLAG_SCALE
  , pattern FT_SUBGLYPH_FLAG_XY_SCALE
  , pattern FT_SUBGLYPH_FLAG_2X2
  , pattern FT_SUBGLYPH_FLAG_USE_MY_METRICS
    -- ** FT_FSTYPE_XXX
  , pattern FT_FSTYPE_INSTALLABLE_EMBEDDING
  , pattern FT_FSTYPE_RESTRICTED_LICENSE_EMBEDDING
  , pattern FT_FSTYPE_PREVIEW_AND_PRINT_EMBEDDING
  , pattern FT_FSTYPE_EDITABLE_EMBEDDING
  , pattern FT_FSTYPE_NO_SUBSETTING
  , pattern FT_FSTYPE_BITMAP_EMBEDDING_ONLY
    -- ** FT_HAS_FAST_GLYPHS
    -- | Deprecated: 'FT_HAS_FAST_GLYPHS'.
  ) where

import           FreeType.Core.Base.Internal
import           FreeType.Core.Base.Types
import           FreeType.Core.Types.Types
import           FreeType.Exception.Internal

import           Control.Exception
import           Data.Bits
import           Foreign.C.String
import           Foreign.Marshal
import           Foreign.Ptr
import           Foreign.Storable

#include "ft2build.h"
#include FT_FREETYPE_H



pattern FT_HAS_HORIZONTAL :: FT_Face -> IO Bool
pattern FT_HAS_HORIZONTAL <- _
  where
    FT_HAS_HORIZONTAL face = do
      face' <- peek face
      case FT_FACE_FLAG_HORIZONTAL .&. frFace_flags face' of
        0 -> return False
        _ -> return True



pattern FT_HAS_VERTICAL :: FT_Face -> IO Bool
pattern FT_HAS_VERTICAL <- _
  where
    FT_HAS_VERTICAL face = do
      face' <- peek face
      case FT_FACE_FLAG_VERTICAL .&. frFace_flags face' of
        0 -> return False
        _ -> return True



pattern FT_HAS_KERNING :: FT_Face -> IO Bool
pattern FT_HAS_KERNING <- _
  where
    FT_HAS_KERNING face = do
      face' <- peek face
      case FT_FACE_FLAG_KERNING .&. frFace_flags face' of
        0 -> return False
        _ -> return True



pattern FT_HAS_FIXED_SIZES :: FT_Face -> IO Bool
pattern FT_HAS_FIXED_SIZES <- _
  where
    FT_HAS_FIXED_SIZES face = do
      face' <- peek face
      case FT_FACE_FLAG_FIXED_SIZES .&. frFace_flags face' of
        0 -> return False
        _ -> return True



pattern FT_HAS_GLYPH_NAMES :: FT_Face -> IO Bool
pattern FT_HAS_GLYPH_NAMES <- _
  where
    FT_HAS_GLYPH_NAMES face = do
      face' <- peek face
      case FT_FACE_FLAG_GLYPH_NAMES .&. frFace_flags face' of
        0 -> return False
        _ -> return True



pattern FT_HAS_COLOR :: FT_Face -> IO Bool
pattern FT_HAS_COLOR <- _
  where
    FT_HAS_COLOR face = do
      face' <- peek face
      case FT_FACE_FLAG_COLOR .&. frFace_flags face' of
        0 -> return False
        _ -> return True



pattern FT_HAS_MULTIPLE_MASTERS :: FT_Face -> IO Bool
pattern FT_HAS_MULTIPLE_MASTERS <- _
  where
    FT_HAS_MULTIPLE_MASTERS face = do
      face' <- peek face
      case FT_FACE_FLAG_MULTIPLE_MASTERS .&. frFace_flags face' of
        0 -> return False
        _ -> return True



pattern FT_IS_SFNT :: FT_Face -> IO Bool
pattern FT_IS_SFNT <- _
  where
    FT_IS_SFNT face = do
      face' <- peek face
      case FT_FACE_FLAG_SFNT .&. frFace_flags face' of
        0 -> return False
        _ -> return True



pattern FT_IS_SCALABLE :: FT_Face -> IO Bool
pattern FT_IS_SCALABLE <- _
  where
    FT_IS_SCALABLE face = do
      face' <- peek face
      case FT_FACE_FLAG_SCALABLE .&. frFace_flags face' of
        0 -> return False
        _ -> return True



pattern FT_IS_FIXED_WIDTH :: FT_Face -> IO Bool
pattern FT_IS_FIXED_WIDTH <- _
  where
    FT_IS_FIXED_WIDTH face = do
      face' <- peek face
      case FT_FACE_FLAG_FIXED_WIDTH .&. frFace_flags face' of
        0 -> return False
        _ -> return True



pattern FT_IS_CID_KEYED :: FT_Face -> IO Bool
pattern FT_IS_CID_KEYED <- _
  where
    FT_IS_CID_KEYED face = do
      face' <- peek face
      case FT_FACE_FLAG_CID_KEYED .&. frFace_flags face' of
        0 -> return False
        _ -> return True



pattern FT_IS_TRICKY :: FT_Face -> IO Bool
pattern FT_IS_TRICKY <- _
  where
    FT_IS_TRICKY face = do
      face' <- peek face
      case FT_FACE_FLAG_TRICKY .&. frFace_flags face' of
        0 -> return False
        _ -> return True



pattern FT_IS_NAMED_INSTANCE :: FT_Face -> IO Bool
pattern FT_IS_NAMED_INSTANCE <- _
  where
    FT_IS_NAMED_INSTANCE face = do
      face' <- peek face
      case 0x7FFF0000 .&. frFace_flags face' of
        0 -> return False
        _ -> return True



pattern FT_IS_VARIATION :: FT_Face -> IO Bool
pattern FT_IS_VARIATION <- _
  where
    FT_IS_VARIATION face = do
      face' <- peek face
      case FT_FACE_FLAG_VARIATION .&. frFace_flags face' of
        0 -> return False
        _ -> return True



ft_Init_FreeType :: IO FT_Library -- ^ library
ft_Init_FreeType =
  autoAllocaError "ft_Init_FreeType" ft_Init_FreeType'



-- | 'bracket' over 'ft_Init_FreeType' and 'ft_Done_FreeType'.
--
--   The provided 'FT_Library' should not be used after this function terminates.
ft_With_FreeType :: (FT_Library -> IO a) -> IO a
ft_With_FreeType =
  bracket ft_Init_FreeType ft_Done_FreeType


ft_Done_FreeType
  :: FT_Library -- ^ library
  -> IO ()
ft_Done_FreeType =
  autoError "ft_Done_FreeType" ft_Done_FreeType'



ft_New_Face
  :: FT_Library -- ^ library
  -> FilePath   -- ^ filepathname
  -> FT_Long    -- ^ face_index
  -> IO FT_Face -- ^ face
ft_New_Face lib path index =
  withCString path $ \pathPtr ->
    alloca $ \facePtr -> do
      ftError "ft_New_Face" $ ft_New_Face' lib (castPtr pathPtr) index facePtr
      peek facePtr



-- | 'bracket' over 'ft_New_Face' and 'ft_Done_Face'.
--
--   The provided 'FT_Face' should not be used after this function terminates.
ft_With_Face
  :: FT_Library        -- ^ library
  -> FilePath          -- ^ filepathname
  -> FT_Long           -- ^ face_index
  -> (FT_Face -> IO a)
  -> IO a
ft_With_Face lib path index = bracket (ft_New_Face lib path index) ft_Done_Face



ft_Done_Face
  :: FT_Face -- ^ face
  -> IO ()
ft_Done_Face =
  autoError "ft_Done_Face" ft_Done_Face'



ft_Reference_Face
  :: FT_Face -- ^ face
  -> IO ()
ft_Reference_Face =
  autoError "ft_Reference_Face" ft_Reference_Face'



ft_New_Memory_Face
  :: FT_Library  -- ^ library
  -> Ptr FT_Byte -- ^ file_base
  -> FT_Long     -- ^ file_size
  -> FT_Long     -- ^ face_index
  -> IO FT_Face  -- ^ face
ft_New_Memory_Face =
  autoAllocaError "ft_New_Memory_Face" ft_New_Memory_Face'



-- | 'bracket' over 'ft_New_Memory_Face' and 'ft_Done_Face'.
--
--   The provided 'FT_Face' should not be used after this function terminates.
ft_With_Memory_Face
  :: FT_Library        -- ^ library
  -> Ptr FT_Byte       -- ^ file_base
  -> FT_Long           -- ^ file_size
  -> FT_Long           -- ^ face_index
  -> (FT_Face -> IO a)
  -> IO a
ft_With_Memory_Face lib base size index =
  bracket (ft_New_Memory_Face lib base size index) ft_Done_Face



ft_Face_Properties
  :: FT_Face          -- ^ face
  -> FT_UInt          -- ^ num_properties
  -> Ptr FT_Parameter -- ^ properties
  -> IO ()
ft_Face_Properties =
  autoError "ft_Face_Properties" ft_Face_Properties'



ft_Open_Face
  :: FT_Library       -- ^ library
  -> Ptr FT_Open_Args -- ^ args
  -> FT_Long          -- ^ face_index
  -> IO FT_Face       -- ^ face
ft_Open_Face =
  autoAllocaError "ft_Open_Face" ft_Open_Face'



ft_Attach_File
  :: FT_Face  -- ^ face
  -> FilePath -- ^ filepathname
  -> IO ()
ft_Attach_File face path =
  withCString path $
    ftError "ft_Attach_File" . ft_Attach_File' face . castPtr



ft_Attach_Stream
  :: FT_Face          -- ^ face
  -> Ptr FT_Open_Args -- ^ parameters
  -> IO ()
ft_Attach_Stream =
  autoError "ft_Attach_Stream" ft_Attach_Stream'




ft_Set_Char_Size
  :: FT_Face    -- ^ face
  -> FT_F26Dot6 -- ^ char_width
  -> FT_F26Dot6 -- ^ char_height
  -> FT_UInt    -- ^ horz_resolution
  -> FT_UInt    -- ^ vert_resolution
  -> IO ()
ft_Set_Char_Size =
  autoError "ft_Set_Char_Size" ft_Set_Char_Size'



ft_Set_Pixel_Sizes
  :: FT_Face -- ^ face
  -> FT_UInt -- ^ pixel_width
  -> FT_UInt -- ^ pixel_height
  -> IO ()
ft_Set_Pixel_Sizes =
  autoError "ft_Set_Pixel_Sizes" ft_Set_Pixel_Sizes'



ft_Request_Size
  :: FT_Face         -- ^ face
  -> FT_Size_Request -- ^ req
  -> IO ()
ft_Request_Size =
  autoError "ft_Request_Size" ft_Request_Size'



ft_Select_Size
  :: FT_Face -- ^ face
  -> FT_Int  -- ^ strike_index
  -> IO ()
ft_Select_Size =
  autoError "ft_Select_Size" ft_Select_Size'



pattern FT_SIZE_REQUEST_TYPE_NOMINAL
      , FT_SIZE_REQUEST_TYPE_REAL_DIM
      , FT_SIZE_REQUEST_TYPE_BBOX
      , FT_SIZE_REQUEST_TYPE_CELL
      , FT_SIZE_REQUEST_TYPE_SCALES
     :: (Eq a, Num a) => a
pattern FT_SIZE_REQUEST_TYPE_NOMINAL  = #const FT_SIZE_REQUEST_TYPE_NOMINAL
pattern FT_SIZE_REQUEST_TYPE_REAL_DIM = #const FT_SIZE_REQUEST_TYPE_REAL_DIM
pattern FT_SIZE_REQUEST_TYPE_BBOX     = #const FT_SIZE_REQUEST_TYPE_BBOX
pattern FT_SIZE_REQUEST_TYPE_CELL     = #const FT_SIZE_REQUEST_TYPE_CELL
pattern FT_SIZE_REQUEST_TYPE_SCALES   = #const FT_SIZE_REQUEST_TYPE_SCALES



ft_Set_Transform
  :: FT_Face         -- ^ face
  -> Maybe FT_Matrix -- ^ matrix
  -> Maybe FT_Vector -- ^ delta
  -> IO ()
ft_Set_Transform face mayMat mayVec =
  let mayAlloca Nothing    = ($ nullPtr)
      mayAlloca (Just val) = with val
  in mayAlloca mayMat $ \matPtr ->
       mayAlloca mayVec $
         ft_Set_Transform' face matPtr



ft_Load_Glyph
  :: FT_Face  -- ^ face
  -> FT_UInt  -- ^ glyph_index
  -> FT_Int32 -- ^ load_flags
  -> IO ()
ft_Load_Glyph =
  autoError "ft_Load_Glyph" $ ft_Load_Glyph'



foreign import ccall "FT_Get_Char_Index"
  ft_Get_Char_Index
    :: FT_Face    -- ^ face
    -> FT_ULong   -- ^ charcode
    -> IO FT_UInt



-- | When @charcode@ is:
--
--     * @Nothing@ — behaves like 'ft_Get_First_Char''
--     * @Just _ @ — behaves like 'ft_Get_Next_Char''
ft_Get_Next_Char
  :: FT_Face                -- ^ face
  -> Maybe FT_ULong         -- ^ charcode
  -> IO (FT_ULong, FT_UInt) -- ^ (charcode, gindex)
ft_Get_Next_Char face Nothing =
  alloca $ \ptr ->
    (,)
      <$> ft_Get_First_Char' face ptr
      <*> peek ptr

ft_Get_Next_Char face (Just code) =
  alloca $ \ptr ->
    (,)
      <$> ft_Get_Next_Char' face code ptr
      <*> peek ptr



foreign import ccall "FT_Get_Name_Index"
  ft_Get_Name_Index
    :: FT_Face       -- ^ face
    -> Ptr FT_String -- ^ glyph_name
    -> IO FT_UInt



ft_Load_Char
  :: FT_Face  -- ^ face
  -> FT_ULong -- ^ char_code
  -> FT_Int32 -- ^ load_flags
  -> IO ()
ft_Load_Char =
  autoError "ft_Load_Char" ft_Load_Char'



pattern FT_LOAD_TARGET_MODE :: FT_Int32 -> FT_Render_Mode
pattern FT_LOAD_TARGET_MODE <- _
  where
    FT_LOAD_TARGET_MODE x = fromIntegral $ (x `shiftR` 16) .&. 15




ft_Render_Glyph
  :: FT_GlyphSlot   -- ^ slot
  -> FT_Render_Mode -- ^ render_mode
  -> IO ()
ft_Render_Glyph =
  autoError "ft_Render_Glyph" ft_Render_Glyph'



pattern FT_RENDER_MODE_NORMAL
      , FT_RENDER_MODE_LIGHT
      , FT_RENDER_MODE_MONO
      , FT_RENDER_MODE_LCD
      , FT_RENDER_MODE_LCD_V
     :: (Eq a, Num a) => a
pattern FT_RENDER_MODE_NORMAL = #const FT_RENDER_MODE_NORMAL
pattern FT_RENDER_MODE_LIGHT  = #const FT_RENDER_MODE_LIGHT
pattern FT_RENDER_MODE_MONO   = #const FT_RENDER_MODE_MONO
pattern FT_RENDER_MODE_LCD    = #const FT_RENDER_MODE_LCD
pattern FT_RENDER_MODE_LCD_V  = #const FT_RENDER_MODE_LCD_V



ft_Get_Kerning
  :: FT_Face      -- ^ face
  -> FT_UInt      -- ^ left_glyph
  -> FT_UInt      -- ^ right_glyph
  -> FT_UInt      -- ^ kern_mode
  -> IO FT_Vector -- ^ kerning
ft_Get_Kerning =
  autoAllocaError "ft_Get_Kerning" ft_Get_Kerning'



pattern FT_KERNING_DEFAULT
      , FT_KERNING_UNFITTED
      , FT_KERNING_UNSCALED
     :: (Eq a, Num a) => a
pattern FT_KERNING_DEFAULT  = #const FT_KERNING_DEFAULT
pattern FT_KERNING_UNFITTED = #const FT_KERNING_UNFITTED
pattern FT_KERNING_UNSCALED = #const FT_KERNING_UNSCALED



ft_Get_Track_Kerning
  :: FT_Face     -- ^ face
  -> FT_Fixed    -- ^ point_size
  -> FT_Int      -- ^ degree
  -> IO FT_Fixed -- ^ kerning
ft_Get_Track_Kerning =
  autoAllocaError "ft_Get_Track_Kerning" ft_Get_Track_Kerning'



ft_Get_Glyph_Name
  :: FT_Face    -- ^ face
  -> FT_UInt    -- ^ glyph_index
  -> FT_UInt    -- ^ buffer_max
  -> IO String  -- ^ buffer
ft_Get_Glyph_Name face index buffer_max =
  allocaArray (fromIntegral buffer_max) $ \buffer -> do
    ftError "ft_Get_Glyph_Name" $ ft_Get_Glyph_Name' face index (castPtr buffer) buffer_max
    peekCString buffer



ft_Get_Postscript_Name
  :: FT_Face   -- ^ face
  -> IO String
ft_Get_Postscript_Name face =
  peekCString . castPtr =<< ft_Get_Postscript_Name' face



ft_Select_Charmap
  :: FT_Face     -- ^ face
  -> FT_Encoding -- ^ encoding
  -> IO ()
ft_Select_Charmap =
  autoError "ft_Select_Charmap" ft_Select_Charmap'



ft_Set_Charmap
  :: FT_Face    -- ^ face
  -> FT_CharMap -- ^ charmap
  -> IO ()
ft_Set_Charmap =
  autoError "ft_Set_Charmap" ft_Set_Charmap'



foreign import ccall "FT_Get_Charmap_Index"
  ft_Get_Charmap_Index
    :: FT_CharMap -- ^ charmap
    -> IO FT_Int



foreign import ccall "FT_Get_FSType_Flags"
  ft_Get_FSType_Flags
    :: FT_Face      -- ^ face
    -> IO FT_UShort



ft_Get_SubGlyph_Info
  :: FT_GlyphSlot -- ^ glyph
  -> FT_UInt      -- ^ sub_index
  -> IO (FT_Int, FT_UInt, FT_Int, FT_Int, FT_Matrix)
        -- ^ (p_index, p_flags, p_arg1, p_arg2, p_transform)
ft_Get_SubGlyph_Info glyph index =
  alloca $ \p_indexPtr ->
    alloca $ \p_flagsPtr ->
      alloca $ \p_arg1Ptr ->
        alloca $ \p_arg2Ptr ->
          alloca $ \p_transformPtr -> do
            ftError "ft_Get_SubGlyph_Info" $ ft_Get_SubGlyph_Info' glyph index p_indexPtr p_flagsPtr p_arg1Ptr p_arg2Ptr p_transformPtr
            (,,,,)
              <$> peek p_indexPtr
              <*> peek p_flagsPtr
              <*> peek p_arg1Ptr
              <*> peek p_arg2Ptr
              <*> peek p_transformPtr



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
     :: (Eq a, Num a) => a
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
     :: (Eq a, Num a) => a
pattern FT_STYLE_FLAG_ITALIC = #const FT_STYLE_FLAG_ITALIC
pattern FT_STYLE_FLAG_BOLD   = #const FT_STYLE_FLAG_BOLD



pattern FT_OPEN_MEMORY
      , FT_OPEN_STREAM
      , FT_OPEN_PATHNAME
      , FT_OPEN_DRIVER
      , FT_OPEN_PARAMS
     :: (Eq a, Num a) => a
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
     :: (Eq a, Num a) => a
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
     :: (Eq a, Num a) => a
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
     :: (Eq a, Num a) => a
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
     :: (Eq a, Num a) => a
pattern FT_FSTYPE_INSTALLABLE_EMBEDDING        = #const FT_FSTYPE_INSTALLABLE_EMBEDDING
pattern FT_FSTYPE_RESTRICTED_LICENSE_EMBEDDING = #const FT_FSTYPE_RESTRICTED_LICENSE_EMBEDDING
pattern FT_FSTYPE_PREVIEW_AND_PRINT_EMBEDDING  = #const FT_FSTYPE_PREVIEW_AND_PRINT_EMBEDDING
pattern FT_FSTYPE_EDITABLE_EMBEDDING           = #const FT_FSTYPE_EDITABLE_EMBEDDING
pattern FT_FSTYPE_NO_SUBSETTING                = #const FT_FSTYPE_NO_SUBSETTING
pattern FT_FSTYPE_BITMAP_EMBEDDING_ONLY        = #const FT_FSTYPE_BITMAP_EMBEDDING_ONLY
