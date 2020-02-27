{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}
{-# OPTIONS_HADDOCK hide #-}

module FreeType.Format.WinFNT.Internal where

import           FreeType.Core.Base.Internal
import           FreeType.Core.Types.Internal

import           Foreign.C.Types
import           Foreign.Ptr

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
                             , wfnthrA_space               :: FT_UShort
                             , wfnthrB_space               :: FT_UShort
                             , wfnthrC_space               :: FT_UShort
                             , wfnthrColor_table_offset    :: FT_UShort
                             , wfnthrReserved1             :: FT_ULong
                             }



type FT_WinFNT_Header = Ptr FT_WinFNT_HeaderRec



foreign import ccall "FT_Get_WinFNT_Header"
  ft_Get_WinFNT_Header :: FT_Face -> Ptr FT_WinFNT_HeaderRec -> IO FT_Error
