{-# LANGUAGE DataKinds
           , EmptyDataDecls
           , ForeignFunctionInterface
           , MultiParamTypeClasses
           , PatternSynonyms
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
                     { grLibrary :: FT_Library
                     , grClazz   :: Ptr FT_Glyph_Class
                     , grFormat  :: FT_Glyph_Format
                     , grAdvance :: FT_Vector
                     }

instance Offset "grLibrary" FT_GlyphRec where rawOffset = #{offset struct FT_GlyphRec_, library}
instance Offset "grClazz"   FT_GlyphRec where rawOffset = #{offset struct FT_GlyphRec_, clazz  }
instance Offset "grFormat"  FT_GlyphRec where rawOffset = #{offset struct FT_GlyphRec_, format }
instance Offset "grAdvance" FT_GlyphRec where rawOffset = #{offset struct FT_GlyphRec_, advance}

instance Storable FT_GlyphRec where
  sizeOf _    = #size      struct FT_GlyphRec_
  alignment _ = #alignment struct FT_GlyphRec_

  peek ptr =
    FT_GlyphRec
      <$> peek (offset @"grLibrary" ptr)
      <*> peek (offset @"grClazz"   ptr)
      <*> peek (offset @"grFormat"  ptr)
      <*> peek (offset @"grAdvance" ptr)

  poke ptr val = do
    pokeField @"grLibrary" ptr val
    pokeField @"grClazz"   ptr val
    pokeField @"grFormat"  ptr val
    pokeField @"grAdvance" ptr val



type FT_BitmapGlyph = Ptr FT_BitmapGlyphRec

data FT_BitmapGlyphRec = FT_BitmapGlyphRec
                           { bgrRoot   :: FT_GlyphRec
                           , bgrLeft   :: FT_Int
                           , bgrTop    :: FT_Int
                           , bgrBitmap :: FT_Bitmap
                           }

instance Offset "bgrRoot"   FT_BitmapGlyphRec where rawOffset = #{offset struct FT_BitmapGlyphRec_, root  }
instance Offset "bgrLeft"   FT_BitmapGlyphRec where rawOffset = #{offset struct FT_BitmapGlyphRec_, left  }
instance Offset "bgrTop"    FT_BitmapGlyphRec where rawOffset = #{offset struct FT_BitmapGlyphRec_, top   }
instance Offset "bgrBitmap" FT_BitmapGlyphRec where rawOffset = #{offset struct FT_BitmapGlyphRec_, bitmap}

instance Storable FT_BitmapGlyphRec where
  sizeOf _    = #size      struct FT_BitmapGlyphRec_
  alignment _ = #alignment struct FT_BitmapGlyphRec_

  peek ptr =
    FT_BitmapGlyphRec
      <$> peek (offset @"bgrRoot"   ptr)
      <*> peek (offset @"bgrLeft"   ptr)
      <*> peek (offset @"bgrTop"    ptr)
      <*> peek (offset @"bgrBitmap" ptr)

  poke ptr val = do
    pokeField @"bgrRoot"   ptr val
    pokeField @"bgrLeft"   ptr val
    pokeField @"bgrTop"    ptr val
    pokeField @"bgrBitmap" ptr val



newtype FT_OutlineGlyph = Ptr FT_OutlineGlyphRec

data FT_OutlineGlyphRec = FT_OutlineGlyphRec
                            { ogrRoot    :: FT_GlyphRec
                            , ogrOutline :: FT_Outline
                            }

instance Offset "ogrRoot"    FT_OutlineGlyphRec where rawOffset = #{offset struct FT_OutlineGlyphRec_, root   }
instance Offset "ogrOutline" FT_OutlineGlyphRec where rawOffset = #{offset struct FT_OutlineGlyphRec_, outline}

instance Storable FT_OutlineGlyphRec where
  sizeOf _    = #size      struct FT_OutlineGlyphRec_
  alignment _ = #alignment struct FT_OutlineGlyphRec_

  peek ptr =
    FT_OutlineGlyphRec
      <$> peek (offset @"ogrRoot"    ptr)
      <*> peek (offset @"ogrOutline" ptr)

  poke ptr val = do
    pokeField @"ogrRoot"    ptr val
    pokeField @"ogrOutline" ptr val
