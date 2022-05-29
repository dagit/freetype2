{-# LANGUAGE TemplateHaskell #-}

module Main where

import           FreeType
import           FreeType.Internal
import           Fields.Lens

import           GHC.IO.Encoding



-- | Checks that field prefixes match the datatype names.
main :: IO ()
main = do
  setLocaleEncoding utf8

  putStrLn "FreeType.Cache"

  putStrLn $(testFieldsFT ''FTC_ScalerRec)
  putStrLn $(testFieldsFT ''FTC_ImageTypeRec)
  putStrLn $(testFieldsFT ''FTC_SBitRec)

  putStrLn "FreeType.Control.Driver"

  putStrLn $(testFieldsFT ''FT_Prop_GlyphToScriptMap)
  putStrLn $(testFieldsFT ''FT_Prop_IncreaseXHeight)

  putStrLn "FreeType.Core.Base"

  putStrLn $(testFieldsFT ''FT_FaceRec)
  putStrLn $(testFieldsFT ''FT_SizeRec)
  putStrLn $(testFieldsFT ''FT_Size_Metrics)
  putStrLn $(testFieldsFT ''FT_GlyphSlotRec)
  putStrLn $(testFieldsFT ''FT_Glyph_Metrics)
  putStrLn $(testFieldsFT ''FT_Bitmap_Size)
  putStrLn $(testFieldsFT ''FT_Open_Args)
  putStrLn $(testFieldsFT ''FT_Parameter)
  putStrLn $(testFieldsFT ''FT_Size_RequestRec)
  putStrLn $(testFieldsFT ''FT_CharMapRec)

  putStrLn "FreeType.Core.Color"

  putStrLn $(testFieldsFT ''FT_Color)
  putStrLn $(testFieldsFT ''FT_Palette_Data)

  putStrLn "FreeType.Core.Glyph"

  putStrLn $(testFieldsFT ''FT_GlyphRec)
  putStrLn $(testFieldsFT ''FT_BitmapGlyphRec)
  putStrLn $(testFieldsFT ''FT_OutlineGlyphRec)

  putStrLn "FreeType.Core.Layer"

  putStrLn $(testFieldsFT ''FT_LayerIterator)

  putStrLn "FreeType.Core.Types"

  putStrLn $(testFieldsFT ''FT_Vector)
  putStrLn $(testFieldsFT ''FT_BBox)
  putStrLn $(testFieldsFT ''FT_Matrix)
  putStrLn $(testFieldsFT ''FT_UnitVector)
  putStrLn $(testFieldsFT ''FT_Data)
  putStrLn $(testFieldsFT ''FT_Generic)
  putStrLn $(testFieldsFT ''FT_Bitmap)

  putStrLn "FreeType.Format.BDF"

  putStrLn $(testFieldsFT ''BDF_PropertyRec)

  putStrLn "FreeType.Format.Multiple"

  putStrLn $(testFieldsFT ''FT_MM_Axis)
  putStrLn $(testFieldsFT ''FT_Multi_Master)
  putStrLn $(testFieldsFT ''FT_Var_Axis)
  putStrLn $(testFieldsFT ''FT_Var_Named_Style)
  putStrLn $(testFieldsFT ''FT_MM_Var)

  putStrLn "FreeType.Format.SFNT"

  putStrLn $(testFieldsFT ''FT_SfntName)
  putStrLn $(testFieldsFT ''FT_SfntLangTag)

  putStrLn "FreeType.Format.TrueType"

  putStrLn $(testFieldsFT ''TT_Header)
  putStrLn $(testFieldsFT ''TT_HoriHeader)
  putStrLn $(testFieldsFT ''TT_VertHeader)
  putStrLn $(testFieldsFT ''TT_OS2)
  putStrLn $(testFieldsFT ''TT_Postscript)
  putStrLn $(testFieldsFT ''TT_PCLT)
  putStrLn $(testFieldsFT ''TT_MaxProfile)

  putStrLn "FreeType.Format.Type1"

  putStrLn $(testFieldsFT ''PS_FontInfoRec)
  putStrLn $(testFieldsFT ''PS_PrivateRec)
  putStrLn $(testFieldsFT ''CID_FaceDictRec)
  putStrLn $(testFieldsFT ''CID_FaceInfoRec)

  putStrLn "FreeType.Format.WinFNT"

  putStrLn $(testFieldsFT ''FT_WinFNT_HeaderRec)

  putStrLn "FreeType.Miscellaneous.Incremental"

  putStrLn $(testFieldsFT ''FT_Incremental_MetricsRec)
  putStrLn $(testFieldsFT ''FT_Incremental_FuncsRec)
  putStrLn $(testFieldsFT ''FT_Incremental_InterfaceRec)

  putStrLn "FreeType.Support.List"

  putStrLn $(testFieldsFT ''FT_ListNodeRec)
  putStrLn $(testFieldsFT ''FT_ListRec)

  putStrLn "FreeType.Support.Module"

  putStrLn $(testFieldsFT ''FT_Module_Class)
  putStrLn $(testFieldsFT ''FT_Renderer_Class)

  putStrLn "FreeType.Support.Outline"

  putStrLn $(testFieldsFT ''FT_Outline)
  putStrLn $(testFieldsFT ''FT_Outline_Funcs)

  putStrLn "FreeType.Support.Outline.Internal"

  putStrLn $(testFieldsFT ''FT_Outline_Funcs')

  putStrLn "FreeType.Support.Scanline"

  putStrLn $(testFieldsFT ''FT_Span)
  putStrLn $(testFieldsFT ''FT_Raster_Params)
  putStrLn $(testFieldsFT ''FT_Raster_Funcs)

  putStrLn "FreeType.Support.System"

  putStrLn $(testFieldsFT ''FT_MemoryRec)
  putStrLn $(testFieldsFT ''FT_StreamDesc)
  putStrLn $(testFieldsFT ''FT_StreamRec)
