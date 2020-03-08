{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}

module FreeType.Core.Glyph.Types where

import           FreeType.Core.Base.Types
import           FreeType.Core.Types.Types
import           FreeType.Support.Outline.Types

import           Data.Function ((&))
import           Foreign.Ptr
import           Foreign.Storable

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

instance Storable FT_GlyphRec where    
  sizeOf _    = #size      struct FT_GlyphRec_    
  alignment _ = #alignment struct FT_GlyphRec_    
    
  peek ptr =    
    FT_GlyphRec    
      <$> #{peek struct FT_GlyphRec_, library} ptr    
      <*> #{peek struct FT_GlyphRec_, clazz  } ptr    
      <*> #{peek struct FT_GlyphRec_, format } ptr    
      <*> #{peek struct FT_GlyphRec_, advance} ptr    
    
  poke ptr val = do    
    #{poke struct FT_GlyphRec_, library} ptr $ val & grLibrary    
    #{poke struct FT_GlyphRec_, clazz  } ptr $ val & grClazz    
    #{poke struct FT_GlyphRec_, format } ptr $ val & grFormat    
    #{poke struct FT_GlyphRec_, advance} ptr $ val & grAdvance



type FT_BitmapGlyph = Ptr FT_BitmapGlyphRec

data FT_BitmapGlyphRec = FT_BitmapGlyphRec
                           { bgrRoot   :: FT_GlyphRec
                           , bgrLeft   :: FT_Int
                           , bgrTop    :: FT_Int
                           , bgrBitmap :: FT_Bitmap
                           }

instance Storable FT_BitmapGlyphRec where    
  sizeOf _    = #size      struct FT_BitmapGlyphRec_    
  alignment _ = #alignment struct FT_BitmapGlyphRec_    
    
  peek ptr =    
    FT_BitmapGlyphRec    
      <$> #{peek struct FT_BitmapGlyphRec_, root  } ptr    
      <*> #{peek struct FT_BitmapGlyphRec_, left  } ptr    
      <*> #{peek struct FT_BitmapGlyphRec_, top   } ptr    
      <*> #{peek struct FT_BitmapGlyphRec_, bitmap} ptr    
    
  poke ptr val = do    
    #{poke struct FT_BitmapGlyphRec_, root  } ptr $ val & bgrRoot    
    #{poke struct FT_BitmapGlyphRec_, left  } ptr $ val & bgrLeft    
    #{poke struct FT_BitmapGlyphRec_, top   } ptr $ val & bgrTop    
    #{poke struct FT_BitmapGlyphRec_, bitmap} ptr $ val & bgrBitmap



newtype FT_OutlineGlyph = Ptr FT_OutlineGlyphRec

data FT_OutlineGlyphRec = FT_OutlineGlyphRec
                            { ogrRoot    :: FT_GlyphRec
                            , ogrOutline :: FT_Outline
                            }

instance Storable FT_OutlineGlyphRec where    
  sizeOf _    = #size      struct FT_OutlineGlyphRec_    
  alignment _ = #alignment struct FT_OutlineGlyphRec_    

  peek ptr =
    FT_OutlineGlyphRec
      <$> #{peek struct FT_OutlineGlyphRec_, root   } ptr
      <*> #{peek struct FT_OutlineGlyphRec_, outline} ptr

  poke ptr val = do
    #{poke struct FT_OutlineGlyphRec_, root   } ptr $ val & ogrRoot
    #{poke struct FT_OutlineGlyphRec_, outline} ptr $ val & ogrOutline
