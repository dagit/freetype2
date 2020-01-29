{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}

module Graphics.FreeType.Bindings.Format.WinFNT where

import           Graphics.FreeType.Bindings.Core.Base
import           Graphics.FreeType.Bindings.Core.Types

import           Foreign.C.Types
import           Foreign.Ptr
import           Foreign.Storable

#include "ft2build.h"
#include FT_WINFONTS_H

pattern FT_WinFNT_ID_CP1252                        
      , FT_WinFNT_ID_DEFAULT                    
      , FT_WinFNT_ID_SYMBOL                       
      , FT_WinFNT_ID_MAC                          
      , FT_WinFNT_ID_CP932                         
      , FT_WinFNT_ID_CP949                        
      , FT_WinFNT_ID_CP1361                       
      , FT_WinFNT_ID_CP936                         
      , FT_WinFNT_ID_CP950                         
      , FT_WinFNT_ID_CP1253                        
      , FT_WinFNT_ID_CP1254                        
      , FT_WinFNT_ID_CP1258                        
      , FT_WinFNT_ID_CP1255                        
      , FT_WinFNT_ID_CP1256                        
      , FT_WinFNT_ID_CP1257                       
      , FT_WinFNT_ID_CP1251                        
      , FT_WinFNT_ID_CP874                      
      , FT_WinFNT_ID_CP1250    
      , FT_WinFNT_ID_OEM
     :: FT_Int32
pattern FT_WinFNT_ID_CP1252  = #const FT_WinFNT_ID_CP1252
pattern FT_WinFNT_ID_DEFAULT = #const FT_WinFNT_ID_DEFAULT
pattern FT_WinFNT_ID_SYMBOL  = #const FT_WinFNT_ID_SYMBOL
pattern FT_WinFNT_ID_MAC     = #const FT_WinFNT_ID_MAC
pattern FT_WinFNT_ID_CP932   = #const FT_WinFNT_ID_CP932
pattern FT_WinFNT_ID_CP949   = #const FT_WinFNT_ID_CP949
pattern FT_WinFNT_ID_CP1361  = #const FT_WinFNT_ID_CP1361
pattern FT_WinFNT_ID_CP936   = #const FT_WinFNT_ID_CP936
pattern FT_WinFNT_ID_CP950   = #const FT_WinFNT_ID_CP950
pattern FT_WinFNT_ID_CP1253  = #const FT_WinFNT_ID_CP1253
pattern FT_WinFNT_ID_CP1254  = #const FT_WinFNT_ID_CP1254
pattern FT_WinFNT_ID_CP1258  = #const FT_WinFNT_ID_CP1258
pattern FT_WinFNT_ID_CP1255  = #const FT_WinFNT_ID_CP1255
pattern FT_WinFNT_ID_CP1256  = #const FT_WinFNT_ID_CP1256
pattern FT_WinFNT_ID_CP1257  = #const FT_WinFNT_ID_CP1257
pattern FT_WinFNT_ID_CP1251  = #const FT_WinFNT_ID_CP1251
pattern FT_WinFNT_ID_CP874   = #const FT_WinFNT_ID_CP874
pattern FT_WinFNT_ID_CP1250  = #const FT_WinFNT_ID_CP1250
pattern FT_WinFNT_ID_OEM     = #const FT_WinFNT_ID_OEM



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
                             , wfnthr_A_space              :: FT_UShort
                             , wfnthr_B_space              :: FT_UShort
                             , wfnthr_C_space              :: FT_UShort
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
    #{poke struct FT_WinFNT_HeaderRec_, version              } ptr $ wfnthrVersion               val
    #{poke struct FT_WinFNT_HeaderRec_, file_size            } ptr $ wfnthrFile_size             val
    #{poke struct FT_WinFNT_HeaderRec_, copyright            } ptr $ wfnthrCopyright             val
    #{poke struct FT_WinFNT_HeaderRec_, file_type            } ptr $ wfnthrFile_type             val
    #{poke struct FT_WinFNT_HeaderRec_, nominal_point_size   } ptr $ wfnthrNominal_point_size    val
    #{poke struct FT_WinFNT_HeaderRec_, vertical_resolution  } ptr $ wfnthrVertical_resolution   val
    #{poke struct FT_WinFNT_HeaderRec_, horizontal_resolution} ptr $ wfnthrHorizontal_resolution val
    #{poke struct FT_WinFNT_HeaderRec_, ascent               } ptr $ wfnthrAscent                val
    #{poke struct FT_WinFNT_HeaderRec_, internal_leading     } ptr $ wfnthrInternal_leading      val
    #{poke struct FT_WinFNT_HeaderRec_, external_leading     } ptr $ wfnthrExternal_leading      val
    #{poke struct FT_WinFNT_HeaderRec_, italic               } ptr $ wfnthrItalic                val
    #{poke struct FT_WinFNT_HeaderRec_, underline            } ptr $ wfnthrUnderline             val
    #{poke struct FT_WinFNT_HeaderRec_, strike_out           } ptr $ wfnthrStrike_out            val
    #{poke struct FT_WinFNT_HeaderRec_, weight               } ptr $ wfnthrWeight                val
    #{poke struct FT_WinFNT_HeaderRec_, charset              } ptr $ wfnthrCharset               val
    #{poke struct FT_WinFNT_HeaderRec_, pixel_width          } ptr $ wfnthrPixel_width           val
    #{poke struct FT_WinFNT_HeaderRec_, pixel_height         } ptr $ wfnthrPixel_height          val
    #{poke struct FT_WinFNT_HeaderRec_, pitch_and_family     } ptr $ wfnthrPitch_and_family      val
    #{poke struct FT_WinFNT_HeaderRec_, avg_width            } ptr $ wfnthrAvg_width             val
    #{poke struct FT_WinFNT_HeaderRec_, max_width            } ptr $ wfnthrMax_width             val
    #{poke struct FT_WinFNT_HeaderRec_, first_char           } ptr $ wfnthrFirst_char            val
    #{poke struct FT_WinFNT_HeaderRec_, last_char            } ptr $ wfnthrLast_char             val
    #{poke struct FT_WinFNT_HeaderRec_, default_char         } ptr $ wfnthrDefault_char          val
    #{poke struct FT_WinFNT_HeaderRec_, break_char           } ptr $ wfnthrBreak_char            val
    #{poke struct FT_WinFNT_HeaderRec_, bytes_per_row        } ptr $ wfnthrBytes_per_row         val
    #{poke struct FT_WinFNT_HeaderRec_, device_offset        } ptr $ wfnthrDevice_offset         val
    #{poke struct FT_WinFNT_HeaderRec_, face_name_offset     } ptr $ wfnthrFace_name_offset      val
    #{poke struct FT_WinFNT_HeaderRec_, bits_pointer         } ptr $ wfnthrBits_pointer          val
    #{poke struct FT_WinFNT_HeaderRec_, bits_offset          } ptr $ wfnthrBits_offset           val
    #{poke struct FT_WinFNT_HeaderRec_, reserved             } ptr $ wfnthrReserved              val
    #{poke struct FT_WinFNT_HeaderRec_, flags                } ptr $ wfnthrFlags                 val
    #{poke struct FT_WinFNT_HeaderRec_, A_space              } ptr $ wfnthr_A_space              val
    #{poke struct FT_WinFNT_HeaderRec_, B_space              } ptr $ wfnthr_B_space              val
    #{poke struct FT_WinFNT_HeaderRec_, C_space              } ptr $ wfnthr_C_space              val
    #{poke struct FT_WinFNT_HeaderRec_, color_table_offset   } ptr $ wfnthrColor_table_offset    val
    #{poke struct FT_WinFNT_HeaderRec_, reserved1            } ptr $ wfnthrReserved1             val



type FT_WinFNT_Header = Ptr FT_WinFNT_HeaderRec



foreign import ccall "FT_Get_WinFNT_Header"
  ft_Get_WinFNT_Header :: FT_Face -> Ptr FT_WinFNT_HeaderRec -> IO FT_Error
