{-# LANGUAGE DataKinds
           , ForeignFunctionInterface
           , MultiParamTypeClasses
           , TypeApplications #-}

module FreeType.Format.Type1.Types where

import           FreeType.Core.Types.Types

import           Data.Word
import           Foreign.Ptr
import           Foreign.Storable
import           Foreign.Storable.Offset

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

instance Offset "firVersion"             PS_FontInfoRec where rawOffset = #{offset struct PS_FontInfoRec_, version            }
instance Offset "firNotice"              PS_FontInfoRec where rawOffset = #{offset struct PS_FontInfoRec_, notice             }
instance Offset "firFull_name"           PS_FontInfoRec where rawOffset = #{offset struct PS_FontInfoRec_, full_name          }
instance Offset "firFamily_name"         PS_FontInfoRec where rawOffset = #{offset struct PS_FontInfoRec_, family_name        }
instance Offset "firWeight"              PS_FontInfoRec where rawOffset = #{offset struct PS_FontInfoRec_, weight             }
instance Offset "firItalic_angle"        PS_FontInfoRec where rawOffset = #{offset struct PS_FontInfoRec_, italic_angle       }
instance Offset "firIs_fixed_pitch"      PS_FontInfoRec where rawOffset = #{offset struct PS_FontInfoRec_, is_fixed_pitch     }
instance Offset "firUnderline_position"  PS_FontInfoRec where rawOffset = #{offset struct PS_FontInfoRec_, underline_position }
instance Offset "firUnderline_thickness" PS_FontInfoRec where rawOffset = #{offset struct PS_FontInfoRec_, underline_thickness}

instance Storable PS_FontInfoRec where
  sizeOf _    = #size      struct PS_FontInfoRec_
  alignment _ = #alignment struct PS_FontInfoRec_

  peek ptr =
    PS_FontInfoRec
      <$> peek (offset @"firVersion"             ptr)
      <*> peek (offset @"firNotice"              ptr)
      <*> peek (offset @"firFull_name"           ptr)
      <*> peek (offset @"firFamily_name"         ptr)
      <*> peek (offset @"firWeight"              ptr)
      <*> peek (offset @"firItalic_angle"        ptr)
      <*> peek (offset @"firIs_fixed_pitch"      ptr)
      <*> peek (offset @"firUnderline_position"  ptr)
      <*> peek (offset @"firUnderline_thickness" ptr)

  poke ptr val = do
    pokeField @"firVersion"             ptr val
    pokeField @"firNotice"              ptr val
    pokeField @"firFull_name"           ptr val
    pokeField @"firFamily_name"         ptr val
    pokeField @"firWeight"              ptr val
    pokeField @"firItalic_angle"        ptr val
    pokeField @"firIs_fixed_pitch"      ptr val
    pokeField @"firUnderline_position"  ptr val
    pokeField @"firUnderline_thickness" ptr val



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

instance Offset "prUnique_id"              PS_PrivateRec where rawOffset = #{offset struct PS_PrivateRec_, unique_id             }
instance Offset "prLenIV"                  PS_PrivateRec where rawOffset = #{offset struct PS_PrivateRec_, lenIV                 }
instance Offset "prNum_blue_values"        PS_PrivateRec where rawOffset = #{offset struct PS_PrivateRec_, num_blue_values       }
instance Offset "prNum_other_blues"        PS_PrivateRec where rawOffset = #{offset struct PS_PrivateRec_, num_other_blues       }
instance Offset "prNum_family_blues"       PS_PrivateRec where rawOffset = #{offset struct PS_PrivateRec_, num_family_blues      }
instance Offset "prNum_family_other_blues" PS_PrivateRec where rawOffset = #{offset struct PS_PrivateRec_, num_family_other_blues}
instance Offset "prBlue_values"            PS_PrivateRec where rawOffset = #{offset struct PS_PrivateRec_, blue_values           }
instance Offset "prOther_blues"            PS_PrivateRec where rawOffset = #{offset struct PS_PrivateRec_, other_blues           }
instance Offset "prFamily_blues"           PS_PrivateRec where rawOffset = #{offset struct PS_PrivateRec_, family_blues          }
instance Offset "prFamily_other_blues"     PS_PrivateRec where rawOffset = #{offset struct PS_PrivateRec_, family_other_blues    }
instance Offset "prBlue_scale"             PS_PrivateRec where rawOffset = #{offset struct PS_PrivateRec_, blue_scale            }
instance Offset "prBlue_shift"             PS_PrivateRec where rawOffset = #{offset struct PS_PrivateRec_, blue_shift            }
instance Offset "prBlue_fuzz"              PS_PrivateRec where rawOffset = #{offset struct PS_PrivateRec_, blue_fuzz             }
instance Offset "prStandard_width"         PS_PrivateRec where rawOffset = #{offset struct PS_PrivateRec_, standard_width        }
instance Offset "prStandard_height"        PS_PrivateRec where rawOffset = #{offset struct PS_PrivateRec_, standard_height       }
instance Offset "prNum_snap_widths"        PS_PrivateRec where rawOffset = #{offset struct PS_PrivateRec_, num_snap_widths       }
instance Offset "prNum_snap_heights"       PS_PrivateRec where rawOffset = #{offset struct PS_PrivateRec_, num_snap_heights      }
instance Offset "prForce_bold"             PS_PrivateRec where rawOffset = #{offset struct PS_PrivateRec_, force_bold            }
instance Offset "prRound_stem_up"          PS_PrivateRec where rawOffset = #{offset struct PS_PrivateRec_, round_stem_up         }
instance Offset "prSnap_widths"            PS_PrivateRec where rawOffset = #{offset struct PS_PrivateRec_, snap_widths           }
instance Offset "prSnap_heights"           PS_PrivateRec where rawOffset = #{offset struct PS_PrivateRec_, snap_heights          }
instance Offset "prExpansion_factor"       PS_PrivateRec where rawOffset = #{offset struct PS_PrivateRec_, expansion_factor      }
instance Offset "prLanguage_group"         PS_PrivateRec where rawOffset = #{offset struct PS_PrivateRec_, language_group        }
instance Offset "prPassword"               PS_PrivateRec where rawOffset = #{offset struct PS_PrivateRec_, password              }
instance Offset "prMin_feature"            PS_PrivateRec where rawOffset = #{offset struct PS_PrivateRec_, min_feature           }


instance Storable PS_PrivateRec where
  sizeOf _    = #size      struct PS_PrivateRec_
  alignment _ = #alignment struct PS_PrivateRec_

  peek ptr =
    PS_PrivateRec
      <$> peek (offset @"prUnique_id"              ptr)
      <*> peek (offset @"prLenIV"                  ptr)
      <*> peek (offset @"prNum_blue_values"        ptr)
      <*> peek (offset @"prNum_other_blues"        ptr)
      <*> peek (offset @"prNum_family_blues"       ptr)
      <*> peek (offset @"prNum_family_other_blues" ptr)
      <*> peek (offset @"prBlue_values"            ptr)
      <*> peek (offset @"prOther_blues"            ptr)
      <*> peek (offset @"prFamily_blues"           ptr)
      <*> peek (offset @"prFamily_other_blues"     ptr)
      <*> peek (offset @"prBlue_scale"             ptr)
      <*> peek (offset @"prBlue_shift"             ptr)
      <*> peek (offset @"prBlue_fuzz"              ptr)
      <*> peek (offset @"prStandard_width"         ptr)
      <*> peek (offset @"prStandard_height"        ptr)
      <*> peek (offset @"prNum_snap_widths"        ptr)
      <*> peek (offset @"prNum_snap_heights"       ptr)
      <*> peek (offset @"prForce_bold"             ptr)
      <*> peek (offset @"prRound_stem_up"          ptr)
      <*> peek (offset @"prSnap_widths"            ptr)
      <*> peek (offset @"prSnap_heights"           ptr)
      <*> peek (offset @"prExpansion_factor"       ptr)
      <*> peek (offset @"prLanguage_group"         ptr)
      <*> peek (offset @"prPassword"               ptr)
      <*> peek (offset @"prMin_feature"            ptr)

  poke ptr val = do
    pokeField @"prUnique_id"              ptr val
    pokeField @"prLenIV"                  ptr val
    pokeField @"prNum_blue_values"        ptr val
    pokeField @"prNum_other_blues"        ptr val
    pokeField @"prNum_family_blues"       ptr val
    pokeField @"prNum_family_other_blues" ptr val
    pokeField @"prBlue_values"            ptr val
    pokeField @"prOther_blues"            ptr val
    pokeField @"prFamily_blues"           ptr val
    pokeField @"prFamily_other_blues"     ptr val
    pokeField @"prBlue_scale"             ptr val
    pokeField @"prBlue_shift"             ptr val
    pokeField @"prBlue_fuzz"              ptr val
    pokeField @"prStandard_width"         ptr val
    pokeField @"prStandard_height"        ptr val
    pokeField @"prNum_snap_widths"        ptr val
    pokeField @"prNum_snap_heights"       ptr val
    pokeField @"prForce_bold"             ptr val
    pokeField @"prRound_stem_up"          ptr val
    pokeField @"prSnap_widths"            ptr val
    pokeField @"prSnap_heights"           ptr val
    pokeField @"prExpansion_factor"       ptr val
    pokeField @"prLanguage_group"         ptr val
    pokeField @"prPassword"               ptr val
    pokeField @"prMin_feature"            ptr val



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

instance Offset "fdrPrivate_dict"        CID_FaceDictRec where rawOffset = #{offset struct CID_FaceDictRec_, private_dict       }
instance Offset "fdrLen_buildchar"       CID_FaceDictRec where rawOffset = #{offset struct CID_FaceDictRec_, len_buildchar      }
instance Offset "fdrForcebold_threshold" CID_FaceDictRec where rawOffset = #{offset struct CID_FaceDictRec_, forcebold_threshold}
instance Offset "fdrStroke_width"        CID_FaceDictRec where rawOffset = #{offset struct CID_FaceDictRec_, stroke_width       }
instance Offset "fdrExpansion_factor"    CID_FaceDictRec where rawOffset = #{offset struct CID_FaceDictRec_, expansion_factor   }
instance Offset "fdrPaint_type"          CID_FaceDictRec where rawOffset = #{offset struct CID_FaceDictRec_, paint_type         }
instance Offset "fdrFont_type"           CID_FaceDictRec where rawOffset = #{offset struct CID_FaceDictRec_, font_type          }
instance Offset "fdrFont_matrix"         CID_FaceDictRec where rawOffset = #{offset struct CID_FaceDictRec_, font_matrix        }
instance Offset "fdrFont_offset"         CID_FaceDictRec where rawOffset = #{offset struct CID_FaceDictRec_, font_offset        }
instance Offset "fdrNum_subrs"           CID_FaceDictRec where rawOffset = #{offset struct CID_FaceDictRec_, num_subrs          }
instance Offset "fdrSubrmap_offset"      CID_FaceDictRec where rawOffset = #{offset struct CID_FaceDictRec_, subrmap_offset     }
instance Offset "fdrSd_bytes"            CID_FaceDictRec where rawOffset = #{offset struct CID_FaceDictRec_, sd_bytes           }

instance Storable CID_FaceDictRec where
  sizeOf _    = #size      struct CID_FaceDictRec_
  alignment _ = #alignment struct CID_FaceDictRec_

  peek ptr =
    CID_FaceDictRec
      <$> peek (offset @"fdrPrivate_dict"        ptr)
      <*> peek (offset @"fdrLen_buildchar"       ptr)
      <*> peek (offset @"fdrForcebold_threshold" ptr)
      <*> peek (offset @"fdrStroke_width"        ptr)
      <*> peek (offset @"fdrExpansion_factor"    ptr)
      <*> peek (offset @"fdrPaint_type"          ptr)
      <*> peek (offset @"fdrFont_type"           ptr)
      <*> peek (offset @"fdrFont_matrix"         ptr)
      <*> peek (offset @"fdrFont_offset"         ptr)
      <*> peek (offset @"fdrNum_subrs"           ptr)
      <*> peek (offset @"fdrSubrmap_offset"      ptr)
      <*> peek (offset @"fdrSd_bytes"            ptr)

  poke ptr val = do
    pokeField @"fdrPrivate_dict"        ptr val
    pokeField @"fdrLen_buildchar"       ptr val
    pokeField @"fdrForcebold_threshold" ptr val
    pokeField @"fdrStroke_width"        ptr val
    pokeField @"fdrExpansion_factor"    ptr val
    pokeField @"fdrPaint_type"          ptr val
    pokeField @"fdrFont_type"           ptr val
    pokeField @"fdrFont_matrix"         ptr val
    pokeField @"fdrFont_offset"         ptr val
    pokeField @"fdrNum_subrs"           ptr val
    pokeField @"fdrSubrmap_offset"      ptr val
    pokeField @"fdrSd_bytes"            ptr val



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

instance Offset "firCid_font_name" CID_FaceInfoRec where rawOffset = #{offset struct CID_FaceInfoRec_, cid_font_name}
instance Offset "firCid_version"   CID_FaceInfoRec where rawOffset = #{offset struct CID_FaceInfoRec_, cid_version  }
instance Offset "firCid_font_type" CID_FaceInfoRec where rawOffset = #{offset struct CID_FaceInfoRec_, cid_font_type}
instance Offset "firRegistry"      CID_FaceInfoRec where rawOffset = #{offset struct CID_FaceInfoRec_, registry     }
instance Offset "firOrdering"      CID_FaceInfoRec where rawOffset = #{offset struct CID_FaceInfoRec_, ordering     }
instance Offset "firSupplement"    CID_FaceInfoRec where rawOffset = #{offset struct CID_FaceInfoRec_, supplement   }
instance Offset "firFont_info"     CID_FaceInfoRec where rawOffset = #{offset struct CID_FaceInfoRec_, font_info    }
instance Offset "firFont_bbox"     CID_FaceInfoRec where rawOffset = #{offset struct CID_FaceInfoRec_, font_bbox    }
instance Offset "firUid_base"      CID_FaceInfoRec where rawOffset = #{offset struct CID_FaceInfoRec_, uid_base     }
instance Offset "firNum_xuid"      CID_FaceInfoRec where rawOffset = #{offset struct CID_FaceInfoRec_, num_xuid     }
instance Offset "firXuid"          CID_FaceInfoRec where rawOffset = #{offset struct CID_FaceInfoRec_, xuid         }
instance Offset "firCidmap_offset" CID_FaceInfoRec where rawOffset = #{offset struct CID_FaceInfoRec_, cidmap_offset}
instance Offset "firFd_bytes"      CID_FaceInfoRec where rawOffset = #{offset struct CID_FaceInfoRec_, fd_bytes     }
instance Offset "firGd_bytes"      CID_FaceInfoRec where rawOffset = #{offset struct CID_FaceInfoRec_, gd_bytes     }
instance Offset "firCid_count"     CID_FaceInfoRec where rawOffset = #{offset struct CID_FaceInfoRec_, cid_count    }
instance Offset "firNum_dicts"     CID_FaceInfoRec where rawOffset = #{offset struct CID_FaceInfoRec_, num_dicts    }
instance Offset "firFont_dicts"    CID_FaceInfoRec where rawOffset = #{offset struct CID_FaceInfoRec_, font_dicts   }
instance Offset "firData_offset"   CID_FaceInfoRec where rawOffset = #{offset struct CID_FaceInfoRec_, data_offset  }

instance Storable CID_FaceInfoRec where
  sizeOf _    = #size      struct CID_FaceInfoRec_
  alignment _ = #alignment struct CID_FaceInfoRec_

  peek ptr =
    CID_FaceInfoRec
      <$> peek (offset @"firCid_font_name" ptr)
      <*> peek (offset @"firCid_version"   ptr)
      <*> peek (offset @"firCid_font_type" ptr)
      <*> peek (offset @"firRegistry"      ptr)
      <*> peek (offset @"firOrdering"      ptr)
      <*> peek (offset @"firSupplement"    ptr)
      <*> peek (offset @"firFont_info"     ptr)
      <*> peek (offset @"firFont_bbox"     ptr)
      <*> peek (offset @"firUid_base"      ptr)
      <*> peek (offset @"firNum_xuid"      ptr)
      <*> peek (offset @"firXuid"          ptr)
      <*> peek (offset @"firCidmap_offset" ptr)
      <*> peek (offset @"firFd_bytes"      ptr)
      <*> peek (offset @"firGd_bytes"      ptr)
      <*> peek (offset @"firCid_count"     ptr)
      <*> peek (offset @"firNum_dicts"     ptr)
      <*> peek (offset @"firFont_dicts"    ptr)
      <*> peek (offset @"firData_offset"   ptr)

  poke ptr val = do
    pokeField @"firCid_font_name" ptr val
    pokeField @"firCid_version"   ptr val
    pokeField @"firCid_font_type" ptr val
    pokeField @"firRegistry"      ptr val
    pokeField @"firOrdering"      ptr val
    pokeField @"firSupplement"    ptr val
    pokeField @"firFont_info"     ptr val
    pokeField @"firFont_bbox"     ptr val
    pokeField @"firUid_base"      ptr val
    pokeField @"firNum_xuid"      ptr val
    pokeField @"firXuid"          ptr val
    pokeField @"firCidmap_offset" ptr val
    pokeField @"firFd_bytes"      ptr val
    pokeField @"firGd_bytes"      ptr val
    pokeField @"firCid_count"     ptr val
    pokeField @"firNum_dicts"     ptr val
    pokeField @"firFont_dicts"    ptr val
    pokeField @"firData_offset"   ptr val



type CID_FaceInfo = Ptr CID_FaceInfoRec



type T1_Blend_Flags = #type enum T1_Blend_Flags_



type T1_EncodingType = #type enum T1_EncodingType_



type PS_Dict_Keys = #type enum PS_Dict_Keys_



type T1_FontInfo = Ptr PS_FontInfoRec



type T1_Private = Ptr PS_PrivateRec



type CID_FontDict = Ptr CID_FaceDictRec



type CID_Info = CID_FaceInfoRec
