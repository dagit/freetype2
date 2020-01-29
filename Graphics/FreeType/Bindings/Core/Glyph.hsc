{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module Graphics.FreeType.Bindings.Core.Glyph where

import           Graphics.FreeType.Bindings.Core.Base
import           Graphics.FreeType.Bindings.Core.Types
import           Graphics.FreeType.Bindings.Support.Outline

import           Foreign.C.Types
import           Foreign.Ptr
import           Foreign.Storable

#include "ft2build.h"
#include FT_FREETYPE_H

#include "freetype/ftglyph.h"

type FT_Glyph = Ptr FT_GlyphRec



data FT_Glyph_Class

data FT_GlyphRec = FT_GlyphRec
                     { glyphRecLibrary :: FT_Library
                     , glyphRecClazz   :: Ptr FT_Glyph_Class
                     , glyphRecFormat  :: FT_Glyph_Format
                     , glyphRecAdvance :: FT_Vector
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
    #{poke struct FT_GlyphRec_, library} ptr $ glyphRecLibrary val
    #{poke struct FT_GlyphRec_, clazz  } ptr $ glyphRecClazz   val
    #{poke struct FT_GlyphRec_, format } ptr $ glyphRecFormat  val
    #{poke struct FT_GlyphRec_, advance} ptr $ glyphRecAdvance val



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
    #{poke struct FT_BitmapGlyphRec_, root  } ptr $ bgrRoot   val
    #{poke struct FT_BitmapGlyphRec_, left  } ptr $ bgrLeft   val
    #{poke struct FT_BitmapGlyphRec_, top   } ptr $ bgrTop    val
    #{poke struct FT_BitmapGlyphRec_, bitmap} ptr $ bgrBitmap val



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
    #{poke struct FT_OutlineGlyphRec_, root   } ptr $ ogrRoot    val
    #{poke struct FT_OutlineGlyphRec_, outline} ptr $ ogrOutline val



foreign import ccall "FT_New_Glyph"
  ft_New_Glyph :: FT_Library -> FT_Glyph_Format -> Ptr FT_Glyph -> IO FT_Error



foreign import ccall "FT_Get_Glyph"
  ft_Get_Glyph :: FT_GlyphSlot -> Ptr FT_Glyph -> IO FT_Error



foreign import ccall "FT_Glyph_Copy"
  ft_Glyph_Copy :: FT_Glyph -> Ptr FT_Glyph -> IO FT_Error



foreign import ccall "FT_Glyph_Transform"
  ft_Glyph_Transform :: FT_Glyph -> Ptr FT_Matrix -> Ptr FT_Vector -> IO FT_Error



newtype FT_Glyph_BBox_Mode = FT_Glyph_BBox_Mode { unFT_Glyph_BBox_Mode :: CInt }
                             deriving (Show, Eq, Storable)

#{enum FT_Glyph_BBox_Mode, FT_Glyph_BBox_Mode
 , ft_GLYPH_BBOX_UNSCALED  = FT_GLYPH_BBOX_UNSCALED
 , ft_GLYPH_BBOX_SUBPIXELS = FT_GLYPH_BBOX_SUBPIXELS
 , ft_GLYPH_BBOX_GRIDFIT   = FT_GLYPH_BBOX_GRIDFIT
 , ft_GLYPH_BBOX_TRUNCATE  = FT_GLYPH_BBOX_TRUNCATE
 , ft_GLYPH_BBOX_PIXELS    = FT_GLYPH_BBOX_PIXELS
 }



foreign import ccall "FT_Glyph_Get_CBox"
  ft_Glyph_Get_CBox :: FT_Glyph -> FT_UInt -> Ptr FT_BBox -> IO ()



foreign import ccall "FT_Glyph_To_Bitmap"
  ft_Glyph_To_Bitmap :: Ptr FT_Glyph -> FT_Render_Mode -> Ptr FT_Vector -> FT_Bool -> IO FT_Error



foreign import ccall "FT_Done_Glyph"
  ft_Done_Glyph :: FT_Glyph -> IO ()
