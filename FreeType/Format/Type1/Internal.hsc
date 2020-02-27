{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}
{-# OPTIONS_HADDOCK hide #-}

module FreeType.Format.Type1.Internal where

import           FreeType.Core.Base.Internal
import           FreeType.Core.Types.Internal

import           Foreign.C.Types
import           Foreign.Ptr

#include "ft2build.h"
#include FT_TYPE1_TABLES_H

data PS_FontInfoRec = PS_FontInfoRec
                        { firVersion             :: Ptr FT_String
                        , firNotice              :: Ptr FT_String
                        , firFull_name           :: Ptr FT_String
                        , firFamily_name         :: Ptr FT_String
                        , firWeight              :: Ptr FT_String
                        , firItalic_angle        :: FT_Long
                        , firIs_fixed_pitch      :: FT_Bool
                        , firUnderline_position  :: FT_Short
                        , firUnderline_thickness :: FT_UShort
                        }



type PS_FontInfo = Ptr PS_FontInfoRec



data PS_PrivateRec = PS_PrivateRec
                       { prUnique_id              :: FT_Int
                       , prLenIV                  :: FT_Int
                       , prNum_blue_values        :: FT_Byte
                       , prNum_other_blues        :: FT_Byte
                       , prNum_family_blues       :: FT_Byte
                       , prNum_family_other_blues :: FT_Byte
                       , prBlue_values            :: FT_Short
                       , prOther_blues            :: FT_Short
                       , prFamily_blues           :: FT_Short
                       , prFamily_other_blues     :: FT_Short
                       , prBlue_scale             :: FT_Fixed
                       , prBlue_shift             :: FT_Int
                       , prBlue_fuzz              :: FT_Int
                       , prStandard_width         :: FT_UShort
                       , prStandard_height        :: FT_UShort
                       , prNum_snap_widths        :: FT_Byte
                       , prNum_snap_heights       :: FT_Byte
                       , prForce_bold             :: FT_Bool
                       , prRound_stem_up          :: FT_Bool
                       , prSnap_widths            :: FT_Short
                       , prSnap_heights           :: FT_Short
                       , prExpansion_factor       :: FT_Fixed
                       , prLanguage_group         :: FT_Long
                       , prPassword               :: FT_Long
                       , prMin_feature            :: FT_Short
                       }



type PS_Private = Ptr PS_PrivateRec



data CID_FaceDictRec = CID_FaceDictRec
                         { fdrPrivate_dict        :: PS_PrivateRec
                         , fdrLen_buildchar       :: FT_UInt
                         , fdrForcebold_threshold :: FT_Fixed
                         , fdrStroke_width        :: FT_Pos
                         , fdrExpansion_factor    :: FT_Fixed
                         , fdrPaint_type          :: FT_Byte
                         , fdrFont_type           :: FT_Byte
                         , fdrFont_matrix         :: FT_Matrix
                         , fdrFont_offset         :: FT_Vector
                         , fdrNum_subrs           :: FT_UInt
                         , fdrSubrmap_offset      :: FT_ULong
                         , fdrSd_bytes            :: FT_Int
                         }



type CID_FaceDict = Ptr CID_FaceDictRec



data CID_FaceInfoRec = CID_FaceInfoRec
                         { firCid_font_name :: Ptr FT_String
                         , firCid_version   :: FT_Fixed
                         , firCid_font_type :: FT_Int
                         , firRegistry      :: Ptr FT_String
                         , firOrdering      :: Ptr FT_String
                         , firSupplement    :: FT_Int
                         , firFont_info     :: PS_FontInfoRec
                         , firFont_bbox     :: FT_BBox
                         , firUid_base      :: FT_ULong
                         , firNum_xuid      :: FT_Int
                         , firXuid          :: FT_ULong
                         , firCidmap_offset :: FT_ULong
                         , firFd_bytes      :: FT_Int
                         , firGd_bytes      :: FT_Int
                         , firCid_count     :: FT_ULong
                         , firNum_dicts     :: FT_Int
                         , firFont_dicts    :: CID_FaceDict
                         , firData_offset   :: FT_ULong
                         }



type CID_FaceInfo = Ptr CID_FaceInfoRec



foreign import ccall "FT_Has_PS_Glyph_Names"
  ft_Has_PS_Glyph_Names :: FT_Face -> IO FT_Int



foreign import ccall "FT_Get_PS_Font_Info"
  ft_Get_PS_Font_Info :: FT_Face -> PS_FontInfo -> IO FT_Error



foreign import ccall "FT_Get_PS_Font_Private"
  ft_Get_PS_Font_Private :: FT_Face -> PS_Private -> IO FT_Error



foreign import ccall "FT_Get_PS_Font_Value"
  ft_Get_PS_Font_Value :: FT_Face -> PS_Dict_Keys -> FT_UInt -> Ptr () -> FT_Long -> IO FT_Long



type T1_Blend_Flags = FT_Int32

pattern T1_BLEND_UNDERLINE_POSITION
      , T1_BLEND_UNDERLINE_THICKNESS
      , T1_BLEND_ITALIC_ANGLE
      , T1_BLEND_BLUE_VALUES
      , T1_BLEND_OTHER_BLUES
      , T1_BLEND_STANDARD_WIDTH
      , T1_BLEND_STANDARD_HEIGHT
      , T1_BLEND_STEM_SNAP_WIDTHS
      , T1_BLEND_STEM_SNAP_HEIGHTS
      , T1_BLEND_BLUE_SCALE
      , T1_BLEND_BLUE_SHIFT
      , T1_BLEND_FAMILY_BLUES
      , T1_BLEND_FAMILY_OTHER_BLUES
      , T1_BLEND_FORCE_BOLD
     :: T1_Blend_Flags
pattern T1_BLEND_UNDERLINE_POSITION  = #const T1_BLEND_UNDERLINE_POSITION
pattern T1_BLEND_UNDERLINE_THICKNESS = #const T1_BLEND_UNDERLINE_THICKNESS
pattern T1_BLEND_ITALIC_ANGLE        = #const T1_BLEND_ITALIC_ANGLE
pattern T1_BLEND_BLUE_VALUES         = #const T1_BLEND_BLUE_VALUES
pattern T1_BLEND_OTHER_BLUES         = #const T1_BLEND_OTHER_BLUES
pattern T1_BLEND_STANDARD_WIDTH      = #const T1_BLEND_STANDARD_WIDTH
pattern T1_BLEND_STANDARD_HEIGHT     = #const T1_BLEND_STANDARD_HEIGHT
pattern T1_BLEND_STEM_SNAP_WIDTHS    = #const T1_BLEND_STEM_SNAP_WIDTHS
pattern T1_BLEND_STEM_SNAP_HEIGHTS   = #const T1_BLEND_STEM_SNAP_HEIGHTS
pattern T1_BLEND_BLUE_SCALE          = #const T1_BLEND_BLUE_SCALE
pattern T1_BLEND_BLUE_SHIFT          = #const T1_BLEND_BLUE_SHIFT
pattern T1_BLEND_FAMILY_BLUES        = #const T1_BLEND_FAMILY_BLUES
pattern T1_BLEND_FAMILY_OTHER_BLUES  = #const T1_BLEND_FAMILY_OTHER_BLUES
pattern T1_BLEND_FORCE_BOLD          = #const T1_BLEND_FORCE_BOLD



type T1_EncodingType = FT_Int32

pattern T1_ENCODING_TYPE_NONE
      , T1_ENCODING_TYPE_ARRAY
      , T1_ENCODING_TYPE_STANDARD
      , T1_ENCODING_TYPE_ISOLATIN1
      , T1_ENCODING_TYPE_EXPERT
     :: T1_EncodingType
pattern T1_ENCODING_TYPE_NONE      = #const T1_ENCODING_TYPE_NONE
pattern T1_ENCODING_TYPE_ARRAY     = #const T1_ENCODING_TYPE_ARRAY
pattern T1_ENCODING_TYPE_STANDARD  = #const T1_ENCODING_TYPE_STANDARD
pattern T1_ENCODING_TYPE_ISOLATIN1 = #const T1_ENCODING_TYPE_ISOLATIN1
pattern T1_ENCODING_TYPE_EXPERT    = #const T1_ENCODING_TYPE_EXPERT



type PS_Dict_Keys = FT_Int32

pattern PS_DICT_FONT_TYPE             
      , PS_DICT_FONT_MATRIX           
      , PS_DICT_FONT_BBOX             
      , PS_DICT_PAINT_TYPE            
      , PS_DICT_FONT_NAME             
      , PS_DICT_UNIQUE_ID             
      , PS_DICT_NUM_CHAR_STRINGS      
      , PS_DICT_CHAR_STRING_KEY       
      , PS_DICT_CHAR_STRING           
      , PS_DICT_ENCODING_TYPE         
      , PS_DICT_ENCODING_ENTRY        
      , PS_DICT_NUM_SUBRS             
      , PS_DICT_SUBR                  
      , PS_DICT_STD_HW                
      , PS_DICT_STD_VW                
      , PS_DICT_NUM_BLUE_VALUES       
      , PS_DICT_BLUE_VALUE            
      , PS_DICT_BLUE_FUZZ             
      , PS_DICT_NUM_OTHER_BLUES       
      , PS_DICT_OTHER_BLUE            
      , PS_DICT_NUM_FAMILY_BLUES      
      , PS_DICT_FAMILY_BLUE           
      , PS_DICT_NUM_FAMILY_OTHER_BLUES
      , PS_DICT_FAMILY_OTHER_BLUE     
      , PS_DICT_BLUE_SCALE            
      , PS_DICT_BLUE_SHIFT            
      , PS_DICT_NUM_STEM_SNAP_H       
      , PS_DICT_STEM_SNAP_H           
      , PS_DICT_NUM_STEM_SNAP_V       
      , PS_DICT_STEM_SNAP_V           
      , PS_DICT_FORCE_BOLD            
      , PS_DICT_RND_STEM_UP           
      , PS_DICT_MIN_FEATURE           
      , PS_DICT_LEN_IV                
      , PS_DICT_PASSWORD              
      , PS_DICT_LANGUAGE_GROUP        
      , PS_DICT_VERSION               
      , PS_DICT_NOTICE                
      , PS_DICT_FULL_NAME             
      , PS_DICT_FAMILY_NAME           
      , PS_DICT_WEIGHT                
      , PS_DICT_IS_FIXED_PITCH        
      , PS_DICT_UNDERLINE_POSITION    
      , PS_DICT_UNDERLINE_THICKNESS   
      , PS_DICT_FS_TYPE               
      , PS_DICT_ITALIC_ANGLE          
     :: PS_Dict_Keys
pattern PS_DICT_FONT_TYPE              = #const PS_DICT_FONT_TYPE
pattern PS_DICT_FONT_MATRIX            = #const PS_DICT_FONT_MATRIX
pattern PS_DICT_FONT_BBOX              = #const PS_DICT_FONT_BBOX
pattern PS_DICT_PAINT_TYPE             = #const PS_DICT_PAINT_TYPE
pattern PS_DICT_FONT_NAME              = #const PS_DICT_FONT_NAME
pattern PS_DICT_UNIQUE_ID              = #const PS_DICT_UNIQUE_ID
pattern PS_DICT_NUM_CHAR_STRINGS       = #const PS_DICT_NUM_CHAR_STRINGS
pattern PS_DICT_CHAR_STRING_KEY        = #const PS_DICT_CHAR_STRING_KEY
pattern PS_DICT_CHAR_STRING            = #const PS_DICT_CHAR_STRING
pattern PS_DICT_ENCODING_TYPE          = #const PS_DICT_ENCODING_TYPE
pattern PS_DICT_ENCODING_ENTRY         = #const PS_DICT_ENCODING_ENTRY
pattern PS_DICT_NUM_SUBRS              = #const PS_DICT_NUM_SUBRS
pattern PS_DICT_SUBR                   = #const PS_DICT_SUBR
pattern PS_DICT_STD_HW                 = #const PS_DICT_STD_HW
pattern PS_DICT_STD_VW                 = #const PS_DICT_STD_VW
pattern PS_DICT_NUM_BLUE_VALUES        = #const PS_DICT_NUM_BLUE_VALUES
pattern PS_DICT_BLUE_VALUE             = #const PS_DICT_BLUE_VALUE
pattern PS_DICT_BLUE_FUZZ              = #const PS_DICT_BLUE_FUZZ
pattern PS_DICT_NUM_OTHER_BLUES        = #const PS_DICT_NUM_OTHER_BLUES
pattern PS_DICT_OTHER_BLUE             = #const PS_DICT_OTHER_BLUE
pattern PS_DICT_NUM_FAMILY_BLUES       = #const PS_DICT_NUM_FAMILY_BLUES
pattern PS_DICT_FAMILY_BLUE            = #const PS_DICT_FAMILY_BLUE
pattern PS_DICT_NUM_FAMILY_OTHER_BLUES = #const PS_DICT_NUM_FAMILY_OTHER_BLUES
pattern PS_DICT_FAMILY_OTHER_BLUE      = #const PS_DICT_FAMILY_OTHER_BLUE
pattern PS_DICT_BLUE_SCALE             = #const PS_DICT_BLUE_SCALE
pattern PS_DICT_BLUE_SHIFT             = #const PS_DICT_BLUE_SHIFT
pattern PS_DICT_NUM_STEM_SNAP_H        = #const PS_DICT_NUM_STEM_SNAP_H
pattern PS_DICT_STEM_SNAP_H            = #const PS_DICT_STEM_SNAP_H
pattern PS_DICT_NUM_STEM_SNAP_V        = #const PS_DICT_NUM_STEM_SNAP_V
pattern PS_DICT_STEM_SNAP_V            = #const PS_DICT_STEM_SNAP_V
pattern PS_DICT_FORCE_BOLD             = #const PS_DICT_FORCE_BOLD
pattern PS_DICT_RND_STEM_UP            = #const PS_DICT_RND_STEM_UP
pattern PS_DICT_MIN_FEATURE            = #const PS_DICT_MIN_FEATURE
pattern PS_DICT_LEN_IV                 = #const PS_DICT_LEN_IV
pattern PS_DICT_PASSWORD               = #const PS_DICT_PASSWORD
pattern PS_DICT_LANGUAGE_GROUP         = #const PS_DICT_LANGUAGE_GROUP
pattern PS_DICT_VERSION                = #const PS_DICT_VERSION
pattern PS_DICT_NOTICE                 = #const PS_DICT_NOTICE
pattern PS_DICT_FULL_NAME              = #const PS_DICT_FULL_NAME
pattern PS_DICT_FAMILY_NAME            = #const PS_DICT_FAMILY_NAME
pattern PS_DICT_WEIGHT                 = #const PS_DICT_WEIGHT
pattern PS_DICT_IS_FIXED_PITCH         = #const PS_DICT_IS_FIXED_PITCH
pattern PS_DICT_UNDERLINE_POSITION     = #const PS_DICT_UNDERLINE_POSITION
pattern PS_DICT_UNDERLINE_THICKNESS    = #const PS_DICT_UNDERLINE_THICKNESS
pattern PS_DICT_FS_TYPE                = #const PS_DICT_FS_TYPE
pattern PS_DICT_ITALIC_ANGLE           = #const PS_DICT_ITALIC_ANGLE



type T1_FontInfo = Ptr PS_FontInfoRec



type T1_Private = Ptr PS_PrivateRec



type CID_FontDict = Ptr CID_FaceDictRec
