{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}

module FreeType.Format.TrueType.Types where

import           FreeType.Core.Types.Types

import           Data.Function ((&))
import           Data.Word
import           Foreign.Ptr
import           Foreign.Storable

#include "ft2build.h"
#include FT_TRUETYPE_TABLES_H

data TT_Header = TT_Header
                   { hTable_Version       :: FT_Fixed
                   , hFont_Revision       :: FT_Fixed
                   , hCheckSum_Adjust     :: FT_Long
                   , hMagic_Number        :: FT_Long
                   , hFlags               :: FT_UShort
                   , hUnits_Per_EM        :: FT_UShort
                   , hCreated             :: Ptr FT_ULong
                   , hModified            :: Ptr FT_ULong
                   , hXMin                :: FT_Short
                   , hYMin                :: FT_Short
                   , hXMax                :: FT_Short
                   , hYMax                :: FT_Short
                   , hMac_Style           :: FT_UShort
                   , hLowest_Rec_PPEM     :: FT_UShort
                   , hFont_Direction      :: FT_Short
                   , hIndex_To_Loc_Format :: FT_Short
                   , hGlyph_Data_Format   :: FT_Short
                   }

instance Storable TT_Header where    
  sizeOf _    = #size      struct TT_Header_    
  alignment _ = #alignment struct TT_Header_    
    
  peek ptr =    
    TT_Header    
      <$> #{peek struct TT_Header_, Table_Version      } ptr    
      <*> #{peek struct TT_Header_, Font_Revision      } ptr    
      <*> #{peek struct TT_Header_, CheckSum_Adjust    } ptr    
      <*> #{peek struct TT_Header_, Magic_Number       } ptr    
      <*> #{peek struct TT_Header_, Flags              } ptr    
      <*> #{peek struct TT_Header_, Units_Per_EM       } ptr    
      <*> #{peek struct TT_Header_, Created            } ptr    
      <*> #{peek struct TT_Header_, Modified           } ptr    
      <*> #{peek struct TT_Header_, xMin               } ptr    
      <*> #{peek struct TT_Header_, yMin               } ptr    
      <*> #{peek struct TT_Header_, xMax               } ptr    
      <*> #{peek struct TT_Header_, yMax               } ptr    
      <*> #{peek struct TT_Header_, Mac_Style          } ptr    
      <*> #{peek struct TT_Header_, Lowest_Rec_PPEM    } ptr    
      <*> #{peek struct TT_Header_, Font_Direction     } ptr    
      <*> #{peek struct TT_Header_, Index_To_Loc_Format} ptr    
      <*> #{peek struct TT_Header_, Glyph_Data_Format  } ptr    
    
  poke ptr val = do    
    #{poke struct TT_Header_, Table_Version      } ptr $ val & hTable_Version          
    #{poke struct TT_Header_, Font_Revision      } ptr $ val & hFont_Revision          
    #{poke struct TT_Header_, CheckSum_Adjust    } ptr $ val & hCheckSum_Adjust        
    #{poke struct TT_Header_, Magic_Number       } ptr $ val & hMagic_Number           
    #{poke struct TT_Header_, Flags              } ptr $ val & hFlags                  
    #{poke struct TT_Header_, Units_Per_EM       } ptr $ val & hUnits_Per_EM           
    #{poke struct TT_Header_, Created            } ptr $ val & hCreated                
    #{poke struct TT_Header_, Modified           } ptr $ val & hModified               
    #{poke struct TT_Header_, xMin               } ptr $ val & hXMin                   
    #{poke struct TT_Header_, yMin               } ptr $ val & hYMin                   
    #{poke struct TT_Header_, xMax               } ptr $ val & hXMax                   
    #{poke struct TT_Header_, yMax               } ptr $ val & hYMax                   
    #{poke struct TT_Header_, Mac_Style          } ptr $ val & hMac_Style              
    #{poke struct TT_Header_, Lowest_Rec_PPEM    } ptr $ val & hLowest_Rec_PPEM        
    #{poke struct TT_Header_, Font_Direction     } ptr $ val & hFont_Direction         
    #{poke struct TT_Header_, Index_To_Loc_Format} ptr $ val & hIndex_To_Loc_Format    
    #{poke struct TT_Header_, Glyph_Data_Format  } ptr $ val & hGlyph_Data_Format



data TT_HoriHeader = TT_HoriHeader
                       { hhVersion                :: FT_Fixed
                       , hhAscender               :: FT_Short
                       , hhDescender              :: FT_Short
                       , hhLine_Gap               :: FT_Short
                       , hhAdvance_Width_Max      :: FT_UShort
                       , hhMin_Left_Side_Bearing  :: FT_Short
                       , hhMin_Right_Side_Bearing :: FT_Short
                       , hhXMax_Extent            :: FT_Short
                       , hhCaret_Slope_Rise       :: FT_Short
                       , hhCaret_Slope_Run        :: FT_Short
                       , hhCaret_Offset           :: FT_Short
                       , hhReserved               :: Ptr FT_Short
                       , hhMetric_Data_Format     :: FT_Short
                       , hhNumber_Of_HMetrics     :: FT_UShort
                       , hhLong_metrics           :: Ptr ()
                       , hhShort_metrics          :: Ptr ()
                       }

instance Storable TT_HoriHeader where           
  sizeOf _    = #size      struct TT_HoriHeader_
  alignment _ = #alignment struct TT_HoriHeader_
                
  peek ptr =     
    TT_HoriHeader                                               
      <$> #{peek struct TT_HoriHeader_, Version               } ptr
      <*> #{peek struct TT_HoriHeader_, Ascender              } ptr
      <*> #{peek struct TT_HoriHeader_, Descender             } ptr
      <*> #{peek struct TT_HoriHeader_, Line_Gap              } ptr
      <*> #{peek struct TT_HoriHeader_, advance_Width_Max     } ptr
      <*> #{peek struct TT_HoriHeader_, min_Left_Side_Bearing } ptr
      <*> #{peek struct TT_HoriHeader_, min_Right_Side_Bearing} ptr
      <*> #{peek struct TT_HoriHeader_, xMax_Extent           } ptr
      <*> #{peek struct TT_HoriHeader_, caret_Slope_Rise      } ptr
      <*> #{peek struct TT_HoriHeader_, caret_Slope_Run       } ptr
      <*> #{peek struct TT_HoriHeader_, caret_Offset          } ptr
      <*> #{peek struct TT_HoriHeader_, Reserved              } ptr
      <*> #{peek struct TT_HoriHeader_, metric_Data_Format    } ptr
      <*> #{peek struct TT_HoriHeader_, number_Of_HMetrics    } ptr
      <*> #{peek struct TT_HoriHeader_, long_metrics          } ptr
      <*> #{peek struct TT_HoriHeader_, short_metrics         } ptr
    
                       
  poke ptr val = do                                                                  
    #{poke struct TT_HoriHeader_, Version               } ptr $ val & hhVersion               
    #{poke struct TT_HoriHeader_, Ascender              } ptr $ val & hhAscender              
    #{poke struct TT_HoriHeader_, Descender             } ptr $ val & hhDescender             
    #{poke struct TT_HoriHeader_, Line_Gap              } ptr $ val & hhLine_Gap              
    #{poke struct TT_HoriHeader_, advance_Width_Max     } ptr $ val & hhAdvance_Width_Max     
    #{poke struct TT_HoriHeader_, min_Left_Side_Bearing } ptr $ val & hhMin_Left_Side_Bearing 
    #{poke struct TT_HoriHeader_, min_Right_Side_Bearing} ptr $ val & hhMin_Right_Side_Bearing
    #{poke struct TT_HoriHeader_, xMax_Extent           } ptr $ val & hhXMax_Extent           
    #{poke struct TT_HoriHeader_, caret_Slope_Rise      } ptr $ val & hhCaret_Slope_Rise      
    #{poke struct TT_HoriHeader_, caret_Slope_Run       } ptr $ val & hhCaret_Slope_Run       
    #{poke struct TT_HoriHeader_, caret_Offset          } ptr $ val & hhCaret_Offset          
    #{poke struct TT_HoriHeader_, Reserved              } ptr $ val & hhReserved              
    #{poke struct TT_HoriHeader_, metric_Data_Format    } ptr $ val & hhMetric_Data_Format    
    #{poke struct TT_HoriHeader_, number_Of_HMetrics    } ptr $ val & hhNumber_Of_HMetrics    
    #{poke struct TT_HoriHeader_, long_metrics          } ptr $ val & hhLong_metrics          
    #{poke struct TT_HoriHeader_, short_metrics         } ptr $ val & hhShort_metrics



data TT_VertHeader = TT_VertHeader
                       { vhVersion                 :: FT_Fixed
                       , vhAscender                :: FT_Short
                       , vhDescender               :: FT_Short
                       , vhLine_Gap                :: FT_Short
                       , vhAdvance_Height_Max      :: FT_UShort
                       , vhMin_Top_Side_Bearing    :: FT_Short
                       , vhMin_Bottom_Side_Bearing :: FT_Short
                       , vhYMax_Extent             :: FT_Short
                       , vhCaret_Slope_Rise        :: FT_Short
                       , vhCaret_Slope_Run         :: FT_Short
                       , vhCaret_Offset            :: FT_Short
                       , vhReserved                :: Ptr FT_Short
                       , vhMetric_Data_Format      :: FT_Short
                       , vhNumber_Of_VMetrics      :: FT_UShort
                       , vhLong_metrics            :: Ptr ()
                       , vhShort_metrics           :: Ptr ()
                       }

instance Storable TT_VertHeader where
  sizeOf _    = #size      struct TT_VertHeader_
  alignment _ = #alignment struct TT_VertHeader_

  peek ptr =
    TT_VertHeader
      <$> #{peek struct TT_VertHeader_, Version                } ptr
      <*> #{peek struct TT_VertHeader_, Ascender               } ptr
      <*> #{peek struct TT_VertHeader_, Descender              } ptr
      <*> #{peek struct TT_VertHeader_, Line_Gap               } ptr
      <*> #{peek struct TT_VertHeader_, advance_Height_Max     } ptr
      <*> #{peek struct TT_VertHeader_, min_Top_Side_Bearing   } ptr
      <*> #{peek struct TT_VertHeader_, min_Bottom_Side_Bearing} ptr
      <*> #{peek struct TT_VertHeader_, yMax_Extent            } ptr
      <*> #{peek struct TT_VertHeader_, caret_Slope_Rise       } ptr
      <*> #{peek struct TT_VertHeader_, caret_Slope_Run        } ptr
      <*> #{peek struct TT_VertHeader_, caret_Offset           } ptr
      <*> #{peek struct TT_VertHeader_, Reserved               } ptr
      <*> #{peek struct TT_VertHeader_, metric_Data_Format     } ptr
      <*> #{peek struct TT_VertHeader_, number_Of_VMetrics     } ptr
      <*> #{peek struct TT_VertHeader_, long_metrics           } ptr
      <*> #{peek struct TT_VertHeader_, short_metrics          } ptr


  poke ptr val = do
    #{poke struct TT_VertHeader_, Version                } ptr $ val & vhVersion                
    #{poke struct TT_VertHeader_, Ascender               } ptr $ val & vhAscender               
    #{poke struct TT_VertHeader_, Descender              } ptr $ val & vhDescender              
    #{poke struct TT_VertHeader_, Line_Gap               } ptr $ val & vhLine_Gap               
    #{poke struct TT_VertHeader_, advance_Height_Max     } ptr $ val & vhAdvance_Height_Max     
    #{poke struct TT_VertHeader_, min_Top_Side_Bearing   } ptr $ val & vhMin_Top_Side_Bearing   
    #{poke struct TT_VertHeader_, min_Bottom_Side_Bearing} ptr $ val & vhMin_Bottom_Side_Bearing
    #{poke struct TT_VertHeader_, yMax_Extent            } ptr $ val & vhYMax_Extent            
    #{poke struct TT_VertHeader_, caret_Slope_Rise       } ptr $ val & vhCaret_Slope_Rise       
    #{poke struct TT_VertHeader_, caret_Slope_Run        } ptr $ val & vhCaret_Slope_Run        
    #{poke struct TT_VertHeader_, caret_Offset           } ptr $ val & vhCaret_Offset           
    #{poke struct TT_VertHeader_, Reserved               } ptr $ val & vhReserved               
    #{poke struct TT_VertHeader_, metric_Data_Format     } ptr $ val & vhMetric_Data_Format     
    #{poke struct TT_VertHeader_, number_Of_VMetrics     } ptr $ val & vhNumber_Of_VMetrics     
    #{poke struct TT_VertHeader_, long_metrics           } ptr $ val & vhLong_metrics           
    #{poke struct TT_VertHeader_, short_metrics          } ptr $ val & vhShort_metrics



data TT_OS2 = TT_OS2
                { osVersion                 :: FT_UShort
                , osXAvgCharWidth           :: FT_Short
                , osUsWeightClass           :: FT_UShort
                , osUsWidthClass            :: FT_UShort
                , osFsType                  :: FT_UShort
                , osYSubscriptXSize         :: FT_Short
                , osYSubscriptYSize         :: FT_Short
                , osYSubscriptXOffset       :: FT_Short
                , osYSubscriptYOffset       :: FT_Short
                , osYSuperscriptXSize       :: FT_Short
                , osYSuperscriptYSize       :: FT_Short
                , osYSuperscriptXOffset     :: FT_Short
                , osYSuperscriptYOffset     :: FT_Short
                , osYStrikeoutSize          :: FT_Short
                , osYStrikeoutPosition      :: FT_Short
                , osSFamilyClass            :: FT_Short
                , osPanose                  :: Ptr FT_Byte
                , osUlUnicodeRange1         :: FT_ULong
                , osUlUnicodeRange2         :: FT_ULong
                , osUlUnicodeRange3         :: FT_ULong
                , osUlUnicodeRange4         :: FT_ULong
                , osAchVendID               :: Ptr FT_Char
                , osFsSelection             :: FT_UShort
                , osUsFirstCharIndex        :: FT_UShort
                , osUsLastCharIndex         :: FT_UShort
                , osSTypoAscender           :: FT_Short
                , osSTypoDescender          :: FT_Short
                , osSTypoLineGap            :: FT_Short
                , osUsWinAscent             :: FT_UShort
                , osUsWinDescent            :: FT_UShort
                , osUlCodePageRange1        :: FT_ULong
                , osUlCodePageRange2        :: FT_ULong
                , osSxHeight                :: FT_Short
                , osSCapHeight              :: FT_Short
                , osUsDefaultChar           :: FT_UShort
                , osUsBreakChar             :: FT_UShort
                , osUsMaxContext            :: FT_UShort
                , osUsLowerOpticalPointSize :: FT_UShort
                , osUsUpperOpticalPointSize :: FT_UShort
                }

instance Storable TT_OS2 where
  sizeOf _    = #size      struct TT_OS2_
  alignment _ = #alignment struct TT_OS2_

  peek ptr =
    TT_OS2
      <$> #{peek struct TT_OS2_, version                } ptr
      <*> #{peek struct TT_OS2_, xAvgCharWidth          } ptr
      <*> #{peek struct TT_OS2_, usWeightClass          } ptr
      <*> #{peek struct TT_OS2_, usWidthClass           } ptr
      <*> #{peek struct TT_OS2_, fsType                 } ptr
      <*> #{peek struct TT_OS2_, ySubscriptXSize        } ptr
      <*> #{peek struct TT_OS2_, ySubscriptYSize        } ptr
      <*> #{peek struct TT_OS2_, ySubscriptXOffset      } ptr
      <*> #{peek struct TT_OS2_, ySubscriptYOffset      } ptr
      <*> #{peek struct TT_OS2_, ySuperscriptXSize      } ptr
      <*> #{peek struct TT_OS2_, ySuperscriptYSize      } ptr
      <*> #{peek struct TT_OS2_, ySuperscriptXOffset    } ptr
      <*> #{peek struct TT_OS2_, ySuperscriptYOffset    } ptr
      <*> #{peek struct TT_OS2_, yStrikeoutSize         } ptr
      <*> #{peek struct TT_OS2_, yStrikeoutPosition     } ptr
      <*> #{peek struct TT_OS2_, sFamilyClass           } ptr
      <*> #{peek struct TT_OS2_, panose                 } ptr
      <*> #{peek struct TT_OS2_, ulUnicodeRange1        } ptr
      <*> #{peek struct TT_OS2_, ulUnicodeRange2        } ptr
      <*> #{peek struct TT_OS2_, ulUnicodeRange3        } ptr
      <*> #{peek struct TT_OS2_, ulUnicodeRange4        } ptr
      <*> #{peek struct TT_OS2_, achVendID              } ptr
      <*> #{peek struct TT_OS2_, fsSelection            } ptr
      <*> #{peek struct TT_OS2_, usFirstCharIndex       } ptr
      <*> #{peek struct TT_OS2_, usLastCharIndex        } ptr
      <*> #{peek struct TT_OS2_, sTypoAscender          } ptr
      <*> #{peek struct TT_OS2_, sTypoDescender         } ptr
      <*> #{peek struct TT_OS2_, sTypoLineGap           } ptr
      <*> #{peek struct TT_OS2_, usWinAscent            } ptr
      <*> #{peek struct TT_OS2_, usWinDescent           } ptr
      <*> #{peek struct TT_OS2_, ulCodePageRange1       } ptr
      <*> #{peek struct TT_OS2_, ulCodePageRange2       } ptr
      <*> #{peek struct TT_OS2_, sxHeight               } ptr
      <*> #{peek struct TT_OS2_, sCapHeight             } ptr
      <*> #{peek struct TT_OS2_, usDefaultChar          } ptr
      <*> #{peek struct TT_OS2_, usBreakChar            } ptr
      <*> #{peek struct TT_OS2_, usMaxContext           } ptr
      <*> #{peek struct TT_OS2_, usLowerOpticalPointSize} ptr
      <*> #{peek struct TT_OS2_, usUpperOpticalPointSize} ptr

  poke ptr val = do
    #{poke struct TT_OS2_, version                } ptr $ val & osVersion                
    #{poke struct TT_OS2_, xAvgCharWidth          } ptr $ val & osXAvgCharWidth          
    #{poke struct TT_OS2_, usWeightClass          } ptr $ val & osUsWeightClass          
    #{poke struct TT_OS2_, usWidthClass           } ptr $ val & osUsWidthClass           
    #{poke struct TT_OS2_, fsType                 } ptr $ val & osFsType                 
    #{poke struct TT_OS2_, ySubscriptXSize        } ptr $ val & osYSubscriptXSize        
    #{poke struct TT_OS2_, ySubscriptYSize        } ptr $ val & osYSubscriptYSize        
    #{poke struct TT_OS2_, ySubscriptXOffset      } ptr $ val & osYSubscriptXOffset      
    #{poke struct TT_OS2_, ySubscriptYOffset      } ptr $ val & osYSubscriptYOffset      
    #{poke struct TT_OS2_, ySuperscriptXSize      } ptr $ val & osYSuperscriptXSize      
    #{poke struct TT_OS2_, ySuperscriptYSize      } ptr $ val & osYSuperscriptYSize      
    #{poke struct TT_OS2_, ySuperscriptXOffset    } ptr $ val & osYSuperscriptXOffset    
    #{poke struct TT_OS2_, ySuperscriptYOffset    } ptr $ val & osYSuperscriptYOffset    
    #{poke struct TT_OS2_, yStrikeoutSize         } ptr $ val & osYStrikeoutSize         
    #{poke struct TT_OS2_, yStrikeoutPosition     } ptr $ val & osYStrikeoutPosition     
    #{poke struct TT_OS2_, sFamilyClass           } ptr $ val & osSFamilyClass           
    #{poke struct TT_OS2_, panose                 } ptr $ val & osPanose                 
    #{poke struct TT_OS2_, ulUnicodeRange1        } ptr $ val & osUlUnicodeRange1        
    #{poke struct TT_OS2_, ulUnicodeRange2        } ptr $ val & osUlUnicodeRange2        
    #{poke struct TT_OS2_, ulUnicodeRange3        } ptr $ val & osUlUnicodeRange3        
    #{poke struct TT_OS2_, ulUnicodeRange4        } ptr $ val & osUlUnicodeRange4        
    #{poke struct TT_OS2_, achVendID              } ptr $ val & osAchVendID              
    #{poke struct TT_OS2_, fsSelection            } ptr $ val & osFsSelection            
    #{poke struct TT_OS2_, usFirstCharIndex       } ptr $ val & osUsFirstCharIndex       
    #{poke struct TT_OS2_, usLastCharIndex        } ptr $ val & osUsLastCharIndex        
    #{poke struct TT_OS2_, sTypoAscender          } ptr $ val & osSTypoAscender          
    #{poke struct TT_OS2_, sTypoDescender         } ptr $ val & osSTypoDescender         
    #{poke struct TT_OS2_, sTypoLineGap           } ptr $ val & osSTypoLineGap           
    #{poke struct TT_OS2_, usWinAscent            } ptr $ val & osUsWinAscent            
    #{poke struct TT_OS2_, usWinDescent           } ptr $ val & osUsWinDescent           
    #{poke struct TT_OS2_, ulCodePageRange1       } ptr $ val & osUlCodePageRange1       
    #{poke struct TT_OS2_, ulCodePageRange2       } ptr $ val & osUlCodePageRange2       
    #{poke struct TT_OS2_, sxHeight               } ptr $ val & osSxHeight               
    #{poke struct TT_OS2_, sCapHeight             } ptr $ val & osSCapHeight             
    #{poke struct TT_OS2_, usDefaultChar          } ptr $ val & osUsDefaultChar          
    #{poke struct TT_OS2_, usBreakChar            } ptr $ val & osUsBreakChar            
    #{poke struct TT_OS2_, usMaxContext           } ptr $ val & osUsMaxContext           
    #{poke struct TT_OS2_, usLowerOpticalPointSize} ptr $ val & osUsLowerOpticalPointSize
    #{poke struct TT_OS2_, usUpperOpticalPointSize} ptr $ val & osUsUpperOpticalPointSize



data TT_Postscript = TT_Postscript
                       { pFormatType         :: FT_Fixed
                       , pItalicAngle        :: FT_Fixed
                       , pUnderlinePosition  :: FT_Short
                       , pUnderlineThickness :: FT_Short
                       , pIsFixedPitch       :: FT_ULong
                       , pMinMemType42       :: FT_ULong
                       , pMaxMemType42       :: FT_ULong
                       , pMinMemType1        :: FT_ULong
                       , pMaxMemType1        :: FT_ULong
                       }
instance Storable TT_Postscript where
  sizeOf _    = #size      struct TT_Postscript_
  alignment _ = #alignment struct TT_Postscript_

  peek ptr =
    TT_Postscript
      <$> #{peek struct TT_Postscript_, FormatType        } ptr
      <*> #{peek struct TT_Postscript_, italicAngle       } ptr
      <*> #{peek struct TT_Postscript_, underlinePosition } ptr
      <*> #{peek struct TT_Postscript_, underlineThickness} ptr
      <*> #{peek struct TT_Postscript_, isFixedPitch      } ptr
      <*> #{peek struct TT_Postscript_, minMemType42      } ptr
      <*> #{peek struct TT_Postscript_, maxMemType42      } ptr
      <*> #{peek struct TT_Postscript_, minMemType1       } ptr
      <*> #{peek struct TT_Postscript_, maxMemType1       } ptr

  poke ptr val = do
    #{poke struct TT_Postscript_, FormatType        } ptr $ val & pFormatType        
    #{poke struct TT_Postscript_, italicAngle       } ptr $ val & pItalicAngle       
    #{poke struct TT_Postscript_, underlinePosition } ptr $ val & pUnderlinePosition 
    #{poke struct TT_Postscript_, underlineThickness} ptr $ val & pUnderlineThickness
    #{poke struct TT_Postscript_, isFixedPitch      } ptr $ val & pIsFixedPitch      
    #{poke struct TT_Postscript_, minMemType42      } ptr $ val & pMinMemType42      
    #{poke struct TT_Postscript_, maxMemType42      } ptr $ val & pMaxMemType42      
    #{poke struct TT_Postscript_, minMemType1       } ptr $ val & pMinMemType1       
    #{poke struct TT_Postscript_, maxMemType1       } ptr $ val & pMaxMemType1



data TT_PCLT = TT_PCLT
                 { pcltVersion             :: FT_Fixed
                 , pcltFontNumber          :: FT_ULong
                 , pcltPitch               :: FT_UShort
                 , pcltXHeight             :: FT_UShort
                 , pcltStyle               :: FT_UShort
                 , pcltTypeFamily          :: FT_UShort
                 , pcltCapHeight           :: FT_UShort
                 , pcltSymbolSet           :: FT_UShort
                 , pcltTypeFace            :: Ptr FT_Char
                 , pcltCharacterComplement :: Ptr FT_Char
                 , pcltFileName            :: Ptr FT_Char
                 , pcltStrokeWeight        :: FT_Char
                 , pcltWidthType           :: FT_Char
                 , pcltSerifStyle          :: FT_Byte
                 , pcltReserved            :: FT_Byte
                 }

instance Storable TT_PCLT where
  sizeOf _    = #size      struct TT_PCLT_
  alignment _ = #alignment struct TT_PCLT_

  peek ptr =
    TT_PCLT
      <$> #{peek struct TT_PCLT_, Version            } ptr
      <*> #{peek struct TT_PCLT_, FontNumber         } ptr
      <*> #{peek struct TT_PCLT_, Pitch              } ptr
      <*> #{peek struct TT_PCLT_, xHeight            } ptr
      <*> #{peek struct TT_PCLT_, Style              } ptr
      <*> #{peek struct TT_PCLT_, TypeFamily         } ptr
      <*> #{peek struct TT_PCLT_, CapHeight          } ptr
      <*> #{peek struct TT_PCLT_, SymbolSet          } ptr
      <*> #{peek struct TT_PCLT_, TypeFace           } ptr
      <*> #{peek struct TT_PCLT_, CharacterComplement} ptr
      <*> #{peek struct TT_PCLT_, FileName           } ptr
      <*> #{peek struct TT_PCLT_, StrokeWeight       } ptr
      <*> #{peek struct TT_PCLT_, WidthType          } ptr
      <*> #{peek struct TT_PCLT_, SerifStyle         } ptr
      <*> #{peek struct TT_PCLT_, Reserved           } ptr

  poke ptr val = do
    #{poke struct TT_PCLT_, Version            } ptr $ val & pcltVersion            
    #{poke struct TT_PCLT_, FontNumber         } ptr $ val & pcltFontNumber         
    #{poke struct TT_PCLT_, Pitch              } ptr $ val & pcltPitch              
    #{poke struct TT_PCLT_, xHeight            } ptr $ val & pcltXHeight            
    #{poke struct TT_PCLT_, Style              } ptr $ val & pcltStyle              
    #{poke struct TT_PCLT_, TypeFamily         } ptr $ val & pcltTypeFamily         
    #{poke struct TT_PCLT_, CapHeight          } ptr $ val & pcltCapHeight          
    #{poke struct TT_PCLT_, SymbolSet          } ptr $ val & pcltSymbolSet          
    #{poke struct TT_PCLT_, TypeFace           } ptr $ val & pcltTypeFace           
    #{poke struct TT_PCLT_, CharacterComplement} ptr $ val & pcltCharacterComplement
    #{poke struct TT_PCLT_, FileName           } ptr $ val & pcltFileName           
    #{poke struct TT_PCLT_, StrokeWeight       } ptr $ val & pcltStrokeWeight       
    #{poke struct TT_PCLT_, WidthType          } ptr $ val & pcltWidthType          
    #{poke struct TT_PCLT_, SerifStyle         } ptr $ val & pcltSerifStyle         
    #{poke struct TT_PCLT_, Reserved           } ptr $ val & pcltReserved



data TT_MaxProfile = TT_MaxProfile
                       { mpVersion               :: FT_Fixed
                       , mpNumGlyphs             :: FT_UShort
                       , mpMaxPoints             :: FT_UShort
                       , mpMaxContours           :: FT_UShort
                       , mpMaxCompositePoints    :: FT_UShort
                       , mpMaxCompositeContours  :: FT_UShort
                       , mpMaxZones              :: FT_UShort
                       , mpMaxTwilightPoints     :: FT_UShort
                       , mpMaxStorage            :: FT_UShort
                       , mpMaxFunctionDefs       :: FT_UShort
                       , mpMaxInstructionDefs    :: FT_UShort
                       , mpMaxStackElements      :: FT_UShort
                       , mpMaxSizeOfInstructions :: FT_UShort
                       , mpMaxComponentElements  :: FT_UShort
                       , mpMaxComponentDepth     :: FT_UShort
                       }

instance Storable TT_MaxProfile where
  sizeOf _    = #size      struct TT_MaxProfile_
  alignment _ = #alignment struct TT_MaxProfile_

  peek ptr =
    TT_MaxProfile
      <$> #{peek struct TT_MaxProfile_, version              } ptr
      <*> #{peek struct TT_MaxProfile_, numGlyphs            } ptr
      <*> #{peek struct TT_MaxProfile_, maxPoints            } ptr
      <*> #{peek struct TT_MaxProfile_, maxContours          } ptr
      <*> #{peek struct TT_MaxProfile_, maxCompositePoints   } ptr
      <*> #{peek struct TT_MaxProfile_, maxCompositeContours } ptr
      <*> #{peek struct TT_MaxProfile_, maxZones             } ptr
      <*> #{peek struct TT_MaxProfile_, maxTwilightPoints    } ptr
      <*> #{peek struct TT_MaxProfile_, maxStorage           } ptr
      <*> #{peek struct TT_MaxProfile_, maxFunctionDefs      } ptr
      <*> #{peek struct TT_MaxProfile_, maxInstructionDefs   } ptr
      <*> #{peek struct TT_MaxProfile_, maxStackElements     } ptr
      <*> #{peek struct TT_MaxProfile_, maxSizeOfInstructions} ptr
      <*> #{peek struct TT_MaxProfile_, maxComponentElements } ptr
      <*> #{peek struct TT_MaxProfile_, maxComponentDepth    } ptr

  poke ptr val = do
    #{poke struct TT_MaxProfile_, version              } ptr $ val & mpVersion              
    #{poke struct TT_MaxProfile_, numGlyphs            } ptr $ val & mpNumGlyphs            
    #{poke struct TT_MaxProfile_, maxPoints            } ptr $ val & mpMaxPoints            
    #{poke struct TT_MaxProfile_, maxContours          } ptr $ val & mpMaxContours          
    #{poke struct TT_MaxProfile_, maxCompositePoints   } ptr $ val & mpMaxCompositePoints   
    #{poke struct TT_MaxProfile_, maxCompositeContours } ptr $ val & mpMaxCompositeContours 
    #{poke struct TT_MaxProfile_, maxZones             } ptr $ val & mpMaxZones             
    #{poke struct TT_MaxProfile_, maxTwilightPoints    } ptr $ val & mpMaxTwilightPoints    
    #{poke struct TT_MaxProfile_, maxStorage           } ptr $ val & mpMaxStorage           
    #{poke struct TT_MaxProfile_, maxFunctionDefs      } ptr $ val & mpMaxFunctionDefs      
    #{poke struct TT_MaxProfile_, maxInstructionDefs   } ptr $ val & mpMaxInstructionDefs   
    #{poke struct TT_MaxProfile_, maxStackElements     } ptr $ val & mpMaxStackElements     
    #{poke struct TT_MaxProfile_, maxSizeOfInstructions} ptr $ val & mpMaxSizeOfInstructions
    #{poke struct TT_MaxProfile_, maxComponentElements } ptr $ val & mpMaxComponentElements 
    #{poke struct TT_MaxProfile_, maxComponentDepth    } ptr $ val & mpMaxComponentDepth



type FT_Sfnt_Tag = #type enum FT_Sfnt_Tag_
