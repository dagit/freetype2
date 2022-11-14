{-# LANGUAGE DataKinds
           , FlexibleInstances
           , ForeignFunctionInterface
           , MultiParamTypeClasses #-}
#if __GLASGOW_HASKELL__ >= 902
{-# LANGUAGE NoFieldSelectors #-}
#endif
{-# LANGUAGE TypeApplications #-}

module FreeType.Format.WinFNT.Types where

import           FreeType.Core.Types.Types

import           Foreign.Ptr
import           Foreign.Storable
import           Foreign.Storable.Offset

#include "ft2build.h"
#include FT_WINFONTS_H

data FT_WinFNT_HeaderRec = FT_WinFNT_HeaderRec
                             { version               :: FT_UShort
                             , file_size             :: FT_ULong
                             , copyright             :: FT_Byte
                             , file_type             :: FT_UShort
                             , nominal_point_size    :: FT_UShort
                             , vertical_resolution   :: FT_UShort
                             , horizontal_resolution :: FT_UShort
                             , ascent                :: FT_UShort
                             , internal_leading      :: FT_UShort
                             , external_leading      :: FT_UShort
                             , italic                :: FT_Byte
                             , underline             :: FT_Byte
                             , strike_out            :: FT_Byte
                             , weight                :: FT_UShort
                             , charset               :: FT_Byte
                             , pixel_width           :: FT_UShort
                             , pixel_height          :: FT_UShort
                             , pitch_and_family      :: FT_Byte
                             , avg_width             :: FT_UShort
                             , max_width             :: FT_UShort
                             , first_char            :: FT_Byte
                             , last_char             :: FT_Byte
                             , default_char          :: FT_Byte
                             , break_char            :: FT_Byte
                             , bytes_per_row         :: FT_UShort
                             , device_offset         :: FT_ULong
                             , face_name_offset      :: FT_ULong
                             , bits_pointer          :: FT_ULong
                             , bits_offset           :: FT_ULong
                             , reserved              :: FT_Byte
                             , flags                 :: FT_ULong
                             , a_space               :: FT_UShort
                             , b_space               :: FT_UShort
                             , c_space               :: FT_UShort
                             , color_table_offset    :: FT_UShort
                             , reserved1             :: FT_ULong
                             }

instance Offset "version"               FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, version              }
instance Offset "file_size"             FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, file_size            }
instance Offset "copyright"             FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, copyright            }
instance Offset "file_type"             FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, file_type            }
instance Offset "nominal_point_size"    FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, nominal_point_size   }
instance Offset "vertical_resolution"   FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, vertical_resolution  }
instance Offset "horizontal_resolution" FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, horizontal_resolution}
instance Offset "ascent"                FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, ascent               }
instance Offset "internal_leading"      FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, internal_leading     }
instance Offset "external_leading"      FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, external_leading     }
instance Offset "italic"                FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, italic               }
instance Offset "underline"             FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, underline            }
instance Offset "strike_out"            FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, strike_out           }
instance Offset "weight"                FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, weight               }
instance Offset "charset"               FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, charset              }
instance Offset "pixel_width"           FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, pixel_width          }
instance Offset "pixel_height"          FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, pixel_height         }
instance Offset "pitch_and_family"      FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, pitch_and_family     }
instance Offset "avg_width"             FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, avg_width            }
instance Offset "max_width"             FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, max_width            }
instance Offset "first_char"            FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, first_char           }
instance Offset "last_char"             FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, last_char            }
instance Offset "default_char"          FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, default_char         }
instance Offset "break_char"            FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, break_char           }
instance Offset "bytes_per_row"         FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, bytes_per_row        }
instance Offset "device_offset"         FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, device_offset        }
instance Offset "face_name_offset"      FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, face_name_offset     }
instance Offset "bits_pointer"          FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, bits_pointer         }
instance Offset "bits_offset"           FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, bits_offset          }
instance Offset "reserved"              FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, reserved             }
instance Offset "flags"                 FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, flags                }
instance Offset "a_space"               FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, A_space              }
instance Offset "b_space"               FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, B_space              }
instance Offset "c_space"               FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, C_space              }
instance Offset "color_table_offset"    FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, color_table_offset   }
instance Offset "reserved1"             FT_WinFNT_HeaderRec where rawOffset = #{offset struct FT_WinFNT_HeaderRec_, reserved1            }

instance Storable FT_WinFNT_HeaderRec where
  sizeOf _    = #size      struct FT_WinFNT_HeaderRec_
  alignment _ = #alignment struct FT_WinFNT_HeaderRec_

  peek ptr =
    FT_WinFNT_HeaderRec
      <$> peek (offset @"version"               ptr)
      <*> peek (offset @"file_size"             ptr)
      <*> peek (offset @"copyright"             ptr)
      <*> peek (offset @"file_type"             ptr)
      <*> peek (offset @"nominal_point_size"    ptr)
      <*> peek (offset @"vertical_resolution"   ptr)
      <*> peek (offset @"horizontal_resolution" ptr)
      <*> peek (offset @"ascent"                ptr)
      <*> peek (offset @"internal_leading"      ptr)
      <*> peek (offset @"external_leading"      ptr)
      <*> peek (offset @"italic"                ptr)
      <*> peek (offset @"underline"             ptr)
      <*> peek (offset @"strike_out"            ptr)
      <*> peek (offset @"weight"                ptr)
      <*> peek (offset @"charset"               ptr)
      <*> peek (offset @"pixel_width"           ptr)
      <*> peek (offset @"pixel_height"          ptr)
      <*> peek (offset @"pitch_and_family"      ptr)
      <*> peek (offset @"avg_width"             ptr)
      <*> peek (offset @"max_width"             ptr)
      <*> peek (offset @"first_char"            ptr)
      <*> peek (offset @"last_char"             ptr)
      <*> peek (offset @"default_char"          ptr)
      <*> peek (offset @"break_char"            ptr)
      <*> peek (offset @"bytes_per_row"         ptr)
      <*> peek (offset @"device_offset"         ptr)
      <*> peek (offset @"face_name_offset"      ptr)
      <*> peek (offset @"bits_pointer"          ptr)
      <*> peek (offset @"bits_offset"           ptr)
      <*> peek (offset @"reserved"              ptr)
      <*> peek (offset @"flags"                 ptr)
      <*> peek (offset @"a_space"               ptr)
      <*> peek (offset @"b_space"               ptr)
      <*> peek (offset @"c_space"               ptr)
      <*> peek (offset @"color_table_offset"    ptr)
      <*> peek (offset @"reserved1"             ptr)

  poke ptr val = do
    pokeField @"version"               ptr val
    pokeField @"file_size"             ptr val
    pokeField @"copyright"             ptr val
    pokeField @"file_type"             ptr val
    pokeField @"nominal_point_size"    ptr val
    pokeField @"vertical_resolution"   ptr val
    pokeField @"horizontal_resolution" ptr val
    pokeField @"ascent"                ptr val
    pokeField @"internal_leading"      ptr val
    pokeField @"external_leading"      ptr val
    pokeField @"italic"                ptr val
    pokeField @"underline"             ptr val
    pokeField @"strike_out"            ptr val
    pokeField @"weight"                ptr val
    pokeField @"charset"               ptr val
    pokeField @"pixel_width"           ptr val
    pokeField @"pixel_height"          ptr val
    pokeField @"pitch_and_family"      ptr val
    pokeField @"avg_width"             ptr val
    pokeField @"max_width"             ptr val
    pokeField @"first_char"            ptr val
    pokeField @"last_char"             ptr val
    pokeField @"default_char"          ptr val
    pokeField @"break_char"            ptr val
    pokeField @"bytes_per_row"         ptr val
    pokeField @"device_offset"         ptr val
    pokeField @"face_name_offset"      ptr val
    pokeField @"bits_pointer"          ptr val
    pokeField @"bits_offset"           ptr val
    pokeField @"reserved"              ptr val
    pokeField @"flags"                 ptr val
    pokeField @"a_space"               ptr val
    pokeField @"b_space"               ptr val
    pokeField @"c_space"               ptr val
    pokeField @"color_table_offset"    ptr val
    pokeField @"reserved1"             ptr val



type FT_WinFNT_Header = Ptr FT_WinFNT_HeaderRec
