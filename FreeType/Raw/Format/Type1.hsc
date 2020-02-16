{-# OPTIONS_GHC -fno-warn-orphans #-}

module FreeType.Raw.Format.Type1
  ( module FreeType.Raw.Format.Type1.Internal
  ) where

import           FreeType.Raw.Circular ()
import           FreeType.Raw.Format.Type1.Internal
import           FreeType.Lens

import           Foreign.Storable
import           Lens.Micro ((^.))

#include "ft2build.h"
#include FT_TYPE1_TABLES_H

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
    #{poke struct PS_FontInfoRec_, version            } ptr $ val^.version
    #{poke struct PS_FontInfoRec_, notice             } ptr $ val^.notice
    #{poke struct PS_FontInfoRec_, full_name          } ptr $ val^.full_name
    #{poke struct PS_FontInfoRec_, family_name        } ptr $ val^.family_name
    #{poke struct PS_FontInfoRec_, weight             } ptr $ val^.weight
    #{poke struct PS_FontInfoRec_, italic_angle       } ptr $ val^.italic_angle
    #{poke struct PS_FontInfoRec_, is_fixed_pitch     } ptr $ val^.is_fixed_pitch
    #{poke struct PS_FontInfoRec_, underline_position } ptr $ val^.underline_position
    #{poke struct PS_FontInfoRec_, underline_thickness} ptr $ val^.underline_thickness



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
    #{poke struct PS_PrivateRec_, unique_id             } ptr $ val^.unique_id
    #{poke struct PS_PrivateRec_, lenIV                 } ptr $ val^.lenIV
    #{poke struct PS_PrivateRec_, num_blue_values       } ptr $ val^.num_blue_values
    #{poke struct PS_PrivateRec_, num_other_blues       } ptr $ val^.num_other_blues
    #{poke struct PS_PrivateRec_, num_family_blues      } ptr $ val^.num_family_blues
    #{poke struct PS_PrivateRec_, num_family_other_blues} ptr $ val^.num_family_other_blues
    #{poke struct PS_PrivateRec_, blue_values           } ptr $ val^.blue_values
    #{poke struct PS_PrivateRec_, other_blues           } ptr $ val^.other_blues
    #{poke struct PS_PrivateRec_, family_blues          } ptr $ val^.family_blues
    #{poke struct PS_PrivateRec_, family_other_blues    } ptr $ val^.family_other_blues
    #{poke struct PS_PrivateRec_, blue_scale            } ptr $ val^.blue_scale
    #{poke struct PS_PrivateRec_, blue_shift            } ptr $ val^.blue_shift
    #{poke struct PS_PrivateRec_, blue_fuzz             } ptr $ val^.blue_fuzz
    #{poke struct PS_PrivateRec_, standard_width        } ptr $ val^.standard_width
    #{poke struct PS_PrivateRec_, standard_height       } ptr $ val^.standard_height
    #{poke struct PS_PrivateRec_, num_snap_widths       } ptr $ val^.num_snap_widths
    #{poke struct PS_PrivateRec_, num_snap_heights      } ptr $ val^.num_snap_heights
    #{poke struct PS_PrivateRec_, force_bold            } ptr $ val^.force_bold
    #{poke struct PS_PrivateRec_, round_stem_up         } ptr $ val^.round_stem_up
    #{poke struct PS_PrivateRec_, snap_widths           } ptr $ val^.snap_widths
    #{poke struct PS_PrivateRec_, snap_heights          } ptr $ val^.snap_heights
    #{poke struct PS_PrivateRec_, expansion_factor      } ptr $ val^.expansion_factor
    #{poke struct PS_PrivateRec_, language_group        } ptr $ val^.language_group
    #{poke struct PS_PrivateRec_, password              } ptr $ val^.password
    #{poke struct PS_PrivateRec_, min_feature           } ptr $ val^.min_feature



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
    #{poke struct CID_FaceDictRec_, private_dict       } ptr $ val^.private_dict
    #{poke struct CID_FaceDictRec_, len_buildchar      } ptr $ val^.len_buildchar
    #{poke struct CID_FaceDictRec_, forcebold_threshold} ptr $ val^.forcebold_threshold
    #{poke struct CID_FaceDictRec_, stroke_width       } ptr $ val^.stroke_width
    #{poke struct CID_FaceDictRec_, expansion_factor   } ptr $ val^.expansion_factor
    #{poke struct CID_FaceDictRec_, paint_type         } ptr $ val^.paint_type
    #{poke struct CID_FaceDictRec_, font_type          } ptr $ val^.font_type
    #{poke struct CID_FaceDictRec_, font_matrix        } ptr $ val^.font_matrix
    #{poke struct CID_FaceDictRec_, font_offset        } ptr $ val^.font_offset
    #{poke struct CID_FaceDictRec_, num_subrs          } ptr $ val^.num_subrs
    #{poke struct CID_FaceDictRec_, subrmap_offset     } ptr $ val^.subrmap_offset
    #{poke struct CID_FaceDictRec_, sd_bytes           } ptr $ val^.sd_bytes



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
    #{poke struct CID_FaceInfoRec_, cid_font_name} ptr $ val^.cid_font_name
    #{poke struct CID_FaceInfoRec_, cid_version  } ptr $ val^.cid_version
    #{poke struct CID_FaceInfoRec_, cid_font_type} ptr $ val^.cid_font_type
    #{poke struct CID_FaceInfoRec_, registry     } ptr $ val^.registry
    #{poke struct CID_FaceInfoRec_, ordering     } ptr $ val^.ordering
    #{poke struct CID_FaceInfoRec_, supplement   } ptr $ val^.supplement
    #{poke struct CID_FaceInfoRec_, font_info    } ptr $ val^.font_info
    #{poke struct CID_FaceInfoRec_, font_bbox    } ptr $ val^.font_bbox
    #{poke struct CID_FaceInfoRec_, uid_base     } ptr $ val^.uid_base
    #{poke struct CID_FaceInfoRec_, num_xuid     } ptr $ val^.num_xuid
    #{poke struct CID_FaceInfoRec_, xuid         } ptr $ val^.xuid
    #{poke struct CID_FaceInfoRec_, cidmap_offset} ptr $ val^.cidmap_offset
    #{poke struct CID_FaceInfoRec_, fd_bytes     } ptr $ val^.fd_bytes
    #{poke struct CID_FaceInfoRec_, gd_bytes     } ptr $ val^.gd_bytes
    #{poke struct CID_FaceInfoRec_, cid_count    } ptr $ val^.cid_count
    #{poke struct CID_FaceInfoRec_, num_dicts    } ptr $ val^.num_dicts
    #{poke struct CID_FaceInfoRec_, font_dicts   } ptr $ val^.font_dicts
    #{poke struct CID_FaceInfoRec_, data_offset  } ptr $ val^.data_offset
