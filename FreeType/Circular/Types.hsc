{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}

module FreeType.Circular.Types where

import          FreeType.Core.Types.Types

import          Data.Int
import          Data.Function ((&))
import          Data.Word
import          Foreign.Ptr
import          Foreign.Storable

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
    #{poke struct FT_FaceRec_, num_faces          } ptr $ val & frNum_faces
    #{poke struct FT_FaceRec_, face_index         } ptr $ val & frFace_index
    #{poke struct FT_FaceRec_, face_flags         } ptr $ val & frFace_flags
    #{poke struct FT_FaceRec_, style_flags        } ptr $ val & frStyle_flags
    #{poke struct FT_FaceRec_, num_glyphs         } ptr $ val & frNum_glyphs
    #{poke struct FT_FaceRec_, family_name        } ptr $ val & frFamily_name
    #{poke struct FT_FaceRec_, style_name         } ptr $ val & frStyle_name
    #{poke struct FT_FaceRec_, num_fixed_sizes    } ptr $ val & frNum_fixed_sizes
    #{poke struct FT_FaceRec_, available_sizes    } ptr $ val & frAvailable_sizes
    #{poke struct FT_FaceRec_, num_charmaps       } ptr $ val & frNum_charmaps
    #{poke struct FT_FaceRec_, charmaps           } ptr $ val & frCharmaps
    #{poke struct FT_FaceRec_, generic            } ptr $ val & frGeneric
    #{poke struct FT_FaceRec_, bbox               } ptr $ val & frBbox
    #{poke struct FT_FaceRec_, units_per_EM       } ptr $ val & frUnits_per_EM
    #{poke struct FT_FaceRec_, ascender           } ptr $ val & frAscender
    #{poke struct FT_FaceRec_, descender          } ptr $ val & frDescender
    #{poke struct FT_FaceRec_, height             } ptr $ val & frHeight
    #{poke struct FT_FaceRec_, max_advance_width  } ptr $ val & frMax_advance_width
    #{poke struct FT_FaceRec_, max_advance_height } ptr $ val & frMax_advance_height
    #{poke struct FT_FaceRec_, underline_position } ptr $ val & frUnderline_position
    #{poke struct FT_FaceRec_, underline_thickness} ptr $ val & frUnderline_thickness
    #{poke struct FT_FaceRec_, glyph              } ptr $ val & frGlyph
    #{poke struct FT_FaceRec_, size               } ptr $ val & frSize
    #{poke struct FT_FaceRec_, charmap            } ptr $ val & frCharmap
    #{poke struct FT_FaceRec_, driver             } ptr $ val & frDriver
    #{poke struct FT_FaceRec_, memory             } ptr $ val & frMemory
    #{poke struct FT_FaceRec_, stream             } ptr $ val & frStream
    #{poke struct FT_FaceRec_, sizes_list         } ptr $ val & frSizes_list
    #{poke struct FT_FaceRec_, autohint           } ptr $ val & frAutohint
    #{poke struct FT_FaceRec_, extensions         } ptr $ val & frExtensions
    #{poke struct FT_FaceRec_, internal           } ptr $ val & frInternal



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
    #{poke struct FT_Bitmap_Size_, height} ptr $ val & bsHeight
    #{poke struct FT_Bitmap_Size_, width } ptr $ val & bsWidth
    #{poke struct FT_Bitmap_Size_, size  } ptr $ val & bsSize
    #{poke struct FT_Bitmap_Size_, x_ppem} ptr $ val & bsX_ppem
    #{poke struct FT_Bitmap_Size_, y_ppem} ptr $ val & bsY_ppem




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
    #{poke struct FT_CharMapRec_, face       } ptr $ val & cmrFace
    #{poke struct FT_CharMapRec_, encoding   } ptr $ val & cmrEncoding
    #{poke struct FT_CharMapRec_, platform_id} ptr $ val & cmrPlatform_id
    #{poke struct FT_CharMapRec_, encoding_id} ptr $ val & cmrEncoding_id



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
    #{poke struct FT_GlyphSlotRec_, library          } ptr $ val & gsrLibrary
    #{poke struct FT_GlyphSlotRec_, face             } ptr $ val & gsrFace
    #{poke struct FT_GlyphSlotRec_, next             } ptr $ val & gsrNext
    #{poke struct FT_GlyphSlotRec_, glyph_index      } ptr $ val & gsrGlyph_index
    #{poke struct FT_GlyphSlotRec_, generic          } ptr $ val & gsrGeneric
    #{poke struct FT_GlyphSlotRec_, metrics          } ptr $ val & gsrMetrics
    #{poke struct FT_GlyphSlotRec_, linearHoriAdvance} ptr $ val & gsrLinearHoriAdvance
    #{poke struct FT_GlyphSlotRec_, linearVertAdvance} ptr $ val & gsrLinearVertAdvance
    #{poke struct FT_GlyphSlotRec_, advance          } ptr $ val & gsrAdvance
    #{poke struct FT_GlyphSlotRec_, format           } ptr $ val & gsrFormat
    #{poke struct FT_GlyphSlotRec_, bitmap           } ptr $ val & gsrBitmap
    #{poke struct FT_GlyphSlotRec_, bitmap_left      } ptr $ val & gsrBitmap_left
    #{poke struct FT_GlyphSlotRec_, bitmap_top       } ptr $ val & gsrBitmap_top
    #{poke struct FT_GlyphSlotRec_, outline          } ptr $ val & gsrOutline
    #{poke struct FT_GlyphSlotRec_, num_subglyphs    } ptr $ val & gsrNum_subglyphs
    #{poke struct FT_GlyphSlotRec_, subglyphs        } ptr $ val & gsrSubglyphs
    #{poke struct FT_GlyphSlotRec_, control_data     } ptr $ val & gsrControl_data
    #{poke struct FT_GlyphSlotRec_, control_len      } ptr $ val & gsrControl_len
    #{poke struct FT_GlyphSlotRec_, lsb_delta        } ptr $ val & gsrLsb_delta
    #{poke struct FT_GlyphSlotRec_, rsb_delta        } ptr $ val & gsrRsb_delta
    #{poke struct FT_GlyphSlotRec_, other            } ptr $ val & gsrOther
    #{poke struct FT_GlyphSlotRec_, internal         } ptr $ val & gsrInternal



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
    #{poke struct FT_SizeRec_, face    } ptr $ val & srFace
    #{poke struct FT_SizeRec_, generic } ptr $ val & srGeneric
    #{poke struct FT_SizeRec_, metrics } ptr $ val & srMetrics
    #{poke struct FT_SizeRec_, internal} ptr $ val & srInternal



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
    #{poke struct FT_Glyph_Metrics_, width       } ptr $ val & gmWidth
    #{poke struct FT_Glyph_Metrics_, height      } ptr $ val & gmHeight
    #{poke struct FT_Glyph_Metrics_, horiBearingX} ptr $ val & gmHoriBearingX
    #{poke struct FT_Glyph_Metrics_, horiBearingY} ptr $ val & gmHoriBearingY
    #{poke struct FT_Glyph_Metrics_, horiAdvance } ptr $ val & gmHoriAdvance
    #{poke struct FT_Glyph_Metrics_, vertBearingX} ptr $ val & gmVertBearingX
    #{poke struct FT_Glyph_Metrics_, vertBearingY} ptr $ val & gmVertBearingY
    #{poke struct FT_Glyph_Metrics_, vertAdvance } ptr $ val & gmVertAdvance



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
    #{poke struct FT_Size_Metrics_, x_ppem     } ptr $ val & smX_ppem
    #{poke struct FT_Size_Metrics_, y_ppem     } ptr $ val & smY_ppem
    #{poke struct FT_Size_Metrics_, x_scale    } ptr $ val & smX_scale
    #{poke struct FT_Size_Metrics_, y_scale    } ptr $ val & smY_scale
    #{poke struct FT_Size_Metrics_, ascender   } ptr $ val & smAscender
    #{poke struct FT_Size_Metrics_, descender  } ptr $ val & smDescender
    #{poke struct FT_Size_Metrics_, height     } ptr $ val & smHeight
    #{poke struct FT_Size_Metrics_, max_advance} ptr $ val & smMax_advance


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
    #{poke struct FT_MemoryRec_, user   } ptr $ val & mrUser
    #{poke struct FT_MemoryRec_, alloc  } ptr $ val & mrAlloc
    #{poke struct FT_MemoryRec_, free   } ptr $ val & mrFree
    #{poke struct FT_MemoryRec_, realloc} ptr $ val & mrRealloc



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
    #{poke struct FT_StreamRec_, base      } ptr $ val & srBase
    #{poke struct FT_StreamRec_, size      } ptr $ val & srSize
    #{poke struct FT_StreamRec_, pos       } ptr $ val & srPos
    #{poke struct FT_StreamRec_, descriptor} ptr $ val & srDescriptor
    #{poke struct FT_StreamRec_, pathname  } ptr $ val & srPathname
    #{poke struct FT_StreamRec_, read      } ptr $ val & srRead
    #{poke struct FT_StreamRec_, close     } ptr $ val & srClose
    #{poke struct FT_StreamRec_, memory    } ptr $ val & srMemory
    #{poke struct FT_StreamRec_, cursor    } ptr $ val & srCursor
    #{poke struct FT_StreamRec_, limit     } ptr $ val & srLimit



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

instance Storable FT_StreamDesc where
  sizeOf _    = #size      union FT_StreamDesc_
  alignment _ = #alignment union FT_StreamDesc_

  peek ptr =
    FT_StreamDesc
      <$> #{peek union FT_StreamDesc_, value  } ptr
      <*> #{peek union FT_StreamDesc_, pointer} ptr

  poke ptr val = do
    #{poke union FT_StreamDesc_, value  } ptr $ val & sdValue
    #{poke union FT_StreamDesc_, pointer} ptr $ val & sdPointer




data FT_Outline = FT_Outline
                    { oN_contours :: #type short
                    , oN_points   :: #type short
                    , oPoints     :: Ptr FT_Vector
                    , oTags       :: Ptr #type char
                    , oContours   :: Ptr #type short
                    , oFlags      :: #type int
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
    #{poke struct FT_Outline_, n_contours} ptr $ val & oN_contours
    #{poke struct FT_Outline_, n_points  } ptr $ val & oN_points
    #{poke struct FT_Outline_, points    } ptr $ val & oPoints
    #{poke struct FT_Outline_, tags      } ptr $ val & oTags
    #{poke struct FT_Outline_, contours  } ptr $ val & oContours
    #{poke struct FT_Outline_, flags     } ptr $ val & oFlags



type FT_List = Ptr FT_ListRec

data FT_ListRec = FT_ListRec
                    { lrHead :: FT_ListNode
                    , lrTail :: FT_ListNode
                    }

instance Storable FT_ListRec where
  sizeOf _    = #size      struct FT_ListRec_
  alignment _ = #alignment struct FT_ListRec_

  peek ptr =
    FT_ListRec
      <$> #{peek struct FT_ListRec_, head} ptr
      <*> #{peek struct FT_ListRec_, tail} ptr

  poke ptr val = do
    #{poke struct FT_ListRec_, head} ptr $ val & lrHead
    #{poke struct FT_ListRec_, tail} ptr $ val & lrTail



type FT_ListNode = Ptr FT_ListNodeRec

data FT_ListNodeRec = FT_ListNodeRec
                        { lnrPrev :: FT_ListNode
                        , lnrNext :: FT_ListNode
                        , lnrData :: Ptr ()
                        }

instance Storable FT_ListNodeRec where
  sizeOf _    = #size      struct FT_ListNodeRec_
  alignment _ = #alignment struct FT_ListNodeRec_

  peek ptr =
    FT_ListNodeRec
      <$> #{peek struct FT_ListNodeRec_, prev} ptr
      <*> #{peek struct FT_ListNodeRec_, next} ptr
      <*> #{peek struct FT_ListNodeRec_, data} ptr

  poke ptr val = do
    #{poke struct FT_ListNodeRec_, prev} ptr $ val & lnrPrev
    #{poke struct FT_ListNodeRec_, next} ptr $ val & lnrNext
    #{poke struct FT_ListNodeRec_, data} ptr $ val & lnrData
