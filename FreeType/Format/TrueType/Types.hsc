{-# LANGUAGE DataKinds
           , DuplicateRecordFields
           , FlexibleInstances
           , ForeignFunctionInterface
           , MultiParamTypeClasses #-}
#if __GLASGOW_HASKELL__ >= 902
{-# LANGUAGE NoFieldSelectors #-}
#endif
{-# LANGUAGE PatternSynonyms
           , TypeApplications #-}

module FreeType.Format.TrueType.Types where

import           FreeType.Core.Types.Types

import           Data.Word
import           Foreign.Ptr
import           Foreign.Storable
import           Foreign.Storable.Offset

#include "ft2build.h"
#include FT_TRUETYPE_TABLES_H

data TT_Header = TT_Header
                   { table_Version       :: FT_Fixed
                   , font_Revision       :: FT_Fixed
                   , checkSum_Adjust     :: FT_Long
                   , magic_Number        :: FT_Long
                   , flags               :: FT_UShort
                   , units_Per_EM        :: FT_UShort
                   , created             :: Ptr FT_ULong
                   , modified            :: Ptr FT_ULong
                   , xMin                :: FT_Short
                   , yMin                :: FT_Short
                   , xMax                :: FT_Short
                   , yMax                :: FT_Short
                   , mac_Style           :: FT_UShort
                   , lowest_Rec_PPEM     :: FT_UShort
                   , font_Direction      :: FT_Short
                   , index_To_Loc_Format :: FT_Short
                   , glyph_Data_Format   :: FT_Short
                   }

instance Offset "table_Version"       TT_Header where rawOffset = #{offset struct TT_Header_, Table_Version      }
instance Offset "font_Revision"       TT_Header where rawOffset = #{offset struct TT_Header_, Font_Revision      }
instance Offset "checkSum_Adjust"     TT_Header where rawOffset = #{offset struct TT_Header_, CheckSum_Adjust    }
instance Offset "magic_Number"        TT_Header where rawOffset = #{offset struct TT_Header_, Magic_Number       }
instance Offset "flags"               TT_Header where rawOffset = #{offset struct TT_Header_, Flags              }
instance Offset "units_Per_EM"        TT_Header where rawOffset = #{offset struct TT_Header_, Units_Per_EM       }
instance Offset "created"             TT_Header where rawOffset = #{offset struct TT_Header_, Created            }
instance Offset "modified"            TT_Header where rawOffset = #{offset struct TT_Header_, Modified           }
instance Offset "xMin"                TT_Header where rawOffset = #{offset struct TT_Header_, xMin               }
instance Offset "yMin"                TT_Header where rawOffset = #{offset struct TT_Header_, yMin               }
instance Offset "xMax"                TT_Header where rawOffset = #{offset struct TT_Header_, xMax               }
instance Offset "yMax"                TT_Header where rawOffset = #{offset struct TT_Header_, yMax               }
instance Offset "mac_Style"           TT_Header where rawOffset = #{offset struct TT_Header_, Mac_Style          }
instance Offset "lowest_Rec_PPEM"     TT_Header where rawOffset = #{offset struct TT_Header_, Lowest_Rec_PPEM    }
instance Offset "font_Direction"      TT_Header where rawOffset = #{offset struct TT_Header_, Font_Direction     }
instance Offset "index_To_Loc_Format" TT_Header where rawOffset = #{offset struct TT_Header_, Index_To_Loc_Format}
instance Offset "glyph_Data_Format"   TT_Header where rawOffset = #{offset struct TT_Header_, Glyph_Data_Format  }

instance Storable TT_Header where
  sizeOf _    = #size      struct TT_Header_
  alignment _ = #alignment struct TT_Header_

  peek ptr =
    TT_Header
      <$> peek (offset @"table_Version"       ptr)
      <*> peek (offset @"font_Revision"       ptr)
      <*> peek (offset @"checkSum_Adjust"     ptr)
      <*> peek (offset @"magic_Number"        ptr)
      <*> peek (offset @"flags"               ptr)
      <*> peek (offset @"units_Per_EM"        ptr)
      <*> peek (offset @"created"             ptr)
      <*> peek (offset @"modified"            ptr)
      <*> peek (offset @"xMin"                ptr)
      <*> peek (offset @"yMin"                ptr)
      <*> peek (offset @"xMax"                ptr)
      <*> peek (offset @"yMax"                ptr)
      <*> peek (offset @"mac_Style"           ptr)
      <*> peek (offset @"lowest_Rec_PPEM"     ptr)
      <*> peek (offset @"font_Direction"      ptr)
      <*> peek (offset @"index_To_Loc_Format" ptr)
      <*> peek (offset @"glyph_Data_Format"   ptr)

  poke ptr val = do
    pokeField @"table_Version"       ptr val
    pokeField @"font_Revision"       ptr val
    pokeField @"checkSum_Adjust"     ptr val
    pokeField @"magic_Number"        ptr val
    pokeField @"flags"               ptr val
    pokeField @"units_Per_EM"        ptr val
    pokeField @"created"             ptr val
    pokeField @"modified"            ptr val
    pokeField @"xMin"                ptr val
    pokeField @"yMin"                ptr val
    pokeField @"xMax"                ptr val
    pokeField @"yMax"                ptr val
    pokeField @"mac_Style"           ptr val
    pokeField @"lowest_Rec_PPEM"     ptr val
    pokeField @"font_Direction"      ptr val
    pokeField @"index_To_Loc_Format" ptr val
    pokeField @"glyph_Data_Format"   ptr val



data TT_HoriHeader = TT_HoriHeader
                       { version                :: FT_Fixed
                       , ascender               :: FT_Short
                       , descender              :: FT_Short
                       , line_Gap               :: FT_Short
                       , advance_Width_Max      :: FT_UShort
                       , min_Left_Side_Bearing  :: FT_Short
                       , min_Right_Side_Bearing :: FT_Short
                       , xMax_Extent            :: FT_Short
                       , caret_Slope_Rise       :: FT_Short
                       , caret_Slope_Run        :: FT_Short
                       , caret_Offset           :: FT_Short
                       , reserved               :: Ptr FT_Short
                       , metric_Data_Format     :: FT_Short
                       , number_Of_HMetrics     :: FT_UShort
                       , long_metrics           :: Ptr ()
                       , short_metrics          :: Ptr ()
                       }

instance Offset "version"                TT_HoriHeader where rawOffset = #{offset struct TT_HoriHeader_, Version               }
instance Offset "ascender"               TT_HoriHeader where rawOffset = #{offset struct TT_HoriHeader_, Ascender              }
instance Offset "descender"              TT_HoriHeader where rawOffset = #{offset struct TT_HoriHeader_, Descender             }
instance Offset "line_Gap"               TT_HoriHeader where rawOffset = #{offset struct TT_HoriHeader_, Line_Gap              }
instance Offset "advance_Width_Max"      TT_HoriHeader where rawOffset = #{offset struct TT_HoriHeader_, advance_Width_Max     }
instance Offset "min_Left_Side_Bearing"  TT_HoriHeader where rawOffset = #{offset struct TT_HoriHeader_, min_Left_Side_Bearing }
instance Offset "min_Right_Side_Bearing" TT_HoriHeader where rawOffset = #{offset struct TT_HoriHeader_, min_Right_Side_Bearing}
instance Offset "xMax_Extent"            TT_HoriHeader where rawOffset = #{offset struct TT_HoriHeader_, xMax_Extent           }
instance Offset "caret_Slope_Rise"       TT_HoriHeader where rawOffset = #{offset struct TT_HoriHeader_, caret_Slope_Rise      }
instance Offset "caret_Slope_Run"        TT_HoriHeader where rawOffset = #{offset struct TT_HoriHeader_, caret_Slope_Run       }
instance Offset "caret_Offset"           TT_HoriHeader where rawOffset = #{offset struct TT_HoriHeader_, caret_Offset          }
instance Offset "reserved"               TT_HoriHeader where rawOffset = #{offset struct TT_HoriHeader_, Reserved              }
instance Offset "metric_Data_Format"     TT_HoriHeader where rawOffset = #{offset struct TT_HoriHeader_, metric_Data_Format    }
instance Offset "number_Of_HMetrics"     TT_HoriHeader where rawOffset = #{offset struct TT_HoriHeader_, number_Of_HMetrics    }
instance Offset "long_metrics"           TT_HoriHeader where rawOffset = #{offset struct TT_HoriHeader_, long_metrics          }
instance Offset "short_metrics"          TT_HoriHeader where rawOffset = #{offset struct TT_HoriHeader_, short_metrics         }

instance Storable TT_HoriHeader where
  sizeOf _    = #size      struct TT_HoriHeader_
  alignment _ = #alignment struct TT_HoriHeader_

  peek ptr =
    TT_HoriHeader
      <$> peek (offset @"version"                ptr)
      <*> peek (offset @"ascender"               ptr)
      <*> peek (offset @"descender"              ptr)
      <*> peek (offset @"line_Gap"               ptr)
      <*> peek (offset @"advance_Width_Max"      ptr)
      <*> peek (offset @"min_Left_Side_Bearing"  ptr)
      <*> peek (offset @"min_Right_Side_Bearing" ptr)
      <*> peek (offset @"xMax_Extent"            ptr)
      <*> peek (offset @"caret_Slope_Rise"       ptr)
      <*> peek (offset @"caret_Slope_Run"        ptr)
      <*> peek (offset @"caret_Offset"           ptr)
      <*> peek (offset @"reserved"               ptr)
      <*> peek (offset @"metric_Data_Format"     ptr)
      <*> peek (offset @"number_Of_HMetrics"     ptr)
      <*> peek (offset @"long_metrics"           ptr)
      <*> peek (offset @"short_metrics"          ptr)

  poke ptr val = do
    pokeField @"version"                ptr val
    pokeField @"ascender"               ptr val
    pokeField @"descender"              ptr val
    pokeField @"line_Gap"               ptr val
    pokeField @"advance_Width_Max"      ptr val
    pokeField @"min_Left_Side_Bearing"  ptr val
    pokeField @"min_Right_Side_Bearing" ptr val
    pokeField @"xMax_Extent"            ptr val
    pokeField @"caret_Slope_Rise"       ptr val
    pokeField @"caret_Slope_Run"        ptr val
    pokeField @"caret_Offset"           ptr val
    pokeField @"reserved"               ptr val
    pokeField @"metric_Data_Format"     ptr val
    pokeField @"number_Of_HMetrics"     ptr val
    pokeField @"long_metrics"           ptr val
    pokeField @"short_metrics"          ptr val



data TT_VertHeader = TT_VertHeader
                       { version                 :: FT_Fixed
                       , ascender                :: FT_Short
                       , descender               :: FT_Short
                       , line_Gap                :: FT_Short
                       , advance_Height_Max      :: FT_UShort
                       , min_Top_Side_Bearing    :: FT_Short
                       , min_Bottom_Side_Bearing :: FT_Short
                       , yMax_Extent             :: FT_Short
                       , caret_Slope_Rise        :: FT_Short
                       , caret_Slope_Run         :: FT_Short
                       , caret_Offset            :: FT_Short
                       , reserved                :: Ptr FT_Short
                       , metric_Data_Format      :: FT_Short
                       , number_Of_VMetrics      :: FT_UShort
                       , long_metrics            :: Ptr ()
                       , short_metrics           :: Ptr ()
                       }

instance Offset "version"                 TT_VertHeader where rawOffset = #{offset struct TT_VertHeader_, Version                }
instance Offset "ascender"                TT_VertHeader where rawOffset = #{offset struct TT_VertHeader_, Ascender               }
instance Offset "descender"               TT_VertHeader where rawOffset = #{offset struct TT_VertHeader_, Descender              }
instance Offset "line_Gap"                TT_VertHeader where rawOffset = #{offset struct TT_VertHeader_, Line_Gap               }
instance Offset "advance_Height_Max"      TT_VertHeader where rawOffset = #{offset struct TT_VertHeader_, advance_Height_Max     }
instance Offset "min_Top_Side_Bearing"    TT_VertHeader where rawOffset = #{offset struct TT_VertHeader_, min_Top_Side_Bearing   }
instance Offset "min_Bottom_Side_Bearing" TT_VertHeader where rawOffset = #{offset struct TT_VertHeader_, min_Bottom_Side_Bearing}
instance Offset "yMax_Extent"             TT_VertHeader where rawOffset = #{offset struct TT_VertHeader_, yMax_Extent            }
instance Offset "caret_Slope_Rise"        TT_VertHeader where rawOffset = #{offset struct TT_VertHeader_, caret_Slope_Rise       }
instance Offset "caret_Slope_Run"         TT_VertHeader where rawOffset = #{offset struct TT_VertHeader_, caret_Slope_Run        }
instance Offset "caret_Offset"            TT_VertHeader where rawOffset = #{offset struct TT_VertHeader_, caret_Offset           }
instance Offset "reserved"                TT_VertHeader where rawOffset = #{offset struct TT_VertHeader_, Reserved               }
instance Offset "metric_Data_Format"      TT_VertHeader where rawOffset = #{offset struct TT_VertHeader_, metric_Data_Format     }
instance Offset "number_Of_VMetrics"      TT_VertHeader where rawOffset = #{offset struct TT_VertHeader_, number_Of_VMetrics     }
instance Offset "long_metrics"            TT_VertHeader where rawOffset = #{offset struct TT_VertHeader_, long_metrics           }
instance Offset "short_metrics"           TT_VertHeader where rawOffset = #{offset struct TT_VertHeader_, short_metrics          }

instance Storable TT_VertHeader where
  sizeOf _    = #size      struct TT_VertHeader_
  alignment _ = #alignment struct TT_VertHeader_

  peek ptr =
    TT_VertHeader
      <$> peek (offset @"version"                 ptr)
      <*> peek (offset @"ascender"                ptr)
      <*> peek (offset @"descender"               ptr)
      <*> peek (offset @"line_Gap"                ptr)
      <*> peek (offset @"advance_Height_Max"      ptr)
      <*> peek (offset @"min_Top_Side_Bearing"    ptr)
      <*> peek (offset @"min_Bottom_Side_Bearing" ptr)
      <*> peek (offset @"yMax_Extent"             ptr)
      <*> peek (offset @"caret_Slope_Rise"        ptr)
      <*> peek (offset @"caret_Slope_Run"         ptr)
      <*> peek (offset @"caret_Offset"            ptr)
      <*> peek (offset @"reserved"                ptr)
      <*> peek (offset @"metric_Data_Format"      ptr)
      <*> peek (offset @"number_Of_VMetrics"      ptr)
      <*> peek (offset @"long_metrics"            ptr)
      <*> peek (offset @"short_metrics"           ptr)

  poke ptr val = do
    pokeField @"version"                 ptr val
    pokeField @"ascender"                ptr val
    pokeField @"descender"               ptr val
    pokeField @"line_Gap"                ptr val
    pokeField @"advance_Height_Max"      ptr val
    pokeField @"min_Top_Side_Bearing"    ptr val
    pokeField @"min_Bottom_Side_Bearing" ptr val
    pokeField @"yMax_Extent"             ptr val
    pokeField @"caret_Slope_Rise"        ptr val
    pokeField @"caret_Slope_Run"         ptr val
    pokeField @"caret_Offset"            ptr val
    pokeField @"reserved"                ptr val
    pokeField @"metric_Data_Format"      ptr val
    pokeField @"number_Of_VMetrics"      ptr val
    pokeField @"long_metrics"            ptr val
    pokeField @"short_metrics"           ptr val



data TT_OS2 = TT_OS2
                { version                 :: FT_UShort
                , xAvgCharWidth           :: FT_Short
                , usWeightClass           :: FT_UShort
                , usWidthClass            :: FT_UShort
                , fsType                  :: FT_UShort
                , ySubscriptXSize         :: FT_Short
                , ySubscriptYSize         :: FT_Short
                , ySubscriptXOffset       :: FT_Short
                , ySubscriptYOffset       :: FT_Short
                , ySuperscriptXSize       :: FT_Short
                , ySuperscriptYSize       :: FT_Short
                , ySuperscriptXOffset     :: FT_Short
                , ySuperscriptYOffset     :: FT_Short
                , yStrikeoutSize          :: FT_Short
                , yStrikeoutPosition      :: FT_Short
                , sFamilyClass            :: FT_Short
                , panose                  :: Ptr FT_Byte
                , ulUnicodeRange1         :: FT_ULong
                , ulUnicodeRange2         :: FT_ULong
                , ulUnicodeRange3         :: FT_ULong
                , ulUnicodeRange4         :: FT_ULong
                , achVendID               :: Ptr FT_Char
                , fsSelection             :: FT_UShort
                , usFirstCharIndex        :: FT_UShort
                , usLastCharIndex         :: FT_UShort
                , sTypoAscender           :: FT_Short
                , sTypoDescender          :: FT_Short
                , sTypoLineGap            :: FT_Short
                , usWinAscent             :: FT_UShort
                , usWinDescent            :: FT_UShort
                , ulCodePageRange1        :: FT_ULong
                , ulCodePageRange2        :: FT_ULong
                , sxHeight                :: FT_Short
                , sCapHeight              :: FT_Short
                , usDefaultChar           :: FT_UShort
                , usBreakChar             :: FT_UShort
                , usMaxContext            :: FT_UShort
                , usLowerOpticalPointSize :: FT_UShort
                , usUpperOpticalPointSize :: FT_UShort
                }

instance Offset "version"                 TT_OS2 where rawOffset = #{offset struct TT_OS2_, version                }
instance Offset "xAvgCharWidth"           TT_OS2 where rawOffset = #{offset struct TT_OS2_, xAvgCharWidth          }
instance Offset "usWeightClass"           TT_OS2 where rawOffset = #{offset struct TT_OS2_, usWeightClass          }
instance Offset "usWidthClass"            TT_OS2 where rawOffset = #{offset struct TT_OS2_, usWidthClass           }
instance Offset "fsType"                  TT_OS2 where rawOffset = #{offset struct TT_OS2_, fsType                 }
instance Offset "ySubscriptXSize"         TT_OS2 where rawOffset = #{offset struct TT_OS2_, ySubscriptXSize        }
instance Offset "ySubscriptYSize"         TT_OS2 where rawOffset = #{offset struct TT_OS2_, ySubscriptYSize        }
instance Offset "ySubscriptXOffset"       TT_OS2 where rawOffset = #{offset struct TT_OS2_, ySubscriptXOffset      }
instance Offset "ySubscriptYOffset"       TT_OS2 where rawOffset = #{offset struct TT_OS2_, ySubscriptYOffset      }
instance Offset "ySuperscriptXSize"       TT_OS2 where rawOffset = #{offset struct TT_OS2_, ySuperscriptXSize      }
instance Offset "ySuperscriptYSize"       TT_OS2 where rawOffset = #{offset struct TT_OS2_, ySuperscriptYSize      }
instance Offset "ySuperscriptXOffset"     TT_OS2 where rawOffset = #{offset struct TT_OS2_, ySuperscriptXOffset    }
instance Offset "ySuperscriptYOffset"     TT_OS2 where rawOffset = #{offset struct TT_OS2_, ySuperscriptYOffset    }
instance Offset "yStrikeoutSize"          TT_OS2 where rawOffset = #{offset struct TT_OS2_, yStrikeoutSize         }
instance Offset "yStrikeoutPosition"      TT_OS2 where rawOffset = #{offset struct TT_OS2_, yStrikeoutPosition     }
instance Offset "sFamilyClass"            TT_OS2 where rawOffset = #{offset struct TT_OS2_, sFamilyClass           }
instance Offset "panose"                  TT_OS2 where rawOffset = #{offset struct TT_OS2_, panose                 }
instance Offset "ulUnicodeRange1"         TT_OS2 where rawOffset = #{offset struct TT_OS2_, ulUnicodeRange1        }
instance Offset "ulUnicodeRange2"         TT_OS2 where rawOffset = #{offset struct TT_OS2_, ulUnicodeRange2        }
instance Offset "ulUnicodeRange3"         TT_OS2 where rawOffset = #{offset struct TT_OS2_, ulUnicodeRange3        }
instance Offset "ulUnicodeRange4"         TT_OS2 where rawOffset = #{offset struct TT_OS2_, ulUnicodeRange4        }
instance Offset "achVendID"               TT_OS2 where rawOffset = #{offset struct TT_OS2_, achVendID              }
instance Offset "fsSelection"             TT_OS2 where rawOffset = #{offset struct TT_OS2_, fsSelection            }
instance Offset "usFirstCharIndex"        TT_OS2 where rawOffset = #{offset struct TT_OS2_, usFirstCharIndex       }
instance Offset "usLastCharIndex"         TT_OS2 where rawOffset = #{offset struct TT_OS2_, usLastCharIndex        }
instance Offset "sTypoAscender"           TT_OS2 where rawOffset = #{offset struct TT_OS2_, sTypoAscender          }
instance Offset "sTypoDescender"          TT_OS2 where rawOffset = #{offset struct TT_OS2_, sTypoDescender         }
instance Offset "sTypoLineGap"            TT_OS2 where rawOffset = #{offset struct TT_OS2_, sTypoLineGap           }
instance Offset "usWinAscent"             TT_OS2 where rawOffset = #{offset struct TT_OS2_, usWinAscent            }
instance Offset "usWinDescent"            TT_OS2 where rawOffset = #{offset struct TT_OS2_, usWinDescent           }
instance Offset "ulCodePageRange1"        TT_OS2 where rawOffset = #{offset struct TT_OS2_, ulCodePageRange1       }
instance Offset "ulCodePageRange2"        TT_OS2 where rawOffset = #{offset struct TT_OS2_, ulCodePageRange2       }
instance Offset "sxHeight"                TT_OS2 where rawOffset = #{offset struct TT_OS2_, sxHeight               }
instance Offset "sCapHeight"              TT_OS2 where rawOffset = #{offset struct TT_OS2_, sCapHeight             }
instance Offset "usDefaultChar"           TT_OS2 where rawOffset = #{offset struct TT_OS2_, usDefaultChar          }
instance Offset "usBreakChar"             TT_OS2 where rawOffset = #{offset struct TT_OS2_, usBreakChar            }
instance Offset "usMaxContext"            TT_OS2 where rawOffset = #{offset struct TT_OS2_, usMaxContext           }
instance Offset "usLowerOpticalPointSize" TT_OS2 where rawOffset = #{offset struct TT_OS2_, usLowerOpticalPointSize}
instance Offset "usUpperOpticalPointSize" TT_OS2 where rawOffset = #{offset struct TT_OS2_, usUpperOpticalPointSize}

instance Storable TT_OS2 where
  sizeOf _    = #size      struct TT_OS2_
  alignment _ = #alignment struct TT_OS2_

  peek ptr =
    TT_OS2
      <$> peek (offset @"version"                 ptr)
      <*> peek (offset @"xAvgCharWidth"           ptr)
      <*> peek (offset @"usWeightClass"           ptr)
      <*> peek (offset @"usWidthClass"            ptr)
      <*> peek (offset @"fsType"                  ptr)
      <*> peek (offset @"ySubscriptXSize"         ptr)
      <*> peek (offset @"ySubscriptYSize"         ptr)
      <*> peek (offset @"ySubscriptXOffset"       ptr)
      <*> peek (offset @"ySubscriptYOffset"       ptr)
      <*> peek (offset @"ySuperscriptXSize"       ptr)
      <*> peek (offset @"ySuperscriptYSize"       ptr)
      <*> peek (offset @"ySuperscriptXOffset"     ptr)
      <*> peek (offset @"ySuperscriptYOffset"     ptr)
      <*> peek (offset @"yStrikeoutSize"          ptr)
      <*> peek (offset @"yStrikeoutPosition"      ptr)
      <*> peek (offset @"sFamilyClass"            ptr)
      <*> peek (offset @"panose"                  ptr)
      <*> peek (offset @"ulUnicodeRange1"         ptr)
      <*> peek (offset @"ulUnicodeRange2"         ptr)
      <*> peek (offset @"ulUnicodeRange3"         ptr)
      <*> peek (offset @"ulUnicodeRange4"         ptr)
      <*> peek (offset @"achVendID"               ptr)
      <*> peek (offset @"fsSelection"             ptr)
      <*> peek (offset @"usFirstCharIndex"        ptr)
      <*> peek (offset @"usLastCharIndex"         ptr)
      <*> peek (offset @"sTypoAscender"           ptr)
      <*> peek (offset @"sTypoDescender"          ptr)
      <*> peek (offset @"sTypoLineGap"            ptr)
      <*> peek (offset @"usWinAscent"             ptr)
      <*> peek (offset @"usWinDescent"            ptr)
      <*> peek (offset @"ulCodePageRange1"        ptr)
      <*> peek (offset @"ulCodePageRange2"        ptr)
      <*> peek (offset @"sxHeight"                ptr)
      <*> peek (offset @"sCapHeight"              ptr)
      <*> peek (offset @"usDefaultChar"           ptr)
      <*> peek (offset @"usBreakChar"             ptr)
      <*> peek (offset @"usMaxContext"            ptr)
      <*> peek (offset @"usLowerOpticalPointSize" ptr)
      <*> peek (offset @"usUpperOpticalPointSize" ptr)

  poke ptr val = do
    pokeField @"version"                 ptr val
    pokeField @"xAvgCharWidth"           ptr val
    pokeField @"usWeightClass"           ptr val
    pokeField @"usWidthClass"            ptr val
    pokeField @"fsType"                  ptr val
    pokeField @"ySubscriptXSize"         ptr val
    pokeField @"ySubscriptYSize"         ptr val
    pokeField @"ySubscriptXOffset"       ptr val
    pokeField @"ySubscriptYOffset"       ptr val
    pokeField @"ySuperscriptXSize"       ptr val
    pokeField @"ySuperscriptYSize"       ptr val
    pokeField @"ySuperscriptXOffset"     ptr val
    pokeField @"ySuperscriptYOffset"     ptr val
    pokeField @"yStrikeoutSize"          ptr val
    pokeField @"yStrikeoutPosition"      ptr val
    pokeField @"sFamilyClass"            ptr val
    pokeField @"panose"                  ptr val
    pokeField @"ulUnicodeRange1"         ptr val
    pokeField @"ulUnicodeRange2"         ptr val
    pokeField @"ulUnicodeRange3"         ptr val
    pokeField @"ulUnicodeRange4"         ptr val
    pokeField @"achVendID"               ptr val
    pokeField @"fsSelection"             ptr val
    pokeField @"usFirstCharIndex"        ptr val
    pokeField @"usLastCharIndex"         ptr val
    pokeField @"sTypoAscender"           ptr val
    pokeField @"sTypoDescender"          ptr val
    pokeField @"sTypoLineGap"            ptr val
    pokeField @"usWinAscent"             ptr val
    pokeField @"usWinDescent"            ptr val
    pokeField @"ulCodePageRange1"        ptr val
    pokeField @"ulCodePageRange2"        ptr val
    pokeField @"sxHeight"                ptr val
    pokeField @"sCapHeight"              ptr val
    pokeField @"usDefaultChar"           ptr val
    pokeField @"usBreakChar"             ptr val
    pokeField @"usMaxContext"            ptr val
    pokeField @"usLowerOpticalPointSize" ptr val
    pokeField @"usUpperOpticalPointSize" ptr val



data TT_Postscript = TT_Postscript
                       { formatType         :: FT_Fixed
                       , italicAngle        :: FT_Fixed
                       , underlinePosition  :: FT_Short
                       , underlineThickness :: FT_Short
                       , isFixedPitch       :: FT_ULong
                       , minMemType42       :: FT_ULong
                       , maxMemType42       :: FT_ULong
                       , minMemType1        :: FT_ULong
                       , maxMemType1        :: FT_ULong
                       }

instance Offset "formatType"         TT_Postscript where rawOffset = #{offset struct TT_Postscript_, FormatType        }
instance Offset "italicAngle"        TT_Postscript where rawOffset = #{offset struct TT_Postscript_, italicAngle       }
instance Offset "underlinePosition"  TT_Postscript where rawOffset = #{offset struct TT_Postscript_, underlinePosition }
instance Offset "underlineThickness" TT_Postscript where rawOffset = #{offset struct TT_Postscript_, underlineThickness}
instance Offset "isFixedPitch"       TT_Postscript where rawOffset = #{offset struct TT_Postscript_, isFixedPitch      }
instance Offset "minMemType42"       TT_Postscript where rawOffset = #{offset struct TT_Postscript_, minMemType42      }
instance Offset "maxMemType42"       TT_Postscript where rawOffset = #{offset struct TT_Postscript_, maxMemType42      }
instance Offset "minMemType1"        TT_Postscript where rawOffset = #{offset struct TT_Postscript_, minMemType1       }
instance Offset "maxMemType1"        TT_Postscript where rawOffset = #{offset struct TT_Postscript_, maxMemType1       }

instance Storable TT_Postscript where
  sizeOf _    = #size      struct TT_Postscript_
  alignment _ = #alignment struct TT_Postscript_

  peek ptr =
    TT_Postscript
      <$> peek (offset @"formatType"         ptr)
      <*> peek (offset @"italicAngle"        ptr)
      <*> peek (offset @"underlinePosition"  ptr)
      <*> peek (offset @"underlineThickness" ptr)
      <*> peek (offset @"isFixedPitch"       ptr)
      <*> peek (offset @"minMemType42"       ptr)
      <*> peek (offset @"maxMemType42"       ptr)
      <*> peek (offset @"minMemType1"        ptr)
      <*> peek (offset @"maxMemType1"        ptr)

  poke ptr val = do
    pokeField @"formatType"         ptr val
    pokeField @"italicAngle"        ptr val
    pokeField @"underlinePosition"  ptr val
    pokeField @"underlineThickness" ptr val
    pokeField @"isFixedPitch"       ptr val
    pokeField @"minMemType42"       ptr val
    pokeField @"maxMemType42"       ptr val
    pokeField @"minMemType1"        ptr val
    pokeField @"maxMemType1"        ptr val



data TT_PCLT = TT_PCLT
                 { version             :: FT_Fixed
                 , fontNumber          :: FT_ULong
                 , pitch               :: FT_UShort
                 , xHeight             :: FT_UShort
                 , style               :: FT_UShort
                 , typeFamily          :: FT_UShort
                 , capHeight           :: FT_UShort
                 , symbolSet           :: FT_UShort
                 , typeFace            :: Ptr FT_Char
                 , characterComplement :: Ptr FT_Char
                 , fileName            :: Ptr FT_Char
                 , strokeWeight        :: FT_Char
                 , widthType           :: FT_Char
                 , serifStyle          :: FT_Byte
                 , reserved            :: FT_Byte
                 }

instance Offset "version"             TT_PCLT where rawOffset = #{offset struct TT_PCLT_, Version            }
instance Offset "fontNumber"          TT_PCLT where rawOffset = #{offset struct TT_PCLT_, FontNumber         }
instance Offset "pitch"               TT_PCLT where rawOffset = #{offset struct TT_PCLT_, Pitch              }
instance Offset "xHeight"             TT_PCLT where rawOffset = #{offset struct TT_PCLT_, xHeight            }
instance Offset "style"               TT_PCLT where rawOffset = #{offset struct TT_PCLT_, Style              }
instance Offset "typeFamily"          TT_PCLT where rawOffset = #{offset struct TT_PCLT_, TypeFamily         }
instance Offset "capHeight"           TT_PCLT where rawOffset = #{offset struct TT_PCLT_, CapHeight          }
instance Offset "symbolSet"           TT_PCLT where rawOffset = #{offset struct TT_PCLT_, SymbolSet          }
instance Offset "typeFace"            TT_PCLT where rawOffset = #{offset struct TT_PCLT_, TypeFace           }
instance Offset "characterComplement" TT_PCLT where rawOffset = #{offset struct TT_PCLT_, CharacterComplement}
instance Offset "fileName"            TT_PCLT where rawOffset = #{offset struct TT_PCLT_, FileName           }
instance Offset "strokeWeight"        TT_PCLT where rawOffset = #{offset struct TT_PCLT_, StrokeWeight       }
instance Offset "widthType"           TT_PCLT where rawOffset = #{offset struct TT_PCLT_, WidthType          }
instance Offset "serifStyle"          TT_PCLT where rawOffset = #{offset struct TT_PCLT_, SerifStyle         }
instance Offset "reserved"            TT_PCLT where rawOffset = #{offset struct TT_PCLT_, Reserved           }

instance Storable TT_PCLT where
  sizeOf _    = #size      struct TT_PCLT_
  alignment _ = #alignment struct TT_PCLT_

  peek ptr =
    TT_PCLT
      <$> peek (offset @"version"             ptr)
      <*> peek (offset @"fontNumber"          ptr)
      <*> peek (offset @"pitch"               ptr)
      <*> peek (offset @"xHeight"             ptr)
      <*> peek (offset @"style"               ptr)
      <*> peek (offset @"typeFamily"          ptr)
      <*> peek (offset @"capHeight"           ptr)
      <*> peek (offset @"symbolSet"           ptr)
      <*> peek (offset @"typeFace"            ptr)
      <*> peek (offset @"characterComplement" ptr)
      <*> peek (offset @"fileName"            ptr)
      <*> peek (offset @"strokeWeight"        ptr)
      <*> peek (offset @"widthType"           ptr)
      <*> peek (offset @"serifStyle"          ptr)
      <*> peek (offset @"reserved"            ptr)

  poke ptr val = do
    pokeField @"version"             ptr val
    pokeField @"fontNumber"          ptr val
    pokeField @"pitch"               ptr val
    pokeField @"xHeight"             ptr val
    pokeField @"style"               ptr val
    pokeField @"typeFamily"          ptr val
    pokeField @"capHeight"           ptr val
    pokeField @"symbolSet"           ptr val
    pokeField @"typeFace"            ptr val
    pokeField @"characterComplement" ptr val
    pokeField @"fileName"            ptr val
    pokeField @"strokeWeight"        ptr val
    pokeField @"widthType"           ptr val
    pokeField @"serifStyle"          ptr val
    pokeField @"reserved"            ptr val



data TT_MaxProfile = TT_MaxProfile
                       { version               :: FT_Fixed
                       , numGlyphs             :: FT_UShort
                       , maxPoints             :: FT_UShort
                       , maxContours           :: FT_UShort
                       , maxCompositePoints    :: FT_UShort
                       , maxCompositeContours  :: FT_UShort
                       , maxZones              :: FT_UShort
                       , maxTwilightPoints     :: FT_UShort
                       , maxStorage            :: FT_UShort
                       , maxFunctionDefs       :: FT_UShort
                       , maxInstructionDefs    :: FT_UShort
                       , maxStackElements      :: FT_UShort
                       , maxSizeOfInstructions :: FT_UShort
                       , maxComponentElements  :: FT_UShort
                       , maxComponentDepth     :: FT_UShort
                       }

instance Offset "version"               TT_MaxProfile where rawOffset = #{offset struct TT_MaxProfile_, version              }
instance Offset "numGlyphs"             TT_MaxProfile where rawOffset = #{offset struct TT_MaxProfile_, numGlyphs            }
instance Offset "maxPoints"             TT_MaxProfile where rawOffset = #{offset struct TT_MaxProfile_, maxPoints            }
instance Offset "maxContours"           TT_MaxProfile where rawOffset = #{offset struct TT_MaxProfile_, maxContours          }
instance Offset "maxCompositePoints"    TT_MaxProfile where rawOffset = #{offset struct TT_MaxProfile_, maxCompositePoints   }
instance Offset "maxCompositeContours"  TT_MaxProfile where rawOffset = #{offset struct TT_MaxProfile_, maxCompositeContours }
instance Offset "maxZones"              TT_MaxProfile where rawOffset = #{offset struct TT_MaxProfile_, maxZones             }
instance Offset "maxTwilightPoints"     TT_MaxProfile where rawOffset = #{offset struct TT_MaxProfile_, maxTwilightPoints    }
instance Offset "maxStorage"            TT_MaxProfile where rawOffset = #{offset struct TT_MaxProfile_, maxStorage           }
instance Offset "maxFunctionDefs"       TT_MaxProfile where rawOffset = #{offset struct TT_MaxProfile_, maxFunctionDefs      }
instance Offset "maxInstructionDefs"    TT_MaxProfile where rawOffset = #{offset struct TT_MaxProfile_, maxInstructionDefs   }
instance Offset "maxStackElements"      TT_MaxProfile where rawOffset = #{offset struct TT_MaxProfile_, maxStackElements     }
instance Offset "maxSizeOfInstructions" TT_MaxProfile where rawOffset = #{offset struct TT_MaxProfile_, maxSizeOfInstructions}
instance Offset "maxComponentElements"  TT_MaxProfile where rawOffset = #{offset struct TT_MaxProfile_, maxComponentElements }
instance Offset "maxComponentDepth"     TT_MaxProfile where rawOffset = #{offset struct TT_MaxProfile_, maxComponentDepth    }

instance Storable TT_MaxProfile where
  sizeOf _    = #size      struct TT_MaxProfile_
  alignment _ = #alignment struct TT_MaxProfile_

  peek ptr =
    TT_MaxProfile
      <$> peek (offset @"version"               ptr)
      <*> peek (offset @"numGlyphs"             ptr)
      <*> peek (offset @"maxPoints"             ptr)
      <*> peek (offset @"maxContours"           ptr)
      <*> peek (offset @"maxCompositePoints"    ptr)
      <*> peek (offset @"maxCompositeContours"  ptr)
      <*> peek (offset @"maxZones"              ptr)
      <*> peek (offset @"maxTwilightPoints"     ptr)
      <*> peek (offset @"maxStorage"            ptr)
      <*> peek (offset @"maxFunctionDefs"       ptr)
      <*> peek (offset @"maxInstructionDefs"    ptr)
      <*> peek (offset @"maxStackElements"      ptr)
      <*> peek (offset @"maxSizeOfInstructions" ptr)
      <*> peek (offset @"maxComponentElements"  ptr)
      <*> peek (offset @"maxComponentDepth"     ptr)

  poke ptr val = do
    pokeField @"version"               ptr val
    pokeField @"numGlyphs"             ptr val
    pokeField @"maxPoints"             ptr val
    pokeField @"maxContours"           ptr val
    pokeField @"maxCompositePoints"    ptr val
    pokeField @"maxCompositeContours"  ptr val
    pokeField @"maxZones"              ptr val
    pokeField @"maxTwilightPoints"     ptr val
    pokeField @"maxStorage"            ptr val
    pokeField @"maxFunctionDefs"       ptr val
    pokeField @"maxInstructionDefs"    ptr val
    pokeField @"maxStackElements"      ptr val
    pokeField @"maxSizeOfInstructions" ptr val
    pokeField @"maxComponentElements"  ptr val
    pokeField @"maxComponentDepth"     ptr val



type FT_Sfnt_Tag = #type enum FT_Sfnt_Tag_
