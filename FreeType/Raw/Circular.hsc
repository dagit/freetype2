{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE PatternSynonyms #-}
{-# OPTIONS_HADDOCK hide #-}

module FreeType.Raw.Circular where

import          FreeType.Raw.Core.Types

import          Foreign.C.Types
import          Foreign.Ptr
import          Foreign.Storable

#include "ft2build.h"
#include FT_FREETYPE_H

data FT_LibraryRec
type FT_Library = Ptr FT_LibraryRec



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

instance Storable FT_FaceRec where
  sizeOf _    = #size      struct FT_FaceRec_
  alignment _ = #alignment struct FT_FaceRec_

  peek ptr =
    FT_FaceRec
      <$> #{peek struct FT_FaceRec_, num_faces          } ptr
      <*> #{peek struct FT_FaceRec_, face_index         } ptr
      <*> #{peek struct FT_FaceRec_, face_flags         } ptr
      <*> #{peek struct FT_FaceRec_, style_flags        } ptr
      <*> #{peek struct FT_FaceRec_, num_glyphs         } ptr
      <*> #{peek struct FT_FaceRec_, family_name        } ptr
      <*> #{peek struct FT_FaceRec_, style_name         } ptr
      <*> #{peek struct FT_FaceRec_, num_fixed_sizes    } ptr
      <*> #{peek struct FT_FaceRec_, available_sizes    } ptr
      <*> #{peek struct FT_FaceRec_, num_charmaps       } ptr
      <*> #{peek struct FT_FaceRec_, charmaps           } ptr
      <*> #{peek struct FT_FaceRec_, generic            } ptr
      <*> #{peek struct FT_FaceRec_, bbox               } ptr
      <*> #{peek struct FT_FaceRec_, units_per_EM       } ptr
      <*> #{peek struct FT_FaceRec_, ascender           } ptr
      <*> #{peek struct FT_FaceRec_, descender          } ptr
      <*> #{peek struct FT_FaceRec_, height             } ptr
      <*> #{peek struct FT_FaceRec_, max_advance_width  } ptr
      <*> #{peek struct FT_FaceRec_, max_advance_height } ptr
      <*> #{peek struct FT_FaceRec_, underline_position } ptr
      <*> #{peek struct FT_FaceRec_, underline_thickness} ptr
      <*> #{peek struct FT_FaceRec_, glyph              } ptr
      <*> #{peek struct FT_FaceRec_, size               } ptr
      <*> #{peek struct FT_FaceRec_, charmap            } ptr
      <*> #{peek struct FT_FaceRec_, driver             } ptr
      <*> #{peek struct FT_FaceRec_, memory             } ptr
      <*> #{peek struct FT_FaceRec_, stream             } ptr
      <*> #{peek struct FT_FaceRec_, sizes_list         } ptr
      <*> #{peek struct FT_FaceRec_, autohint           } ptr
      <*> #{peek struct FT_FaceRec_, extensions         } ptr
      <*> #{peek struct FT_FaceRec_, internal           } ptr

  poke ptr val = do
    #{poke struct FT_FaceRec_, num_faces          } ptr $ frNum_faces           val
    #{poke struct FT_FaceRec_, face_index         } ptr $ frFace_index          val
    #{poke struct FT_FaceRec_, face_flags         } ptr $ frFace_flags          val
    #{poke struct FT_FaceRec_, style_flags        } ptr $ frStyle_flags         val
    #{poke struct FT_FaceRec_, num_glyphs         } ptr $ frNum_glyphs          val
    #{poke struct FT_FaceRec_, family_name        } ptr $ frFamily_name         val
    #{poke struct FT_FaceRec_, style_name         } ptr $ frStyle_name          val
    #{poke struct FT_FaceRec_, num_fixed_sizes    } ptr $ frNum_fixed_sizes     val
    #{poke struct FT_FaceRec_, available_sizes    } ptr $ frAvailable_sizes     val
    #{poke struct FT_FaceRec_, num_charmaps       } ptr $ frNum_charmaps        val
    #{poke struct FT_FaceRec_, charmaps           } ptr $ frCharmaps            val
    #{poke struct FT_FaceRec_, generic            } ptr $ frGeneric             val
    #{poke struct FT_FaceRec_, bbox               } ptr $ frBbox                val
    #{poke struct FT_FaceRec_, units_per_EM       } ptr $ frUnits_per_EM        val
    #{poke struct FT_FaceRec_, ascender           } ptr $ frAscender            val
    #{poke struct FT_FaceRec_, descender          } ptr $ frDescender           val
    #{poke struct FT_FaceRec_, height             } ptr $ frHeight              val
    #{poke struct FT_FaceRec_, max_advance_width  } ptr $ frMax_advance_width   val
    #{poke struct FT_FaceRec_, max_advance_height } ptr $ frMax_advance_height  val
    #{poke struct FT_FaceRec_, underline_position } ptr $ frUnderline_position  val
    #{poke struct FT_FaceRec_, underline_thickness} ptr $ frUnderline_thickness val
    #{poke struct FT_FaceRec_, glyph              } ptr $ frGlyph               val
    #{poke struct FT_FaceRec_, size               } ptr $ frSize                val
    #{poke struct FT_FaceRec_, charmap            } ptr $ frCharmap             val
    #{poke struct FT_FaceRec_, driver             } ptr $ frDriver              val
    #{poke struct FT_FaceRec_, memory             } ptr $ frMemory              val
    #{poke struct FT_FaceRec_, stream             } ptr $ frStream              val
    #{poke struct FT_FaceRec_, sizes_list         } ptr $ frSizes_list          val
    #{poke struct FT_FaceRec_, autohint           } ptr $ frAutohint            val
    #{poke struct FT_FaceRec_, extensions         } ptr $ frExtensions          val
    #{poke struct FT_FaceRec_, internal           } ptr $ frInternal            val



data FT_Bitmap_Size = FT_Bitmap_Size
                        { bsHeight :: FT_Short
                        , bsWidth  :: FT_Short
                        , bsSize   :: FT_Pos
                        , bsX_ppem :: FT_Pos
                        , bsY_ppem :: FT_Pos
                        }

instance Storable FT_Bitmap_Size where
  sizeOf _    = #size      struct FT_Bitmap_Size_
  alignment _ = #alignment struct FT_Bitmap_Size_

  peek ptr =
    FT_Bitmap_Size
      <$> #{peek struct FT_Bitmap_Size_, height} ptr
      <*> #{peek struct FT_Bitmap_Size_, width } ptr
      <*> #{peek struct FT_Bitmap_Size_, size  } ptr
      <*> #{peek struct FT_Bitmap_Size_, x_ppem} ptr
      <*> #{peek struct FT_Bitmap_Size_, y_ppem} ptr

  poke ptr val = do
    #{poke struct FT_Bitmap_Size_, height} ptr $ bsHeight val
    #{poke struct FT_Bitmap_Size_, width } ptr $ bsWidth  val
    #{poke struct FT_Bitmap_Size_, size  } ptr $ bsSize   val
    #{poke struct FT_Bitmap_Size_, x_ppem} ptr $ bsX_ppem val
    #{poke struct FT_Bitmap_Size_, y_ppem} ptr $ bsY_ppem val



type FT_CharMap = Ptr FT_CharMapRec

data FT_CharMapRec = FT_CharMapRec
                       { cmrFace        :: FT_Face
                       , cmrEncoding    :: FT_Encoding
                       , cmrPlatform_id :: FT_UShort
                       , cmrEncoding_id :: FT_UShort
                       }

instance Storable FT_CharMapRec where
  sizeOf _    = #size      struct FT_CharMapRec_
  alignment _ = #alignment struct FT_CharMapRec_

  peek ptr =
    FT_CharMapRec
      <$> #{peek struct FT_CharMapRec_, face       } ptr
      <*> #{peek struct FT_CharMapRec_, encoding   } ptr
      <*> #{peek struct FT_CharMapRec_, platform_id} ptr
      <*> #{peek struct FT_CharMapRec_, encoding_id} ptr

  poke ptr val = do
    #{poke struct FT_CharMapRec_, face       } ptr $ cmrFace        val
    #{poke struct FT_CharMapRec_, encoding   } ptr $ cmrEncoding    val
    #{poke struct FT_CharMapRec_, platform_id} ptr $ cmrPlatform_id val
    #{poke struct FT_CharMapRec_, encoding_id} ptr $ cmrEncoding_id val



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
     :: FT_Encoding
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
                         , gsrControl_len       :: CLong
                         , gsrLsb_delta         :: FT_Pos
                         , gsrRsb_delta         :: FT_Pos
                         , gsrOther             :: Ptr ()
                         , gsrInternal          :: FT_Slot_Internal
                         }

instance Storable FT_GlyphSlotRec where
  sizeOf _    = #size      struct FT_GlyphSlotRec_
  alignment _ = #alignment struct FT_GlyphSlotRec_

  peek ptr =
    FT_GlyphSlotRec
      <$> #{peek struct FT_GlyphSlotRec_, library          } ptr
      <*> #{peek struct FT_GlyphSlotRec_, face             } ptr
      <*> #{peek struct FT_GlyphSlotRec_, next             } ptr
      <*> #{peek struct FT_GlyphSlotRec_, glyph_index      } ptr
      <*> #{peek struct FT_GlyphSlotRec_, generic          } ptr
      <*> #{peek struct FT_GlyphSlotRec_, metrics          } ptr
      <*> #{peek struct FT_GlyphSlotRec_, linearHoriAdvance} ptr
      <*> #{peek struct FT_GlyphSlotRec_, linearVertAdvance} ptr
      <*> #{peek struct FT_GlyphSlotRec_, advance          } ptr
      <*> #{peek struct FT_GlyphSlotRec_, format           } ptr
      <*> #{peek struct FT_GlyphSlotRec_, bitmap           } ptr
      <*> #{peek struct FT_GlyphSlotRec_, bitmap_left      } ptr
      <*> #{peek struct FT_GlyphSlotRec_, bitmap_top       } ptr
      <*> #{peek struct FT_GlyphSlotRec_, outline          } ptr
      <*> #{peek struct FT_GlyphSlotRec_, num_subglyphs    } ptr
      <*> #{peek struct FT_GlyphSlotRec_, subglyphs        } ptr
      <*> #{peek struct FT_GlyphSlotRec_, control_data     } ptr
      <*> #{peek struct FT_GlyphSlotRec_, control_len      } ptr
      <*> #{peek struct FT_GlyphSlotRec_, lsb_delta        } ptr
      <*> #{peek struct FT_GlyphSlotRec_, rsb_delta        } ptr
      <*> #{peek struct FT_GlyphSlotRec_, other            } ptr
      <*> #{peek struct FT_GlyphSlotRec_, internal         } ptr

  poke ptr val = do
    #{poke struct FT_GlyphSlotRec_, library          } ptr $ gsrLibrary           val
    #{poke struct FT_GlyphSlotRec_, face             } ptr $ gsrFace              val
    #{poke struct FT_GlyphSlotRec_, next             } ptr $ gsrNext              val
    #{poke struct FT_GlyphSlotRec_, glyph_index      } ptr $ gsrGlyph_index       val
    #{poke struct FT_GlyphSlotRec_, generic          } ptr $ gsrGeneric           val
    #{poke struct FT_GlyphSlotRec_, metrics          } ptr $ gsrMetrics           val
    #{poke struct FT_GlyphSlotRec_, linearHoriAdvance} ptr $ gsrLinearHoriAdvance val
    #{poke struct FT_GlyphSlotRec_, linearVertAdvance} ptr $ gsrLinearVertAdvance val
    #{poke struct FT_GlyphSlotRec_, advance          } ptr $ gsrAdvance           val
    #{poke struct FT_GlyphSlotRec_, format           } ptr $ gsrFormat            val
    #{poke struct FT_GlyphSlotRec_, bitmap           } ptr $ gsrBitmap            val
    #{poke struct FT_GlyphSlotRec_, bitmap_left      } ptr $ gsrBitmap_left       val
    #{poke struct FT_GlyphSlotRec_, bitmap_top       } ptr $ gsrBitmap_top        val
    #{poke struct FT_GlyphSlotRec_, outline          } ptr $ gsrOutline           val
    #{poke struct FT_GlyphSlotRec_, num_subglyphs    } ptr $ gsrNum_subglyphs     val
    #{poke struct FT_GlyphSlotRec_, subglyphs        } ptr $ gsrSubglyphs         val
    #{poke struct FT_GlyphSlotRec_, control_data     } ptr $ gsrControl_data      val
    #{poke struct FT_GlyphSlotRec_, control_len      } ptr $ gsrControl_len       val
    #{poke struct FT_GlyphSlotRec_, lsb_delta        } ptr $ gsrLsb_delta         val
    #{poke struct FT_GlyphSlotRec_, rsb_delta        } ptr $ gsrRsb_delta         val
    #{poke struct FT_GlyphSlotRec_, other            } ptr $ gsrOther             val
    #{poke struct FT_GlyphSlotRec_, internal         } ptr $ gsrInternal          val



type FT_Size = Ptr FT_SizeRec

data FT_SizeRec = FT_SizeRec
                    { srFace     :: FT_Face
                    , srGeneric  :: FT_Generic
                    , srMetrics  :: FT_Size_Metrics
                    , srInternal :: FT_Size_Internal
                    }

instance Storable FT_SizeRec where
  sizeOf _    = #size      struct FT_SizeRec_
  alignment _ = #alignment struct FT_SizeRec_

  peek ptr =
    FT_SizeRec
      <$> #{peek struct FT_SizeRec_, face    } ptr
      <*> #{peek struct FT_SizeRec_, generic } ptr
      <*> #{peek struct FT_SizeRec_, metrics } ptr
      <*> #{peek struct FT_SizeRec_, internal} ptr

  poke ptr val = do
    #{poke struct FT_SizeRec_, face    } ptr $ srFace     val
    #{poke struct FT_SizeRec_, generic } ptr $ srGeneric  val
    #{poke struct FT_SizeRec_, metrics } ptr $ srMetrics  val
    #{poke struct FT_SizeRec_, internal} ptr $ srInternal val



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

instance Storable FT_Glyph_Metrics where
  sizeOf _    = #size      struct FT_Glyph_Metrics_
  alignment _ = #alignment struct FT_Glyph_Metrics_

  peek ptr =
    FT_Glyph_Metrics
      <$> #{peek struct FT_Glyph_Metrics_, width       } ptr
      <*> #{peek struct FT_Glyph_Metrics_, height      } ptr
      <*> #{peek struct FT_Glyph_Metrics_, horiBearingX} ptr
      <*> #{peek struct FT_Glyph_Metrics_, horiBearingY} ptr
      <*> #{peek struct FT_Glyph_Metrics_, horiAdvance } ptr
      <*> #{peek struct FT_Glyph_Metrics_, vertBearingX} ptr
      <*> #{peek struct FT_Glyph_Metrics_, vertBearingY} ptr
      <*> #{peek struct FT_Glyph_Metrics_, vertAdvance } ptr

  poke ptr val = do
    #{poke struct FT_Glyph_Metrics_, width       } ptr $ gmWidth        val
    #{poke struct FT_Glyph_Metrics_, height      } ptr $ gmHeight       val
    #{poke struct FT_Glyph_Metrics_, horiBearingX} ptr $ gmHoriBearingX val
    #{poke struct FT_Glyph_Metrics_, horiBearingY} ptr $ gmHoriBearingY val
    #{poke struct FT_Glyph_Metrics_, horiAdvance } ptr $ gmHoriAdvance  val
    #{poke struct FT_Glyph_Metrics_, vertBearingX} ptr $ gmVertBearingX val
    #{poke struct FT_Glyph_Metrics_, vertBearingY} ptr $ gmVertBearingY val
    #{poke struct FT_Glyph_Metrics_, vertAdvance } ptr $ gmVertAdvance  val



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

instance Storable FT_Size_Metrics where
  sizeOf _    = #size      struct FT_Size_Metrics_
  alignment _ = #alignment struct FT_Size_Metrics_

  peek ptr =
    FT_Size_Metrics
      <$> #{peek struct FT_Size_Metrics_, x_ppem     } ptr
      <*> #{peek struct FT_Size_Metrics_, y_ppem     } ptr
      <*> #{peek struct FT_Size_Metrics_, x_scale    } ptr
      <*> #{peek struct FT_Size_Metrics_, y_scale    } ptr
      <*> #{peek struct FT_Size_Metrics_, ascender   } ptr
      <*> #{peek struct FT_Size_Metrics_, descender  } ptr
      <*> #{peek struct FT_Size_Metrics_, height     } ptr
      <*> #{peek struct FT_Size_Metrics_, max_advance} ptr

  poke ptr val = do
    #{poke struct FT_Size_Metrics_, x_ppem     } ptr $ smX_ppem      val
    #{poke struct FT_Size_Metrics_, y_ppem     } ptr $ smY_ppem      val
    #{poke struct FT_Size_Metrics_, x_scale    } ptr $ smX_scale     val
    #{poke struct FT_Size_Metrics_, y_scale    } ptr $ smY_scale     val
    #{poke struct FT_Size_Metrics_, ascender   } ptr $ smAscender    val
    #{poke struct FT_Size_Metrics_, descender  } ptr $ smDescender   val
    #{poke struct FT_Size_Metrics_, height     } ptr $ smHeight      val
    #{poke struct FT_Size_Metrics_, max_advance} ptr $ smMax_advance val



data FT_ModuleRec
type FT_Module = Ptr FT_ModuleRec



data FT_DriverRec
type FT_Driver = Ptr FT_DriverRec



type FT_Memory = Ptr FT_MemoryRec

data FT_MemoryRec = FT_MemoryRec
                      { mrUser    :: Ptr ()
                      , mrAlloc   :: FT_Alloc_Func
                      , mrFree    :: FT_Free_Func
                      , mrRealloc :: FT_Realloc_Func
                      }

instance Storable FT_MemoryRec where
  sizeOf _    = #size      struct FT_MemoryRec_
  alignment _ = #alignment struct FT_MemoryRec_

  peek ptr =
    FT_MemoryRec
      <$> #{peek struct FT_MemoryRec_, user   } ptr
      <*> #{peek struct FT_MemoryRec_, alloc  } ptr
      <*> #{peek struct FT_MemoryRec_, free   } ptr
      <*> #{peek struct FT_MemoryRec_, realloc} ptr

  poke ptr val = do
    #{poke struct FT_MemoryRec_, user   } ptr $ mrUser    val
    #{poke struct FT_MemoryRec_, alloc  } ptr $ mrAlloc   val
    #{poke struct FT_MemoryRec_, free   } ptr $ mrFree    val
    #{poke struct FT_MemoryRec_, realloc} ptr $ mrRealloc val

type FT_Alloc_Func = FunPtr (FT_Memory -> CLong -> IO (Ptr ()))

type FT_Free_Func = FunPtr (FT_Memory -> Ptr () -> IO ())

type FT_Realloc_Func = FunPtr (FT_Memory -> CLong -> CLong -> Ptr () -> IO (Ptr ()))



type FT_Stream = Ptr FT_StreamRec

data FT_StreamRec = FT_StreamRec
                      { srBase       :: Ptr CUChar
                      , srSize       :: CULong
                      , srPos        :: CULong
                      , srDescriptor :: FT_StreamDesc
                      , srPathname   :: FT_StreamDesc
                      , srRead       :: FT_Stream_IoFunc
                      , srClose      :: FT_Stream_CloseFunc
                      , srMemory     :: FT_Memory
                      , srCursor     :: Ptr CUChar
                      , srLimit      :: Ptr CUChar
                      }

instance Storable FT_StreamRec where
  sizeOf _    = #size struct FT_StreamRec_
  alignment _ = #alignment struct FT_StreamRec_

  peek ptr =
    FT_StreamRec
      <$> #{peek struct FT_StreamRec_, base      } ptr
      <*> #{peek struct FT_StreamRec_, size      } ptr
      <*> #{peek struct FT_StreamRec_, pos       } ptr
      <*> #{peek struct FT_StreamRec_, descriptor} ptr
      <*> #{peek struct FT_StreamRec_, pathname  } ptr
      <*> #{peek struct FT_StreamRec_, read      } ptr
      <*> #{peek struct FT_StreamRec_, close     } ptr
      <*> #{peek struct FT_StreamRec_, memory    } ptr
      <*> #{peek struct FT_StreamRec_, cursor    } ptr
      <*> #{peek struct FT_StreamRec_, limit     } ptr

  poke ptr val = do
    #{poke struct FT_StreamRec_, base      } ptr $ srBase       val
    #{poke struct FT_StreamRec_, size      } ptr $ srSize       val
    #{poke struct FT_StreamRec_, pos       } ptr $ srPos        val
    #{poke struct FT_StreamRec_, descriptor} ptr $ srDescriptor val
    #{poke struct FT_StreamRec_, pathname  } ptr $ srPathname   val
    #{poke struct FT_StreamRec_, read      } ptr $ srRead       val
    #{poke struct FT_StreamRec_, close     } ptr $ srClose      val
    #{poke struct FT_StreamRec_, memory    } ptr $ srMemory     val
    #{poke struct FT_StreamRec_, cursor    } ptr $ srCursor     val
    #{poke struct FT_StreamRec_, limit     } ptr $ srLimit      val

type FT_Stream_IoFunc = FunPtr (FT_Stream -> CULong -> Ptr CUChar -> CULong -> IO CULong)

type FT_Stream_CloseFunc = FunPtr (FT_Stream -> IO ())



data FT_StreamDesc = FT_StreamDesc
                       { sdValue   :: CLong
                       , sdPointer :: Ptr ()
                       }

instance Storable FT_StreamDesc where
  sizeOf _    = #size      union FT_StreamDesc_
  alignment _ = #alignment union FT_StreamDesc_

  peek ptr =
    FT_StreamDesc
      <$> #{peek union FT_StreamDesc_, value  } ptr
      <*> #{peek union FT_StreamDesc_, pointer} ptr

  poke ptr val = do
    #{poke union FT_StreamDesc_, value  } ptr $ sdValue   val
    #{poke union FT_StreamDesc_, pointer} ptr $ sdPointer val



data FT_Outline = FT_Outline
                    { oN_contours :: CShort
                    , oN_points   :: CShort
                    , oPoints     :: Ptr FT_Vector
                    , oTags       :: Ptr CChar
                    , oContours   :: Ptr CShort
                    , oFlags      :: CInt
                    }

instance Storable FT_Outline where
  sizeOf _    = #size      struct FT_Outline_
  alignment _ = #alignment struct FT_Outline_

  peek ptr =
    FT_Outline
      <$> #{peek struct FT_Outline_, n_contours} ptr
      <*> #{peek struct FT_Outline_, n_points  } ptr
      <*> #{peek struct FT_Outline_, points    } ptr
      <*> #{peek struct FT_Outline_, tags      } ptr
      <*> #{peek struct FT_Outline_, contours  } ptr
      <*> #{peek struct FT_Outline_, flags     } ptr

  poke ptr val = do
    #{poke struct FT_Outline_, n_contours} ptr $ oN_contours val
    #{poke struct FT_Outline_, n_points  } ptr $ oN_points   val
    #{poke struct FT_Outline_, points    } ptr $ oPoints     val
    #{poke struct FT_Outline_, tags      } ptr $ oTags       val
    #{poke struct FT_Outline_, contours  } ptr $ oContours   val
    #{poke struct FT_Outline_, flags     } ptr $ oFlags      val



type FT_List = Ptr FT_ListRec

data FT_ListRec = FT_ListRec
                    { lrHead :: FT_ListNode
                    , lrTail :: FT_ListNode
                    }
                  deriving (Show, Eq)

instance Storable FT_ListRec where
  sizeOf _    = #size      struct FT_ListRec_
  alignment _ = #alignment struct FT_ListRec_

  peek ptr =
    FT_ListRec
      <$> #{peek struct FT_ListRec_, head} ptr
      <*> #{peek struct FT_ListRec_, tail} ptr

  poke ptr val = do
    #{poke struct FT_ListRec_, head} ptr $ lrHead val
    #{poke struct FT_ListRec_, tail} ptr $ lrTail val



type FT_ListNode = Ptr FT_ListNodeRec

data FT_ListNodeRec = FT_ListNodeRec
                        { lnrPrev :: FT_ListNode
                        , lnrNext :: FT_ListNode
                        , lnrData :: Ptr ()
                        }
                      deriving (Show, Eq)

instance Storable FT_ListNodeRec where
  sizeOf _    = #size      struct FT_ListNodeRec_
  alignment _ = #alignment struct FT_ListNodeRec_

  peek ptr =
    FT_ListNodeRec
      <$> #{peek struct FT_ListNodeRec_, prev} ptr
      <*> #{peek struct FT_ListNodeRec_, next} ptr
      <*> #{peek struct FT_ListNodeRec_, data} ptr

  poke ptr val = do
    #{poke struct FT_ListNodeRec_, prev} ptr $ lnrPrev val
    #{poke struct FT_ListNodeRec_, next} ptr $ lnrNext val
    #{poke struct FT_ListNodeRec_, data} ptr $ lnrData val
