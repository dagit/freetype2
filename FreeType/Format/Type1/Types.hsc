{-# LANGUAGE ForeignFunctionInterface #-}

module FreeType.Format.Type1.Types where

import           FreeType.Core.Types.Types

import           Data.Function ((&))
import           Data.Word
import           Foreign.Ptr
import           Foreign.Storable

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
    #{poke struct PS_FontInfoRec_, version            } ptr $ val & firVersion
    #{poke struct PS_FontInfoRec_, notice             } ptr $ val & firNotice
    #{poke struct PS_FontInfoRec_, full_name          } ptr $ val & firFull_name
    #{poke struct PS_FontInfoRec_, family_name        } ptr $ val & firFamily_name
    #{poke struct PS_FontInfoRec_, weight             } ptr $ val & firWeight
    #{poke struct PS_FontInfoRec_, italic_angle       } ptr $ val & firItalic_angle
    #{poke struct PS_FontInfoRec_, is_fixed_pitch     } ptr $ val & firIs_fixed_pitch
    #{poke struct PS_FontInfoRec_, underline_position } ptr $ val & firUnderline_position
    #{poke struct PS_FontInfoRec_, underline_thickness} ptr $ val & firUnderline_thickness



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
    #{poke struct PS_PrivateRec_, unique_id             } ptr $ val & prUnique_id
    #{poke struct PS_PrivateRec_, lenIV                 } ptr $ val & prLenIV
    #{poke struct PS_PrivateRec_, num_blue_values       } ptr $ val & prNum_blue_values
    #{poke struct PS_PrivateRec_, num_other_blues       } ptr $ val & prNum_other_blues
    #{poke struct PS_PrivateRec_, num_family_blues      } ptr $ val & prNum_family_blues
    #{poke struct PS_PrivateRec_, num_family_other_blues} ptr $ val & prNum_family_other_blues
    #{poke struct PS_PrivateRec_, blue_values           } ptr $ val & prBlue_values
    #{poke struct PS_PrivateRec_, other_blues           } ptr $ val & prOther_blues
    #{poke struct PS_PrivateRec_, family_blues          } ptr $ val & prFamily_blues
    #{poke struct PS_PrivateRec_, family_other_blues    } ptr $ val & prFamily_other_blues
    #{poke struct PS_PrivateRec_, blue_scale            } ptr $ val & prBlue_scale
    #{poke struct PS_PrivateRec_, blue_shift            } ptr $ val & prBlue_shift
    #{poke struct PS_PrivateRec_, blue_fuzz             } ptr $ val & prBlue_fuzz
    #{poke struct PS_PrivateRec_, standard_width        } ptr $ val & prStandard_width
    #{poke struct PS_PrivateRec_, standard_height       } ptr $ val & prStandard_height
    #{poke struct PS_PrivateRec_, num_snap_widths       } ptr $ val & prNum_snap_widths
    #{poke struct PS_PrivateRec_, num_snap_heights      } ptr $ val & prNum_snap_heights
    #{poke struct PS_PrivateRec_, force_bold            } ptr $ val & prForce_bold
    #{poke struct PS_PrivateRec_, round_stem_up         } ptr $ val & prRound_stem_up
    #{poke struct PS_PrivateRec_, snap_widths           } ptr $ val & prSnap_widths
    #{poke struct PS_PrivateRec_, snap_heights          } ptr $ val & prSnap_heights
    #{poke struct PS_PrivateRec_, expansion_factor      } ptr $ val & prExpansion_factor
    #{poke struct PS_PrivateRec_, language_group        } ptr $ val & prLanguage_group
    #{poke struct PS_PrivateRec_, password              } ptr $ val & prPassword
    #{poke struct PS_PrivateRec_, min_feature           } ptr $ val & prMin_feature



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
    #{poke struct CID_FaceDictRec_, private_dict       } ptr $ val & fdrPrivate_dict
    #{poke struct CID_FaceDictRec_, len_buildchar      } ptr $ val & fdrLen_buildchar
    #{poke struct CID_FaceDictRec_, forcebold_threshold} ptr $ val & fdrForcebold_threshold
    #{poke struct CID_FaceDictRec_, stroke_width       } ptr $ val & fdrStroke_width
    #{poke struct CID_FaceDictRec_, expansion_factor   } ptr $ val & fdrExpansion_factor
    #{poke struct CID_FaceDictRec_, paint_type         } ptr $ val & fdrPaint_type
    #{poke struct CID_FaceDictRec_, font_type          } ptr $ val & fdrFont_type
    #{poke struct CID_FaceDictRec_, font_matrix        } ptr $ val & fdrFont_matrix
    #{poke struct CID_FaceDictRec_, font_offset        } ptr $ val & fdrFont_offset
    #{poke struct CID_FaceDictRec_, num_subrs          } ptr $ val & fdrNum_subrs
    #{poke struct CID_FaceDictRec_, subrmap_offset     } ptr $ val & fdrSubrmap_offset
    #{poke struct CID_FaceDictRec_, sd_bytes           } ptr $ val & fdrSd_bytes



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
    #{poke struct CID_FaceInfoRec_, cid_font_name} ptr $ val & firCid_font_name
    #{poke struct CID_FaceInfoRec_, cid_version  } ptr $ val & firCid_version
    #{poke struct CID_FaceInfoRec_, cid_font_type} ptr $ val & firCid_font_type
    #{poke struct CID_FaceInfoRec_, registry     } ptr $ val & firRegistry
    #{poke struct CID_FaceInfoRec_, ordering     } ptr $ val & firOrdering
    #{poke struct CID_FaceInfoRec_, supplement   } ptr $ val & firSupplement
    #{poke struct CID_FaceInfoRec_, font_info    } ptr $ val & firFont_info
    #{poke struct CID_FaceInfoRec_, font_bbox    } ptr $ val & firFont_bbox
    #{poke struct CID_FaceInfoRec_, uid_base     } ptr $ val & firUid_base
    #{poke struct CID_FaceInfoRec_, num_xuid     } ptr $ val & firNum_xuid
    #{poke struct CID_FaceInfoRec_, xuid         } ptr $ val & firXuid
    #{poke struct CID_FaceInfoRec_, cidmap_offset} ptr $ val & firCidmap_offset
    #{poke struct CID_FaceInfoRec_, fd_bytes     } ptr $ val & firFd_bytes
    #{poke struct CID_FaceInfoRec_, gd_bytes     } ptr $ val & firGd_bytes
    #{poke struct CID_FaceInfoRec_, cid_count    } ptr $ val & firCid_count
    #{poke struct CID_FaceInfoRec_, num_dicts    } ptr $ val & firNum_dicts
    #{poke struct CID_FaceInfoRec_, font_dicts   } ptr $ val & firFont_dicts
    #{poke struct CID_FaceInfoRec_, data_offset  } ptr $ val & firData_offset



type CID_FaceInfo = Ptr CID_FaceInfoRec



type T1_Blend_Flags = #type enum T1_Blend_Flags_



type T1_EncodingType = #type enum T1_EncodingType_



type PS_Dict_Keys = #type enum PS_Dict_Keys_



type T1_FontInfo = Ptr PS_FontInfoRec



type T1_Private = Ptr PS_PrivateRec



type CID_FontDict = Ptr CID_FaceDictRec



type CID_Info = CID_FaceInfoRec
