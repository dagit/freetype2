{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}

module Graphics.FreeType.Bindings.Format.Type1 where

import           Graphics.FreeType.Bindings.Core.Base
import           Graphics.FreeType.Bindings.Core.Types

import           Foreign.C.Types
import           Foreign.Ptr
import           Foreign.Storable

#include "ft2build.h"
#include FT_FREETYPE_H

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

instance Storable PS_FontInfoRec where
  sizeOf _    = #size      struct PS_FontInfoRec_
  alignment _ = #alignment struct PS_FontInfoRec_

  peek ptr =
    PS_FontInfoRec
      <$> #{peek struct PS_FontInfoRec_, version            } ptr
      <*> #{peek struct PS_FontInfoRec_, notice             } ptr
      <*> #{peek struct PS_FontInfoRec_, full_name          } ptr
      <*> #{peek struct PS_FontInfoRec_, family_name        } ptr
      <*> #{peek struct PS_FontInfoRec_, weight             } ptr
      <*> #{peek struct PS_FontInfoRec_, italic_angle       } ptr
      <*> #{peek struct PS_FontInfoRec_, is_fixed_pitch     } ptr
      <*> #{peek struct PS_FontInfoRec_, underline_position } ptr
      <*> #{peek struct PS_FontInfoRec_, underline_thickness} ptr

  poke ptr val = do
    #{poke struct PS_FontInfoRec_, version            } ptr $ firVersion             val
    #{poke struct PS_FontInfoRec_, notice             } ptr $ firNotice              val
    #{poke struct PS_FontInfoRec_, full_name          } ptr $ firFull_name           val
    #{poke struct PS_FontInfoRec_, family_name        } ptr $ firFamily_name         val
    #{poke struct PS_FontInfoRec_, weight             } ptr $ firWeight              val
    #{poke struct PS_FontInfoRec_, italic_angle       } ptr $ firItalic_angle        val
    #{poke struct PS_FontInfoRec_, is_fixed_pitch     } ptr $ firIs_fixed_pitch      val
    #{poke struct PS_FontInfoRec_, underline_position } ptr $ firUnderline_position  val
    #{poke struct PS_FontInfoRec_, underline_thickness} ptr $ firUnderline_thickness val



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



instance Storable PS_PrivateRec where
  sizeOf _    = #size      struct PS_PrivateRec_
  alignment _ = #alignment struct PS_PrivateRec_

  peek ptr =
    PS_PrivateRec
      <$> #{peek struct PS_PrivateRec_, unique_id             } ptr
      <*> #{peek struct PS_PrivateRec_, lenIV                 } ptr
      <*> #{peek struct PS_PrivateRec_, num_blue_values       } ptr
      <*> #{peek struct PS_PrivateRec_, num_other_blues       } ptr
      <*> #{peek struct PS_PrivateRec_, num_family_blues      } ptr
      <*> #{peek struct PS_PrivateRec_, num_family_other_blues} ptr
      <*> #{peek struct PS_PrivateRec_, blue_values           } ptr
      <*> #{peek struct PS_PrivateRec_, other_blues           } ptr
      <*> #{peek struct PS_PrivateRec_, family_blues          } ptr
      <*> #{peek struct PS_PrivateRec_, family_other_blues    } ptr
      <*> #{peek struct PS_PrivateRec_, blue_scale            } ptr
      <*> #{peek struct PS_PrivateRec_, blue_shift            } ptr
      <*> #{peek struct PS_PrivateRec_, blue_fuzz             } ptr
      <*> #{peek struct PS_PrivateRec_, standard_width        } ptr
      <*> #{peek struct PS_PrivateRec_, standard_height       } ptr
      <*> #{peek struct PS_PrivateRec_, num_snap_widths       } ptr
      <*> #{peek struct PS_PrivateRec_, num_snap_heights      } ptr
      <*> #{peek struct PS_PrivateRec_, force_bold            } ptr
      <*> #{peek struct PS_PrivateRec_, round_stem_up         } ptr
      <*> #{peek struct PS_PrivateRec_, snap_widths           } ptr
      <*> #{peek struct PS_PrivateRec_, snap_heights          } ptr
      <*> #{peek struct PS_PrivateRec_, expansion_factor      } ptr
      <*> #{peek struct PS_PrivateRec_, language_group        } ptr
      <*> #{peek struct PS_PrivateRec_, password              } ptr
      <*> #{peek struct PS_PrivateRec_, min_feature           } ptr



  poke ptr val = do
    #{poke struct PS_PrivateRec_, unique_id             } ptr $ prUnique_id              val
    #{poke struct PS_PrivateRec_, lenIV                 } ptr $ prLenIV                  val
    #{poke struct PS_PrivateRec_, num_blue_values       } ptr $ prNum_blue_values        val
    #{poke struct PS_PrivateRec_, num_other_blues       } ptr $ prNum_other_blues        val
    #{poke struct PS_PrivateRec_, num_family_blues      } ptr $ prNum_family_blues       val
    #{poke struct PS_PrivateRec_, num_family_other_blues} ptr $ prNum_family_other_blues val
    #{poke struct PS_PrivateRec_, blue_values           } ptr $ prBlue_values            val
    #{poke struct PS_PrivateRec_, other_blues           } ptr $ prOther_blues            val
    #{poke struct PS_PrivateRec_, family_blues          } ptr $ prFamily_blues           val
    #{poke struct PS_PrivateRec_, family_other_blues    } ptr $ prFamily_other_blues     val
    #{poke struct PS_PrivateRec_, blue_scale            } ptr $ prBlue_scale             val
    #{poke struct PS_PrivateRec_, blue_shift            } ptr $ prBlue_shift             val
    #{poke struct PS_PrivateRec_, blue_fuzz             } ptr $ prBlue_fuzz              val
    #{poke struct PS_PrivateRec_, standard_width        } ptr $ prStandard_width         val
    #{poke struct PS_PrivateRec_, standard_height       } ptr $ prStandard_height        val
    #{poke struct PS_PrivateRec_, num_snap_widths       } ptr $ prNum_snap_widths        val
    #{poke struct PS_PrivateRec_, num_snap_heights      } ptr $ prNum_snap_heights       val
    #{poke struct PS_PrivateRec_, force_bold            } ptr $ prForce_bold             val
    #{poke struct PS_PrivateRec_, round_stem_up         } ptr $ prRound_stem_up          val
    #{poke struct PS_PrivateRec_, snap_widths           } ptr $ prSnap_widths            val
    #{poke struct PS_PrivateRec_, snap_heights          } ptr $ prSnap_heights           val
    #{poke struct PS_PrivateRec_, expansion_factor      } ptr $ prExpansion_factor       val
    #{poke struct PS_PrivateRec_, language_group        } ptr $ prLanguage_group         val
    #{poke struct PS_PrivateRec_, password              } ptr $ prPassword               val
    #{poke struct PS_PrivateRec_, min_feature           } ptr $ prMin_feature            val



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



instance Storable CID_FaceDictRec where
  sizeOf _    = #size      struct CID_FaceDictRec_
  alignment _ = #alignment struct CID_FaceDictRec_

  peek ptr =
    CID_FaceDictRec
      <$> #{peek struct CID_FaceDictRec_, private_dict       } ptr
      <*> #{peek struct CID_FaceDictRec_, len_buildchar      } ptr
      <*> #{peek struct CID_FaceDictRec_, forcebold_threshold} ptr
      <*> #{peek struct CID_FaceDictRec_, stroke_width       } ptr
      <*> #{peek struct CID_FaceDictRec_, expansion_factor   } ptr
      <*> #{peek struct CID_FaceDictRec_, paint_type         } ptr
      <*> #{peek struct CID_FaceDictRec_, font_type          } ptr
      <*> #{peek struct CID_FaceDictRec_, font_matrix        } ptr
      <*> #{peek struct CID_FaceDictRec_, font_offset        } ptr
      <*> #{peek struct CID_FaceDictRec_, num_subrs          } ptr
      <*> #{peek struct CID_FaceDictRec_, subrmap_offset     } ptr
      <*> #{peek struct CID_FaceDictRec_, sd_bytes           } ptr

  poke ptr val = do
    #{poke struct CID_FaceDictRec_, private_dict       } ptr $ fdrPrivate_dict        val
    #{poke struct CID_FaceDictRec_, len_buildchar      } ptr $ fdrLen_buildchar       val
    #{poke struct CID_FaceDictRec_, forcebold_threshold} ptr $ fdrForcebold_threshold val
    #{poke struct CID_FaceDictRec_, stroke_width       } ptr $ fdrStroke_width        val
    #{poke struct CID_FaceDictRec_, expansion_factor   } ptr $ fdrExpansion_factor    val
    #{poke struct CID_FaceDictRec_, paint_type         } ptr $ fdrPaint_type          val
    #{poke struct CID_FaceDictRec_, font_type          } ptr $ fdrFont_type           val
    #{poke struct CID_FaceDictRec_, font_matrix        } ptr $ fdrFont_matrix         val
    #{poke struct CID_FaceDictRec_, font_offset        } ptr $ fdrFont_offset         val
    #{poke struct CID_FaceDictRec_, num_subrs          } ptr $ fdrNum_subrs           val
    #{poke struct CID_FaceDictRec_, subrmap_offset     } ptr $ fdrSubrmap_offset      val
    #{poke struct CID_FaceDictRec_, sd_bytes           } ptr $ fdrSd_bytes            val



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



instance Storable CID_FaceInfoRec where
  sizeOf _    = #size      struct CID_FaceInfoRec_
  alignment _ = #alignment struct CID_FaceInfoRec_

  peek ptr =
    CID_FaceInfoRec
      <$> #{peek struct CID_FaceInfoRec_, cid_font_name} ptr
      <*> #{peek struct CID_FaceInfoRec_, cid_version  } ptr
      <*> #{peek struct CID_FaceInfoRec_, cid_font_type} ptr
      <*> #{peek struct CID_FaceInfoRec_, registry     } ptr
      <*> #{peek struct CID_FaceInfoRec_, ordering     } ptr
      <*> #{peek struct CID_FaceInfoRec_, supplement   } ptr
      <*> #{peek struct CID_FaceInfoRec_, font_info    } ptr
      <*> #{peek struct CID_FaceInfoRec_, font_bbox    } ptr
      <*> #{peek struct CID_FaceInfoRec_, uid_base     } ptr
      <*> #{peek struct CID_FaceInfoRec_, num_xuid     } ptr
      <*> #{peek struct CID_FaceInfoRec_, xuid         } ptr
      <*> #{peek struct CID_FaceInfoRec_, cidmap_offset} ptr
      <*> #{peek struct CID_FaceInfoRec_, fd_bytes     } ptr
      <*> #{peek struct CID_FaceInfoRec_, gd_bytes     } ptr
      <*> #{peek struct CID_FaceInfoRec_, cid_count    } ptr
      <*> #{peek struct CID_FaceInfoRec_, num_dicts    } ptr
      <*> #{peek struct CID_FaceInfoRec_, font_dicts   } ptr
      <*> #{peek struct CID_FaceInfoRec_, data_offset  } ptr

  poke ptr val = do
    #{poke struct CID_FaceInfoRec_, cid_font_name} ptr $ firCid_font_name val
    #{poke struct CID_FaceInfoRec_, cid_version  } ptr $ firCid_version   val
    #{poke struct CID_FaceInfoRec_, cid_font_type} ptr $ firCid_font_type val
    #{poke struct CID_FaceInfoRec_, registry     } ptr $ firRegistry      val
    #{poke struct CID_FaceInfoRec_, ordering     } ptr $ firOrdering      val
    #{poke struct CID_FaceInfoRec_, supplement   } ptr $ firSupplement    val
    #{poke struct CID_FaceInfoRec_, font_info    } ptr $ firFont_info     val
    #{poke struct CID_FaceInfoRec_, font_bbox    } ptr $ firFont_bbox     val
    #{poke struct CID_FaceInfoRec_, uid_base     } ptr $ firUid_base      val
    #{poke struct CID_FaceInfoRec_, num_xuid     } ptr $ firNum_xuid      val
    #{poke struct CID_FaceInfoRec_, xuid         } ptr $ firXuid          val
    #{poke struct CID_FaceInfoRec_, cidmap_offset} ptr $ firCidmap_offset val
    #{poke struct CID_FaceInfoRec_, fd_bytes     } ptr $ firFd_bytes      val
    #{poke struct CID_FaceInfoRec_, gd_bytes     } ptr $ firGd_bytes      val
    #{poke struct CID_FaceInfoRec_, cid_count    } ptr $ firCid_count     val
    #{poke struct CID_FaceInfoRec_, num_dicts    } ptr $ firNum_dicts     val
    #{poke struct CID_FaceInfoRec_, font_dicts   } ptr $ firFont_dicts    val
    #{poke struct CID_FaceInfoRec_, data_offset  } ptr $ firData_offset   val



type CID_FaceInfo = Ptr CID_FaceInfoRec



foreign import ccall "FT_Has_PS_Glyph_Names"
  ft_Has_PS_Glyph_Names :: FT_Face -> FT_Int



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
