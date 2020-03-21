{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}

module FreeType.Core.Base.Types
  ( FT_Library
  , FT_LibraryRec
  , FT_Face
  , FT_Size
  , FT_GlyphSlot
  , FT_CharMap
  , FT_Encoding
  , pattern FT_ENCODING_NONE
  , pattern FT_ENCODING_MS_SYMBOL
  , pattern FT_ENCODING_UNICODE
  , pattern FT_ENCODING_SJIS
  , pattern FT_ENCODING_PRC
  , pattern FT_ENCODING_BIG5
  , pattern FT_ENCODING_WANSUNG
  , pattern FT_ENCODING_JOHAB
  , pattern FT_ENCODING_ADOBE_STANDARD
  , pattern FT_ENCODING_ADOBE_EXPERT
  , pattern FT_ENCODING_ADOBE_CUSTOM
  , pattern FT_ENCODING_ADOBE_LATIN_1
  , pattern FT_ENCODING_OLD_LATIN_2
  , pattern FT_ENCODING_APPLE_ROMAN
  , FT_FaceRec (..)
  , FT_SizeRec (..)
  , FT_Size_Metrics (..)
  , FT_GlyphSlotRec (..)
  , FT_Glyph_Metrics (..)
  , FT_SubGlyph
  , FT_SubGlyphRec
  , FT_Bitmap_Size (..)
  , FT_Open_Args (..)
  , FT_Parameter (..)
  , FT_Size_Request_Type
  , FT_Size_RequestRec (..)
  , FT_Size_Request
  , FT_Render_Mode
  , FT_Kerning_Mode
  , FT_CharMapRec (..)
  , FT_Face_Internal
  , FT_Face_InternalRec
  , FT_Size_Internal
  , FT_Size_InternalRec
  , FT_Slot_Internal
  , FT_Slot_InternalRec
  ) where

import           FreeType.Circular.Types
import           FreeType.Core.Types.Types

import           Data.Function ((&))
import           Data.Word
import           Foreign.Ptr
import           Foreign.Storable

#include "ft2build.h"
#include FT_FREETYPE_H

data FT_Open_Args = FT_Open_Args
                      { oaFlags       :: FT_UInt
                      , oaMemory_base :: Ptr FT_Byte
                      , oaMemory_size :: FT_Long
                      , oaPathname    :: Ptr FT_String
                      , oaStream      :: FT_Stream
                      , oaDriver      :: FT_Module
                      , oaNum_params  :: FT_Int
                      , oaParams      :: Ptr FT_Parameter
                      }

instance Storable FT_Open_Args where
  sizeOf _    = #size      struct FT_Open_Args_
  alignment _ = #alignment struct FT_Open_Args_

  peek ptr =
    FT_Open_Args
      <$> #{peek struct FT_Open_Args_, flags      } ptr
      <*> #{peek struct FT_Open_Args_, memory_base} ptr
      <*> #{peek struct FT_Open_Args_, memory_size} ptr
      <*> #{peek struct FT_Open_Args_, pathname   } ptr
      <*> #{peek struct FT_Open_Args_, stream     } ptr
      <*> #{peek struct FT_Open_Args_, driver     } ptr
      <*> #{peek struct FT_Open_Args_, num_params } ptr
      <*> #{peek struct FT_Open_Args_, params     } ptr

  poke ptr val = do
    #{poke struct FT_Open_Args_, flags      } ptr $ val & oaFlags
    #{poke struct FT_Open_Args_, memory_base} ptr $ val & oaMemory_base
    #{poke struct FT_Open_Args_, memory_size} ptr $ val & oaMemory_size
    #{poke struct FT_Open_Args_, pathname   } ptr $ val & oaPathname
    #{poke struct FT_Open_Args_, stream     } ptr $ val & oaStream
    #{poke struct FT_Open_Args_, driver     } ptr $ val & oaDriver
    #{poke struct FT_Open_Args_, num_params } ptr $ val & oaNum_params
    #{poke struct FT_Open_Args_, params     } ptr $ val & oaParams



data FT_Parameter = FT_Parameter
                      { pTag  :: FT_ULong
                      , pData :: FT_Pointer
                      }

instance Storable FT_Parameter where
  sizeOf _    = #size      struct FT_Parameter_
  alignment _ = #alignment struct FT_Parameter_

  peek ptr =
    FT_Parameter
      <$> #{peek struct FT_Parameter_, tag } ptr
      <*> #{peek struct FT_Parameter_, data} ptr

  poke ptr val = do
    #{poke struct FT_Parameter_, tag } ptr $ val & pTag
    #{poke struct FT_Parameter_, data} ptr $ val & pData



type FT_Size_Request_Type = #type enum FT_Size_Request_Type_



data FT_Size_RequestRec = FT_Size_RequestRec
                            { srrType           :: FT_Size_Request_Type
                            , srrWidth          :: FT_Long
                            , srrHeight         :: FT_Long
                            , srrHoriResolution :: FT_UInt
                            , srrVertResolution :: FT_UInt
                            }

instance Storable FT_Size_RequestRec where
  sizeOf _    = #size      struct FT_Size_RequestRec_
  alignment _ = #alignment struct FT_Size_RequestRec_

  peek ptr =
    FT_Size_RequestRec
      <$> #{peek struct FT_Size_RequestRec_, type          } ptr
      <*> #{peek struct FT_Size_RequestRec_, width         } ptr
      <*> #{peek struct FT_Size_RequestRec_, height        } ptr
      <*> #{peek struct FT_Size_RequestRec_, horiResolution} ptr
      <*> #{peek struct FT_Size_RequestRec_, vertResolution} ptr

  poke ptr val = do
    #{poke struct FT_Size_RequestRec_, type          } ptr $ val & srrType
    #{poke struct FT_Size_RequestRec_, width         } ptr $ val & srrWidth
    #{poke struct FT_Size_RequestRec_, height        } ptr $ val & srrHeight
    #{poke struct FT_Size_RequestRec_, horiResolution} ptr $ val & srrHoriResolution
    #{poke struct FT_Size_RequestRec_, vertResolution} ptr $ val & srrVertResolution


type FT_Size_Request = Ptr FT_Size_RequestRec



type FT_Render_Mode = #type enum FT_Render_Mode_



type FT_Kerning_Mode = #type enum FT_Kerning_Mode_
