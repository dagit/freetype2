{-# LANGUAGE DataKinds
           , DuplicateRecordFields
           , EmptyDataDecls
           , FlexibleInstances
           , ForeignFunctionInterface
           , MultiParamTypeClasses #-}
#if __GLASGOW_HASKELL__ >= 902
{-# LANGUAGE NoFieldSelectors #-}
#endif
{-# LANGUAGE PatternSynonyms
           , TypeApplications #-}

{-# OPTIONS_HADDOCK hide #-}

module FreeType.Circular.Types where

import          FreeType.Core.Types.Types

import          Data.Int
import          Data.Word
import          GHC.Records
import          Foreign.Ptr
import          Foreign.Storable
import          Foreign.Storable.Offset

#include "ft2build.h"
#include FT_FREETYPE_H

type FT_Library = Ptr FT_LibraryRec

data FT_LibraryRec



type FT_Face = Ptr FT_FaceRec

data FT_FaceRec = FT_FaceRec
                    { num_faces           :: FT_Long
                    , face_index          :: FT_Long
                    , face_flags          :: FT_Long
                    , style_flags         :: FT_Long
                    , num_glyphs          :: FT_Long
                    , family_name         :: Ptr FT_String
                    , style_name          :: Ptr FT_String
                    , num_fixed_sizes     :: FT_Int
                    , available_sizes     :: Ptr FT_Bitmap_Size
                    , num_charmaps        :: FT_Int
                    , charmaps            :: Ptr FT_CharMap
                    , generic             :: FT_Generic
                    , bbox                :: FT_BBox
                    , units_per_EM        :: FT_UShort
                    , ascender            :: FT_Short
                    , descender           :: FT_Short
                    , height              :: FT_Short
                    , max_advance_width   :: FT_Short
                    , max_advance_height  :: FT_Short
                    , underline_position  :: FT_Short
                    , underline_thickness :: FT_Short
                    , glyph               :: FT_GlyphSlot
                    , size                :: FT_Size
                    , charmap             :: FT_CharMap
                    , driver              :: FT_Driver
                    , memory              :: FT_Memory
                    , stream              :: FT_Stream
                    , sizes_list          :: FT_ListRec
                    , autohint            :: FT_Generic
                    , extensions          :: Ptr ()
                    , internal            :: FT_Face_Internal
                    }

instance Offset "num_faces"           FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, num_faces          }
instance Offset "face_index"          FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, face_index         }
instance Offset "face_flags"          FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, face_flags         }
instance Offset "style_flags"         FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, style_flags        }
instance Offset "num_glyphs"          FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, num_glyphs         }
instance Offset "family_name"         FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, family_name        }
instance Offset "style_name"          FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, style_name         }
instance Offset "num_fixed_sizes"     FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, num_fixed_sizes    }
instance Offset "available_sizes"     FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, available_sizes    }
instance Offset "num_charmaps"        FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, num_charmaps       }
instance Offset "charmaps"            FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, charmaps           }
instance Offset "generic"             FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, generic            }
instance Offset "bbox"                FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, bbox               }
instance Offset "units_per_EM"        FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, units_per_EM       }
instance Offset "ascender"            FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, ascender           }
instance Offset "descender"           FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, descender          }
instance Offset "height"              FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, height             }
instance Offset "max_advance_width"   FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, max_advance_width  }
instance Offset "max_advance_height"  FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, max_advance_height }
instance Offset "underline_position"  FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, underline_position }
instance Offset "underline_thickness" FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, underline_thickness}
instance Offset "glyph"               FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, glyph              }
instance Offset "size"                FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, size               }
instance Offset "charmap"             FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, charmap            }
instance Offset "driver"              FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, driver             }
instance Offset "memory"              FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, memory             }
instance Offset "stream"              FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, stream             }
instance Offset "sizes_list"          FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, sizes_list         }
instance Offset "autohint"            FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, autohint           }
instance Offset "extensions"          FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, extensions         }
instance Offset "internal"            FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, internal           }

instance Storable FT_FaceRec where
  sizeOf _    = #size      struct FT_FaceRec_
  alignment _ = #alignment struct FT_FaceRec_

  peek ptr =
    FT_FaceRec
      <$> peek (offset @"num_faces"           ptr)
      <*> peek (offset @"face_index"          ptr)
      <*> peek (offset @"face_flags"          ptr)
      <*> peek (offset @"style_flags"         ptr)
      <*> peek (offset @"num_glyphs"          ptr)
      <*> peek (offset @"family_name"         ptr)
      <*> peek (offset @"style_name"          ptr)
      <*> peek (offset @"num_fixed_sizes"     ptr)
      <*> peek (offset @"available_sizes"     ptr)
      <*> peek (offset @"num_charmaps"        ptr)
      <*> peek (offset @"charmaps"            ptr)
      <*> peek (offset @"generic"             ptr)
      <*> peek (offset @"bbox"                ptr)
      <*> peek (offset @"units_per_EM"        ptr)
      <*> peek (offset @"ascender"            ptr)
      <*> peek (offset @"descender"           ptr)
      <*> peek (offset @"height"              ptr)
      <*> peek (offset @"max_advance_width"   ptr)
      <*> peek (offset @"max_advance_height"  ptr)
      <*> peek (offset @"underline_position"  ptr)
      <*> peek (offset @"underline_thickness" ptr)
      <*> peek (offset @"glyph"               ptr)
      <*> peek (offset @"size"                ptr)
      <*> peek (offset @"charmap"             ptr)
      <*> peek (offset @"driver"              ptr)
      <*> peek (offset @"memory"              ptr)
      <*> peek (offset @"stream"              ptr)
      <*> peek (offset @"sizes_list"          ptr)
      <*> peek (offset @"autohint"            ptr)
      <*> peek (offset @"extensions"          ptr)
      <*> peek (offset @"internal"            ptr)

  poke ptr val = do
    pokeField @"num_faces"           ptr val
    pokeField @"face_index"          ptr val
    pokeField @"face_flags"          ptr val
    pokeField @"style_flags"         ptr val
    pokeField @"num_glyphs"          ptr val
    pokeField @"family_name"         ptr val
    pokeField @"style_name"          ptr val
    pokeField @"num_fixed_sizes"     ptr val
    pokeField @"available_sizes"     ptr val
    pokeField @"num_charmaps"        ptr val
    pokeField @"charmaps"            ptr val
    pokeField @"generic"             ptr val
    pokeField @"bbox"                ptr val
    pokeField @"units_per_EM"        ptr val
    pokeField @"ascender"            ptr val
    pokeField @"descender"           ptr val
    pokeField @"height"              ptr val
    pokeField @"max_advance_width"   ptr val
    pokeField @"max_advance_height"  ptr val
    pokeField @"underline_position"  ptr val
    pokeField @"underline_thickness" ptr val
    pokeField @"glyph"               ptr val
    pokeField @"size"                ptr val
    pokeField @"charmap"             ptr val
    pokeField @"driver"              ptr val
    pokeField @"memory"              ptr val
    pokeField @"stream"              ptr val
    pokeField @"sizes_list"          ptr val
    pokeField @"autohint"            ptr val
    pokeField @"extensions"          ptr val
    pokeField @"internal"            ptr val



data FT_Bitmap_Size = FT_Bitmap_Size
                        { height :: FT_Short
                        , width  :: FT_Short
                        , size   :: FT_Pos
                        , x_ppem :: FT_Pos
                        , y_ppem :: FT_Pos
                        }

instance Offset "height" FT_Bitmap_Size where rawOffset = #{offset struct FT_Bitmap_Size_, height}
instance Offset "width"  FT_Bitmap_Size where rawOffset = #{offset struct FT_Bitmap_Size_, width }
instance Offset "size"   FT_Bitmap_Size where rawOffset = #{offset struct FT_Bitmap_Size_, size  }
instance Offset "x_ppem" FT_Bitmap_Size where rawOffset = #{offset struct FT_Bitmap_Size_, x_ppem}
instance Offset "y_ppem" FT_Bitmap_Size where rawOffset = #{offset struct FT_Bitmap_Size_, y_ppem}

instance Storable FT_Bitmap_Size where
  sizeOf _    = #size      struct FT_Bitmap_Size_
  alignment _ = #alignment struct FT_Bitmap_Size_

  peek ptr =
    FT_Bitmap_Size
      <$> peek (offset @"height" ptr)
      <*> peek (offset @"width"  ptr)
      <*> peek (offset @"size"   ptr)
      <*> peek (offset @"x_ppem" ptr)
      <*> peek (offset @"y_ppem" ptr)

  poke ptr val = do
    pokeField @"height" ptr val
    pokeField @"width"  ptr val
    pokeField @"size"   ptr val
    pokeField @"x_ppem" ptr val
    pokeField @"y_ppem" ptr val



type FT_CharMap = Ptr FT_CharMapRec

data FT_CharMapRec = FT_CharMapRec
                       { face        :: FT_Face
                       , encoding    :: FT_Encoding
                       , platform_id :: FT_UShort
                       , encoding_id :: FT_UShort
                       }

instance Offset "face"        FT_CharMapRec where rawOffset = #{offset struct FT_CharMapRec_, face       }
instance Offset "encoding"    FT_CharMapRec where rawOffset = #{offset struct FT_CharMapRec_, encoding   }
instance Offset "platform_id" FT_CharMapRec where rawOffset = #{offset struct FT_CharMapRec_, platform_id}
instance Offset "encoding_id" FT_CharMapRec where rawOffset = #{offset struct FT_CharMapRec_, encoding_id}

instance Storable FT_CharMapRec where
  sizeOf _    = #size      struct FT_CharMapRec_
  alignment _ = #alignment struct FT_CharMapRec_

  peek ptr =
    FT_CharMapRec
      <$> peek (offset @"face"        ptr)
      <*> peek (offset @"encoding"    ptr)
      <*> peek (offset @"platform_id" ptr)
      <*> peek (offset @"encoding_id" ptr)

  poke ptr val = do
    pokeField @"face"        ptr val
    pokeField @"encoding"    ptr val
    pokeField @"platform_id" ptr val
    pokeField @"encoding_id" ptr val



type FT_Encoding = FT_UInt

pattern FT_ENCODING_NONE
      , FT_ENCODING_MS_SYMBOL
      , FT_ENCODING_UNICODE
      , FT_ENCODING_SJIS
      , FT_ENCODING_PRC
      , FT_ENCODING_BIG5
      , FT_ENCODING_WANSUNG
      , FT_ENCODING_JOHAB
      , FT_ENCODING_GB2312
      , FT_ENCODING_MS_SJIS
      , FT_ENCODING_MS_GB2312
      , FT_ENCODING_MS_BIG5
      , FT_ENCODING_MS_WANSUNG
      , FT_ENCODING_MS_JOHAB
      , FT_ENCODING_ADOBE_STANDARD
      , FT_ENCODING_ADOBE_EXPERT
      , FT_ENCODING_ADOBE_CUSTOM
      , FT_ENCODING_ADOBE_LATIN_1
      , FT_ENCODING_OLD_LATIN_2
      , FT_ENCODING_APPLE_ROMAN
     :: (Eq a, Num a) => a
pattern FT_ENCODING_NONE           = #const FT_ENCODING_NONE
pattern FT_ENCODING_MS_SYMBOL      = #const FT_ENCODING_MS_SYMBOL
pattern FT_ENCODING_UNICODE        = #const FT_ENCODING_UNICODE
pattern FT_ENCODING_SJIS           = #const FT_ENCODING_SJIS
pattern FT_ENCODING_PRC            = #const FT_ENCODING_PRC
pattern FT_ENCODING_BIG5           = #const FT_ENCODING_BIG5
pattern FT_ENCODING_WANSUNG        = #const FT_ENCODING_WANSUNG
pattern FT_ENCODING_JOHAB          = #const FT_ENCODING_JOHAB
pattern FT_ENCODING_GB2312         = #const FT_ENCODING_GB2312
pattern FT_ENCODING_MS_SJIS        = #const FT_ENCODING_MS_SJIS
pattern FT_ENCODING_MS_GB2312      = #const FT_ENCODING_MS_GB2312
pattern FT_ENCODING_MS_BIG5        = #const FT_ENCODING_MS_BIG5
pattern FT_ENCODING_MS_WANSUNG     = #const FT_ENCODING_MS_WANSUNG
pattern FT_ENCODING_MS_JOHAB       = #const FT_ENCODING_MS_JOHAB
pattern FT_ENCODING_ADOBE_STANDARD = #const FT_ENCODING_ADOBE_STANDARD
pattern FT_ENCODING_ADOBE_EXPERT   = #const FT_ENCODING_ADOBE_EXPERT
pattern FT_ENCODING_ADOBE_CUSTOM   = #const FT_ENCODING_ADOBE_CUSTOM
pattern FT_ENCODING_ADOBE_LATIN_1  = #const FT_ENCODING_ADOBE_LATIN_1
pattern FT_ENCODING_OLD_LATIN_2    = #const FT_ENCODING_OLD_LATIN_2
pattern FT_ENCODING_APPLE_ROMAN    = #const FT_ENCODING_APPLE_ROMAN



type FT_GlyphSlot = Ptr FT_GlyphSlotRec

data FT_GlyphSlotRec = FT_GlyphSlotRec
                         { library           :: FT_Library
                         , face              :: FT_Face
                         , next              :: FT_GlyphSlot
                         , glyph_index       :: FT_UInt
                         , generic           :: FT_Generic
                         , metrics           :: FT_Glyph_Metrics
                         , linearHoriAdvance :: FT_Fixed
                         , linearVertAdvance :: FT_Fixed
                         , advance           :: FT_Vector
                         , format            :: FT_Glyph_Format
                         , bitmap            :: FT_Bitmap
                         , bitmap_left       :: FT_Int
                         , bitmap_top        :: FT_Int
                         , outline           :: FT_Outline
                         , num_subglyphs     :: FT_UInt
                         , subglyphs         :: FT_SubGlyph
                         , control_data      :: Ptr ()
                         , control_len       :: #type long
                         , lsb_delta         :: FT_Pos
                         , rsb_delta         :: FT_Pos
                         , other             :: Ptr ()
                         , internal          :: FT_Slot_Internal
                         }

instance Offset "library"           FT_GlyphSlotRec where rawOffset = #{offset struct FT_GlyphSlotRec_, library          }
instance Offset "face"              FT_GlyphSlotRec where rawOffset = #{offset struct FT_GlyphSlotRec_, face             }
instance Offset "next"              FT_GlyphSlotRec where rawOffset = #{offset struct FT_GlyphSlotRec_, next             }
instance Offset "glyph_index"       FT_GlyphSlotRec where rawOffset = #{offset struct FT_GlyphSlotRec_, glyph_index      }
instance Offset "generic"           FT_GlyphSlotRec where rawOffset = #{offset struct FT_GlyphSlotRec_, generic          }
instance Offset "metrics"           FT_GlyphSlotRec where rawOffset = #{offset struct FT_GlyphSlotRec_, metrics          }
instance Offset "linearHoriAdvance" FT_GlyphSlotRec where rawOffset = #{offset struct FT_GlyphSlotRec_, linearHoriAdvance}
instance Offset "linearVertAdvance" FT_GlyphSlotRec where rawOffset = #{offset struct FT_GlyphSlotRec_, linearVertAdvance}
instance Offset "advance"           FT_GlyphSlotRec where rawOffset = #{offset struct FT_GlyphSlotRec_, advance          }
instance Offset "format"            FT_GlyphSlotRec where rawOffset = #{offset struct FT_GlyphSlotRec_, format           }
instance Offset "bitmap"            FT_GlyphSlotRec where rawOffset = #{offset struct FT_GlyphSlotRec_, bitmap           }
instance Offset "bitmap_left"       FT_GlyphSlotRec where rawOffset = #{offset struct FT_GlyphSlotRec_, bitmap_left      }
instance Offset "bitmap_top"        FT_GlyphSlotRec where rawOffset = #{offset struct FT_GlyphSlotRec_, bitmap_top       }
instance Offset "outline"           FT_GlyphSlotRec where rawOffset = #{offset struct FT_GlyphSlotRec_, outline          }
instance Offset "num_subglyphs"     FT_GlyphSlotRec where rawOffset = #{offset struct FT_GlyphSlotRec_, num_subglyphs    }
instance Offset "subglyphs"         FT_GlyphSlotRec where rawOffset = #{offset struct FT_GlyphSlotRec_, subglyphs        }
instance Offset "control_data"      FT_GlyphSlotRec where rawOffset = #{offset struct FT_GlyphSlotRec_, control_data     }
instance Offset "control_len"       FT_GlyphSlotRec where rawOffset = #{offset struct FT_GlyphSlotRec_, control_len      }
instance Offset "lsb_delta"         FT_GlyphSlotRec where rawOffset = #{offset struct FT_GlyphSlotRec_, lsb_delta        }
instance Offset "rsb_delta"         FT_GlyphSlotRec where rawOffset = #{offset struct FT_GlyphSlotRec_, rsb_delta        }
instance Offset "other"             FT_GlyphSlotRec where rawOffset = #{offset struct FT_GlyphSlotRec_, other            }
instance Offset "internal"          FT_GlyphSlotRec where rawOffset = #{offset struct FT_GlyphSlotRec_, internal         }

instance Storable FT_GlyphSlotRec where
  sizeOf _    = #size      struct FT_GlyphSlotRec_
  alignment _ = #alignment struct FT_GlyphSlotRec_

  peek ptr =
    FT_GlyphSlotRec
      <$> peek (offset @"library"           ptr)
      <*> peek (offset @"face"              ptr)
      <*> peek (offset @"next"              ptr)
      <*> peek (offset @"glyph_index"       ptr)
      <*> peek (offset @"generic"           ptr)
      <*> peek (offset @"metrics"           ptr)
      <*> peek (offset @"linearHoriAdvance" ptr)
      <*> peek (offset @"linearVertAdvance" ptr)
      <*> peek (offset @"advance"           ptr)
      <*> peek (offset @"format"            ptr)
      <*> peek (offset @"bitmap"            ptr)
      <*> peek (offset @"bitmap_left"       ptr)
      <*> peek (offset @"bitmap_top"        ptr)
      <*> peek (offset @"outline"           ptr)
      <*> peek (offset @"num_subglyphs"     ptr)
      <*> peek (offset @"subglyphs"         ptr)
      <*> peek (offset @"control_data"      ptr)
      <*> peek (offset @"control_len"       ptr)
      <*> peek (offset @"lsb_delta"         ptr)
      <*> peek (offset @"rsb_delta"         ptr)
      <*> peek (offset @"other"             ptr)
      <*> peek (offset @"internal"          ptr)

  poke ptr val = do
    pokeField @"library"           ptr val
    pokeField @"face"              ptr val
    pokeField @"next"              ptr val
    pokeField @"glyph_index"       ptr val
    pokeField @"generic"           ptr val
    pokeField @"metrics"           ptr val
    pokeField @"linearHoriAdvance" ptr val
    pokeField @"linearVertAdvance" ptr val
    pokeField @"advance"           ptr val
    pokeField @"format"            ptr val
    pokeField @"bitmap"            ptr val
    pokeField @"bitmap_left"       ptr val
    pokeField @"bitmap_top"        ptr val
    pokeField @"outline"           ptr val
    pokeField @"num_subglyphs"     ptr val
    pokeField @"subglyphs"         ptr val
    pokeField @"control_data"      ptr val
    pokeField @"control_len"       ptr val
    pokeField @"lsb_delta"         ptr val
    pokeField @"rsb_delta"         ptr val
    pokeField @"other"             ptr val
    pokeField @"internal"          ptr val



type FT_Size = Ptr FT_SizeRec

data FT_SizeRec = FT_SizeRec
                    { face     :: FT_Face
                    , generic  :: FT_Generic
                    , metrics  :: FT_Size_Metrics
                    , internal :: FT_Size_Internal
                    }

instance Offset "face"     FT_SizeRec where rawOffset = #{offset struct FT_SizeRec_, face    }
instance Offset "generic"  FT_SizeRec where rawOffset = #{offset struct FT_SizeRec_, generic }
instance Offset "metrics"  FT_SizeRec where rawOffset = #{offset struct FT_SizeRec_, metrics }
instance Offset "internal" FT_SizeRec where rawOffset = #{offset struct FT_SizeRec_, internal}

instance Storable FT_SizeRec where
  sizeOf _    = #size      struct FT_SizeRec_
  alignment _ = #alignment struct FT_SizeRec_

  peek ptr =
    FT_SizeRec
      <$> peek (offset @"face"     ptr)
      <*> peek (offset @"generic"  ptr)
      <*> peek (offset @"metrics"  ptr)
      <*> peek (offset @"internal" ptr)

  poke ptr val = do
    pokeField @"face"     ptr val
    pokeField @"generic"  ptr val
    pokeField @"metrics"  ptr val
    pokeField @"internal" ptr val



data FT_Face_InternalRec
type FT_Face_Internal = Ptr FT_Face_InternalRec



data FT_Size_InternalRec
type FT_Size_Internal = Ptr FT_Size_InternalRec



data FT_Slot_InternalRec
type FT_Slot_Internal = Ptr FT_Slot_InternalRec



data FT_Glyph_Metrics = FT_Glyph_Metrics
                          { width        :: FT_Pos
                          , height       :: FT_Pos
                          , horiBearingX :: FT_Pos
                          , horiBearingY :: FT_Pos
                          , horiAdvance  :: FT_Pos
                          , vertBearingX :: FT_Pos
                          , vertBearingY :: FT_Pos
                          , vertAdvance  :: FT_Pos
                          }

instance Offset "width"        FT_Glyph_Metrics where rawOffset = #{offset struct FT_Glyph_Metrics_, width       }
instance Offset "height"       FT_Glyph_Metrics where rawOffset = #{offset struct FT_Glyph_Metrics_, height      }
instance Offset "horiBearingX" FT_Glyph_Metrics where rawOffset = #{offset struct FT_Glyph_Metrics_, horiBearingX}
instance Offset "horiBearingY" FT_Glyph_Metrics where rawOffset = #{offset struct FT_Glyph_Metrics_, horiBearingY}
instance Offset "horiAdvance"  FT_Glyph_Metrics where rawOffset = #{offset struct FT_Glyph_Metrics_, horiAdvance }
instance Offset "vertBearingX" FT_Glyph_Metrics where rawOffset = #{offset struct FT_Glyph_Metrics_, vertBearingX}
instance Offset "vertBearingY" FT_Glyph_Metrics where rawOffset = #{offset struct FT_Glyph_Metrics_, vertBearingY}
instance Offset "vertAdvance"  FT_Glyph_Metrics where rawOffset = #{offset struct FT_Glyph_Metrics_, vertAdvance }

instance Storable FT_Glyph_Metrics where
  sizeOf _    = #size      struct FT_Glyph_Metrics_
  alignment _ = #alignment struct FT_Glyph_Metrics_

  peek ptr =
    FT_Glyph_Metrics
      <$> peek (offset @"width"        ptr)
      <*> peek (offset @"height"       ptr)
      <*> peek (offset @"horiBearingX" ptr)
      <*> peek (offset @"horiBearingY" ptr)
      <*> peek (offset @"horiAdvance"  ptr)
      <*> peek (offset @"vertBearingX" ptr)
      <*> peek (offset @"vertBearingY" ptr)
      <*> peek (offset @"vertAdvance"  ptr)

  poke ptr val = do
    pokeField @"width"        ptr val
    pokeField @"height"       ptr val
    pokeField @"horiBearingX" ptr val
    pokeField @"horiBearingY" ptr val
    pokeField @"horiAdvance"  ptr val
    pokeField @"vertBearingX" ptr val
    pokeField @"vertBearingY" ptr val
    pokeField @"vertAdvance"  ptr val



data FT_SubGlyphRec
type FT_SubGlyph = Ptr FT_SubGlyphRec



data FT_Size_Metrics = FT_Size_Metrics
                         { x_ppem      :: FT_UShort
                         , y_ppem      :: FT_UShort
                         , x_scale     :: FT_Fixed
                         , y_scale     :: FT_Fixed
                         , ascender    :: FT_Pos
                         , descender   :: FT_Pos
                         , height      :: FT_Pos
                         , max_advance :: FT_Pos
                         }

instance Offset "x_ppem"      FT_Size_Metrics where rawOffset = #{offset struct FT_Size_Metrics_, x_ppem     }
instance Offset "y_ppem"      FT_Size_Metrics where rawOffset = #{offset struct FT_Size_Metrics_, y_ppem     }
instance Offset "x_scale"     FT_Size_Metrics where rawOffset = #{offset struct FT_Size_Metrics_, x_scale    }
instance Offset "y_scale"     FT_Size_Metrics where rawOffset = #{offset struct FT_Size_Metrics_, y_scale    }
instance Offset "ascender"    FT_Size_Metrics where rawOffset = #{offset struct FT_Size_Metrics_, ascender   }
instance Offset "descender"   FT_Size_Metrics where rawOffset = #{offset struct FT_Size_Metrics_, descender  }
instance Offset "height"      FT_Size_Metrics where rawOffset = #{offset struct FT_Size_Metrics_, height     }
instance Offset "max_advance" FT_Size_Metrics where rawOffset = #{offset struct FT_Size_Metrics_, max_advance}

instance Storable FT_Size_Metrics where
  sizeOf _    = #size      struct FT_Size_Metrics_
  alignment _ = #alignment struct FT_Size_Metrics_

  peek ptr =
    FT_Size_Metrics
      <$> peek (offset @"x_ppem"      ptr)
      <*> peek (offset @"y_ppem"      ptr)
      <*> peek (offset @"x_scale"     ptr)
      <*> peek (offset @"y_scale"     ptr)
      <*> peek (offset @"ascender"    ptr)
      <*> peek (offset @"descender"   ptr)
      <*> peek (offset @"height"      ptr)
      <*> peek (offset @"max_advance" ptr)

  poke ptr val = do
    pokeField @"x_ppem"      ptr val
    pokeField @"y_ppem"      ptr val
    pokeField @"x_scale"     ptr val
    pokeField @"y_scale"     ptr val
    pokeField @"ascender"    ptr val
    pokeField @"descender"   ptr val
    pokeField @"height"      ptr val
    pokeField @"max_advance" ptr val



data FT_ModuleRec
type FT_Module = Ptr FT_ModuleRec



data FT_DriverRec
type FT_Driver = Ptr FT_DriverRec



type FT_Memory = Ptr FT_MemoryRec

data FT_MemoryRec = FT_MemoryRec
                      { user    :: Ptr ()
                      , alloc   :: FunPtr FT_Alloc_Func
                      , free    :: FunPtr FT_Free_Func
                      , realloc :: FunPtr FT_Realloc_Func
                      }

instance Offset "user"    FT_MemoryRec where rawOffset = #{offset struct FT_MemoryRec_, user   }
instance Offset "alloc"   FT_MemoryRec where rawOffset = #{offset struct FT_MemoryRec_, alloc  }
instance Offset "free"    FT_MemoryRec where rawOffset = #{offset struct FT_MemoryRec_, free   }
instance Offset "realloc" FT_MemoryRec where rawOffset = #{offset struct FT_MemoryRec_, realloc}

instance Storable FT_MemoryRec where
  sizeOf _    = #size      struct FT_MemoryRec_
  alignment _ = #alignment struct FT_MemoryRec_

  peek ptr =
    FT_MemoryRec
      <$> peek (offset @"user"    ptr)
      <*> peek (offset @"alloc"   ptr)
      <*> peek (offset @"free"    ptr)
      <*> peek (offset @"realloc" ptr)

  poke ptr val = do
    pokeField @"user"    ptr val
    pokeField @"alloc"   ptr val
    pokeField @"free"    ptr val
    pokeField @"realloc" ptr val



type FT_Alloc_Func = FT_Memory    -- ^ memory
                  -> #{type long} -- ^ size
                  -> IO (Ptr ())



type FT_Free_Func = FT_Memory -- ^ memory
                 -> Ptr ()    -- ^ block
                 -> IO ()



type FT_Realloc_Func = FT_Memory    -- ^ memory
                    -> #{type long} -- ^ cur_size
                    -> #{type long} -- ^ new_size
                    -> Ptr ()       -- ^ block
                    -> IO (Ptr ())



type FT_Stream = Ptr FT_StreamRec

data FT_StreamRec = FT_StreamRec
                      { base       :: Ptr #type unsigned char
                      , size       :: #type unsigned long
                      , pos        :: #type unsigned long
                      , descriptor :: FT_StreamDesc
                      , pathname   :: FT_StreamDesc
                      , read       :: Ptr FT_Stream_IoFunc
                      , close      :: Ptr FT_Stream_CloseFunc
                      , memory     :: FT_Memory
                      , cursor     :: Ptr #type unsigned char
                      , limit      :: Ptr #type unsigned char
                      }

instance Offset "base"       FT_StreamRec where rawOffset = #{offset struct FT_StreamRec_, base      }
instance Offset "size"       FT_StreamRec where rawOffset = #{offset struct FT_StreamRec_, size      }
instance Offset "pos"        FT_StreamRec where rawOffset = #{offset struct FT_StreamRec_, pos       }
instance Offset "descriptor" FT_StreamRec where rawOffset = #{offset struct FT_StreamRec_, descriptor}
instance Offset "pathname"   FT_StreamRec where rawOffset = #{offset struct FT_StreamRec_, pathname  }
instance Offset "read"       FT_StreamRec where rawOffset = #{offset struct FT_StreamRec_, read      }
instance Offset "close"      FT_StreamRec where rawOffset = #{offset struct FT_StreamRec_, close     }
instance Offset "memory"     FT_StreamRec where rawOffset = #{offset struct FT_StreamRec_, memory    }
instance Offset "cursor"     FT_StreamRec where rawOffset = #{offset struct FT_StreamRec_, cursor    }
instance Offset "limit"      FT_StreamRec where rawOffset = #{offset struct FT_StreamRec_, limit     }

instance Storable FT_StreamRec where
  sizeOf _    = #size struct FT_StreamRec_
  alignment _ = #alignment struct FT_StreamRec_

  peek ptr =
    FT_StreamRec
      <$> peek (offset @"base"       ptr)
      <*> peek (offset @"size"       ptr)
      <*> peek (offset @"pos"        ptr)
      <*> peek (offset @"descriptor" ptr)
      <*> peek (offset @"pathname"   ptr)
      <*> peek (offset @"read"       ptr)
      <*> peek (offset @"close"      ptr)
      <*> peek (offset @"memory"     ptr)
      <*> peek (offset @"cursor"     ptr)
      <*> peek (offset @"limit"      ptr)

  poke ptr val = do
    pokeField @"base"       ptr val
    pokeField @"size"       ptr val
    pokeField @"pos"        ptr val
    pokeField @"descriptor" ptr val
    pokeField @"pathname"   ptr val
    pokeField @"read"       ptr val
    pokeField @"close"      ptr val
    pokeField @"memory"     ptr val
    pokeField @"cursor"     ptr val
    pokeField @"limit"      ptr val



type FT_Stream_IoFunc = FT_Stream                 -- ^ stream
                     -> #{type unsigned long}     -- ^ offset
                     -> Ptr #{type unsigned char} -- ^ buffer
                     -> #{type unsigned long}     -- ^ count
                     -> #type unsigned long



type FT_Stream_CloseFunc = FT_Stream -- ^ stream
                        -> IO ()



data FT_StreamDesc

instance Offset "value"   FT_StreamDesc where rawOffset = #{offset union FT_StreamDesc_, value  }
instance Offset "pointer" FT_StreamDesc where rawOffset = #{offset union FT_StreamDesc_, pointer}

instance HasField "value" FT_StreamDesc #{type long} where
  getField = errorWithoutStackTrace "FT_StreamDesc.value.getField: union field"

instance HasField "pointer" FT_StreamDesc (Ptr ()) where
  getField = errorWithoutStackTrace "FT_StreamDesc.pointer.getField: union field"

instance Storable FT_StreamDesc where
  sizeOf _    = #size      union FT_StreamDesc_
  alignment _ = #alignment union FT_StreamDesc_

  peek _ = errorWithoutStackTrace "FT_StreamDesc.peek: union type"

  poke _ _ = return ()



data FT_Outline = FT_Outline
                    { n_contours :: #type short
                    , n_points   :: #type short
                    , points     :: Ptr FT_Vector
                    , tags       :: Ptr #type char
                    , contours   :: Ptr #type short
                    , flags      :: #type int
                    }

instance Offset "n_contours" FT_Outline where rawOffset = #{offset struct FT_Outline_, n_contours}
instance Offset "n_points"   FT_Outline where rawOffset = #{offset struct FT_Outline_, n_points  }
instance Offset "points"     FT_Outline where rawOffset = #{offset struct FT_Outline_, points    }
instance Offset "tags"       FT_Outline where rawOffset = #{offset struct FT_Outline_, tags      }
instance Offset "contours"   FT_Outline where rawOffset = #{offset struct FT_Outline_, contours  }
instance Offset "flags"      FT_Outline where rawOffset = #{offset struct FT_Outline_, flags     }

instance Storable FT_Outline where
  sizeOf _    = #size      struct FT_Outline_
  alignment _ = #alignment struct FT_Outline_

  peek ptr =
    FT_Outline
      <$> peek (offset @"n_contours" ptr)
      <*> peek (offset @"n_points"   ptr)
      <*> peek (offset @"points"     ptr)
      <*> peek (offset @"tags"       ptr)
      <*> peek (offset @"contours"   ptr)
      <*> peek (offset @"flags"      ptr)

  poke ptr val = do
    pokeField @"n_contours" ptr val
    pokeField @"n_points"   ptr val
    pokeField @"points"     ptr val
    pokeField @"tags"       ptr val
    pokeField @"contours"   ptr val
    pokeField @"flags"      ptr val



type FT_List = Ptr FT_ListRec

data FT_ListRec = FT_ListRec
                    { head :: FT_ListNode
                    , tail :: FT_ListNode
                    }

instance Offset "head" FT_ListRec where rawOffset = #{offset struct FT_ListRec_, head}
instance Offset "tail" FT_ListRec where rawOffset = #{offset struct FT_ListRec_, tail}

instance Storable FT_ListRec where
  sizeOf _    = #size      struct FT_ListRec_
  alignment _ = #alignment struct FT_ListRec_

  peek ptr =
    FT_ListRec
      <$> peek (offset @"head" ptr)
      <*> peek (offset @"tail" ptr)

  poke ptr val = do
    pokeField @"head" ptr val
    pokeField @"tail" ptr val



type FT_ListNode = Ptr FT_ListNodeRec

data FT_ListNodeRec = FT_ListNodeRec
                        { prev  :: FT_ListNode
                        , next  :: FT_ListNode
                        , data_ :: Ptr ()
                        }

instance Offset "prev"  FT_ListNodeRec where rawOffset = #{offset struct FT_ListNodeRec_, prev}
instance Offset "next"  FT_ListNodeRec where rawOffset = #{offset struct FT_ListNodeRec_, next}
instance Offset "data"  FT_ListNodeRec where rawOffset = #{offset struct FT_ListNodeRec_, data}

instance Offset "data_" FT_ListNodeRec where
  rawOffset = rawOffset @"data" @FT_ListNodeRec

instance HasField "data" FT_ListNodeRec (Ptr ()) where
  getField = getField @"data_" @FT_ListNodeRec

instance Storable FT_ListNodeRec where
  sizeOf _    = #size      struct FT_ListNodeRec_
  alignment _ = #alignment struct FT_ListNodeRec_

  peek ptr =
    FT_ListNodeRec
      <$> peek (offset @"prev" ptr)
      <*> peek (offset @"next" ptr)
      <*> peek (offset @"data" ptr)

  poke ptr val = do
    pokeField @"prev" ptr val
    pokeField @"next" ptr val
    pokeField @"data" ptr val
