{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE TemplateHaskell #-}

module FreeType.Lens where

import           FreeType.Internal.Lens
import           FreeType.Cache.Internal
import           FreeType.Circular.Internal
import           FreeType.Core.Base.Internal
import           FreeType.Core.Color.Internal
import           FreeType.Core.Glyph.Internal
import           FreeType.Core.Layer.Internal
import           FreeType.Core.Types.Internal
import           FreeType.Format.BDF.Internal
import           FreeType.Format.Multiple.Internal
import           FreeType.Format.SFNT.Internal
import           FreeType.Format.TrueType.Internal
import           FreeType.Format.Type1.Internal
import           FreeType.Format.WinFNT.Internal
import           FreeType.Miscellaneous.Incremental.Internal
import           FreeType.Support.Module.Internal
import           FreeType.Support.Outline.Internal
import           FreeType.Support.Scanline.Internal



-- FreeType.Raw.Cache

makeFieldsFT ''FTC_ScalerRec

makeFieldsFT ''FTC_ImageTypeRec

makeFieldsFT ''FTC_SBitRec



-- FreeType.Raw.Circular

makeFieldsFT ''FT_FaceRec

makeFieldsFT ''FT_Bitmap_Size

makeFieldsFT ''FT_CharMapRec

makeFieldsFT ''FT_GlyphSlotRec

makeFieldsFT ''FT_SizeRec

makeFieldsFT ''FT_Glyph_Metrics

makeFieldsFT ''FT_Size_Metrics

makeFieldsFT ''FT_MemoryRec

makeFieldsFT ''FT_StreamRec

makeFieldsFT ''FT_StreamDesc

makeFieldsFT ''FT_Outline

makeFieldsFT ''FT_ListRec

makeFieldsFT' ''FT_ListNodeRec
  $ \val -> case val of
              "data" -> "data_"
              _      -> val



-- FreeType.Raw.Core.Base

makeFieldsFT ''FT_Open_Args

makeFieldsFT' ''FT_Parameter
  $ \val -> case val of
              "data" -> "data_"
              _      -> val

makeFieldsFT' ''FT_Size_RequestRec
  $ \val -> case val of
              "type" -> "type_"
              _      -> val



-- FreeType.Raw.Core.Color

makeFieldsFT ''FT_Color

makeFieldsFT ''FT_Palette_Data



-- FreeType.Raw.Core.Glyph

makeFieldsFT ''FT_GlyphRec

makeFieldsFT ''FT_BitmapGlyphRec

makeFieldsFT ''FT_OutlineGlyphRec



-- FreeType.Raw.Core.Layer

makeFieldsFT ''FT_LayerIterator



-- FreeType.Raw.Core.Types

makeFieldsFT ''FT_Vector

makeFieldsFT ''FT_BBox

makeFieldsFT ''FT_Matrix

makeFieldsFT ''FT_UnitVector

makeFieldsFT' ''FT_Data
  $ \val -> case val of
              "length" -> "length_"
              _        -> val

makeFieldsFT' ''FT_Generic
  $ \val -> case val of
              "data" -> "data_"
              _      -> val

makeFieldsFT ''FT_Bitmap



-- FreeType.Raw.Format.BDF

makeFieldsFT' ''BDF_PropertyRec
  $ \val -> case val of
              "type" -> "type_"
              _      -> val



-- FreeType.Raw.Format.Multiple

makeFieldsFT' ''FT_MM_Axis
  $ \val -> case val of
              "minimum" -> "minimum_"
              "maximum" -> "maximum_"
              _         -> val

makeFieldsFT ''FT_Multi_Master

makeFieldsFT' ''FT_Var_Axis
  $ \val -> case val of
              "minimum" -> "minimum_"
              "maximum" -> "maximum_"
              _         -> val

makeFieldsFT ''FT_Var_Named_Style

makeFieldsFT ''FT_MM_Var



-- FreeType.Raw.Format.SFNT

makeFieldsFT ''FT_SfntName

makeFieldsFT ''FT_SfntLangTag



-- FreeType.Raw.Format.TrueType

makeFieldsFT ''TT_Header

makeFieldsFT ''TT_HoriHeader

makeFieldsFT ''TT_VertHeader

makeFieldsFT ''TT_OS2

makeFieldsFT ''TT_Postscript

makeFieldsFT ''TT_PCLT

makeFieldsFT ''TT_MaxProfile



-- FreeType.Raw.Format.Type1

makeFieldsFT ''PS_FontInfoRec

makeFieldsFT ''PS_PrivateRec

makeFieldsFT ''CID_FaceDictRec

makeFieldsFT ''CID_FaceInfoRec



-- FreeType.Raw.Format.WinFNT

makeFieldsFT ''FT_WinFNT_HeaderRec



-- FreeType.Raw.Miscellaneous.Incremental

makeFieldsFT ''FT_Incremental_MetricsRec

makeFieldsFT ''FT_Incremental_FuncsRec

makeFieldsFT ''FT_Incremental_InterfaceRec



-- FreeType.Raw.Support.Module

makeFieldsFT ''FT_Module_Class

makeFieldsFT ''FT_Renderer_Class



-- FreeType.Raw.Support.Outline

makeFieldsFT ''FT_Outline_Funcs



-- FreeType.Raw.Support.Scanline

makeFieldsFT ''FT_Span

makeFieldsFT ''FT_Raster_Params

makeFieldsFT ''FT_Raster_Funcs
