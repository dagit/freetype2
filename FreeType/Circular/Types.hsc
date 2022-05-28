{-# LANGUAGE DataKinds
           , EmptyDataDecls
           , FlexibleInstances
           , ForeignFunctionInterface
           , MultiParamTypeClasses
           , PatternSynonyms
           , TypeApplications #-}

{-# OPTIONS_HADDOCK hide #-}

module FreeType.Circular.Types where

import          FreeType.Core.Types.Types

import          Data.Int
import          Data.Word
import          Foreign.Ptr
import          Foreign.Storable
import          Foreign.Storable.Offset

#include "ft2build.h"
#include FT_FREETYPE_H

type FT_Library = Ptr FT_LibraryRec

data FT_LibraryRec



type FT_Face = Ptr FT_FaceRec

data FT_FaceRec = FT_FaceRec
                    { frNum_faces           :: FT_Long
                    , frFace_index          :: FT_Long
                    , frFace_flags          :: FT_Long
                    , frStyle_flags         :: FT_Long
                    , frNum_glyphs          :: FT_Long
                    , frFamily_name         :: Ptr FT_String
                    , frStyle_name          :: Ptr FT_String
                    , frNum_fixed_sizes     :: FT_Int
                    , frAvailable_sizes     :: Ptr FT_Bitmap_Size
                    , frNum_charmaps        :: FT_Int
                    , frCharmaps            :: Ptr FT_CharMap
                    , frGeneric             :: FT_Generic
                    , frBbox                :: FT_BBox
                    , frUnits_per_EM        :: FT_UShort
                    , frAscender            :: FT_Short
                    , frDescender           :: FT_Short
                    , frHeight              :: FT_Short
                    , frMax_advance_width   :: FT_Short
                    , frMax_advance_height  :: FT_Short
                    , frUnderline_position  :: FT_Short
                    , frUnderline_thickness :: FT_Short
                    , frGlyph               :: FT_GlyphSlot
                    , frSize                :: FT_Size
                    , frCharmap             :: FT_CharMap
                    , frDriver              :: FT_Driver
                    , frMemory              :: FT_Memory
                    , frStream              :: FT_Stream
                    , frSizes_list          :: FT_ListRec
                    , frAutohint            :: FT_Generic
                    , frExtensions          :: Ptr ()
                    , frInternal            :: FT_Face_Internal
                    }

instance Offset "frNum_faces"           FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, num_faces          }
instance Offset "frFace_index"          FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, face_index         }
instance Offset "frFace_flags"          FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, face_flags         }
instance Offset "frStyle_flags"         FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, style_flags        }
instance Offset "frNum_glyphs"          FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, num_glyphs         }
instance Offset "frFamily_name"         FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, family_name        }
instance Offset "frStyle_name"          FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, style_name         }
instance Offset "frNum_fixed_sizes"     FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, num_fixed_sizes    }
instance Offset "frAvailable_sizes"     FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, available_sizes    }
instance Offset "frNum_charmaps"        FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, num_charmaps       }
instance Offset "frCharmaps"            FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, charmaps           }
instance Offset "frGeneric"             FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, generic            }
instance Offset "frBbox"                FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, bbox               }
instance Offset "frUnits_per_EM"        FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, units_per_EM       }
instance Offset "frAscender"            FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, ascender           }
instance Offset "frDescender"           FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, descender          }
instance Offset "frHeight"              FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, height             }
instance Offset "frMax_advance_width"   FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, max_advance_width  }
instance Offset "frMax_advance_height"  FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, max_advance_height }
instance Offset "frUnderline_position"  FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, underline_position }
instance Offset "frUnderline_thickness" FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, underline_thickness}
instance Offset "frGlyph"               FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, glyph              }
instance Offset "frSize"                FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, size               }
instance Offset "frCharmap"             FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, charmap            }
instance Offset "frDriver"              FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, driver             }
instance Offset "frMemory"              FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, memory             }
instance Offset "frStream"              FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, stream             }
instance Offset "frSizes_list"          FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, sizes_list         }
instance Offset "frAutohint"            FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, autohint           }
instance Offset "frExtensions"          FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, extensions         }
instance Offset "frInternal"            FT_FaceRec where rawOffset = #{offset struct FT_FaceRec_, internal           }

instance Storable FT_FaceRec where
  sizeOf _    = #size      struct FT_FaceRec_
  alignment _ = #alignment struct FT_FaceRec_

  peek ptr =
    FT_FaceRec
      <$> peek (offset @"frNum_faces"           ptr)
      <*> peek (offset @"frFace_index"          ptr)
      <*> peek (offset @"frFace_flags"          ptr)
      <*> peek (offset @"frStyle_flags"         ptr)
      <*> peek (offset @"frNum_glyphs"          ptr)
      <*> peek (offset @"frFamily_name"         ptr)
      <*> peek (offset @"frStyle_name"          ptr)
      <*> peek (offset @"frNum_fixed_sizes"     ptr)
      <*> peek (offset @"frAvailable_sizes"     ptr)
      <*> peek (offset @"frNum_charmaps"        ptr)
      <*> peek (offset @"frCharmaps"            ptr)
      <*> peek (offset @"frGeneric"             ptr)
      <*> peek (offset @"frBbox"                ptr)
      <*> peek (offset @"frUnits_per_EM"        ptr)
      <*> peek (offset @"frAscender"            ptr)
      <*> peek (offset @"frDescender"           ptr)
      <*> peek (offset @"frHeight"              ptr)
      <*> peek (offset @"frMax_advance_width"   ptr)
      <*> peek (offset @"frMax_advance_height"  ptr)
      <*> peek (offset @"frUnderline_position"  ptr)
      <*> peek (offset @"frUnderline_thickness" ptr)
      <*> peek (offset @"frGlyph"               ptr)
      <*> peek (offset @"frSize"                ptr)
      <*> peek (offset @"frCharmap"             ptr)
      <*> peek (offset @"frDriver"              ptr)
      <*> peek (offset @"frMemory"              ptr)
      <*> peek (offset @"frStream"              ptr)
      <*> peek (offset @"frSizes_list"          ptr)
      <*> peek (offset @"frAutohint"            ptr)
      <*> peek (offset @"frExtensions"          ptr)
      <*> peek (offset @"frInternal"            ptr)

  poke ptr val = do
    pokeField @"frNum_faces"           ptr val
    pokeField @"frFace_index"          ptr val
    pokeField @"frFace_flags"          ptr val
    pokeField @"frStyle_flags"         ptr val
    pokeField @"frNum_glyphs"          ptr val
    pokeField @"frFamily_name"         ptr val
    pokeField @"frStyle_name"          ptr val
    pokeField @"frNum_fixed_sizes"     ptr val
    pokeField @"frAvailable_sizes"     ptr val
    pokeField @"frNum_charmaps"        ptr val
    pokeField @"frCharmaps"            ptr val
    pokeField @"frGeneric"             ptr val
    pokeField @"frBbox"                ptr val
    pokeField @"frUnits_per_EM"        ptr val
    pokeField @"frAscender"            ptr val
    pokeField @"frDescender"           ptr val
    pokeField @"frHeight"              ptr val
    pokeField @"frMax_advance_width"   ptr val
    pokeField @"frMax_advance_height"  ptr val
    pokeField @"frUnderline_position"  ptr val
    pokeField @"frUnderline_thickness" ptr val
    pokeField @"frGlyph"               ptr val
    pokeField @"frSize"                ptr val
    pokeField @"frCharmap"             ptr val
    pokeField @"frDriver"              ptr val
    pokeField @"frMemory"              ptr val
    pokeField @"frStream"              ptr val
    pokeField @"frSizes_list"          ptr val
    pokeField @"frAutohint"            ptr val
    pokeField @"frExtensions"          ptr val
    pokeField @"frInternal"            ptr val



data FT_Bitmap_Size = FT_Bitmap_Size
                        { bsHeight :: FT_Short
                        , bsWidth  :: FT_Short
                        , bsSize   :: FT_Pos
                        , bsX_ppem :: FT_Pos
                        , bsY_ppem :: FT_Pos
                        }

instance Offset "bsHeight" FT_Bitmap_Size where rawOffset = #{offset struct FT_Bitmap_Size_, height}
instance Offset "bsWidth"  FT_Bitmap_Size where rawOffset = #{offset struct FT_Bitmap_Size_, width }
instance Offset "bsSize"   FT_Bitmap_Size where rawOffset = #{offset struct FT_Bitmap_Size_, size  }
instance Offset "bsX_ppem" FT_Bitmap_Size where rawOffset = #{offset struct FT_Bitmap_Size_, x_ppem}
instance Offset "bsY_ppem" FT_Bitmap_Size where rawOffset = #{offset struct FT_Bitmap_Size_, y_ppem}

instance Storable FT_Bitmap_Size where
  sizeOf _    = #size      struct FT_Bitmap_Size_
  alignment _ = #alignment struct FT_Bitmap_Size_

  peek ptr =
    FT_Bitmap_Size
      <$> peek (offset @"bsHeight" ptr)
      <*> peek (offset @"bsWidth"  ptr)
      <*> peek (offset @"bsSize"   ptr)
      <*> peek (offset @"bsX_ppem" ptr)
      <*> peek (offset @"bsY_ppem" ptr)

  poke ptr val = do
    pokeField @"bsHeight" ptr val
    pokeField @"bsWidth"  ptr val
    pokeField @"bsSize"   ptr val
    pokeField @"bsX_ppem" ptr val
    pokeField @"bsY_ppem" ptr val



type FT_CharMap = Ptr FT_CharMapRec

data FT_CharMapRec = FT_CharMapRec
                       { cmrFace        :: FT_Face
                       , cmrEncoding    :: FT_Encoding
                       , cmrPlatform_id :: FT_UShort
                       , cmrEncoding_id :: FT_UShort
                       }

instance Offset "cmrFace"        FT_CharMapRec where rawOffset = #{offset struct FT_CharMapRec_, face       }
instance Offset "cmrEncoding"    FT_CharMapRec where rawOffset = #{offset struct FT_CharMapRec_, encoding   }
instance Offset "cmrPlatform_id" FT_CharMapRec where rawOffset = #{offset struct FT_CharMapRec_, platform_id}
instance Offset "cmrEncoding_id" FT_CharMapRec where rawOffset = #{offset struct FT_CharMapRec_, encoding_id}

instance Storable FT_CharMapRec where
  sizeOf _    = #size      struct FT_CharMapRec_
  alignment _ = #alignment struct FT_CharMapRec_

  peek ptr =
    FT_CharMapRec
      <$> peek (offset @"cmrFace"        ptr)
      <*> peek (offset @"cmrEncoding"    ptr)
      <*> peek (offset @"cmrPlatform_id" ptr)
      <*> peek (offset @"cmrEncoding_id" ptr)

  poke ptr val = do
    pokeField @"cmrFace"        ptr val
    pokeField @"cmrEncoding"    ptr val
    pokeField @"cmrPlatform_id" ptr val
    pokeField @"cmrEncoding_id" ptr val



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
                         { gsrLibrary           :: FT_Library
                         , gsrFace              :: FT_Face
                         , gsrNext              :: FT_GlyphSlot
                         , gsrGlyph_index       :: FT_UInt
                         , gsrGeneric           :: FT_Generic
                         , gsrMetrics           :: FT_Glyph_Metrics
                         , gsrLinearHoriAdvance :: FT_Fixed
                         , gsrLinearVertAdvance :: FT_Fixed
                         , gsrAdvance           :: FT_Vector
                         , gsrFormat            :: FT_Glyph_Format
                         , gsrBitmap            :: FT_Bitmap
                         , gsrBitmap_left       :: FT_Int
                         , gsrBitmap_top        :: FT_Int
                         , gsrOutline           :: FT_Outline
                         , gsrNum_subglyphs     :: FT_UInt
                         , gsrSubglyphs         :: FT_SubGlyph
                         , gsrControl_data      :: Ptr ()
                         , gsrControl_len       :: #type long
                         , gsrLsb_delta         :: FT_Pos
                         , gsrRsb_delta         :: FT_Pos
                         , gsrOther             :: Ptr ()
                         , gsrInternal          :: FT_Slot_Internal
                         }

instance Offset "gsrLibrary"           FT_GlyphSlotRec where rawOffset = #{offset struct FT_GlyphSlotRec_, library          }
instance Offset "gsrFace"              FT_GlyphSlotRec where rawOffset = #{offset struct FT_GlyphSlotRec_, face             }
instance Offset "gsrNext"              FT_GlyphSlotRec where rawOffset = #{offset struct FT_GlyphSlotRec_, next             }
instance Offset "gsrGlyph_index"       FT_GlyphSlotRec where rawOffset = #{offset struct FT_GlyphSlotRec_, glyph_index      }
instance Offset "gsrGeneric"           FT_GlyphSlotRec where rawOffset = #{offset struct FT_GlyphSlotRec_, generic          }
instance Offset "gsrMetrics"           FT_GlyphSlotRec where rawOffset = #{offset struct FT_GlyphSlotRec_, metrics          }
instance Offset "gsrLinearHoriAdvance" FT_GlyphSlotRec where rawOffset = #{offset struct FT_GlyphSlotRec_, linearHoriAdvance}
instance Offset "gsrLinearVertAdvance" FT_GlyphSlotRec where rawOffset = #{offset struct FT_GlyphSlotRec_, linearVertAdvance}
instance Offset "gsrAdvance"           FT_GlyphSlotRec where rawOffset = #{offset struct FT_GlyphSlotRec_, advance          }
instance Offset "gsrFormat"            FT_GlyphSlotRec where rawOffset = #{offset struct FT_GlyphSlotRec_, format           }
instance Offset "gsrBitmap"            FT_GlyphSlotRec where rawOffset = #{offset struct FT_GlyphSlotRec_, bitmap           }
instance Offset "gsrBitmap_left"       FT_GlyphSlotRec where rawOffset = #{offset struct FT_GlyphSlotRec_, bitmap_left      }
instance Offset "gsrBitmap_top"        FT_GlyphSlotRec where rawOffset = #{offset struct FT_GlyphSlotRec_, bitmap_top       }
instance Offset "gsrOutline"           FT_GlyphSlotRec where rawOffset = #{offset struct FT_GlyphSlotRec_, outline          }
instance Offset "gsrNum_subglyphs"     FT_GlyphSlotRec where rawOffset = #{offset struct FT_GlyphSlotRec_, num_subglyphs    }
instance Offset "gsrSubglyphs"         FT_GlyphSlotRec where rawOffset = #{offset struct FT_GlyphSlotRec_, subglyphs        }
instance Offset "gsrControl_data"      FT_GlyphSlotRec where rawOffset = #{offset struct FT_GlyphSlotRec_, control_data     }
instance Offset "gsrControl_len"       FT_GlyphSlotRec where rawOffset = #{offset struct FT_GlyphSlotRec_, control_len      }
instance Offset "gsrLsb_delta"         FT_GlyphSlotRec where rawOffset = #{offset struct FT_GlyphSlotRec_, lsb_delta        }
instance Offset "gsrRsb_delta"         FT_GlyphSlotRec where rawOffset = #{offset struct FT_GlyphSlotRec_, rsb_delta        }
instance Offset "gsrOther"             FT_GlyphSlotRec where rawOffset = #{offset struct FT_GlyphSlotRec_, other            }
instance Offset "gsrInternal"          FT_GlyphSlotRec where rawOffset = #{offset struct FT_GlyphSlotRec_, internal         }

instance Storable FT_GlyphSlotRec where
  sizeOf _    = #size      struct FT_GlyphSlotRec_
  alignment _ = #alignment struct FT_GlyphSlotRec_

  peek ptr =
    FT_GlyphSlotRec
      <$> peek (offset @"gsrLibrary"           ptr)
      <*> peek (offset @"gsrFace"              ptr)
      <*> peek (offset @"gsrNext"              ptr)
      <*> peek (offset @"gsrGlyph_index"       ptr)
      <*> peek (offset @"gsrGeneric"           ptr)
      <*> peek (offset @"gsrMetrics"           ptr)
      <*> peek (offset @"gsrLinearHoriAdvance" ptr)
      <*> peek (offset @"gsrLinearVertAdvance" ptr)
      <*> peek (offset @"gsrAdvance"           ptr)
      <*> peek (offset @"gsrFormat"            ptr)
      <*> peek (offset @"gsrBitmap"            ptr)
      <*> peek (offset @"gsrBitmap_left"       ptr)
      <*> peek (offset @"gsrBitmap_top"        ptr)
      <*> peek (offset @"gsrOutline"           ptr)
      <*> peek (offset @"gsrNum_subglyphs"     ptr)
      <*> peek (offset @"gsrSubglyphs"         ptr)
      <*> peek (offset @"gsrControl_data"      ptr)
      <*> peek (offset @"gsrControl_len"       ptr)
      <*> peek (offset @"gsrLsb_delta"         ptr)
      <*> peek (offset @"gsrRsb_delta"         ptr)
      <*> peek (offset @"gsrOther"             ptr)
      <*> peek (offset @"gsrInternal"          ptr)

  poke ptr val = do
    pokeField @"gsrLibrary"           ptr val
    pokeField @"gsrFace"              ptr val
    pokeField @"gsrNext"              ptr val
    pokeField @"gsrGlyph_index"       ptr val
    pokeField @"gsrGeneric"           ptr val
    pokeField @"gsrMetrics"           ptr val
    pokeField @"gsrLinearHoriAdvance" ptr val
    pokeField @"gsrLinearVertAdvance" ptr val
    pokeField @"gsrAdvance"           ptr val
    pokeField @"gsrFormat"            ptr val
    pokeField @"gsrBitmap"            ptr val
    pokeField @"gsrBitmap_left"       ptr val
    pokeField @"gsrBitmap_top"        ptr val
    pokeField @"gsrOutline"           ptr val
    pokeField @"gsrNum_subglyphs"     ptr val
    pokeField @"gsrSubglyphs"         ptr val
    pokeField @"gsrControl_data"      ptr val
    pokeField @"gsrControl_len"       ptr val
    pokeField @"gsrLsb_delta"         ptr val
    pokeField @"gsrRsb_delta"         ptr val
    pokeField @"gsrOther"             ptr val
    pokeField @"gsrInternal"          ptr val



type FT_Size = Ptr FT_SizeRec

data FT_SizeRec = FT_SizeRec
                    { srFace     :: FT_Face
                    , srGeneric  :: FT_Generic
                    , srMetrics  :: FT_Size_Metrics
                    , srInternal :: FT_Size_Internal
                    }

instance Offset "srFace"     FT_SizeRec where rawOffset = #{offset struct FT_SizeRec_, face    }
instance Offset "srGeneric"  FT_SizeRec where rawOffset = #{offset struct FT_SizeRec_, generic }
instance Offset "srMetrics"  FT_SizeRec where rawOffset = #{offset struct FT_SizeRec_, metrics }
instance Offset "srInternal" FT_SizeRec where rawOffset = #{offset struct FT_SizeRec_, internal}

instance Storable FT_SizeRec where
  sizeOf _    = #size      struct FT_SizeRec_
  alignment _ = #alignment struct FT_SizeRec_

  peek ptr =
    FT_SizeRec
      <$> peek (offset @"srFace"     ptr)
      <*> peek (offset @"srGeneric"  ptr)
      <*> peek (offset @"srMetrics"  ptr)
      <*> peek (offset @"srInternal" ptr)

  poke ptr val = do
    pokeField @"srFace"     ptr val
    pokeField @"srGeneric"  ptr val
    pokeField @"srMetrics"  ptr val
    pokeField @"srInternal" ptr val



data FT_Face_InternalRec
type FT_Face_Internal = Ptr FT_Face_InternalRec



data FT_Size_InternalRec
type FT_Size_Internal = Ptr FT_Size_InternalRec



data FT_Slot_InternalRec
type FT_Slot_Internal = Ptr FT_Slot_InternalRec



data FT_Glyph_Metrics = FT_Glyph_Metrics
                          { gmWidth        :: FT_Pos
                          , gmHeight       :: FT_Pos
                          , gmHoriBearingX :: FT_Pos
                          , gmHoriBearingY :: FT_Pos
                          , gmHoriAdvance  :: FT_Pos
                          , gmVertBearingX :: FT_Pos
                          , gmVertBearingY :: FT_Pos
                          , gmVertAdvance  :: FT_Pos
                          }

instance Offset "gmWidth"        FT_Glyph_Metrics where rawOffset = #{offset struct FT_Glyph_Metrics_, width       }
instance Offset "gmHeight"       FT_Glyph_Metrics where rawOffset = #{offset struct FT_Glyph_Metrics_, height      }
instance Offset "gmHoriBearingX" FT_Glyph_Metrics where rawOffset = #{offset struct FT_Glyph_Metrics_, horiBearingX}
instance Offset "gmHoriBearingY" FT_Glyph_Metrics where rawOffset = #{offset struct FT_Glyph_Metrics_, horiBearingY}
instance Offset "gmHoriAdvance"  FT_Glyph_Metrics where rawOffset = #{offset struct FT_Glyph_Metrics_, horiAdvance }
instance Offset "gmVertBearingX" FT_Glyph_Metrics where rawOffset = #{offset struct FT_Glyph_Metrics_, vertBearingX}
instance Offset "gmVertBearingY" FT_Glyph_Metrics where rawOffset = #{offset struct FT_Glyph_Metrics_, vertBearingY}
instance Offset "gmVertAdvance"  FT_Glyph_Metrics where rawOffset = #{offset struct FT_Glyph_Metrics_, vertAdvance }

instance Storable FT_Glyph_Metrics where
  sizeOf _    = #size      struct FT_Glyph_Metrics_
  alignment _ = #alignment struct FT_Glyph_Metrics_

  peek ptr =
    FT_Glyph_Metrics
      <$> peek (offset @"gmWidth"        ptr)
      <*> peek (offset @"gmHeight"       ptr)
      <*> peek (offset @"gmHoriBearingX" ptr)
      <*> peek (offset @"gmHoriBearingY" ptr)
      <*> peek (offset @"gmHoriAdvance"  ptr)
      <*> peek (offset @"gmVertBearingX" ptr)
      <*> peek (offset @"gmVertBearingY" ptr)
      <*> peek (offset @"gmVertAdvance"  ptr)

  poke ptr val = do
    pokeField @"gmWidth"        ptr val
    pokeField @"gmHeight"       ptr val
    pokeField @"gmHoriBearingX" ptr val
    pokeField @"gmHoriBearingY" ptr val
    pokeField @"gmHoriAdvance"  ptr val
    pokeField @"gmVertBearingX" ptr val
    pokeField @"gmVertBearingY" ptr val
    pokeField @"gmVertAdvance"  ptr val



data FT_SubGlyphRec
type FT_SubGlyph = Ptr FT_SubGlyphRec



data FT_Size_Metrics = FT_Size_Metrics
                         { smX_ppem      :: FT_UShort
                         , smY_ppem      :: FT_UShort
                         , smX_scale     :: FT_Fixed
                         , smY_scale     :: FT_Fixed
                         , smAscender    :: FT_Pos
                         , smDescender   :: FT_Pos
                         , smHeight      :: FT_Pos
                         , smMax_advance :: FT_Pos
                         }

instance Offset "smX_ppem"      FT_Size_Metrics where rawOffset = #{offset struct FT_Size_Metrics_, x_ppem     }
instance Offset "smY_ppem"      FT_Size_Metrics where rawOffset = #{offset struct FT_Size_Metrics_, y_ppem     }
instance Offset "smX_scale"     FT_Size_Metrics where rawOffset = #{offset struct FT_Size_Metrics_, x_scale    }
instance Offset "smY_scale"     FT_Size_Metrics where rawOffset = #{offset struct FT_Size_Metrics_, y_scale    }
instance Offset "smAscender"    FT_Size_Metrics where rawOffset = #{offset struct FT_Size_Metrics_, ascender   }
instance Offset "smDescender"   FT_Size_Metrics where rawOffset = #{offset struct FT_Size_Metrics_, descender  }
instance Offset "smHeight"      FT_Size_Metrics where rawOffset = #{offset struct FT_Size_Metrics_, height     }
instance Offset "smMax_advance" FT_Size_Metrics where rawOffset = #{offset struct FT_Size_Metrics_, max_advance}

instance Storable FT_Size_Metrics where
  sizeOf _    = #size      struct FT_Size_Metrics_
  alignment _ = #alignment struct FT_Size_Metrics_

  peek ptr =
    FT_Size_Metrics
      <$> peek (offset @"smX_ppem"      ptr)
      <*> peek (offset @"smY_ppem"      ptr)
      <*> peek (offset @"smX_scale"     ptr)
      <*> peek (offset @"smY_scale"     ptr)
      <*> peek (offset @"smAscender"    ptr)
      <*> peek (offset @"smDescender"   ptr)
      <*> peek (offset @"smHeight"      ptr)
      <*> peek (offset @"smMax_advance" ptr)

  poke ptr val = do
    pokeField @"smX_ppem"      ptr val
    pokeField @"smY_ppem"      ptr val
    pokeField @"smX_scale"     ptr val
    pokeField @"smY_scale"     ptr val
    pokeField @"smAscender"    ptr val
    pokeField @"smDescender"   ptr val
    pokeField @"smHeight"      ptr val
    pokeField @"smMax_advance" ptr val



data FT_ModuleRec
type FT_Module = Ptr FT_ModuleRec



data FT_DriverRec
type FT_Driver = Ptr FT_DriverRec



type FT_Memory = Ptr FT_MemoryRec

data FT_MemoryRec = FT_MemoryRec
                      { mrUser    :: Ptr ()
                      , mrAlloc   :: FunPtr FT_Alloc_Func
                      , mrFree    :: FunPtr FT_Free_Func
                      , mrRealloc :: FunPtr FT_Realloc_Func
                      }

instance Offset "mrUser"    FT_MemoryRec where rawOffset = #{offset struct FT_MemoryRec_, user   }
instance Offset "mrAlloc"   FT_MemoryRec where rawOffset = #{offset struct FT_MemoryRec_, alloc  }
instance Offset "mrFree"    FT_MemoryRec where rawOffset = #{offset struct FT_MemoryRec_, free   }
instance Offset "mrRealloc" FT_MemoryRec where rawOffset = #{offset struct FT_MemoryRec_, realloc}

instance Storable FT_MemoryRec where
  sizeOf _    = #size      struct FT_MemoryRec_
  alignment _ = #alignment struct FT_MemoryRec_

  peek ptr =
    FT_MemoryRec
      <$> peek (offset @"mrUser"    ptr)
      <*> peek (offset @"mrAlloc"   ptr)
      <*> peek (offset @"mrFree"    ptr)
      <*> peek (offset @"mrRealloc" ptr)

  poke ptr val = do
    pokeField @"mrUser"    ptr val
    pokeField @"mrAlloc"   ptr val
    pokeField @"mrFree"    ptr val
    pokeField @"mrRealloc" ptr val



type FT_Alloc_Func = FT_Memory    -- ^ memory
                  -> #{type long} -- ^ size
                  -> IO (Ptr ())

foreign import ccall "wrapper"
  ft_Alloc_Func :: FT_Alloc_Func -> IO (FunPtr FT_Alloc_Func)

foreign import ccall "dynamic"
  ft_Alloc_Func' :: FunPtr FT_Alloc_Func -> FT_Alloc_Func



type FT_Free_Func = FT_Memory -- ^ memory
                 -> Ptr ()    -- ^ block
                 -> IO ()

foreign import ccall "wrapper"    
  ft_Free_Func :: FT_Free_Func -> IO (FunPtr FT_Free_Func)    
    
foreign import ccall "dynamic"                                  
  ft_Free_Func' :: FunPtr FT_Free_Func -> FT_Free_Func



type FT_Realloc_Func = FT_Memory    -- ^ memory
                    -> #{type long} -- ^ cur_size
                    -> #{type long} -- ^ new_size
                    -> Ptr ()       -- ^ block
                    -> IO (Ptr ())

foreign import ccall "wrapper"    
  ft_Realloc_Func :: FT_Realloc_Func -> IO (FunPtr FT_Realloc_Func)    
    
foreign import ccall "dynamic"                                  
  ft_Realloc_Func' :: FunPtr FT_Realloc_Func -> FT_Realloc_Func



type FT_Stream = Ptr FT_StreamRec

data FT_StreamRec = FT_StreamRec
                      { srBase       :: Ptr #type unsigned char
                      , srSize       :: #type unsigned long
                      , srPos        :: #type unsigned long
                      , srDescriptor :: FT_StreamDesc
                      , srPathname   :: FT_StreamDesc
                      , srRead       :: Ptr FT_Stream_IoFunc
                      , srClose      :: Ptr FT_Stream_CloseFunc
                      , srMemory     :: FT_Memory
                      , srCursor     :: Ptr #type unsigned char
                      , srLimit      :: Ptr #type unsigned char
                      }

instance Offset "srBase"       FT_StreamRec where rawOffset = #{offset struct FT_StreamRec_, base      }
instance Offset "srSize"       FT_StreamRec where rawOffset = #{offset struct FT_StreamRec_, size      }
instance Offset "srPos"        FT_StreamRec where rawOffset = #{offset struct FT_StreamRec_, pos       }
instance Offset "srDescriptor" FT_StreamRec where rawOffset = #{offset struct FT_StreamRec_, descriptor}
instance Offset "srPathname"   FT_StreamRec where rawOffset = #{offset struct FT_StreamRec_, pathname  }
instance Offset "srRead"       FT_StreamRec where rawOffset = #{offset struct FT_StreamRec_, read      }
instance Offset "srClose"      FT_StreamRec where rawOffset = #{offset struct FT_StreamRec_, close     }
instance Offset "srMemory"     FT_StreamRec where rawOffset = #{offset struct FT_StreamRec_, memory    }
instance Offset "srCursor"     FT_StreamRec where rawOffset = #{offset struct FT_StreamRec_, cursor    }
instance Offset "srLimit"      FT_StreamRec where rawOffset = #{offset struct FT_StreamRec_, limit     }

instance Storable FT_StreamRec where
  sizeOf _    = #size struct FT_StreamRec_
  alignment _ = #alignment struct FT_StreamRec_

  peek ptr =
    FT_StreamRec
      <$> peek (offset @"srBase"       ptr)
      <*> peek (offset @"srSize"       ptr)
      <*> peek (offset @"srPos"        ptr)
      <*> peek (offset @"srDescriptor" ptr)
      <*> peek (offset @"srPathname"   ptr)
      <*> peek (offset @"srRead"       ptr)
      <*> peek (offset @"srClose"      ptr)
      <*> peek (offset @"srMemory"     ptr)
      <*> peek (offset @"srCursor"     ptr)
      <*> peek (offset @"srLimit"      ptr)

  poke ptr val = do
    pokeField @"srBase"       ptr val
    pokeField @"srSize"       ptr val
    pokeField @"srPos"        ptr val
    pokeField @"srDescriptor" ptr val
    pokeField @"srPathname"   ptr val
    pokeField @"srRead"       ptr val
    pokeField @"srClose"      ptr val
    pokeField @"srMemory"     ptr val
    pokeField @"srCursor"     ptr val
    pokeField @"srLimit"      ptr val



type FT_Stream_IoFunc = FT_Stream                 -- ^ stream
                     -> #{type unsigned long}     -- ^ offset
                     -> Ptr #{type unsigned char} -- ^ buffer
                     -> #{type unsigned long}     -- ^ count
                     -> #type unsigned long

foreign import ccall "wrapper"
  ft_Stream_IoFunc :: FT_Stream_IoFunc -> IO (FunPtr FT_Stream_IoFunc)    
    
foreign import ccall "dynamic"                                  
  ft_Stream_IoFunc' :: FunPtr FT_Stream_IoFunc -> FT_Stream_IoFunc



type FT_Stream_CloseFunc = FT_Stream -- ^ stream
                        -> IO ()

foreign import ccall "wrapper"
  ft_Stream_CloseFunc :: FT_Stream_CloseFunc -> IO (FunPtr FT_Stream_CloseFunc)    
    
foreign import ccall "dynamic"                                  
  ft_Stream_CloseFunc' :: FunPtr FT_Stream_CloseFunc -> FT_Stream_CloseFunc



data FT_StreamDesc = FT_StreamDesc
                       { sdValue   :: #type long
                       , sdPointer :: Ptr ()
                       }

instance Offset "sdValue"   FT_StreamDesc where rawOffset = #{offset union FT_StreamDesc_, value  }
instance Offset "sdPointer" FT_StreamDesc where rawOffset = #{offset union FT_StreamDesc_, pointer}

instance Storable FT_StreamDesc where
  sizeOf _    = #size      union FT_StreamDesc_
  alignment _ = #alignment union FT_StreamDesc_

  peek ptr =
    FT_StreamDesc
      <$> peek (offset @"sdValue"   ptr)
      <*> peek (offset @"sdPointer" ptr)

  poke ptr val = do
    pokeField @"sdValue"   ptr val
    pokeField @"sdPointer" ptr val



data FT_Outline = FT_Outline
                    { oN_contours :: #type short
                    , oN_points   :: #type short
                    , oPoints     :: Ptr FT_Vector
                    , oTags       :: Ptr #type char
                    , oContours   :: Ptr #type short
                    , oFlags      :: #type int
                    }

instance Offset "oN_contours" FT_Outline where rawOffset = #{offset struct FT_Outline_, n_contours}
instance Offset "oN_points"   FT_Outline where rawOffset = #{offset struct FT_Outline_, n_points  }
instance Offset "oPoints"     FT_Outline where rawOffset = #{offset struct FT_Outline_, points    }
instance Offset "oTags"       FT_Outline where rawOffset = #{offset struct FT_Outline_, tags      }
instance Offset "oContours"   FT_Outline where rawOffset = #{offset struct FT_Outline_, contours  }
instance Offset "oFlags"      FT_Outline where rawOffset = #{offset struct FT_Outline_, flags     }

instance Storable FT_Outline where
  sizeOf _    = #size      struct FT_Outline_
  alignment _ = #alignment struct FT_Outline_

  peek ptr =
    FT_Outline
      <$> peek (offset @"oN_contours" ptr)
      <*> peek (offset @"oN_points"   ptr)
      <*> peek (offset @"oPoints"     ptr)
      <*> peek (offset @"oTags"       ptr)
      <*> peek (offset @"oContours"   ptr)
      <*> peek (offset @"oFlags"      ptr)

  poke ptr val = do
    pokeField @"oN_contours" ptr val
    pokeField @"oN_points"   ptr val
    pokeField @"oPoints"     ptr val
    pokeField @"oTags"       ptr val
    pokeField @"oContours"   ptr val
    pokeField @"oFlags"      ptr val



type FT_List = Ptr FT_ListRec

data FT_ListRec = FT_ListRec
                    { lrHead :: FT_ListNode
                    , lrTail :: FT_ListNode
                    }

instance Offset "lrHead" FT_ListRec where rawOffset = #{offset struct FT_ListRec_, head}
instance Offset "lrTail" FT_ListRec where rawOffset = #{offset struct FT_ListRec_, tail}

instance Storable FT_ListRec where
  sizeOf _    = #size      struct FT_ListRec_
  alignment _ = #alignment struct FT_ListRec_

  peek ptr =
    FT_ListRec
      <$> peek (offset @"lrHead" ptr)
      <*> peek (offset @"lrTail" ptr)

  poke ptr val = do
    pokeField @"lrHead" ptr val
    pokeField @"lrTail" ptr val



type FT_ListNode = Ptr FT_ListNodeRec

data FT_ListNodeRec = FT_ListNodeRec
                        { lnrPrev :: FT_ListNode
                        , lnrNext :: FT_ListNode
                        , lnrData :: Ptr ()
                        }

instance Offset "lnrPrev" FT_ListNodeRec where rawOffset = #{offset struct FT_ListNodeRec_, prev}
instance Offset "lnrNext" FT_ListNodeRec where rawOffset = #{offset struct FT_ListNodeRec_, next}
instance Offset "lnrData" FT_ListNodeRec where rawOffset = #{offset struct FT_ListNodeRec_, data}

instance Storable FT_ListNodeRec where
  sizeOf _    = #size      struct FT_ListNodeRec_
  alignment _ = #alignment struct FT_ListNodeRec_

  peek ptr =
    FT_ListNodeRec
      <$> peek (offset @"lnrPrev" ptr)
      <*> peek (offset @"lnrNext" ptr)
      <*> peek (offset @"lnrData" ptr)

  poke ptr val = do
    pokeField @"lnrPrev" ptr val
    pokeField @"lnrNext" ptr val
    pokeField @"lnrData" ptr val
