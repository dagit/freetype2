{-# LANGUAGE DataKinds
           , FlexibleInstances
           , ForeignFunctionInterface
           , MultiParamTypeClasses
           , PatternSynonyms
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

instance Offset "hTable_Version"       TT_Header where rawOffset = #{offset struct TT_Header_, Table_Version      }
instance Offset "hFont_Revision"       TT_Header where rawOffset = #{offset struct TT_Header_, Font_Revision      }
instance Offset "hCheckSum_Adjust"     TT_Header where rawOffset = #{offset struct TT_Header_, CheckSum_Adjust    }
instance Offset "hMagic_Number"        TT_Header where rawOffset = #{offset struct TT_Header_, Magic_Number       }
instance Offset "hFlags"               TT_Header where rawOffset = #{offset struct TT_Header_, Flags              }
instance Offset "hUnits_Per_EM"        TT_Header where rawOffset = #{offset struct TT_Header_, Units_Per_EM       }
instance Offset "hCreated"             TT_Header where rawOffset = #{offset struct TT_Header_, Created            }
instance Offset "hModified"            TT_Header where rawOffset = #{offset struct TT_Header_, Modified           }
instance Offset "hXMin"                TT_Header where rawOffset = #{offset struct TT_Header_, xMin               }
instance Offset "hYMin"                TT_Header where rawOffset = #{offset struct TT_Header_, yMin               }
instance Offset "hXMax"                TT_Header where rawOffset = #{offset struct TT_Header_, xMax               }
instance Offset "hYMax"                TT_Header where rawOffset = #{offset struct TT_Header_, yMax               }
instance Offset "hMac_Style"           TT_Header where rawOffset = #{offset struct TT_Header_, Mac_Style          }
instance Offset "hLowest_Rec_PPEM"     TT_Header where rawOffset = #{offset struct TT_Header_, Lowest_Rec_PPEM    }
instance Offset "hFont_Direction"      TT_Header where rawOffset = #{offset struct TT_Header_, Font_Direction     }
instance Offset "hIndex_To_Loc_Format" TT_Header where rawOffset = #{offset struct TT_Header_, Index_To_Loc_Format}
instance Offset "hGlyph_Data_Format"   TT_Header where rawOffset = #{offset struct TT_Header_, Glyph_Data_Format  }



instance Storable TT_Header where
  sizeOf _    = #size      struct TT_Header_
  alignment _ = #alignment struct TT_Header_

  peek ptr =
    TT_Header
      <$> peek (offset @"hTable_Version"       ptr)
      <*> peek (offset @"hFont_Revision"       ptr)
      <*> peek (offset @"hCheckSum_Adjust"     ptr)
      <*> peek (offset @"hMagic_Number"        ptr)
      <*> peek (offset @"hFlags"               ptr)
      <*> peek (offset @"hUnits_Per_EM"        ptr)
      <*> peek (offset @"hCreated"             ptr)
      <*> peek (offset @"hModified"            ptr)
      <*> peek (offset @"hXMin"                ptr)
      <*> peek (offset @"hYMin"                ptr)
      <*> peek (offset @"hXMax"                ptr)
      <*> peek (offset @"hYMax"                ptr)
      <*> peek (offset @"hMac_Style"           ptr)
      <*> peek (offset @"hLowest_Rec_PPEM"     ptr)
      <*> peek (offset @"hFont_Direction"      ptr)
      <*> peek (offset @"hIndex_To_Loc_Format" ptr)
      <*> peek (offset @"hGlyph_Data_Format"   ptr)

  poke ptr val = do
    pokeField @"hTable_Version"       ptr val
    pokeField @"hFont_Revision"       ptr val
    pokeField @"hCheckSum_Adjust"     ptr val
    pokeField @"hMagic_Number"        ptr val
    pokeField @"hFlags"               ptr val
    pokeField @"hUnits_Per_EM"        ptr val
    pokeField @"hCreated"             ptr val
    pokeField @"hModified"            ptr val
    pokeField @"hXMin"                ptr val
    pokeField @"hYMin"                ptr val
    pokeField @"hXMax"                ptr val
    pokeField @"hYMax"                ptr val
    pokeField @"hMac_Style"           ptr val
    pokeField @"hLowest_Rec_PPEM"     ptr val
    pokeField @"hFont_Direction"      ptr val
    pokeField @"hIndex_To_Loc_Format" ptr val
    pokeField @"hGlyph_Data_Format"   ptr val



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

instance Offset "hhVersion"                TT_HoriHeader where rawOffset = #{offset struct TT_HoriHeader_, Version               }
instance Offset "hhAscender"               TT_HoriHeader where rawOffset = #{offset struct TT_HoriHeader_, Ascender              }
instance Offset "hhDescender"              TT_HoriHeader where rawOffset = #{offset struct TT_HoriHeader_, Descender             }
instance Offset "hhLine_Gap"               TT_HoriHeader where rawOffset = #{offset struct TT_HoriHeader_, Line_Gap              }
instance Offset "hhAdvance_Width_Max"      TT_HoriHeader where rawOffset = #{offset struct TT_HoriHeader_, advance_Width_Max     }
instance Offset "hhMin_Left_Side_Bearing"  TT_HoriHeader where rawOffset = #{offset struct TT_HoriHeader_, min_Left_Side_Bearing }
instance Offset "hhMin_Right_Side_Bearing" TT_HoriHeader where rawOffset = #{offset struct TT_HoriHeader_, min_Right_Side_Bearing}
instance Offset "hhXMax_Extent"            TT_HoriHeader where rawOffset = #{offset struct TT_HoriHeader_, xMax_Extent           }
instance Offset "hhCaret_Slope_Rise"       TT_HoriHeader where rawOffset = #{offset struct TT_HoriHeader_, caret_Slope_Rise      }
instance Offset "hhCaret_Slope_Run"        TT_HoriHeader where rawOffset = #{offset struct TT_HoriHeader_, caret_Slope_Run       }
instance Offset "hhCaret_Offset"           TT_HoriHeader where rawOffset = #{offset struct TT_HoriHeader_, caret_Offset          }
instance Offset "hhReserved"               TT_HoriHeader where rawOffset = #{offset struct TT_HoriHeader_, Reserved              }
instance Offset "hhMetric_Data_Format"     TT_HoriHeader where rawOffset = #{offset struct TT_HoriHeader_, metric_Data_Format    }
instance Offset "hhNumber_Of_HMetrics"     TT_HoriHeader where rawOffset = #{offset struct TT_HoriHeader_, number_Of_HMetrics    }
instance Offset "hhLong_metrics"           TT_HoriHeader where rawOffset = #{offset struct TT_HoriHeader_, long_metrics          }
instance Offset "hhShort_metrics"          TT_HoriHeader where rawOffset = #{offset struct TT_HoriHeader_, short_metrics         }

instance Storable TT_HoriHeader where
  sizeOf _    = #size      struct TT_HoriHeader_
  alignment _ = #alignment struct TT_HoriHeader_

  peek ptr =
    TT_HoriHeader
      <$> peek (offset @"hhVersion"                ptr)
      <*> peek (offset @"hhAscender"               ptr)
      <*> peek (offset @"hhDescender"              ptr)
      <*> peek (offset @"hhLine_Gap"               ptr)
      <*> peek (offset @"hhAdvance_Width_Max"      ptr)
      <*> peek (offset @"hhMin_Left_Side_Bearing"  ptr)
      <*> peek (offset @"hhMin_Right_Side_Bearing" ptr)
      <*> peek (offset @"hhXMax_Extent"            ptr)
      <*> peek (offset @"hhCaret_Slope_Rise"       ptr)
      <*> peek (offset @"hhCaret_Slope_Run"        ptr)
      <*> peek (offset @"hhCaret_Offset"           ptr)
      <*> peek (offset @"hhReserved"               ptr)
      <*> peek (offset @"hhMetric_Data_Format"     ptr)
      <*> peek (offset @"hhNumber_Of_HMetrics"     ptr)
      <*> peek (offset @"hhLong_metrics"           ptr)
      <*> peek (offset @"hhShort_metrics"          ptr)

  poke ptr val = do
    pokeField @"hhVersion"                ptr val
    pokeField @"hhAscender"               ptr val
    pokeField @"hhDescender"              ptr val
    pokeField @"hhLine_Gap"               ptr val
    pokeField @"hhAdvance_Width_Max"      ptr val
    pokeField @"hhMin_Left_Side_Bearing"  ptr val
    pokeField @"hhMin_Right_Side_Bearing" ptr val
    pokeField @"hhXMax_Extent"            ptr val
    pokeField @"hhCaret_Slope_Rise"       ptr val
    pokeField @"hhCaret_Slope_Run"        ptr val
    pokeField @"hhCaret_Offset"           ptr val
    pokeField @"hhReserved"               ptr val
    pokeField @"hhMetric_Data_Format"     ptr val
    pokeField @"hhNumber_Of_HMetrics"     ptr val
    pokeField @"hhLong_metrics"           ptr val
    pokeField @"hhShort_metrics"          ptr val



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

instance Offset "vhVersion"                 TT_VertHeader where rawOffset = #{offset struct TT_VertHeader_, Version                }
instance Offset "vhAscender"                TT_VertHeader where rawOffset = #{offset struct TT_VertHeader_, Ascender               }
instance Offset "vhDescender"               TT_VertHeader where rawOffset = #{offset struct TT_VertHeader_, Descender              }
instance Offset "vhLine_Gap"                TT_VertHeader where rawOffset = #{offset struct TT_VertHeader_, Line_Gap               }
instance Offset "vhAdvance_Height_Max"      TT_VertHeader where rawOffset = #{offset struct TT_VertHeader_, advance_Height_Max     }
instance Offset "vhMin_Top_Side_Bearing"    TT_VertHeader where rawOffset = #{offset struct TT_VertHeader_, min_Top_Side_Bearing   }
instance Offset "vhMin_Bottom_Side_Bearing" TT_VertHeader where rawOffset = #{offset struct TT_VertHeader_, min_Bottom_Side_Bearing}
instance Offset "vhYMax_Extent"             TT_VertHeader where rawOffset = #{offset struct TT_VertHeader_, yMax_Extent            }
instance Offset "vhCaret_Slope_Rise"        TT_VertHeader where rawOffset = #{offset struct TT_VertHeader_, caret_Slope_Rise       }
instance Offset "vhCaret_Slope_Run"         TT_VertHeader where rawOffset = #{offset struct TT_VertHeader_, caret_Slope_Run        }
instance Offset "vhCaret_Offset"            TT_VertHeader where rawOffset = #{offset struct TT_VertHeader_, caret_Offset           }
instance Offset "vhReserved"                TT_VertHeader where rawOffset = #{offset struct TT_VertHeader_, Reserved               }
instance Offset "vhMetric_Data_Format"      TT_VertHeader where rawOffset = #{offset struct TT_VertHeader_, metric_Data_Format     }
instance Offset "vhNumber_Of_VMetrics"      TT_VertHeader where rawOffset = #{offset struct TT_VertHeader_, number_Of_VMetrics     }
instance Offset "vhLong_metrics"            TT_VertHeader where rawOffset = #{offset struct TT_VertHeader_, long_metrics           }
instance Offset "vhShort_metrics"           TT_VertHeader where rawOffset = #{offset struct TT_VertHeader_, short_metrics          }



instance Storable TT_VertHeader where
  sizeOf _    = #size      struct TT_VertHeader_
  alignment _ = #alignment struct TT_VertHeader_

  peek ptr =
    TT_VertHeader
      <$> peek (offset @"vhVersion"                 ptr)
      <*> peek (offset @"vhAscender"                ptr)
      <*> peek (offset @"vhDescender"               ptr)
      <*> peek (offset @"vhLine_Gap"                ptr)
      <*> peek (offset @"vhAdvance_Height_Max"      ptr)
      <*> peek (offset @"vhMin_Top_Side_Bearing"    ptr)
      <*> peek (offset @"vhMin_Bottom_Side_Bearing" ptr)
      <*> peek (offset @"vhYMax_Extent"             ptr)
      <*> peek (offset @"vhCaret_Slope_Rise"        ptr)
      <*> peek (offset @"vhCaret_Slope_Run"         ptr)
      <*> peek (offset @"vhCaret_Offset"            ptr)
      <*> peek (offset @"vhReserved"                ptr)
      <*> peek (offset @"vhMetric_Data_Format"      ptr)
      <*> peek (offset @"vhNumber_Of_VMetrics"      ptr)
      <*> peek (offset @"vhLong_metrics"            ptr)
      <*> peek (offset @"vhShort_metrics"           ptr)

  poke ptr val = do
    pokeField @"vhVersion"                 ptr val
    pokeField @"vhAscender"                ptr val
    pokeField @"vhDescender"               ptr val
    pokeField @"vhLine_Gap"                ptr val
    pokeField @"vhAdvance_Height_Max"      ptr val
    pokeField @"vhMin_Top_Side_Bearing"    ptr val
    pokeField @"vhMin_Bottom_Side_Bearing" ptr val
    pokeField @"vhYMax_Extent"             ptr val
    pokeField @"vhCaret_Slope_Rise"        ptr val
    pokeField @"vhCaret_Slope_Run"         ptr val
    pokeField @"vhCaret_Offset"            ptr val
    pokeField @"vhReserved"                ptr val
    pokeField @"vhMetric_Data_Format"      ptr val
    pokeField @"vhNumber_Of_VMetrics"      ptr val
    pokeField @"vhLong_metrics"            ptr val
    pokeField @"vhShort_metrics"           ptr val



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

instance Offset "osVersion"                 TT_OS2 where rawOffset = #{offset struct TT_OS2_, version                }
instance Offset "osXAvgCharWidth"           TT_OS2 where rawOffset = #{offset struct TT_OS2_, xAvgCharWidth          }
instance Offset "osUsWeightClass"           TT_OS2 where rawOffset = #{offset struct TT_OS2_, usWeightClass          }
instance Offset "osUsWidthClass"            TT_OS2 where rawOffset = #{offset struct TT_OS2_, usWidthClass           }
instance Offset "osFsType"                  TT_OS2 where rawOffset = #{offset struct TT_OS2_, fsType                 }
instance Offset "osYSubscriptXSize"         TT_OS2 where rawOffset = #{offset struct TT_OS2_, ySubscriptXSize        }
instance Offset "osYSubscriptYSize"         TT_OS2 where rawOffset = #{offset struct TT_OS2_, ySubscriptYSize        }
instance Offset "osYSubscriptXOffset"       TT_OS2 where rawOffset = #{offset struct TT_OS2_, ySubscriptXOffset      }
instance Offset "osYSubscriptYOffset"       TT_OS2 where rawOffset = #{offset struct TT_OS2_, ySubscriptYOffset      }
instance Offset "osYSuperscriptXSize"       TT_OS2 where rawOffset = #{offset struct TT_OS2_, ySuperscriptXSize      }
instance Offset "osYSuperscriptYSize"       TT_OS2 where rawOffset = #{offset struct TT_OS2_, ySuperscriptYSize      }
instance Offset "osYSuperscriptXOffset"     TT_OS2 where rawOffset = #{offset struct TT_OS2_, ySuperscriptXOffset    }
instance Offset "osYSuperscriptYOffset"     TT_OS2 where rawOffset = #{offset struct TT_OS2_, ySuperscriptYOffset    }
instance Offset "osYStrikeoutSize"          TT_OS2 where rawOffset = #{offset struct TT_OS2_, yStrikeoutSize         }
instance Offset "osYStrikeoutPosition"      TT_OS2 where rawOffset = #{offset struct TT_OS2_, yStrikeoutPosition     }
instance Offset "osSFamilyClass"            TT_OS2 where rawOffset = #{offset struct TT_OS2_, sFamilyClass           }
instance Offset "osPanose"                  TT_OS2 where rawOffset = #{offset struct TT_OS2_, panose                 }
instance Offset "osUlUnicodeRange1"         TT_OS2 where rawOffset = #{offset struct TT_OS2_, ulUnicodeRange1        }
instance Offset "osUlUnicodeRange2"         TT_OS2 where rawOffset = #{offset struct TT_OS2_, ulUnicodeRange2        }
instance Offset "osUlUnicodeRange3"         TT_OS2 where rawOffset = #{offset struct TT_OS2_, ulUnicodeRange3        }
instance Offset "osUlUnicodeRange4"         TT_OS2 where rawOffset = #{offset struct TT_OS2_, ulUnicodeRange4        }
instance Offset "osAchVendID"               TT_OS2 where rawOffset = #{offset struct TT_OS2_, achVendID              }
instance Offset "osFsSelection"             TT_OS2 where rawOffset = #{offset struct TT_OS2_, fsSelection            }
instance Offset "osUsFirstCharIndex"        TT_OS2 where rawOffset = #{offset struct TT_OS2_, usFirstCharIndex       }
instance Offset "osUsLastCharIndex"         TT_OS2 where rawOffset = #{offset struct TT_OS2_, usLastCharIndex        }
instance Offset "osSTypoAscender"           TT_OS2 where rawOffset = #{offset struct TT_OS2_, sTypoAscender          }
instance Offset "osSTypoDescender"          TT_OS2 where rawOffset = #{offset struct TT_OS2_, sTypoDescender         }
instance Offset "osSTypoLineGap"            TT_OS2 where rawOffset = #{offset struct TT_OS2_, sTypoLineGap           }
instance Offset "osUsWinAscent"             TT_OS2 where rawOffset = #{offset struct TT_OS2_, usWinAscent            }
instance Offset "osUsWinDescent"            TT_OS2 where rawOffset = #{offset struct TT_OS2_, usWinDescent           }
instance Offset "osUlCodePageRange1"        TT_OS2 where rawOffset = #{offset struct TT_OS2_, ulCodePageRange1       }
instance Offset "osUlCodePageRange2"        TT_OS2 where rawOffset = #{offset struct TT_OS2_, ulCodePageRange2       }
instance Offset "osSxHeight"                TT_OS2 where rawOffset = #{offset struct TT_OS2_, sxHeight               }
instance Offset "osSCapHeight"              TT_OS2 where rawOffset = #{offset struct TT_OS2_, sCapHeight             }
instance Offset "osUsDefaultChar"           TT_OS2 where rawOffset = #{offset struct TT_OS2_, usDefaultChar          }
instance Offset "osUsBreakChar"             TT_OS2 where rawOffset = #{offset struct TT_OS2_, usBreakChar            }
instance Offset "osUsMaxContext"            TT_OS2 where rawOffset = #{offset struct TT_OS2_, usMaxContext           }
instance Offset "osUsLowerOpticalPointSize" TT_OS2 where rawOffset = #{offset struct TT_OS2_, usLowerOpticalPointSize}
instance Offset "osUsUpperOpticalPointSize" TT_OS2 where rawOffset = #{offset struct TT_OS2_, usUpperOpticalPointSize}

instance Storable TT_OS2 where
  sizeOf _    = #size      struct TT_OS2_
  alignment _ = #alignment struct TT_OS2_

  peek ptr =
    TT_OS2
      <$> peek (offset @"osVersion"                 ptr)
      <*> peek (offset @"osXAvgCharWidth"           ptr)
      <*> peek (offset @"osUsWeightClass"           ptr)
      <*> peek (offset @"osUsWidthClass"            ptr)
      <*> peek (offset @"osFsType"                  ptr)
      <*> peek (offset @"osYSubscriptXSize"         ptr)
      <*> peek (offset @"osYSubscriptYSize"         ptr)
      <*> peek (offset @"osYSubscriptXOffset"       ptr)
      <*> peek (offset @"osYSubscriptYOffset"       ptr)
      <*> peek (offset @"osYSuperscriptXSize"       ptr)
      <*> peek (offset @"osYSuperscriptYSize"       ptr)
      <*> peek (offset @"osYSuperscriptXOffset"     ptr)
      <*> peek (offset @"osYSuperscriptYOffset"     ptr)
      <*> peek (offset @"osYStrikeoutSize"          ptr)
      <*> peek (offset @"osYStrikeoutPosition"      ptr)
      <*> peek (offset @"osSFamilyClass"            ptr)
      <*> peek (offset @"osPanose"                  ptr)
      <*> peek (offset @"osUlUnicodeRange1"         ptr)
      <*> peek (offset @"osUlUnicodeRange2"         ptr)
      <*> peek (offset @"osUlUnicodeRange3"         ptr)
      <*> peek (offset @"osUlUnicodeRange4"         ptr)
      <*> peek (offset @"osAchVendID"               ptr)
      <*> peek (offset @"osFsSelection"             ptr)
      <*> peek (offset @"osUsFirstCharIndex"        ptr)
      <*> peek (offset @"osUsLastCharIndex"         ptr)
      <*> peek (offset @"osSTypoAscender"           ptr)
      <*> peek (offset @"osSTypoDescender"          ptr)
      <*> peek (offset @"osSTypoLineGap"            ptr)
      <*> peek (offset @"osUsWinAscent"             ptr)
      <*> peek (offset @"osUsWinDescent"            ptr)
      <*> peek (offset @"osUlCodePageRange1"        ptr)
      <*> peek (offset @"osUlCodePageRange2"        ptr)
      <*> peek (offset @"osSxHeight"                ptr)
      <*> peek (offset @"osSCapHeight"              ptr)
      <*> peek (offset @"osUsDefaultChar"           ptr)
      <*> peek (offset @"osUsBreakChar"             ptr)
      <*> peek (offset @"osUsMaxContext"            ptr)
      <*> peek (offset @"osUsLowerOpticalPointSize" ptr)
      <*> peek (offset @"osUsUpperOpticalPointSize" ptr)

  poke ptr val = do
    pokeField @"osVersion"                 ptr val
    pokeField @"osXAvgCharWidth"           ptr val
    pokeField @"osUsWeightClass"           ptr val
    pokeField @"osUsWidthClass"            ptr val
    pokeField @"osFsType"                  ptr val
    pokeField @"osYSubscriptXSize"         ptr val
    pokeField @"osYSubscriptYSize"         ptr val
    pokeField @"osYSubscriptXOffset"       ptr val
    pokeField @"osYSubscriptYOffset"       ptr val
    pokeField @"osYSuperscriptXSize"       ptr val
    pokeField @"osYSuperscriptYSize"       ptr val
    pokeField @"osYSuperscriptXOffset"     ptr val
    pokeField @"osYSuperscriptYOffset"     ptr val
    pokeField @"osYStrikeoutSize"          ptr val
    pokeField @"osYStrikeoutPosition"      ptr val
    pokeField @"osSFamilyClass"            ptr val
    pokeField @"osPanose"                  ptr val
    pokeField @"osUlUnicodeRange1"         ptr val
    pokeField @"osUlUnicodeRange2"         ptr val
    pokeField @"osUlUnicodeRange3"         ptr val
    pokeField @"osUlUnicodeRange4"         ptr val
    pokeField @"osAchVendID"               ptr val
    pokeField @"osFsSelection"             ptr val
    pokeField @"osUsFirstCharIndex"        ptr val
    pokeField @"osUsLastCharIndex"         ptr val
    pokeField @"osSTypoAscender"           ptr val
    pokeField @"osSTypoDescender"          ptr val
    pokeField @"osSTypoLineGap"            ptr val
    pokeField @"osUsWinAscent"             ptr val
    pokeField @"osUsWinDescent"            ptr val
    pokeField @"osUlCodePageRange1"        ptr val
    pokeField @"osUlCodePageRange2"        ptr val
    pokeField @"osSxHeight"                ptr val
    pokeField @"osSCapHeight"              ptr val
    pokeField @"osUsDefaultChar"           ptr val
    pokeField @"osUsBreakChar"             ptr val
    pokeField @"osUsMaxContext"            ptr val
    pokeField @"osUsLowerOpticalPointSize" ptr val
    pokeField @"osUsUpperOpticalPointSize" ptr val



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

instance Offset "pFormatType"         TT_Postscript where rawOffset = #{offset struct TT_Postscript_, FormatType        }
instance Offset "pItalicAngle"        TT_Postscript where rawOffset = #{offset struct TT_Postscript_, italicAngle       }
instance Offset "pUnderlinePosition"  TT_Postscript where rawOffset = #{offset struct TT_Postscript_, underlinePosition }
instance Offset "pUnderlineThickness" TT_Postscript where rawOffset = #{offset struct TT_Postscript_, underlineThickness}
instance Offset "pIsFixedPitch"       TT_Postscript where rawOffset = #{offset struct TT_Postscript_, isFixedPitch      }
instance Offset "pMinMemType42"       TT_Postscript where rawOffset = #{offset struct TT_Postscript_, minMemType42      }
instance Offset "pMaxMemType42"       TT_Postscript where rawOffset = #{offset struct TT_Postscript_, maxMemType42      }
instance Offset "pMinMemType1"        TT_Postscript where rawOffset = #{offset struct TT_Postscript_, minMemType1       }
instance Offset "pMaxMemType1"        TT_Postscript where rawOffset = #{offset struct TT_Postscript_, maxMemType1       }

instance Storable TT_Postscript where
  sizeOf _    = #size      struct TT_Postscript_
  alignment _ = #alignment struct TT_Postscript_

  peek ptr =
    TT_Postscript
      <$> peek (offset @"pFormatType"         ptr)
      <*> peek (offset @"pItalicAngle"        ptr)
      <*> peek (offset @"pUnderlinePosition"  ptr)
      <*> peek (offset @"pUnderlineThickness" ptr)
      <*> peek (offset @"pIsFixedPitch"       ptr)
      <*> peek (offset @"pMinMemType42"       ptr)
      <*> peek (offset @"pMaxMemType42"       ptr)
      <*> peek (offset @"pMinMemType1"        ptr)
      <*> peek (offset @"pMaxMemType1"        ptr)

  poke ptr val = do
    pokeField @"pFormatType"         ptr val
    pokeField @"pItalicAngle"        ptr val
    pokeField @"pUnderlinePosition"  ptr val
    pokeField @"pUnderlineThickness" ptr val
    pokeField @"pIsFixedPitch"       ptr val
    pokeField @"pMinMemType42"       ptr val
    pokeField @"pMaxMemType42"       ptr val
    pokeField @"pMinMemType1"        ptr val
    pokeField @"pMaxMemType1"        ptr val



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

instance Offset "pcltVersion"             TT_PCLT where rawOffset = #{offset struct TT_PCLT_, Version            }
instance Offset "pcltFontNumber"          TT_PCLT where rawOffset = #{offset struct TT_PCLT_, FontNumber         }
instance Offset "pcltPitch"               TT_PCLT where rawOffset = #{offset struct TT_PCLT_, Pitch              }
instance Offset "pcltXHeight"             TT_PCLT where rawOffset = #{offset struct TT_PCLT_, xHeight            }
instance Offset "pcltStyle"               TT_PCLT where rawOffset = #{offset struct TT_PCLT_, Style              }
instance Offset "pcltTypeFamily"          TT_PCLT where rawOffset = #{offset struct TT_PCLT_, TypeFamily         }
instance Offset "pcltCapHeight"           TT_PCLT where rawOffset = #{offset struct TT_PCLT_, CapHeight          }
instance Offset "pcltSymbolSet"           TT_PCLT where rawOffset = #{offset struct TT_PCLT_, SymbolSet          }
instance Offset "pcltTypeFace"            TT_PCLT where rawOffset = #{offset struct TT_PCLT_, TypeFace           }
instance Offset "pcltCharacterComplement" TT_PCLT where rawOffset = #{offset struct TT_PCLT_, CharacterComplement}
instance Offset "pcltFileName"            TT_PCLT where rawOffset = #{offset struct TT_PCLT_, FileName           }
instance Offset "pcltStrokeWeight"        TT_PCLT where rawOffset = #{offset struct TT_PCLT_, StrokeWeight       }
instance Offset "pcltWidthType"           TT_PCLT where rawOffset = #{offset struct TT_PCLT_, WidthType          }
instance Offset "pcltSerifStyle"          TT_PCLT where rawOffset = #{offset struct TT_PCLT_, SerifStyle         }
instance Offset "pcltReserved"            TT_PCLT where rawOffset = #{offset struct TT_PCLT_, Reserved           }

instance Storable TT_PCLT where
  sizeOf _    = #size      struct TT_PCLT_
  alignment _ = #alignment struct TT_PCLT_

  peek ptr =
    TT_PCLT
      <$> peek (offset @"pcltVersion"             ptr)
      <*> peek (offset @"pcltFontNumber"          ptr)
      <*> peek (offset @"pcltPitch"               ptr)
      <*> peek (offset @"pcltXHeight"             ptr)
      <*> peek (offset @"pcltStyle"               ptr)
      <*> peek (offset @"pcltTypeFamily"          ptr)
      <*> peek (offset @"pcltCapHeight"           ptr)
      <*> peek (offset @"pcltSymbolSet"           ptr)
      <*> peek (offset @"pcltTypeFace"            ptr)
      <*> peek (offset @"pcltCharacterComplement" ptr)
      <*> peek (offset @"pcltFileName"            ptr)
      <*> peek (offset @"pcltStrokeWeight"        ptr)
      <*> peek (offset @"pcltWidthType"           ptr)
      <*> peek (offset @"pcltSerifStyle"          ptr)
      <*> peek (offset @"pcltReserved"            ptr)

  poke ptr val = do
    pokeField @"pcltVersion"             ptr val
    pokeField @"pcltFontNumber"          ptr val
    pokeField @"pcltPitch"               ptr val
    pokeField @"pcltXHeight"             ptr val
    pokeField @"pcltStyle"               ptr val
    pokeField @"pcltTypeFamily"          ptr val
    pokeField @"pcltCapHeight"           ptr val
    pokeField @"pcltSymbolSet"           ptr val
    pokeField @"pcltTypeFace"            ptr val
    pokeField @"pcltCharacterComplement" ptr val
    pokeField @"pcltFileName"            ptr val
    pokeField @"pcltStrokeWeight"        ptr val
    pokeField @"pcltWidthType"           ptr val
    pokeField @"pcltSerifStyle"          ptr val
    pokeField @"pcltReserved"            ptr val



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

instance Offset "mpVersion"               TT_MaxProfile where rawOffset = #{offset struct TT_MaxProfile_, version              }
instance Offset "mpNumGlyphs"             TT_MaxProfile where rawOffset = #{offset struct TT_MaxProfile_, numGlyphs            }
instance Offset "mpMaxPoints"             TT_MaxProfile where rawOffset = #{offset struct TT_MaxProfile_, maxPoints            }
instance Offset "mpMaxContours"           TT_MaxProfile where rawOffset = #{offset struct TT_MaxProfile_, maxContours          }
instance Offset "mpMaxCompositePoints"    TT_MaxProfile where rawOffset = #{offset struct TT_MaxProfile_, maxCompositePoints   }
instance Offset "mpMaxCompositeContours"  TT_MaxProfile where rawOffset = #{offset struct TT_MaxProfile_, maxCompositeContours }
instance Offset "mpMaxZones"              TT_MaxProfile where rawOffset = #{offset struct TT_MaxProfile_, maxZones             }
instance Offset "mpMaxTwilightPoints"     TT_MaxProfile where rawOffset = #{offset struct TT_MaxProfile_, maxTwilightPoints    }
instance Offset "mpMaxStorage"            TT_MaxProfile where rawOffset = #{offset struct TT_MaxProfile_, maxStorage           }
instance Offset "mpMaxFunctionDefs"       TT_MaxProfile where rawOffset = #{offset struct TT_MaxProfile_, maxFunctionDefs      }
instance Offset "mpMaxInstructionDefs"    TT_MaxProfile where rawOffset = #{offset struct TT_MaxProfile_, maxInstructionDefs   }
instance Offset "mpMaxStackElements"      TT_MaxProfile where rawOffset = #{offset struct TT_MaxProfile_, maxStackElements     }
instance Offset "mpMaxSizeOfInstructions" TT_MaxProfile where rawOffset = #{offset struct TT_MaxProfile_, maxSizeOfInstructions}
instance Offset "mpMaxComponentElements"  TT_MaxProfile where rawOffset = #{offset struct TT_MaxProfile_, maxComponentElements }
instance Offset "mpMaxComponentDepth"     TT_MaxProfile where rawOffset = #{offset struct TT_MaxProfile_, maxComponentDepth    }

instance Storable TT_MaxProfile where
  sizeOf _    = #size      struct TT_MaxProfile_
  alignment _ = #alignment struct TT_MaxProfile_

  peek ptr =
    TT_MaxProfile
      <$> peek (offset @"mpVersion"               ptr)
      <*> peek (offset @"mpNumGlyphs"             ptr)
      <*> peek (offset @"mpMaxPoints"             ptr)
      <*> peek (offset @"mpMaxContours"           ptr)
      <*> peek (offset @"mpMaxCompositePoints"    ptr)
      <*> peek (offset @"mpMaxCompositeContours"  ptr)
      <*> peek (offset @"mpMaxZones"              ptr)
      <*> peek (offset @"mpMaxTwilightPoints"     ptr)
      <*> peek (offset @"mpMaxStorage"            ptr)
      <*> peek (offset @"mpMaxFunctionDefs"       ptr)
      <*> peek (offset @"mpMaxInstructionDefs"    ptr)
      <*> peek (offset @"mpMaxStackElements"      ptr)
      <*> peek (offset @"mpMaxSizeOfInstructions" ptr)
      <*> peek (offset @"mpMaxComponentElements"  ptr)
      <*> peek (offset @"mpMaxComponentDepth"     ptr)

  poke ptr val = do
    pokeField @"mpVersion"               ptr val
    pokeField @"mpNumGlyphs"             ptr val
    pokeField @"mpMaxPoints"             ptr val
    pokeField @"mpMaxContours"           ptr val
    pokeField @"mpMaxCompositePoints"    ptr val
    pokeField @"mpMaxCompositeContours"  ptr val
    pokeField @"mpMaxZones"              ptr val
    pokeField @"mpMaxTwilightPoints"     ptr val
    pokeField @"mpMaxStorage"            ptr val
    pokeField @"mpMaxFunctionDefs"       ptr val
    pokeField @"mpMaxInstructionDefs"    ptr val
    pokeField @"mpMaxStackElements"      ptr val
    pokeField @"mpMaxSizeOfInstructions" ptr val
    pokeField @"mpMaxComponentElements"  ptr val
    pokeField @"mpMaxComponentDepth"     ptr val



type FT_Sfnt_Tag = #type enum FT_Sfnt_Tag_
