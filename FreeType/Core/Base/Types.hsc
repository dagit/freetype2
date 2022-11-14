{-# LANGUAGE DataKinds
           , EmptyDataDecls
           , FlexibleInstances
           , ForeignFunctionInterface
           , MultiParamTypeClasses #-}
#if __GLASGOW_HASKELL__ >= 902
{-# LANGUAGE NoFieldSelectors #-}
#endif
{-# LANGUAGE PatternSynonyms
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
import           GHC.Records

#include "ft2build.h"
#include FT_FREETYPE_H

data FT_Open_Args = FT_Open_Args
                      { flags       :: FT_UInt
                      , memory_base :: Ptr FT_Byte
                      , memory_size :: FT_Long
                      , pathname    :: Ptr FT_String
                      , stream      :: FT_Stream
                      , driver      :: FT_Module
                      , num_params  :: FT_Int
                      , params      :: Ptr FT_Parameter
                      }

instance Offset "flags"       FT_Open_Args where rawOffset = #{offset struct FT_Open_Args_, flags      }
instance Offset "memory_base" FT_Open_Args where rawOffset = #{offset struct FT_Open_Args_, memory_base}
instance Offset "memory_size" FT_Open_Args where rawOffset = #{offset struct FT_Open_Args_, memory_size}
instance Offset "pathname"    FT_Open_Args where rawOffset = #{offset struct FT_Open_Args_, pathname   }
instance Offset "stream"      FT_Open_Args where rawOffset = #{offset struct FT_Open_Args_, stream     }
instance Offset "driver"      FT_Open_Args where rawOffset = #{offset struct FT_Open_Args_, driver     }
instance Offset "num_params"  FT_Open_Args where rawOffset = #{offset struct FT_Open_Args_, num_params }
instance Offset "params"      FT_Open_Args where rawOffset = #{offset struct FT_Open_Args_, params     }

instance Storable FT_Open_Args where
  sizeOf _    = #size      struct FT_Open_Args_
  alignment _ = #alignment struct FT_Open_Args_

  peek ptr =
    FT_Open_Args
      <$> peek (offset @"flags"       ptr)
      <*> peek (offset @"memory_base" ptr)
      <*> peek (offset @"memory_size" ptr)
      <*> peek (offset @"pathname"    ptr)
      <*> peek (offset @"stream"      ptr)
      <*> peek (offset @"driver"      ptr)
      <*> peek (offset @"num_params"  ptr)
      <*> peek (offset @"params"      ptr)

  poke ptr val = do
    pokeField @"flags"       ptr val
    pokeField @"memory_base" ptr val
    pokeField @"memory_size" ptr val
    pokeField @"pathname"    ptr val
    pokeField @"stream"      ptr val
    pokeField @"driver"      ptr val
    pokeField @"num_params"  ptr val
    pokeField @"params"      ptr val



data FT_Parameter = FT_Parameter
                      { tag   :: FT_ULong
                      , data_ :: FT_Pointer
                      }

instance Offset "tag"   FT_Parameter where rawOffset = #{offset struct FT_Parameter_, tag }
instance Offset "data_" FT_Parameter where rawOffset = #{offset struct FT_Parameter_, data}

instance Storable FT_Parameter where
  sizeOf _    = #size      struct FT_Parameter_
  alignment _ = #alignment struct FT_Parameter_

  peek ptr =
    FT_Parameter
      <$> peek (offset @"tag"   ptr)
      <*> peek (offset @"data_" ptr)

  poke ptr val = do
    pokeField @"tag"   ptr val
    pokeField @"data_" ptr val



type FT_Size_Request_Type = #type enum FT_Size_Request_Type_



data FT_Size_RequestRec = FT_Size_RequestRec
                            { type_          :: FT_Size_Request_Type
                            , width          :: FT_Long
                            , height         :: FT_Long
                            , horiResolution :: FT_UInt
                            , vertResolution :: FT_UInt
                            }

instance Offset "type"           FT_Size_RequestRec where rawOffset = #{offset struct FT_Size_RequestRec_, type          }
instance Offset "width"          FT_Size_RequestRec where rawOffset = #{offset struct FT_Size_RequestRec_, width         }
instance Offset "height"         FT_Size_RequestRec where rawOffset = #{offset struct FT_Size_RequestRec_, height        }
instance Offset "horiResolution" FT_Size_RequestRec where rawOffset = #{offset struct FT_Size_RequestRec_, horiResolution}
instance Offset "vertResolution" FT_Size_RequestRec where rawOffset = #{offset struct FT_Size_RequestRec_, vertResolution}

instance Offset "type_" FT_Size_RequestRec where   
  rawOffset = rawOffset @"type" @FT_Size_RequestRec

instance HasField "type" FT_Size_RequestRec FT_Size_Request_Type where
  getField = getField @"type_" @FT_Size_RequestRec

instance Storable FT_Size_RequestRec where
  sizeOf _    = #size      struct FT_Size_RequestRec_
  alignment _ = #alignment struct FT_Size_RequestRec_

  peek ptr =
    FT_Size_RequestRec
      <$> peek (offset @"type"           ptr)
      <*> peek (offset @"width"          ptr)
      <*> peek (offset @"height"         ptr)
      <*> peek (offset @"horiResolution" ptr)
      <*> peek (offset @"vertResolution" ptr)

  poke ptr val = do
    pokeField @"type"           ptr val
    pokeField @"width"          ptr val
    pokeField @"height"         ptr val
    pokeField @"horiResolution" ptr val
    pokeField @"vertResolution" ptr val



type FT_Size_Request = Ptr FT_Size_RequestRec



type FT_Render_Mode = #type enum FT_Render_Mode_



type FT_Kerning_Mode = #type enum FT_Kerning_Mode_
