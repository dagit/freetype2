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

module FreeType.Core.Glyph.Types where

import           FreeType.Core.Base.Types
import           FreeType.Core.Types.Types
import           FreeType.Support.Outline.Types

import           Foreign.Ptr
import           Foreign.Storable
import           Foreign.Storable.Offset

#include "ft2build.h"
#include FT_GLYPH_H

type FT_Glyph = Ptr FT_GlyphRec



data FT_Glyph_Class

data FT_GlyphRec = FT_GlyphRec
                     { library :: FT_Library
                     , clazz   :: Ptr FT_Glyph_Class
                     , format  :: FT_Glyph_Format
                     , advance :: FT_Vector
                     }

instance Offset "library" FT_GlyphRec where rawOffset = #{offset struct FT_GlyphRec_, library}
instance Offset "clazz"   FT_GlyphRec where rawOffset = #{offset struct FT_GlyphRec_, clazz  }
instance Offset "format"  FT_GlyphRec where rawOffset = #{offset struct FT_GlyphRec_, format }
instance Offset "advance" FT_GlyphRec where rawOffset = #{offset struct FT_GlyphRec_, advance}

instance Storable FT_GlyphRec where
  sizeOf _    = #size      struct FT_GlyphRec_
  alignment _ = #alignment struct FT_GlyphRec_

  peek ptr =
    FT_GlyphRec
      <$> peek (offset @"library" ptr)
      <*> peek (offset @"clazz"   ptr)
      <*> peek (offset @"format"  ptr)
      <*> peek (offset @"advance" ptr)

  poke ptr val = do
    pokeField @"library" ptr val
    pokeField @"clazz"   ptr val
    pokeField @"format"  ptr val
    pokeField @"advance" ptr val



type FT_BitmapGlyph = Ptr FT_BitmapGlyphRec

data FT_BitmapGlyphRec = FT_BitmapGlyphRec
                           { root   :: FT_GlyphRec
                           , left   :: FT_Int
                           , top    :: FT_Int
                           , bitmap :: FT_Bitmap
                           }

instance Offset "root"   FT_BitmapGlyphRec where rawOffset = #{offset struct FT_BitmapGlyphRec_, root  }
instance Offset "left"   FT_BitmapGlyphRec where rawOffset = #{offset struct FT_BitmapGlyphRec_, left  }
instance Offset "top"    FT_BitmapGlyphRec where rawOffset = #{offset struct FT_BitmapGlyphRec_, top   }
instance Offset "bitmap" FT_BitmapGlyphRec where rawOffset = #{offset struct FT_BitmapGlyphRec_, bitmap}

instance Storable FT_BitmapGlyphRec where
  sizeOf _    = #size      struct FT_BitmapGlyphRec_
  alignment _ = #alignment struct FT_BitmapGlyphRec_

  peek ptr =
    FT_BitmapGlyphRec
      <$> peek (offset @"root"   ptr)
      <*> peek (offset @"left"   ptr)
      <*> peek (offset @"top"    ptr)
      <*> peek (offset @"bitmap" ptr)

  poke ptr val = do
    pokeField @"root"   ptr val
    pokeField @"left"   ptr val
    pokeField @"top"    ptr val
    pokeField @"bitmap" ptr val



type FT_OutlineGlyph = Ptr FT_OutlineGlyphRec

data FT_OutlineGlyphRec = FT_OutlineGlyphRec
                            { root    :: FT_GlyphRec
                            , outline :: FT_Outline
                            }

instance Offset "root"    FT_OutlineGlyphRec where rawOffset = #{offset struct FT_OutlineGlyphRec_, root   }
instance Offset "outline" FT_OutlineGlyphRec where rawOffset = #{offset struct FT_OutlineGlyphRec_, outline}

instance Storable FT_OutlineGlyphRec where
  sizeOf _    = #size      struct FT_OutlineGlyphRec_
  alignment _ = #alignment struct FT_OutlineGlyphRec_

  peek ptr =
    FT_OutlineGlyphRec
      <$> peek (offset @"root"    ptr)
      <*> peek (offset @"outline" ptr)

  poke ptr val = do
    pokeField @"root"    ptr val
    pokeField @"outline" ptr val



type FT_SvgGlyph = Ptr FT_SvgGlyphRec

data FT_SvgGlyphRec = FT_SvgGlyphRec
                          { root                :: FT_GlyphRec
                          , svg_document        :: Ptr FT_Byte
                          , svg_document_length :: FT_ULong
                          , glyph_index         :: FT_UInt
                          , metrics             :: FT_Size_Metrics
                          , units_per_EM        :: FT_UShort
                          , start_glyph_id      :: FT_UShort
                          , end_glyph_id        :: FT_UShort
                          , transform           :: FT_Matrix
                          , delta               :: FT_Vector
                          }

instance Offset "root"                FT_SvgGlyphRec where rawOffset = #{offset struct FT_SvgGlyphRec_, root               }
instance Offset "svg_document"        FT_SvgGlyphRec where rawOffset = #{offset struct FT_SvgGlyphRec_, svg_document       }
instance Offset "svg_document_length" FT_SvgGlyphRec where rawOffset = #{offset struct FT_SvgGlyphRec_, svg_document_length}
instance Offset "glyph_index"         FT_SvgGlyphRec where rawOffset = #{offset struct FT_SvgGlyphRec_, glyph_index        }
instance Offset "metrics"             FT_SvgGlyphRec where rawOffset = #{offset struct FT_SvgGlyphRec_, metrics            }
instance Offset "units_per_EM"        FT_SvgGlyphRec where rawOffset = #{offset struct FT_SvgGlyphRec_, units_per_EM       }
instance Offset "start_glyph_id"      FT_SvgGlyphRec where rawOffset = #{offset struct FT_SvgGlyphRec_, start_glyph_id     }
instance Offset "end_glyph_id"        FT_SvgGlyphRec where rawOffset = #{offset struct FT_SvgGlyphRec_, end_glyph_id       }
instance Offset "transform"           FT_SvgGlyphRec where rawOffset = #{offset struct FT_SvgGlyphRec_, transform          }
instance Offset "delta"               FT_SvgGlyphRec where rawOffset = #{offset struct FT_SvgGlyphRec_, delta              }

instance Storable FT_SvgGlyphRec where
  sizeOf _    = #size      struct FT_SvgGlyphRec_
  alignment _ = #alignment struct FT_SvgGlyphRec_

  peek ptr =
    FT_SvgGlyphRec
      <$> peek (offset @"root"                ptr)
      <*> peek (offset @"svg_document"        ptr)
      <*> peek (offset @"svg_document_length" ptr)
      <*> peek (offset @"glyph_index"         ptr)
      <*> peek (offset @"metrics"             ptr)
      <*> peek (offset @"units_per_EM"        ptr)
      <*> peek (offset @"start_glyph_id"      ptr)
      <*> peek (offset @"end_glyph_id"        ptr)
      <*> peek (offset @"transform"           ptr)
      <*> peek (offset @"delta"               ptr)

  poke ptr val = do
    pokeField @"root"                ptr val
    pokeField @"svg_document"        ptr val
    pokeField @"svg_document_length" ptr val
    pokeField @"glyph_index"         ptr val
    pokeField @"metrics"             ptr val
    pokeField @"units_per_EM"        ptr val
    pokeField @"start_glyph_id"      ptr val
    pokeField @"end_glyph_id"        ptr val
    pokeField @"transform"           ptr val
    pokeField @"delta"               ptr val
