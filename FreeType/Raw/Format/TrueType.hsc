{-# OPTIONS_GHC -fno-warn-orphans #-}

module FreeType.Raw.Format.TrueType
  ( module FreeType.Raw.Format.TrueType.Internal
  ) where

import           FreeType.Raw.Format.TrueType.Internal
import           FreeType.Lens

import           Foreign.Storable
import           Lens.Micro ((^.))

#include "ft2build.h"
#include FT_TRUETYPE_TABLES_H
#include FT_TRUETYPE_IDS_H

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
    #{poke struct TT_Header_, Table_Version      } ptr $ val^.table_Version      
    #{poke struct TT_Header_, Font_Revision      } ptr $ val^.font_Revision      
    #{poke struct TT_Header_, CheckSum_Adjust    } ptr $ val^.checkSum_Adjust    
    #{poke struct TT_Header_, Magic_Number       } ptr $ val^.magic_Number       
    #{poke struct TT_Header_, Flags              } ptr $ val^.flags              
    #{poke struct TT_Header_, Units_Per_EM       } ptr $ val^.units_Per_EM       
    #{poke struct TT_Header_, Created            } ptr $ val^.created            
    #{poke struct TT_Header_, Modified           } ptr $ val^.modified           
    #{poke struct TT_Header_, xMin               } ptr $ val^.xMin               
    #{poke struct TT_Header_, yMin               } ptr $ val^.yMin               
    #{poke struct TT_Header_, xMax               } ptr $ val^.xMax               
    #{poke struct TT_Header_, yMax               } ptr $ val^.yMax               
    #{poke struct TT_Header_, Mac_Style          } ptr $ val^.mac_Style          
    #{poke struct TT_Header_, Lowest_Rec_PPEM    } ptr $ val^.lowest_Rec_PPEM    
    #{poke struct TT_Header_, Font_Direction     } ptr $ val^.font_Direction     
    #{poke struct TT_Header_, Index_To_Loc_Format} ptr $ val^.index_To_Loc_Format
    #{poke struct TT_Header_, Glyph_Data_Format  } ptr $ val^.glyph_Data_Format  



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
    #{poke struct TT_HoriHeader_, Version               } ptr $ val^.version               
    #{poke struct TT_HoriHeader_, Ascender              } ptr $ val^.ascender              
    #{poke struct TT_HoriHeader_, Descender             } ptr $ val^.descender             
    #{poke struct TT_HoriHeader_, Line_Gap              } ptr $ val^.line_Gap              
    #{poke struct TT_HoriHeader_, advance_Width_Max     } ptr $ val^.advance_Width_Max     
    #{poke struct TT_HoriHeader_, min_Left_Side_Bearing } ptr $ val^.min_Left_Side_Bearing 
    #{poke struct TT_HoriHeader_, min_Right_Side_Bearing} ptr $ val^.min_Right_Side_Bearing
    #{poke struct TT_HoriHeader_, xMax_Extent           } ptr $ val^.xMax_Extent           
    #{poke struct TT_HoriHeader_, caret_Slope_Rise      } ptr $ val^.caret_Slope_Rise      
    #{poke struct TT_HoriHeader_, caret_Slope_Run       } ptr $ val^.caret_Slope_Run       
    #{poke struct TT_HoriHeader_, caret_Offset          } ptr $ val^.caret_Offset          
    #{poke struct TT_HoriHeader_, Reserved              } ptr $ val^.reserved              
    #{poke struct TT_HoriHeader_, metric_Data_Format    } ptr $ val^.metric_Data_Format    
    #{poke struct TT_HoriHeader_, number_Of_HMetrics    } ptr $ val^.number_Of_HMetrics    
    #{poke struct TT_HoriHeader_, long_metrics          } ptr $ val^.long_metrics          
    #{poke struct TT_HoriHeader_, short_metrics         } ptr $ val^.short_metrics         



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
    #{poke struct TT_VertHeader_, Version                } ptr $ val^.version                
    #{poke struct TT_VertHeader_, Ascender               } ptr $ val^.ascender               
    #{poke struct TT_VertHeader_, Descender              } ptr $ val^.descender              
    #{poke struct TT_VertHeader_, Line_Gap               } ptr $ val^.line_Gap               
    #{poke struct TT_VertHeader_, advance_Height_Max     } ptr $ val^.advance_Height_Max     
    #{poke struct TT_VertHeader_, min_Top_Side_Bearing   } ptr $ val^.min_Top_Side_Bearing   
    #{poke struct TT_VertHeader_, min_Bottom_Side_Bearing} ptr $ val^.min_Bottom_Side_Bearing
    #{poke struct TT_VertHeader_, yMax_Extent            } ptr $ val^.yMax_Extent            
    #{poke struct TT_VertHeader_, caret_Slope_Rise       } ptr $ val^.caret_Slope_Rise       
    #{poke struct TT_VertHeader_, caret_Slope_Run        } ptr $ val^.caret_Slope_Run        
    #{poke struct TT_VertHeader_, caret_Offset           } ptr $ val^.caret_Offset           
    #{poke struct TT_VertHeader_, Reserved               } ptr $ val^.reserved               
    #{poke struct TT_VertHeader_, metric_Data_Format     } ptr $ val^.metric_Data_Format     
    #{poke struct TT_VertHeader_, number_Of_VMetrics     } ptr $ val^.number_Of_VMetrics     
    #{poke struct TT_VertHeader_, long_metrics           } ptr $ val^.long_metrics           
    #{poke struct TT_VertHeader_, short_metrics          } ptr $ val^.short_metrics          



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
    #{poke struct TT_OS2_, version                } ptr $ val^.version                
    #{poke struct TT_OS2_, xAvgCharWidth          } ptr $ val^.xAvgCharWidth          
    #{poke struct TT_OS2_, usWeightClass          } ptr $ val^.usWeightClass          
    #{poke struct TT_OS2_, usWidthClass           } ptr $ val^.usWidthClass           
    #{poke struct TT_OS2_, fsType                 } ptr $ val^.fsType                 
    #{poke struct TT_OS2_, ySubscriptXSize        } ptr $ val^.ySubscriptXSize        
    #{poke struct TT_OS2_, ySubscriptYSize        } ptr $ val^.ySubscriptYSize        
    #{poke struct TT_OS2_, ySubscriptXOffset      } ptr $ val^.ySubscriptXOffset      
    #{poke struct TT_OS2_, ySubscriptYOffset      } ptr $ val^.ySubscriptYOffset      
    #{poke struct TT_OS2_, ySuperscriptXSize      } ptr $ val^.ySuperscriptXSize      
    #{poke struct TT_OS2_, ySuperscriptYSize      } ptr $ val^.ySuperscriptYSize      
    #{poke struct TT_OS2_, ySuperscriptXOffset    } ptr $ val^.ySuperscriptXOffset    
    #{poke struct TT_OS2_, ySuperscriptYOffset    } ptr $ val^.ySuperscriptYOffset    
    #{poke struct TT_OS2_, yStrikeoutSize         } ptr $ val^.yStrikeoutSize         
    #{poke struct TT_OS2_, yStrikeoutPosition     } ptr $ val^.yStrikeoutPosition     
    #{poke struct TT_OS2_, sFamilyClass           } ptr $ val^.sFamilyClass           
    #{poke struct TT_OS2_, panose                 } ptr $ val^.panose                 
    #{poke struct TT_OS2_, ulUnicodeRange1        } ptr $ val^.ulUnicodeRange1        
    #{poke struct TT_OS2_, ulUnicodeRange2        } ptr $ val^.ulUnicodeRange2        
    #{poke struct TT_OS2_, ulUnicodeRange3        } ptr $ val^.ulUnicodeRange3        
    #{poke struct TT_OS2_, ulUnicodeRange4        } ptr $ val^.ulUnicodeRange4        
    #{poke struct TT_OS2_, achVendID              } ptr $ val^.achVendID              
    #{poke struct TT_OS2_, fsSelection            } ptr $ val^.fsSelection            
    #{poke struct TT_OS2_, usFirstCharIndex       } ptr $ val^.usFirstCharIndex       
    #{poke struct TT_OS2_, usLastCharIndex        } ptr $ val^.usLastCharIndex        
    #{poke struct TT_OS2_, sTypoAscender          } ptr $ val^.sTypoAscender          
    #{poke struct TT_OS2_, sTypoDescender         } ptr $ val^.sTypoDescender         
    #{poke struct TT_OS2_, sTypoLineGap           } ptr $ val^.sTypoLineGap           
    #{poke struct TT_OS2_, usWinAscent            } ptr $ val^.usWinAscent            
    #{poke struct TT_OS2_, usWinDescent           } ptr $ val^.usWinDescent           
    #{poke struct TT_OS2_, ulCodePageRange1       } ptr $ val^.ulCodePageRange1       
    #{poke struct TT_OS2_, ulCodePageRange2       } ptr $ val^.ulCodePageRange2       
    #{poke struct TT_OS2_, sxHeight               } ptr $ val^.sxHeight               
    #{poke struct TT_OS2_, sCapHeight             } ptr $ val^.sCapHeight             
    #{poke struct TT_OS2_, usDefaultChar          } ptr $ val^.usDefaultChar          
    #{poke struct TT_OS2_, usBreakChar            } ptr $ val^.usBreakChar            
    #{poke struct TT_OS2_, usMaxContext           } ptr $ val^.usMaxContext           
    #{poke struct TT_OS2_, usLowerOpticalPointSize} ptr $ val^.usLowerOpticalPointSize
    #{poke struct TT_OS2_, usUpperOpticalPointSize} ptr $ val^.usUpperOpticalPointSize



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
    #{poke struct TT_Postscript_, FormatType        } ptr $ val^.formatType        
    #{poke struct TT_Postscript_, italicAngle       } ptr $ val^.italicAngle       
    #{poke struct TT_Postscript_, underlinePosition } ptr $ val^.underlinePosition 
    #{poke struct TT_Postscript_, underlineThickness} ptr $ val^.underlineThickness
    #{poke struct TT_Postscript_, isFixedPitch      } ptr $ val^.isFixedPitch      
    #{poke struct TT_Postscript_, minMemType42      } ptr $ val^.minMemType42      
    #{poke struct TT_Postscript_, maxMemType42      } ptr $ val^.maxMemType42      
    #{poke struct TT_Postscript_, minMemType1       } ptr $ val^.minMemType1       
    #{poke struct TT_Postscript_, maxMemType1       } ptr $ val^.maxMemType1       



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
    #{poke struct TT_PCLT_, Version            } ptr $ val^.version            
    #{poke struct TT_PCLT_, FontNumber         } ptr $ val^.fontNumber         
    #{poke struct TT_PCLT_, Pitch              } ptr $ val^.pitch              
    #{poke struct TT_PCLT_, xHeight            } ptr $ val^.xHeight            
    #{poke struct TT_PCLT_, Style              } ptr $ val^.style              
    #{poke struct TT_PCLT_, TypeFamily         } ptr $ val^.typeFamily         
    #{poke struct TT_PCLT_, CapHeight          } ptr $ val^.capHeight          
    #{poke struct TT_PCLT_, SymbolSet          } ptr $ val^.symbolSet          
    #{poke struct TT_PCLT_, TypeFace           } ptr $ val^.typeFace           
    #{poke struct TT_PCLT_, CharacterComplement} ptr $ val^.characterComplement
    #{poke struct TT_PCLT_, FileName           } ptr $ val^.fileName           
    #{poke struct TT_PCLT_, StrokeWeight       } ptr $ val^.strokeWeight       
    #{poke struct TT_PCLT_, WidthType          } ptr $ val^.widthType          
    #{poke struct TT_PCLT_, SerifStyle         } ptr $ val^.serifStyle         
    #{poke struct TT_PCLT_, Reserved           } ptr $ val^.reserved           



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
    #{poke struct TT_MaxProfile_, version              } ptr $ val^.version              
    #{poke struct TT_MaxProfile_, numGlyphs            } ptr $ val^.numGlyphs            
    #{poke struct TT_MaxProfile_, maxPoints            } ptr $ val^.maxPoints            
    #{poke struct TT_MaxProfile_, maxContours          } ptr $ val^.maxContours          
    #{poke struct TT_MaxProfile_, maxCompositePoints   } ptr $ val^.maxCompositePoints   
    #{poke struct TT_MaxProfile_, maxCompositeContours } ptr $ val^.maxCompositeContours 
    #{poke struct TT_MaxProfile_, maxZones             } ptr $ val^.maxZones             
    #{poke struct TT_MaxProfile_, maxTwilightPoints    } ptr $ val^.maxTwilightPoints    
    #{poke struct TT_MaxProfile_, maxStorage           } ptr $ val^.maxStorage           
    #{poke struct TT_MaxProfile_, maxFunctionDefs      } ptr $ val^.maxFunctionDefs      
    #{poke struct TT_MaxProfile_, maxInstructionDefs   } ptr $ val^.maxInstructionDefs   
    #{poke struct TT_MaxProfile_, maxStackElements     } ptr $ val^.maxStackElements     
    #{poke struct TT_MaxProfile_, maxSizeOfInstructions} ptr $ val^.maxSizeOfInstructions
    #{poke struct TT_MaxProfile_, maxComponentElements } ptr $ val^.maxComponentElements 
    #{poke struct TT_MaxProfile_, maxComponentDepth    } ptr $ val^.maxComponentDepth    
