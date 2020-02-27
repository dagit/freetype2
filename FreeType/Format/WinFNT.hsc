{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

module FreeType.Format.WinFNT
  ( module FreeType.Format.WinFNT.Internal
  ) where

import           FreeType.Format.WinFNT.Internal
import           FreeType.Lens

import           Foreign.Storable
import           Lens.Micro ((^.))

#include "ft2build.h"
#include FT_WINFONTS_H

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
    #{poke struct FT_WinFNT_HeaderRec_, version              } ptr $ val^.version
    #{poke struct FT_WinFNT_HeaderRec_, file_size            } ptr $ val^.file_size
    #{poke struct FT_WinFNT_HeaderRec_, copyright            } ptr $ val^.copyright
    #{poke struct FT_WinFNT_HeaderRec_, file_type            } ptr $ val^.file_type
    #{poke struct FT_WinFNT_HeaderRec_, nominal_point_size   } ptr $ val^.nominal_point_size
    #{poke struct FT_WinFNT_HeaderRec_, vertical_resolution  } ptr $ val^.vertical_resolution
    #{poke struct FT_WinFNT_HeaderRec_, horizontal_resolution} ptr $ val^.horizontal_resolution
    #{poke struct FT_WinFNT_HeaderRec_, ascent               } ptr $ val^.ascent
    #{poke struct FT_WinFNT_HeaderRec_, internal_leading     } ptr $ val^.internal_leading
    #{poke struct FT_WinFNT_HeaderRec_, external_leading     } ptr $ val^.external_leading
    #{poke struct FT_WinFNT_HeaderRec_, italic               } ptr $ val^.italic
    #{poke struct FT_WinFNT_HeaderRec_, underline            } ptr $ val^.underline
    #{poke struct FT_WinFNT_HeaderRec_, strike_out           } ptr $ val^.strike_out
    #{poke struct FT_WinFNT_HeaderRec_, weight               } ptr $ val^.weight
    #{poke struct FT_WinFNT_HeaderRec_, charset              } ptr $ val^.charset
    #{poke struct FT_WinFNT_HeaderRec_, pixel_width          } ptr $ val^.pixel_width
    #{poke struct FT_WinFNT_HeaderRec_, pixel_height         } ptr $ val^.pixel_height
    #{poke struct FT_WinFNT_HeaderRec_, pitch_and_family     } ptr $ val^.pitch_and_family
    #{poke struct FT_WinFNT_HeaderRec_, avg_width            } ptr $ val^.avg_width
    #{poke struct FT_WinFNT_HeaderRec_, max_width            } ptr $ val^.max_width
    #{poke struct FT_WinFNT_HeaderRec_, first_char           } ptr $ val^.first_char
    #{poke struct FT_WinFNT_HeaderRec_, last_char            } ptr $ val^.last_char
    #{poke struct FT_WinFNT_HeaderRec_, default_char         } ptr $ val^.default_char
    #{poke struct FT_WinFNT_HeaderRec_, break_char           } ptr $ val^.break_char
    #{poke struct FT_WinFNT_HeaderRec_, bytes_per_row        } ptr $ val^.bytes_per_row
    #{poke struct FT_WinFNT_HeaderRec_, device_offset        } ptr $ val^.device_offset
    #{poke struct FT_WinFNT_HeaderRec_, face_name_offset     } ptr $ val^.face_name_offset
    #{poke struct FT_WinFNT_HeaderRec_, bits_pointer         } ptr $ val^.bits_pointer
    #{poke struct FT_WinFNT_HeaderRec_, bits_offset          } ptr $ val^.bits_offset
    #{poke struct FT_WinFNT_HeaderRec_, reserved             } ptr $ val^.reserved
    #{poke struct FT_WinFNT_HeaderRec_, flags                } ptr $ val^.flags
    #{poke struct FT_WinFNT_HeaderRec_, A_space              } ptr $ val^.a_space
    #{poke struct FT_WinFNT_HeaderRec_, B_space              } ptr $ val^.b_space
    #{poke struct FT_WinFNT_HeaderRec_, C_space              } ptr $ val^.c_space
    #{poke struct FT_WinFNT_HeaderRec_, color_table_offset   } ptr $ val^.color_table_offset
    #{poke struct FT_WinFNT_HeaderRec_, reserved1            } ptr $ val^.reserved1
