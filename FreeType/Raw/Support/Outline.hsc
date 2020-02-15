{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}

module FreeType.Raw.Support.Outline
  ( FT_Outline (..)

  , ft_Outline_New
  , ft_Outline_Done
  , ft_Outline_Copy
  , ft_Outline_Translate
  , ft_Outline_Transform
  , ft_Outline_Embolden
  , ft_Outline_EmboldenXY
  , ft_Outline_Reverse
  , ft_Outline_Check
  , ft_Outline_Get_CBox
  , ft_Outline_Get_BBox
  , ft_Outline_Get_Bitmap
  , ft_Outline_Render
  , ft_Outline_Decompose

  , FT_Outline_Funcs (..)
  , FT_Outline_MoveToFunc
  , FT_Outline_LineToFunc
  , FT_Outline_ConicToFunc
  , FT_Outline_CubicToFunc

  , FT_Orientation
  , pattern FT_ORIENTATION_TRUETYPE
  , pattern FT_ORIENTATION_POSTSCRIPT
  , pattern FT_ORIENTATION_FILL_RIGHT
  , pattern FT_ORIENTATION_FILL_LEFT
  , pattern FT_ORIENTATION_NONE
  
  , ft_Outline_Get_Orientation
 
  , pattern FT_OUTLINE_NONE
  , pattern FT_OUTLINE_OWNER
  , pattern FT_OUTLINE_EVEN_ODD_FILL
  , pattern FT_OUTLINE_REVERSE_FILL
  , pattern FT_OUTLINE_IGNORE_DROPOUTS
  , pattern FT_OUTLINE_SMART_DROPOUTS
  , pattern FT_OUTLINE_INCLUDE_STUBS
  , pattern FT_OUTLINE_HIGH_PRECISION
  , pattern FT_OUTLINE_SINGLE_PASS

  ) where

import           FreeType.Raw.Circular
import           FreeType.Raw.Core.Types
import           FreeType.Raw.Support.Scanline

import           Foreign.C.Types
import           Foreign.Ptr
import           Foreign.Storable

#include "ft2build.h"
#include FT_FREETYPE_H

#include "freetype/ftimage.h"
#include "freetype/ftoutln.h"

foreign import ccall "FT_Outline_New"
  ft_Outline_New :: FT_Library -> FT_UInt -> FT_Int -> Ptr FT_Outline -> IO FT_Error



foreign import ccall "FT_Outline_Done"
  ft_Outline_Done :: FT_Library -> Ptr FT_Outline -> IO FT_Error



foreign import ccall "FT_Outline_Copy"
  ft_Outline_Copy :: Ptr FT_Outline -> Ptr FT_Outline -> IO FT_Error



foreign import ccall "FT_Outline_Translate"
  ft_Outline_Translate :: Ptr FT_Outline -> FT_Pos -> FT_Pos -> IO ()



foreign import ccall "FT_Outline_Transform"
  ft_Outline_Transform :: Ptr FT_Outline -> Ptr FT_Matrix -> IO ()



foreign import ccall "FT_Outline_Embolden"
  ft_Outline_Embolden :: Ptr FT_Outline -> FT_Pos -> IO FT_Error



foreign import ccall "FT_Outline_EmboldenXY"
  ft_Outline_EmboldenXY :: Ptr FT_Outline -> FT_Pos -> FT_Pos -> IO FT_Error



foreign import ccall "FT_Outline_Reverse"
  ft_Outline_Reverse :: Ptr FT_Outline -> IO ()



foreign import ccall "FT_Outline_Check"
  ft_Outline_Check :: Ptr FT_Outline -> IO FT_Error



foreign import ccall "FT_Outline_Get_CBox"
  ft_Outline_Get_CBox :: Ptr FT_Outline -> Ptr FT_BBox -> IO ()



foreign import ccall "FT_Outline_Get_BBox"
  ft_Outline_Get_BBox :: Ptr FT_Outline -> Ptr FT_BBox -> IO FT_Error



foreign import ccall "FT_Outline_Get_Bitmap"
  ft_Outline_Get_Bitmap :: FT_Library -> Ptr FT_Outline -> Ptr FT_Bitmap -> IO FT_Error



foreign import ccall "FT_Outline_Render"
  ft_Outline_Render :: FT_Library -> Ptr FT_Outline -> Ptr FT_Raster_Params -> IO FT_Error



foreign import ccall "FT_Outline_Decompose"
  ft_Outline_Decompose :: Ptr FT_Outline -> Ptr FT_Outline_Funcs -> Ptr () -> IO FT_Error



data FT_Outline_Funcs = FT_Outline_Funcs
                          { ofMove_to  :: FT_Outline_MoveToFunc
                          , ofLine_to  :: FT_Outline_LineToFunc
                          , ofConic_to :: FT_Outline_ConicToFunc
                          , ofCubic_to :: FT_Outline_CubicToFunc
                          , ofShift    :: CInt
                          , ofDelta    :: FT_Pos
                          }

instance Storable FT_Outline_Funcs where
  sizeOf _    = #size      struct FT_Outline_Funcs_
  alignment _ = #alignment struct FT_Outline_Funcs_

  peek ptr =
    FT_Outline_Funcs
      <$> #{peek struct FT_Outline_Funcs_, move_to } ptr
      <*> #{peek struct FT_Outline_Funcs_, line_to } ptr
      <*> #{peek struct FT_Outline_Funcs_, conic_to} ptr
      <*> #{peek struct FT_Outline_Funcs_, cubic_to} ptr
      <*> #{peek struct FT_Outline_Funcs_, shift   } ptr
      <*> #{peek struct FT_Outline_Funcs_, delta   } ptr

  poke ptr val = do
    #{poke struct FT_Outline_Funcs_, move_to } ptr $ ofMove_to  val
    #{poke struct FT_Outline_Funcs_, line_to } ptr $ ofLine_to  val
    #{poke struct FT_Outline_Funcs_, conic_to} ptr $ ofConic_to val
    #{poke struct FT_Outline_Funcs_, cubic_to} ptr $ ofCubic_to val
    #{poke struct FT_Outline_Funcs_, shift   } ptr $ ofShift    val
    #{poke struct FT_Outline_Funcs_, delta   } ptr $ ofDelta    val



type FT_Outline_MoveToFunc = FunPtr (Ptr FT_Vector -> Ptr () -> IO CInt)



type FT_Outline_LineToFunc = FunPtr (Ptr FT_Vector -> Ptr () -> IO CInt)



type FT_Outline_ConicToFunc = FunPtr (Ptr FT_Vector -> Ptr FT_Vector -> Ptr () -> IO CInt)



type FT_Outline_CubicToFunc = FunPtr (Ptr FT_Vector -> Ptr FT_Vector -> Ptr FT_Vector -> Ptr () -> IO CInt)



type FT_Orientation = FT_Int32

pattern FT_ORIENTATION_TRUETYPE
      , FT_ORIENTATION_POSTSCRIPT
      , FT_ORIENTATION_FILL_RIGHT
      , FT_ORIENTATION_FILL_LEFT
      , FT_ORIENTATION_NONE
     :: FT_Orientation
pattern FT_ORIENTATION_TRUETYPE   = #const FT_ORIENTATION_TRUETYPE
pattern FT_ORIENTATION_POSTSCRIPT = #const FT_ORIENTATION_POSTSCRIPT
pattern FT_ORIENTATION_FILL_RIGHT = #const FT_ORIENTATION_FILL_RIGHT
pattern FT_ORIENTATION_FILL_LEFT  = #const FT_ORIENTATION_FILL_LEFT
pattern FT_ORIENTATION_NONE       = #const FT_ORIENTATION_NONE



foreign import ccall "FT_Outline_Get_Orientation"
  ft_Outline_Get_Orientation :: Ptr FT_Outline -> IO FT_Orientation



pattern FT_OUTLINE_NONE
      , FT_OUTLINE_OWNER
      , FT_OUTLINE_EVEN_ODD_FILL
      , FT_OUTLINE_REVERSE_FILL
      , FT_OUTLINE_IGNORE_DROPOUTS
      , FT_OUTLINE_SMART_DROPOUTS
      , FT_OUTLINE_INCLUDE_STUBS
      , FT_OUTLINE_HIGH_PRECISION
      , FT_OUTLINE_SINGLE_PASS
     :: FT_Int32
pattern FT_OUTLINE_NONE            = #const FT_OUTLINE_NONE
pattern FT_OUTLINE_OWNER           = #const FT_OUTLINE_OWNER
pattern FT_OUTLINE_EVEN_ODD_FILL   = #const FT_OUTLINE_EVEN_ODD_FILL
pattern FT_OUTLINE_REVERSE_FILL    = #const FT_OUTLINE_REVERSE_FILL
pattern FT_OUTLINE_IGNORE_DROPOUTS = #const FT_OUTLINE_IGNORE_DROPOUTS
pattern FT_OUTLINE_SMART_DROPOUTS  = #const FT_OUTLINE_SMART_DROPOUTS
pattern FT_OUTLINE_INCLUDE_STUBS   = #const FT_OUTLINE_INCLUDE_STUBS
pattern FT_OUTLINE_HIGH_PRECISION  = #const FT_OUTLINE_HIGH_PRECISION
pattern FT_OUTLINE_SINGLE_PASS     = #const FT_OUTLINE_SINGLE_PASS
