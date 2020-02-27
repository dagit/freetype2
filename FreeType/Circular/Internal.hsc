{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE PatternSynonyms #-}
{-# OPTIONS_HADDOCK hide #-}

module FreeType.Circular.Internal where

import          FreeType.Core.Types.Internal

import          Foreign.C.Types
import          Foreign.Ptr

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



data FT_Bitmap_Size = FT_Bitmap_Size
                        { bsHeight :: FT_Short
                        , bsWidth  :: FT_Short
                        , bsSize   :: FT_Pos
                        , bsX_ppem :: FT_Pos
                        , bsY_ppem :: FT_Pos
                        }



type FT_CharMap = Ptr FT_CharMapRec

data FT_CharMapRec = FT_CharMapRec
                       { cmrFace        :: FT_Face
                       , cmrEncoding    :: FT_Encoding
                       , cmrPlatform_id :: FT_UShort
                       , cmrEncoding_id :: FT_UShort
                       }



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



type FT_Size = Ptr FT_SizeRec

data FT_SizeRec = FT_SizeRec
                    { srFace     :: FT_Face
                    , srGeneric  :: FT_Generic
                    , srMetrics  :: FT_Size_Metrics
                    , srInternal :: FT_Size_Internal
                    }



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

type FT_Stream_IoFunc = FunPtr (FT_Stream -> CULong -> Ptr CUChar -> CULong -> IO CULong)

type FT_Stream_CloseFunc = FunPtr (FT_Stream -> IO ())



data FT_StreamDesc = FT_StreamDesc
                       { sdValue   :: CLong
                       , sdPointer :: Ptr ()
                       }



data FT_Outline = FT_Outline
                    { oN_contours :: CShort
                    , oN_points   :: CShort
                    , oPoints     :: Ptr FT_Vector
                    , oTags       :: Ptr CChar
                    , oContours   :: Ptr CShort
                    , oFlags      :: CInt
                    }



type FT_List = Ptr FT_ListRec

data FT_ListRec = FT_ListRec
                    { lrHead :: FT_ListNode
                    , lrTail :: FT_ListNode
                    }
                  deriving (Show, Eq)



type FT_ListNode = Ptr FT_ListNodeRec

data FT_ListNodeRec = FT_ListNodeRec
                        { lnrPrev :: FT_ListNode
                        , lnrNext :: FT_ListNode
                        , lnrData :: Ptr ()
                        }
                      deriving (Show, Eq)
