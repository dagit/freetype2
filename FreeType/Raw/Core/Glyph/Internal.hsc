{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}
{-# OPTIONS_HADDOCK hide #-}

module FreeType.Raw.Core.Glyph.Internal where

import           FreeType.Raw.Core.Base.Internal
import           FreeType.Raw.Core.Types.Internal
import           FreeType.Raw.Support.Outline.Internal

import           Foreign.C.Types
import           Foreign.Ptr

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



type FT_BitmapGlyph = Ptr FT_BitmapGlyphRec

data FT_BitmapGlyphRec = FT_BitmapGlyphRec
                           { bgrRoot   :: FT_GlyphRec
                           , bgrLeft   :: FT_Int
                           , bgrTop    :: FT_Int
                           , bgrBitmap :: FT_Bitmap
                           }



newtype FT_OutlineGlyph = Ptr FT_OutlineGlyphRec

data FT_OutlineGlyphRec = FT_OutlineGlyphRec
                            { ogrRoot    :: FT_GlyphRec
                            , ogrOutline :: FT_Outline
                            }



foreign import ccall "FT_New_Glyph"
  ft_New_Glyph :: FT_Library -> FT_Glyph_Format -> Ptr FT_Glyph -> IO FT_Error



foreign import ccall "FT_Get_Glyph"
  ft_Get_Glyph :: FT_GlyphSlot -> Ptr FT_Glyph -> IO FT_Error



foreign import ccall "FT_Glyph_Copy"
  ft_Glyph_Copy :: FT_Glyph -> Ptr FT_Glyph -> IO FT_Error



foreign import ccall "FT_Glyph_Transform"
  ft_Glyph_Transform :: FT_Glyph -> Ptr FT_Matrix -> Ptr FT_Vector -> IO FT_Error



pattern FT_GLYPH_BBOX_UNSCALED
      , FT_GLYPH_BBOX_SUBPIXELS
      , FT_GLYPH_BBOX_GRIDFIT
      , FT_GLYPH_BBOX_TRUNCATE
      , FT_GLYPH_BBOX_PIXELS
 :: CInt
pattern FT_GLYPH_BBOX_UNSCALED  = #const FT_GLYPH_BBOX_UNSCALED
pattern FT_GLYPH_BBOX_SUBPIXELS = #const FT_GLYPH_BBOX_SUBPIXELS
pattern FT_GLYPH_BBOX_GRIDFIT   = #const FT_GLYPH_BBOX_GRIDFIT
pattern FT_GLYPH_BBOX_TRUNCATE  = #const FT_GLYPH_BBOX_TRUNCATE
pattern FT_GLYPH_BBOX_PIXELS    = #const FT_GLYPH_BBOX_PIXELS



foreign import ccall "FT_Glyph_Get_CBox"
  ft_Glyph_Get_CBox :: FT_Glyph -> FT_UInt -> Ptr FT_BBox -> IO ()



foreign import ccall "FT_Glyph_To_Bitmap"
  ft_Glyph_To_Bitmap :: Ptr FT_Glyph -> FT_Render_Mode -> Ptr FT_Vector -> FT_Bool -> IO FT_Error



foreign import ccall "FT_Done_Glyph"
  ft_Done_Glyph :: FT_Glyph -> IO ()
