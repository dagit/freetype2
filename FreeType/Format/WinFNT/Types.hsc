{-# LANGUAGE ForeignFunctionInterface #-}

module FreeType.Format.WinFNT.Types where

import           FreeType.Core.Types.Types

import           Data.Function ((&))
import           Foreign.Ptr
import           Foreign.Storable

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

instance Storable FT_WinFNT_HeaderRec where
  sizeOf _    = #size      struct FT_WinFNT_HeaderRec_
  alignment _ = #alignment struct FT_WinFNT_HeaderRec_

  peek ptr =
    FT_WinFNT_HeaderRec
      <$> #{peek struct FT_WinFNT_HeaderRec_, version              } ptr
      <*> #{peek struct FT_WinFNT_HeaderRec_, file_size            } ptr
      <*> #{peek struct FT_WinFNT_HeaderRec_, copyright            } ptr
      <*> #{peek struct FT_WinFNT_HeaderRec_, file_type            } ptr
      <*> #{peek struct FT_WinFNT_HeaderRec_, nominal_point_size   } ptr
      <*> #{peek struct FT_WinFNT_HeaderRec_, vertical_resolution  } ptr
      <*> #{peek struct FT_WinFNT_HeaderRec_, horizontal_resolution} ptr
      <*> #{peek struct FT_WinFNT_HeaderRec_, ascent               } ptr
      <*> #{peek struct FT_WinFNT_HeaderRec_, internal_leading     } ptr
      <*> #{peek struct FT_WinFNT_HeaderRec_, external_leading     } ptr
      <*> #{peek struct FT_WinFNT_HeaderRec_, italic               } ptr
      <*> #{peek struct FT_WinFNT_HeaderRec_, underline            } ptr
      <*> #{peek struct FT_WinFNT_HeaderRec_, strike_out           } ptr
      <*> #{peek struct FT_WinFNT_HeaderRec_, weight               } ptr
      <*> #{peek struct FT_WinFNT_HeaderRec_, charset              } ptr
      <*> #{peek struct FT_WinFNT_HeaderRec_, pixel_width          } ptr
      <*> #{peek struct FT_WinFNT_HeaderRec_, pixel_height         } ptr
      <*> #{peek struct FT_WinFNT_HeaderRec_, pitch_and_family     } ptr
      <*> #{peek struct FT_WinFNT_HeaderRec_, avg_width            } ptr
      <*> #{peek struct FT_WinFNT_HeaderRec_, max_width            } ptr
      <*> #{peek struct FT_WinFNT_HeaderRec_, first_char           } ptr
      <*> #{peek struct FT_WinFNT_HeaderRec_, last_char            } ptr
      <*> #{peek struct FT_WinFNT_HeaderRec_, default_char         } ptr
      <*> #{peek struct FT_WinFNT_HeaderRec_, break_char           } ptr
      <*> #{peek struct FT_WinFNT_HeaderRec_, bytes_per_row        } ptr
      <*> #{peek struct FT_WinFNT_HeaderRec_, device_offset        } ptr
      <*> #{peek struct FT_WinFNT_HeaderRec_, face_name_offset     } ptr
      <*> #{peek struct FT_WinFNT_HeaderRec_, bits_pointer         } ptr
      <*> #{peek struct FT_WinFNT_HeaderRec_, bits_offset          } ptr
      <*> #{peek struct FT_WinFNT_HeaderRec_, reserved             } ptr
      <*> #{peek struct FT_WinFNT_HeaderRec_, flags                } ptr
      <*> #{peek struct FT_WinFNT_HeaderRec_, A_space              } ptr
      <*> #{peek struct FT_WinFNT_HeaderRec_, B_space              } ptr
      <*> #{peek struct FT_WinFNT_HeaderRec_, C_space              } ptr
      <*> #{peek struct FT_WinFNT_HeaderRec_, color_table_offset   } ptr
      <*> #{peek struct FT_WinFNT_HeaderRec_, reserved1            } ptr

  poke ptr val = do
    #{poke struct FT_WinFNT_HeaderRec_, version              } ptr $ val & wfnthrVersion
    #{poke struct FT_WinFNT_HeaderRec_, file_size            } ptr $ val & wfnthrFile_size
    #{poke struct FT_WinFNT_HeaderRec_, copyright            } ptr $ val & wfnthrCopyright
    #{poke struct FT_WinFNT_HeaderRec_, file_type            } ptr $ val & wfnthrFile_type
    #{poke struct FT_WinFNT_HeaderRec_, nominal_point_size   } ptr $ val & wfnthrNominal_point_size
    #{poke struct FT_WinFNT_HeaderRec_, vertical_resolution  } ptr $ val & wfnthrVertical_resolution
    #{poke struct FT_WinFNT_HeaderRec_, horizontal_resolution} ptr $ val & wfnthrHorizontal_resolution
    #{poke struct FT_WinFNT_HeaderRec_, ascent               } ptr $ val & wfnthrAscent
    #{poke struct FT_WinFNT_HeaderRec_, internal_leading     } ptr $ val & wfnthrInternal_leading
    #{poke struct FT_WinFNT_HeaderRec_, external_leading     } ptr $ val & wfnthrExternal_leading
    #{poke struct FT_WinFNT_HeaderRec_, italic               } ptr $ val & wfnthrItalic
    #{poke struct FT_WinFNT_HeaderRec_, underline            } ptr $ val & wfnthrUnderline
    #{poke struct FT_WinFNT_HeaderRec_, strike_out           } ptr $ val & wfnthrStrike_out
    #{poke struct FT_WinFNT_HeaderRec_, weight               } ptr $ val & wfnthrWeight
    #{poke struct FT_WinFNT_HeaderRec_, charset              } ptr $ val & wfnthrCharset
    #{poke struct FT_WinFNT_HeaderRec_, pixel_width          } ptr $ val & wfnthrPixel_width
    #{poke struct FT_WinFNT_HeaderRec_, pixel_height         } ptr $ val & wfnthrPixel_height
    #{poke struct FT_WinFNT_HeaderRec_, pitch_and_family     } ptr $ val & wfnthrPitch_and_family
    #{poke struct FT_WinFNT_HeaderRec_, avg_width            } ptr $ val & wfnthrAvg_width
    #{poke struct FT_WinFNT_HeaderRec_, max_width            } ptr $ val & wfnthrMax_width
    #{poke struct FT_WinFNT_HeaderRec_, first_char           } ptr $ val & wfnthrFirst_char
    #{poke struct FT_WinFNT_HeaderRec_, last_char            } ptr $ val & wfnthrLast_char
    #{poke struct FT_WinFNT_HeaderRec_, default_char         } ptr $ val & wfnthrDefault_char
    #{poke struct FT_WinFNT_HeaderRec_, break_char           } ptr $ val & wfnthrBreak_char
    #{poke struct FT_WinFNT_HeaderRec_, bytes_per_row        } ptr $ val & wfnthrBytes_per_row
    #{poke struct FT_WinFNT_HeaderRec_, device_offset        } ptr $ val & wfnthrDevice_offset
    #{poke struct FT_WinFNT_HeaderRec_, face_name_offset     } ptr $ val & wfnthrFace_name_offset
    #{poke struct FT_WinFNT_HeaderRec_, bits_pointer         } ptr $ val & wfnthrBits_pointer
    #{poke struct FT_WinFNT_HeaderRec_, bits_offset          } ptr $ val & wfnthrBits_offset
    #{poke struct FT_WinFNT_HeaderRec_, reserved             } ptr $ val & wfnthrReserved
    #{poke struct FT_WinFNT_HeaderRec_, flags                } ptr $ val & wfnthrFlags
    #{poke struct FT_WinFNT_HeaderRec_, A_space              } ptr $ val & wfnthrA_space
    #{poke struct FT_WinFNT_HeaderRec_, B_space              } ptr $ val & wfnthrB_space
    #{poke struct FT_WinFNT_HeaderRec_, C_space              } ptr $ val & wfnthrC_space
    #{poke struct FT_WinFNT_HeaderRec_, color_table_offset   } ptr $ val & wfnthrColor_table_offset
    #{poke struct FT_WinFNT_HeaderRec_, reserved1            } ptr $ val & wfnthrReserved1



type FT_WinFNT_Header = Ptr FT_WinFNT_HeaderRec
