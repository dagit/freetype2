{-# LANGUAGE DataKinds
           , EmptyDataDecls
           , FlexibleInstances
           , ForeignFunctionInterface
           , MultiParamTypeClasses
           , PatternSynonyms
           , TypeApplications #-}

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

import           Data.Word
import           Foreign.Ptr
import           Foreign.Storable
import           Foreign.Storable.Offset

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

instance Offset "oaFlags"       FT_Open_Args where rawOffset = #{offset struct FT_Open_Args_, flags      }
instance Offset "oaMemory_base" FT_Open_Args where rawOffset = #{offset struct FT_Open_Args_, memory_base}
instance Offset "oaMemory_size" FT_Open_Args where rawOffset = #{offset struct FT_Open_Args_, memory_size}
instance Offset "oaPathname"    FT_Open_Args where rawOffset = #{offset struct FT_Open_Args_, pathname   }
instance Offset "oaStream"      FT_Open_Args where rawOffset = #{offset struct FT_Open_Args_, stream     }
instance Offset "oaDriver"      FT_Open_Args where rawOffset = #{offset struct FT_Open_Args_, driver     }
instance Offset "oaNum_params"  FT_Open_Args where rawOffset = #{offset struct FT_Open_Args_, num_params }
instance Offset "oaParams"      FT_Open_Args where rawOffset = #{offset struct FT_Open_Args_, params     }

instance Storable FT_Open_Args where
  sizeOf _    = #size      struct FT_Open_Args_
  alignment _ = #alignment struct FT_Open_Args_

  peek ptr =
    FT_Open_Args
      <$> peek (offset @"oaFlags"       ptr)
      <*> peek (offset @"oaMemory_base" ptr)
      <*> peek (offset @"oaMemory_size" ptr)
      <*> peek (offset @"oaPathname"    ptr)
      <*> peek (offset @"oaStream"      ptr)
      <*> peek (offset @"oaDriver"      ptr)
      <*> peek (offset @"oaNum_params"  ptr)
      <*> peek (offset @"oaParams"      ptr)

  poke ptr val = do
    pokeField @"oaFlags"       ptr val
    pokeField @"oaMemory_base" ptr val
    pokeField @"oaMemory_size" ptr val
    pokeField @"oaPathname"    ptr val
    pokeField @"oaStream"      ptr val
    pokeField @"oaDriver"      ptr val
    pokeField @"oaNum_params"  ptr val
    pokeField @"oaParams"      ptr val



data FT_Parameter = FT_Parameter
                      { pTag  :: FT_ULong
                      , pData :: FT_Pointer
                      }

instance Offset "pTag"  FT_Parameter where rawOffset = #{offset struct FT_Parameter_, tag }
instance Offset "pData" FT_Parameter where rawOffset = #{offset struct FT_Parameter_, data}

instance Storable FT_Parameter where
  sizeOf _    = #size      struct FT_Parameter_
  alignment _ = #alignment struct FT_Parameter_

  peek ptr =
    FT_Parameter
      <$> peek (offset @"pTag"  ptr)
      <*> peek (offset @"pData" ptr)

  poke ptr val = do
    pokeField @"pTag"  ptr val
    pokeField @"pData" ptr val



type FT_Size_Request_Type = #type enum FT_Size_Request_Type_



data FT_Size_RequestRec = FT_Size_RequestRec
                            { srrType           :: FT_Size_Request_Type
                            , srrWidth          :: FT_Long
                            , srrHeight         :: FT_Long
                            , srrHoriResolution :: FT_UInt
                            , srrVertResolution :: FT_UInt
                            }

instance Offset "srrType"           FT_Size_RequestRec where rawOffset = #{offset struct FT_Size_RequestRec_, type          }
instance Offset "srrWidth"          FT_Size_RequestRec where rawOffset = #{offset struct FT_Size_RequestRec_, width         }
instance Offset "srrHeight"         FT_Size_RequestRec where rawOffset = #{offset struct FT_Size_RequestRec_, height        }
instance Offset "srrHoriResolution" FT_Size_RequestRec where rawOffset = #{offset struct FT_Size_RequestRec_, horiResolution}
instance Offset "srrVertResolution" FT_Size_RequestRec where rawOffset = #{offset struct FT_Size_RequestRec_, vertResolution}

instance Storable FT_Size_RequestRec where
  sizeOf _    = #size      struct FT_Size_RequestRec_
  alignment _ = #alignment struct FT_Size_RequestRec_

  peek ptr =
    FT_Size_RequestRec
      <$> peek (offset @"srrType"           ptr)
      <*> peek (offset @"srrWidth"          ptr)
      <*> peek (offset @"srrHeight"         ptr)
      <*> peek (offset @"srrHoriResolution" ptr)
      <*> peek (offset @"srrVertResolution" ptr)

  poke ptr val = do
    pokeField @"srrType"           ptr val
    pokeField @"srrWidth"          ptr val
    pokeField @"srrHeight"         ptr val
    pokeField @"srrHoriResolution" ptr val
    pokeField @"srrVertResolution" ptr val



type FT_Size_Request = Ptr FT_Size_RequestRec



type FT_Render_Mode = #type enum FT_Render_Mode_



type FT_Kerning_Mode = #type enum FT_Kerning_Mode_
