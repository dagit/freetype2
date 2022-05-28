{-# LANGUAGE DataKinds
           , ForeignFunctionInterface
           , MultiParamTypeClasses
           , TypeApplications #-}

module FreeType.Format.WinFNT.Types where

import           FreeType.Core.Types.Types

import           Foreign.Ptr
import           Foreign.Storable
import           Foreign.Storable.Offset

#include "ft2build.h"
#include FT_WINFONTS_H

data FT_WinFNT_HeaderRec = FT_WinFNT_HeaderRec
                             { wfnthrVersion               :: FT_UShort
                             , wfnthrFile_size             :: FT_ULong
                             , wfnthrCopyright             :: FT_Byte
                             , wfnthrFile_type             :: FT_UShort
                             , wfnthrNominal_point_size    :: FT_UShort
                             , wfnthrVertical_resolution   :: FT_UShort
                             , wfnthrHorizontal_resolution :: FT_UShort
                             , wfnthrAscent                :: FT_UShort
                             , wfnthrInternal_leading      :: FT_UShort
                             , wfnthrExternal_leading      :: FT_UShort
                             , wfnthrItalic                :: FT_Byte
                             , wfnthrUnderline             :: FT_Byte
                             , wfnthrStrike_out            :: FT_Byte
                             , wfnthrWeight                :: FT_UShort
                             , wfnthrCharset               :: FT_Byte
                             , wfnthrPixel_width           :: FT_UShort
                             , wfnthrPixel_height          :: FT_UShort
                             , wfnthrPitch_and_family      :: FT_Byte
                             , wfnthrAvg_width             :: FT_UShort
                             , wfnthrMax_width             :: FT_UShort
                             , wfnthrFirst_char            :: FT_Byte
                             , wfnthrLast_char             :: FT_Byte
                             , wfnthrDefault_char          :: FT_Byte
                             , wfnthrBreak_char            :: FT_Byte
                             , wfnthrBytes_per_row         :: FT_UShort
                             , wfnthrDevice_offset         :: FT_ULong
                             , wfnthrFace_name_offset      :: FT_ULong
                             , wfnthrBits_pointer          :: FT_ULong
                             , wfnthrBits_offset           :: FT_ULong
                             , wfnthrReserved              :: FT_Byte
                             , wfnthrFlags                 :: FT_ULong
                             , wfnthrA_space               :: FT_UShort
                             , wfnthrB_space               :: FT_UShort
                             , wfnthrC_space               :: FT_UShort
                             , wfnthrColor_table_offset    :: FT_UShort
                             , wfnthrReserved1             :: FT_ULong
                             }

instance Offset "wfnthrVersion"               FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, version              }
instance Offset "wfnthrFile_size"             FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, file_size            }
instance Offset "wfnthrCopyright"             FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, copyright            }
instance Offset "wfnthrFile_type"             FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, file_type            }
instance Offset "wfnthrNominal_point_size"    FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, nominal_point_size   }
instance Offset "wfnthrVertical_resolution"   FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, vertical_resolution  }
instance Offset "wfnthrHorizontal_resolution" FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, horizontal_resolution}
instance Offset "wfnthrAscent"                FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, ascent               }
instance Offset "wfnthrInternal_leading"      FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, internal_leading     }
instance Offset "wfnthrExternal_leading"      FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, external_leading     }
instance Offset "wfnthrItalic"                FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, italic               }
instance Offset "wfnthrUnderline"             FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, underline            }
instance Offset "wfnthrStrike_out"            FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, strike_out           }
instance Offset "wfnthrWeight"                FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, weight               }
instance Offset "wfnthrCharset"               FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, charset              }
instance Offset "wfnthrPixel_width"           FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, pixel_width          }
instance Offset "wfnthrPixel_height"          FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, pixel_height         }
instance Offset "wfnthrPitch_and_family"      FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, pitch_and_family     }
instance Offset "wfnthrAvg_width"             FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, avg_width            }
instance Offset "wfnthrMax_width"             FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, max_width            }
instance Offset "wfnthrFirst_char"            FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, first_char           }
instance Offset "wfnthrLast_char"             FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, last_char            }
instance Offset "wfnthrDefault_char"          FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, default_char         }
instance Offset "wfnthrBreak_char"            FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, break_char           }
instance Offset "wfnthrBytes_per_row"         FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, bytes_per_row        }
instance Offset "wfnthrDevice_offset"         FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, device_offset        }
instance Offset "wfnthrFace_name_offset"      FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, face_name_offset     }
instance Offset "wfnthrBits_pointer"          FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, bits_pointer         }
instance Offset "wfnthrBits_offset"           FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, bits_offset          }
instance Offset "wfnthrReserved"              FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, reserved             }
instance Offset "wfnthrFlags"                 FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, flags                }
instance Offset "wfnthrA_space"               FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, A_space              }
instance Offset "wfnthrB_space"               FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, B_space              }
instance Offset "wfnthrC_space"               FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, C_space              }
instance Offset "wfnthrColor_table_offset"    FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, color_table_offset   }
instance Offset "wfnthrReserved1"             FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, reserved1            }



instance Storable FT_WinFNT_HeaderRec where
  sizeOf _    = #size      struct FT_WinFNT_HeaderRec_
  alignment _ = #alignment struct FT_WinFNT_HeaderRec_

  peek ptr =
    FT_WinFNT_HeaderRec
      <$> peek (offset @"wfnthrVersion"               ptr)
      <*> peek (offset @"wfnthrFile_size"             ptr)
      <*> peek (offset @"wfnthrCopyright"             ptr)
      <*> peek (offset @"wfnthrFile_type"             ptr)
      <*> peek (offset @"wfnthrNominal_point_size"    ptr)
      <*> peek (offset @"wfnthrVertical_resolution"   ptr)
      <*> peek (offset @"wfnthrHorizontal_resolution" ptr)
      <*> peek (offset @"wfnthrAscent"                ptr)
      <*> peek (offset @"wfnthrInternal_leading"      ptr)
      <*> peek (offset @"wfnthrExternal_leading"      ptr)
      <*> peek (offset @"wfnthrItalic"                ptr)
      <*> peek (offset @"wfnthrUnderline"             ptr)
      <*> peek (offset @"wfnthrStrike_out"            ptr)
      <*> peek (offset @"wfnthrWeight"                ptr)
      <*> peek (offset @"wfnthrCharset"               ptr)
      <*> peek (offset @"wfnthrPixel_width"           ptr)
      <*> peek (offset @"wfnthrPixel_height"          ptr)
      <*> peek (offset @"wfnthrPitch_and_family"      ptr)
      <*> peek (offset @"wfnthrAvg_width"             ptr)
      <*> peek (offset @"wfnthrMax_width"             ptr)
      <*> peek (offset @"wfnthrFirst_char"            ptr)
      <*> peek (offset @"wfnthrLast_char"             ptr)
      <*> peek (offset @"wfnthrDefault_char"          ptr)
      <*> peek (offset @"wfnthrBreak_char"            ptr)
      <*> peek (offset @"wfnthrBytes_per_row"         ptr)
      <*> peek (offset @"wfnthrDevice_offset"         ptr)
      <*> peek (offset @"wfnthrFace_name_offset"      ptr)
      <*> peek (offset @"wfnthrBits_pointer"          ptr)
      <*> peek (offset @"wfnthrBits_offset"           ptr)
      <*> peek (offset @"wfnthrReserved"              ptr)
      <*> peek (offset @"wfnthrFlags"                 ptr)
      <*> peek (offset @"wfnthrA_space"               ptr)
      <*> peek (offset @"wfnthrB_space"               ptr)
      <*> peek (offset @"wfnthrC_space"               ptr)
      <*> peek (offset @"wfnthrColor_table_offset"    ptr)
      <*> peek (offset @"wfnthrReserved1"             ptr)

  poke ptr val = do
    pokeField @"wfnthrVersion"               ptr val
    pokeField @"wfnthrFile_size"             ptr val
    pokeField @"wfnthrCopyright"             ptr val
    pokeField @"wfnthrFile_type"             ptr val
    pokeField @"wfnthrNominal_point_size"    ptr val
    pokeField @"wfnthrVertical_resolution"   ptr val
    pokeField @"wfnthrHorizontal_resolution" ptr val
    pokeField @"wfnthrAscent"                ptr val
    pokeField @"wfnthrInternal_leading"      ptr val
    pokeField @"wfnthrExternal_leading"      ptr val
    pokeField @"wfnthrItalic"                ptr val
    pokeField @"wfnthrUnderline"             ptr val
    pokeField @"wfnthrStrike_out"            ptr val
    pokeField @"wfnthrWeight"                ptr val
    pokeField @"wfnthrCharset"               ptr val
    pokeField @"wfnthrPixel_width"           ptr val
    pokeField @"wfnthrPixel_height"          ptr val
    pokeField @"wfnthrPitch_and_family"      ptr val
    pokeField @"wfnthrAvg_width"             ptr val
    pokeField @"wfnthrMax_width"             ptr val
    pokeField @"wfnthrFirst_char"            ptr val
    pokeField @"wfnthrLast_char"             ptr val
    pokeField @"wfnthrDefault_char"          ptr val
    pokeField @"wfnthrBreak_char"            ptr val
    pokeField @"wfnthrBytes_per_row"         ptr val
    pokeField @"wfnthrDevice_offset"         ptr val
    pokeField @"wfnthrFace_name_offset"      ptr val
    pokeField @"wfnthrBits_pointer"          ptr val
    pokeField @"wfnthrBits_offset"           ptr val
    pokeField @"wfnthrReserved"              ptr val
    pokeField @"wfnthrFlags"                 ptr val
    pokeField @"wfnthrA_space"               ptr val
    pokeField @"wfnthrB_space"               ptr val
    pokeField @"wfnthrC_space"               ptr val
    pokeField @"wfnthrColor_table_offset"    ptr val
    pokeField @"wfnthrReserved1"             ptr val



type FT_WinFNT_Header = Ptr FT_WinFNT_HeaderRec
