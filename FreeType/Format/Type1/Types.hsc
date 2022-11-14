{-# LANGUAGE DataKinds
           , DuplicateRecordFields
           , FlexibleInstances
           , ForeignFunctionInterface
           , MultiParamTypeClasses #-}
#if __GLASGOW_HASKELL__ >= 902
{-# LANGUAGE NoFieldSelectors #-}
#endif
{-# LANGUAGE TypeApplications #-}

module FreeType.Format.Type1.Types where

import           FreeType.Core.Types.Types

import           Data.Word
import           Foreign.Ptr
import           Foreign.Storable
import           Foreign.Storable.Offset

#include "ft2build.h"
#include FT_TYPE1_TABLES_H

data PS_FontInfoRec = PS_FontInfoRec
                        { version             :: Ptr FT_String
                        , notice              :: Ptr FT_String
                        , full_name           :: Ptr FT_String
                        , family_name         :: Ptr FT_String
                        , weight              :: Ptr FT_String
                        , italic_angle        :: FT_Long
                        , is_fixed_pitch      :: FT_Bool
                        , underline_position  :: FT_Short
                        , underline_thickness :: FT_UShort
                        }

instance Offset "version"             PS_FontInfoRec where rawOffset = #{offset struct PS_FontInfoRec_, version            }
instance Offset "notice"              PS_FontInfoRec where rawOffset = #{offset struct PS_FontInfoRec_, notice             }
instance Offset "full_name"           PS_FontInfoRec where rawOffset = #{offset struct PS_FontInfoRec_, full_name          }
instance Offset "family_name"         PS_FontInfoRec where rawOffset = #{offset struct PS_FontInfoRec_, family_name        }
instance Offset "weight"              PS_FontInfoRec where rawOffset = #{offset struct PS_FontInfoRec_, weight             }
instance Offset "italic_angle"        PS_FontInfoRec where rawOffset = #{offset struct PS_FontInfoRec_, italic_angle       }
instance Offset "is_fixed_pitch"      PS_FontInfoRec where rawOffset = #{offset struct PS_FontInfoRec_, is_fixed_pitch     }
instance Offset "underline_position"  PS_FontInfoRec where rawOffset = #{offset struct PS_FontInfoRec_, underline_position }
instance Offset "underline_thickness" PS_FontInfoRec where rawOffset = #{offset struct PS_FontInfoRec_, underline_thickness}

instance Storable PS_FontInfoRec where
  sizeOf _    = #size      struct PS_FontInfoRec_
  alignment _ = #alignment struct PS_FontInfoRec_

  peek ptr =
    PS_FontInfoRec
      <$> peek (offset @"version"             ptr)
      <*> peek (offset @"notice"              ptr)
      <*> peek (offset @"full_name"           ptr)
      <*> peek (offset @"family_name"         ptr)
      <*> peek (offset @"weight"              ptr)
      <*> peek (offset @"italic_angle"        ptr)
      <*> peek (offset @"is_fixed_pitch"      ptr)
      <*> peek (offset @"underline_position"  ptr)
      <*> peek (offset @"underline_thickness" ptr)

  poke ptr val = do
    pokeField @"version"             ptr val
    pokeField @"notice"              ptr val
    pokeField @"full_name"           ptr val
    pokeField @"family_name"         ptr val
    pokeField @"weight"              ptr val
    pokeField @"italic_angle"        ptr val
    pokeField @"is_fixed_pitch"      ptr val
    pokeField @"underline_position"  ptr val
    pokeField @"underline_thickness" ptr val



type PS_FontInfo = Ptr PS_FontInfoRec



data PS_PrivateRec = PS_PrivateRec
                       { unique_id              :: FT_Int
                       , lenIV                  :: FT_Int
                       , num_blue_values        :: FT_Byte
                       , num_other_blues        :: FT_Byte
                       , num_family_blues       :: FT_Byte
                       , num_family_other_blues :: FT_Byte
                       , blue_values            :: FT_Short
                       , other_blues            :: FT_Short
                       , family_blues           :: FT_Short
                       , family_other_blues     :: FT_Short
                       , blue_scale             :: FT_Fixed
                       , blue_shift             :: FT_Int
                       , blue_fuzz              :: FT_Int
                       , standard_width         :: FT_UShort
                       , standard_height        :: FT_UShort
                       , num_snap_widths        :: FT_Byte
                       , num_snap_heights       :: FT_Byte
                       , force_bold             :: FT_Bool
                       , round_stem_up          :: FT_Bool
                       , snap_widths            :: FT_Short
                       , snap_heights           :: FT_Short
                       , expansion_factor       :: FT_Fixed
                       , language_group         :: FT_Long
                       , password               :: FT_Long
                       , min_feature            :: FT_Short
                       }

instance Offset "unique_id"              PS_PrivateRec where rawOffset = #{offset struct PS_PrivateRec_, unique_id             }
instance Offset "lenIV"                  PS_PrivateRec where rawOffset = #{offset struct PS_PrivateRec_, lenIV                 }
instance Offset "num_blue_values"        PS_PrivateRec where rawOffset = #{offset struct PS_PrivateRec_, num_blue_values       }
instance Offset "num_other_blues"        PS_PrivateRec where rawOffset = #{offset struct PS_PrivateRec_, num_other_blues       }
instance Offset "num_family_blues"       PS_PrivateRec where rawOffset = #{offset struct PS_PrivateRec_, num_family_blues      }
instance Offset "num_family_other_blues" PS_PrivateRec where rawOffset = #{offset struct PS_PrivateRec_, num_family_other_blues}
instance Offset "blue_values"            PS_PrivateRec where rawOffset = #{offset struct PS_PrivateRec_, blue_values           }
instance Offset "other_blues"            PS_PrivateRec where rawOffset = #{offset struct PS_PrivateRec_, other_blues           }
instance Offset "family_blues"           PS_PrivateRec where rawOffset = #{offset struct PS_PrivateRec_, family_blues          }
instance Offset "family_other_blues"     PS_PrivateRec where rawOffset = #{offset struct PS_PrivateRec_, family_other_blues    }
instance Offset "blue_scale"             PS_PrivateRec where rawOffset = #{offset struct PS_PrivateRec_, blue_scale            }
instance Offset "blue_shift"             PS_PrivateRec where rawOffset = #{offset struct PS_PrivateRec_, blue_shift            }
instance Offset "blue_fuzz"              PS_PrivateRec where rawOffset = #{offset struct PS_PrivateRec_, blue_fuzz             }
instance Offset "standard_width"         PS_PrivateRec where rawOffset = #{offset struct PS_PrivateRec_, standard_width        }
instance Offset "standard_height"        PS_PrivateRec where rawOffset = #{offset struct PS_PrivateRec_, standard_height       }
instance Offset "num_snap_widths"        PS_PrivateRec where rawOffset = #{offset struct PS_PrivateRec_, num_snap_widths       }
instance Offset "num_snap_heights"       PS_PrivateRec where rawOffset = #{offset struct PS_PrivateRec_, num_snap_heights      }
instance Offset "force_bold"             PS_PrivateRec where rawOffset = #{offset struct PS_PrivateRec_, force_bold            }
instance Offset "round_stem_up"          PS_PrivateRec where rawOffset = #{offset struct PS_PrivateRec_, round_stem_up         }
instance Offset "snap_widths"            PS_PrivateRec where rawOffset = #{offset struct PS_PrivateRec_, snap_widths           }
instance Offset "snap_heights"           PS_PrivateRec where rawOffset = #{offset struct PS_PrivateRec_, snap_heights          }
instance Offset "expansion_factor"       PS_PrivateRec where rawOffset = #{offset struct PS_PrivateRec_, expansion_factor      }
instance Offset "language_group"         PS_PrivateRec where rawOffset = #{offset struct PS_PrivateRec_, language_group        }
instance Offset "password"               PS_PrivateRec where rawOffset = #{offset struct PS_PrivateRec_, password              }
instance Offset "min_feature"            PS_PrivateRec where rawOffset = #{offset struct PS_PrivateRec_, min_feature           }


instance Storable PS_PrivateRec where
  sizeOf _    = #size      struct PS_PrivateRec_
  alignment _ = #alignment struct PS_PrivateRec_

  peek ptr =
    PS_PrivateRec
      <$> peek (offset @"unique_id"              ptr)
      <*> peek (offset @"lenIV"                  ptr)
      <*> peek (offset @"num_blue_values"        ptr)
      <*> peek (offset @"num_other_blues"        ptr)
      <*> peek (offset @"num_family_blues"       ptr)
      <*> peek (offset @"num_family_other_blues" ptr)
      <*> peek (offset @"blue_values"            ptr)
      <*> peek (offset @"other_blues"            ptr)
      <*> peek (offset @"family_blues"           ptr)
      <*> peek (offset @"family_other_blues"     ptr)
      <*> peek (offset @"blue_scale"             ptr)
      <*> peek (offset @"blue_shift"             ptr)
      <*> peek (offset @"blue_fuzz"              ptr)
      <*> peek (offset @"standard_width"         ptr)
      <*> peek (offset @"standard_height"        ptr)
      <*> peek (offset @"num_snap_widths"        ptr)
      <*> peek (offset @"num_snap_heights"       ptr)
      <*> peek (offset @"force_bold"             ptr)
      <*> peek (offset @"round_stem_up"          ptr)
      <*> peek (offset @"snap_widths"            ptr)
      <*> peek (offset @"snap_heights"           ptr)
      <*> peek (offset @"expansion_factor"       ptr)
      <*> peek (offset @"language_group"         ptr)
      <*> peek (offset @"password"               ptr)
      <*> peek (offset @"min_feature"            ptr)

  poke ptr val = do
    pokeField @"unique_id"              ptr val
    pokeField @"lenIV"                  ptr val
    pokeField @"num_blue_values"        ptr val
    pokeField @"num_other_blues"        ptr val
    pokeField @"num_family_blues"       ptr val
    pokeField @"num_family_other_blues" ptr val
    pokeField @"blue_values"            ptr val
    pokeField @"other_blues"            ptr val
    pokeField @"family_blues"           ptr val
    pokeField @"family_other_blues"     ptr val
    pokeField @"blue_scale"             ptr val
    pokeField @"blue_shift"             ptr val
    pokeField @"blue_fuzz"              ptr val
    pokeField @"standard_width"         ptr val
    pokeField @"standard_height"        ptr val
    pokeField @"num_snap_widths"        ptr val
    pokeField @"num_snap_heights"       ptr val
    pokeField @"force_bold"             ptr val
    pokeField @"round_stem_up"          ptr val
    pokeField @"snap_widths"            ptr val
    pokeField @"snap_heights"           ptr val
    pokeField @"expansion_factor"       ptr val
    pokeField @"language_group"         ptr val
    pokeField @"password"               ptr val
    pokeField @"min_feature"            ptr val



type PS_Private = Ptr PS_PrivateRec



data CID_FaceDictRec = CID_FaceDictRec
                         { private_dict        :: PS_PrivateRec
                         , len_buildchar       :: FT_UInt
                         , forcebold_threshold :: FT_Fixed
                         , stroke_width        :: FT_Pos
                         , expansion_factor    :: FT_Fixed
                         , paint_type          :: FT_Byte
                         , font_type           :: FT_Byte
                         , font_matrix         :: FT_Matrix
                         , font_offset         :: FT_Vector
                         , num_subrs           :: FT_UInt
                         , subrmap_offset      :: FT_ULong
                         , sd_bytes            :: FT_Int
                         }

instance Offset "private_dict"        CID_FaceDictRec where rawOffset = #{offset struct CID_FaceDictRec_, private_dict       }
instance Offset "len_buildchar"       CID_FaceDictRec where rawOffset = #{offset struct CID_FaceDictRec_, len_buildchar      }
instance Offset "forcebold_threshold" CID_FaceDictRec where rawOffset = #{offset struct CID_FaceDictRec_, forcebold_threshold}
instance Offset "stroke_width"        CID_FaceDictRec where rawOffset = #{offset struct CID_FaceDictRec_, stroke_width       }
instance Offset "expansion_factor"    CID_FaceDictRec where rawOffset = #{offset struct CID_FaceDictRec_, expansion_factor   }
instance Offset "paint_type"          CID_FaceDictRec where rawOffset = #{offset struct CID_FaceDictRec_, paint_type         }
instance Offset "font_type"           CID_FaceDictRec where rawOffset = #{offset struct CID_FaceDictRec_, font_type          }
instance Offset "font_matrix"         CID_FaceDictRec where rawOffset = #{offset struct CID_FaceDictRec_, font_matrix        }
instance Offset "font_offset"         CID_FaceDictRec where rawOffset = #{offset struct CID_FaceDictRec_, font_offset        }
instance Offset "num_subrs"           CID_FaceDictRec where rawOffset = #{offset struct CID_FaceDictRec_, num_subrs          }
instance Offset "subrmap_offset"      CID_FaceDictRec where rawOffset = #{offset struct CID_FaceDictRec_, subrmap_offset     }
instance Offset "sd_bytes"            CID_FaceDictRec where rawOffset = #{offset struct CID_FaceDictRec_, sd_bytes           }

instance Storable CID_FaceDictRec where
  sizeOf _    = #size      struct CID_FaceDictRec_
  alignment _ = #alignment struct CID_FaceDictRec_

  peek ptr =
    CID_FaceDictRec
      <$> peek (offset @"private_dict"        ptr)
      <*> peek (offset @"len_buildchar"       ptr)
      <*> peek (offset @"forcebold_threshold" ptr)
      <*> peek (offset @"stroke_width"        ptr)
      <*> peek (offset @"expansion_factor"    ptr)
      <*> peek (offset @"paint_type"          ptr)
      <*> peek (offset @"font_type"           ptr)
      <*> peek (offset @"font_matrix"         ptr)
      <*> peek (offset @"font_offset"         ptr)
      <*> peek (offset @"num_subrs"           ptr)
      <*> peek (offset @"subrmap_offset"      ptr)
      <*> peek (offset @"sd_bytes"            ptr)

  poke ptr val = do
    pokeField @"private_dict"        ptr val
    pokeField @"len_buildchar"       ptr val
    pokeField @"forcebold_threshold" ptr val
    pokeField @"stroke_width"        ptr val
    pokeField @"expansion_factor"    ptr val
    pokeField @"paint_type"          ptr val
    pokeField @"font_type"           ptr val
    pokeField @"font_matrix"         ptr val
    pokeField @"font_offset"         ptr val
    pokeField @"num_subrs"           ptr val
    pokeField @"subrmap_offset"      ptr val
    pokeField @"sd_bytes"            ptr val



type CID_FaceDict = Ptr CID_FaceDictRec



data CID_FaceInfoRec = CID_FaceInfoRec
                         { cid_font_name :: Ptr FT_String
                         , cid_version   :: FT_Fixed
                         , cid_font_type :: FT_Int
                         , registry      :: Ptr FT_String
                         , ordering      :: Ptr FT_String
                         , supplement    :: FT_Int
                         , font_info     :: PS_FontInfoRec
                         , font_bbox     :: FT_BBox
                         , uid_base      :: FT_ULong
                         , num_xuid      :: FT_Int
                         , xuid          :: FT_ULong
                         , cidmap_offset :: FT_ULong
                         , fd_bytes      :: FT_Int
                         , gd_bytes      :: FT_Int
                         , cid_count     :: FT_ULong
                         , num_dicts     :: FT_Int
                         , font_dicts    :: CID_FaceDict
                         , data_offset   :: FT_ULong
                         }

instance Offset "cid_font_name" CID_FaceInfoRec where rawOffset = #{offset struct CID_FaceInfoRec_, cid_font_name}
instance Offset "cid_version"   CID_FaceInfoRec where rawOffset = #{offset struct CID_FaceInfoRec_, cid_version  }
instance Offset "cid_font_type" CID_FaceInfoRec where rawOffset = #{offset struct CID_FaceInfoRec_, cid_font_type}
instance Offset "registry"      CID_FaceInfoRec where rawOffset = #{offset struct CID_FaceInfoRec_, registry     }
instance Offset "ordering"      CID_FaceInfoRec where rawOffset = #{offset struct CID_FaceInfoRec_, ordering     }
instance Offset "supplement"    CID_FaceInfoRec where rawOffset = #{offset struct CID_FaceInfoRec_, supplement   }
instance Offset "font_info"     CID_FaceInfoRec where rawOffset = #{offset struct CID_FaceInfoRec_, font_info    }
instance Offset "font_bbox"     CID_FaceInfoRec where rawOffset = #{offset struct CID_FaceInfoRec_, font_bbox    }
instance Offset "uid_base"      CID_FaceInfoRec where rawOffset = #{offset struct CID_FaceInfoRec_, uid_base     }
instance Offset "num_xuid"      CID_FaceInfoRec where rawOffset = #{offset struct CID_FaceInfoRec_, num_xuid     }
instance Offset "xuid"          CID_FaceInfoRec where rawOffset = #{offset struct CID_FaceInfoRec_, xuid         }
instance Offset "cidmap_offset" CID_FaceInfoRec where rawOffset = #{offset struct CID_FaceInfoRec_, cidmap_offset}
instance Offset "fd_bytes"      CID_FaceInfoRec where rawOffset = #{offset struct CID_FaceInfoRec_, fd_bytes     }
instance Offset "gd_bytes"      CID_FaceInfoRec where rawOffset = #{offset struct CID_FaceInfoRec_, gd_bytes     }
instance Offset "cid_count"     CID_FaceInfoRec where rawOffset = #{offset struct CID_FaceInfoRec_, cid_count    }
instance Offset "num_dicts"     CID_FaceInfoRec where rawOffset = #{offset struct CID_FaceInfoRec_, num_dicts    }
instance Offset "font_dicts"    CID_FaceInfoRec where rawOffset = #{offset struct CID_FaceInfoRec_, font_dicts   }
instance Offset "data_offset"   CID_FaceInfoRec where rawOffset = #{offset struct CID_FaceInfoRec_, data_offset  }

instance Storable CID_FaceInfoRec where
  sizeOf _    = #size      struct CID_FaceInfoRec_
  alignment _ = #alignment struct CID_FaceInfoRec_

  peek ptr =
    CID_FaceInfoRec
      <$> peek (offset @"cid_font_name" ptr)
      <*> peek (offset @"cid_version"   ptr)
      <*> peek (offset @"cid_font_type" ptr)
      <*> peek (offset @"registry"      ptr)
      <*> peek (offset @"ordering"      ptr)
      <*> peek (offset @"supplement"    ptr)
      <*> peek (offset @"font_info"     ptr)
      <*> peek (offset @"font_bbox"     ptr)
      <*> peek (offset @"uid_base"      ptr)
      <*> peek (offset @"num_xuid"      ptr)
      <*> peek (offset @"xuid"          ptr)
      <*> peek (offset @"cidmap_offset" ptr)
      <*> peek (offset @"fd_bytes"      ptr)
      <*> peek (offset @"gd_bytes"      ptr)
      <*> peek (offset @"cid_count"     ptr)
      <*> peek (offset @"num_dicts"     ptr)
      <*> peek (offset @"font_dicts"    ptr)
      <*> peek (offset @"data_offset"   ptr)

  poke ptr val = do
    pokeField @"cid_font_name" ptr val
    pokeField @"cid_version"   ptr val
    pokeField @"cid_font_type" ptr val
    pokeField @"registry"      ptr val
    pokeField @"ordering"      ptr val
    pokeField @"supplement"    ptr val
    pokeField @"font_info"     ptr val
    pokeField @"font_bbox"     ptr val
    pokeField @"uid_base"      ptr val
    pokeField @"num_xuid"      ptr val
    pokeField @"xuid"          ptr val
    pokeField @"cidmap_offset" ptr val
    pokeField @"fd_bytes"      ptr val
    pokeField @"gd_bytes"      ptr val
    pokeField @"cid_count"     ptr val
    pokeField @"num_dicts"     ptr val
    pokeField @"font_dicts"    ptr val
    pokeField @"data_offset"   ptr val



type CID_FaceInfo = Ptr CID_FaceInfoRec



type T1_Blend_Flags = #type enum T1_Blend_Flags_



type T1_EncodingType = #type enum T1_EncodingType_



type PS_Dict_Keys = #type enum PS_Dict_Keys_



type T1_FontInfo = Ptr PS_FontInfoRec



type T1_Private = Ptr PS_PrivateRec



type CID_FontDict = Ptr CID_FaceDictRec



type CID_Info = CID_FaceInfoRec
