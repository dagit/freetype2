{-# LANGUAGE ForeignFunctionInterface
           , PatternSynonyms #-}

{- | Please refer to the
     [Core API > Glyph Layer Management](https://www.freetype.org/freetype2/docs/reference/ft2-layer_management.html)
     chapter of the reference.
-}

module FreeType.Core.Layer
  ( -- ** FT_LayerIterator
    FT_LayerIterator (..)
    -- ** FT_Get_Color_Glyph_Layer
  , ft_Get_Color_Glyph_Layer
    -- ** FT_PaintFormat
  , FT_PaintFormat
  , pattern FT_COLR_PAINTFORMAT_COLR_LAYERS    
  , pattern FT_COLR_PAINTFORMAT_SOLID          
  , pattern FT_COLR_PAINTFORMAT_LINEAR_GRADIENT
  , pattern FT_COLR_PAINTFORMAT_RADIAL_GRADIENT
  , pattern FT_COLR_PAINTFORMAT_SWEEP_GRADIENT 
  , pattern FT_COLR_PAINTFORMAT_GLYPH          
  , pattern FT_COLR_PAINTFORMAT_COLR_GLYPH     
  , pattern FT_COLR_PAINTFORMAT_TRANSFORM      
  , pattern FT_COLR_PAINTFORMAT_TRANSLATE      
  , pattern FT_COLR_PAINTFORMAT_SCALE          
  , pattern FT_COLR_PAINTFORMAT_ROTATE         
  , pattern FT_COLR_PAINTFORMAT_SKEW           
  , pattern FT_COLR_PAINTFORMAT_COMPOSITE      
  , pattern FT_COLR_PAINT_FORMAT_MAX           
  , pattern FT_COLR_PAINTFORMAT_UNSUPPORTED 
    -- ** FT_ColorStopIterator
  , FT_ColorStopIterator (..)
    -- ** FT_ColorIndex
  , FT_ColorIndex (..)
    -- ** FT_ColorStop
  , FT_ColorStop (..)
    -- ** FT_PaintExtend
  , FT_PaintExtend
  , pattern FT_COLR_PAINT_EXTEND_PAD    
  , pattern FT_COLR_PAINT_EXTEND_REPEAT 
  , pattern FT_COLR_PAINT_EXTEND_REFLECT
    -- ** FT_ColorLine
  , FT_ColorLine (..)
    -- ** FT_Affine23
  , FT_Affine23 (..)
    -- ** FT_Composite_Mode
  , FT_Composite_Mode
  , pattern FT_COLR_COMPOSITE_CLEAR         
  , pattern FT_COLR_COMPOSITE_SRC           
  , pattern FT_COLR_COMPOSITE_DEST          
  , pattern FT_COLR_COMPOSITE_SRC_OVER      
  , pattern FT_COLR_COMPOSITE_DEST_OVER     
  , pattern FT_COLR_COMPOSITE_SRC_IN        
  , pattern FT_COLR_COMPOSITE_DEST_IN       
  , pattern FT_COLR_COMPOSITE_SRC_OUT       
  , pattern FT_COLR_COMPOSITE_DEST_OUT      
  , pattern FT_COLR_COMPOSITE_SRC_ATOP      
  , pattern FT_COLR_COMPOSITE_DEST_ATOP     
  , pattern FT_COLR_COMPOSITE_XOR           
  , pattern FT_COLR_COMPOSITE_PLUS          
  , pattern FT_COLR_COMPOSITE_SCREEN        
  , pattern FT_COLR_COMPOSITE_OVERLAY       
  , pattern FT_COLR_COMPOSITE_DARKEN        
  , pattern FT_COLR_COMPOSITE_LIGHTEN       
  , pattern FT_COLR_COMPOSITE_COLOR_DODGE   
  , pattern FT_COLR_COMPOSITE_COLOR_BURN    
  , pattern FT_COLR_COMPOSITE_HARD_LIGHT    
  , pattern FT_COLR_COMPOSITE_SOFT_LIGHT    
  , pattern FT_COLR_COMPOSITE_DIFFERENCE    
  , pattern FT_COLR_COMPOSITE_EXCLUSION     
  , pattern FT_COLR_COMPOSITE_MULTIPLY      
  , pattern FT_COLR_COMPOSITE_HSL_HUE       
  , pattern FT_COLR_COMPOSITE_HSL_SATURATION
  , pattern FT_COLR_COMPOSITE_HSL_COLOR     
  , pattern FT_COLR_COMPOSITE_HSL_LUMINOSITY
  , pattern FT_COLR_COMPOSITE_MAX
    -- ** FT_OpaquePaint
  , FT_OpaquePaint (..)
    -- ** FT_PaintColrLayers
  , FT_PaintColrLayers (..)
    -- ** FT_PaintSolid
  , FT_PaintSolid (..)
    -- ** FT_PaintLinearGradient
  , FT_PaintLinearGradient (..)
    -- ** FT_PaintRadialGradient
  , FT_PaintRadialGradient (..)
    -- ** FT_PaintSweepGradient
  , FT_PaintSweepGradient (..)
    -- FT_PaintGlyph
  , FT_PaintGlyph (..)
    -- ** FT_PaintColrGlyph
  , FT_PaintColrGlyph (..)
    -- ** FT_PaintTransform
  , FT_PaintTransform (..)
    -- ** FT_PaintTranslate
  , FT_PaintTranslate (..)
    -- ** FT_PaintScale
  , FT_PaintScale (..)
    -- ** FT_PaintRotate
  , FT_PaintRotate (..)
    -- ** FT_PaintSkew
  , FT_PaintSkew (..)
    -- ** FT_PaintComposite
  , FT_PaintComposite (..)
    -- ** FT_COLR_Paint
  , FT_COLR_Paint (..)
    -- ** FT_Color_Root_Transform
  , FT_Color_Root_Transform
  , pattern FT_COLOR_INCLUDE_ROOT_TRANSFORM
  , pattern FT_COLOR_NO_ROOT_TRANSFORM
  , pattern FT_COLOR_ROOT_TRANSFORM_MAX
    -- ** FT_ClipBox
  , FT_ClipBox (..)
    -- ** FT_Get_Color_Glyph_Paint
  , ft_Get_Color_Glyph_Paint
    -- ** FT_Get_Color_Glyph_ClipBox
  , ft_Get_Color_Glyph_ClipBox
    -- ** FT_Get_Paint_Layers
  , ft_Get_Paint_Layers
    -- ** FT_Get_Colorline_Stops
  , ft_Get_Colorline_Stops
    -- ** FT_Get_Paint
  , ft_Get_Paint
  ) where

import           FreeType.Core.Base.Types
import           FreeType.Core.Layer.Types
import           FreeType.Core.Types.Types

import           Foreign.Ptr

#include "ft2build.h"
#include FT_COLOR_H
#include "ftlayer-plus.h"

foreign import ccall "FT_Get_Color_Glyph_Layer"
  ft_Get_Color_Glyph_Layer
    :: FT_Face              -- ^ face
    -> FT_UInt              -- ^ base_glyph
    -> Ptr FT_UInt          -- ^ aglyph_index
    -> Ptr FT_UInt          -- ^ acolor_index
    -> Ptr FT_LayerIterator -- ^ iterator
    -> IO FT_Bool


pattern FT_COLR_PAINTFORMAT_COLR_LAYERS
      , FT_COLR_PAINTFORMAT_SOLID
      , FT_COLR_PAINTFORMAT_LINEAR_GRADIENT
      , FT_COLR_PAINTFORMAT_RADIAL_GRADIENT
      , FT_COLR_PAINTFORMAT_SWEEP_GRADIENT
      , FT_COLR_PAINTFORMAT_GLYPH
      , FT_COLR_PAINTFORMAT_COLR_GLYPH
      , FT_COLR_PAINTFORMAT_TRANSFORM
      , FT_COLR_PAINTFORMAT_TRANSLATE
      , FT_COLR_PAINTFORMAT_SCALE
      , FT_COLR_PAINTFORMAT_ROTATE
      , FT_COLR_PAINTFORMAT_SKEW
      , FT_COLR_PAINTFORMAT_COMPOSITE
      , FT_COLR_PAINT_FORMAT_MAX
      , FT_COLR_PAINTFORMAT_UNSUPPORTED
     :: (Eq a, Num a) => a
pattern FT_COLR_PAINTFORMAT_COLR_LAYERS     = #const FT_COLR_PAINTFORMAT_COLR_LAYERS
pattern FT_COLR_PAINTFORMAT_SOLID           = #const FT_COLR_PAINTFORMAT_SOLID
pattern FT_COLR_PAINTFORMAT_LINEAR_GRADIENT = #const FT_COLR_PAINTFORMAT_LINEAR_GRADIENT
pattern FT_COLR_PAINTFORMAT_RADIAL_GRADIENT = #const FT_COLR_PAINTFORMAT_RADIAL_GRADIENT
pattern FT_COLR_PAINTFORMAT_SWEEP_GRADIENT  = #const FT_COLR_PAINTFORMAT_SWEEP_GRADIENT
pattern FT_COLR_PAINTFORMAT_GLYPH           = #const FT_COLR_PAINTFORMAT_GLYPH
pattern FT_COLR_PAINTFORMAT_COLR_GLYPH      = #const FT_COLR_PAINTFORMAT_COLR_GLYPH
pattern FT_COLR_PAINTFORMAT_TRANSFORM       = #const FT_COLR_PAINTFORMAT_TRANSFORM
pattern FT_COLR_PAINTFORMAT_TRANSLATE       = #const FT_COLR_PAINTFORMAT_TRANSLATE
pattern FT_COLR_PAINTFORMAT_SCALE           = #const FT_COLR_PAINTFORMAT_SCALE
pattern FT_COLR_PAINTFORMAT_ROTATE          = #const FT_COLR_PAINTFORMAT_ROTATE
pattern FT_COLR_PAINTFORMAT_SKEW            = #const FT_COLR_PAINTFORMAT_SKEW
pattern FT_COLR_PAINTFORMAT_COMPOSITE       = #const FT_COLR_PAINTFORMAT_COMPOSITE
pattern FT_COLR_PAINT_FORMAT_MAX            = #const FT_COLR_PAINT_FORMAT_MAX
pattern FT_COLR_PAINTFORMAT_UNSUPPORTED     = #const FT_COLR_PAINTFORMAT_UNSUPPORTED



pattern FT_COLR_PAINT_EXTEND_PAD
      , FT_COLR_PAINT_EXTEND_REPEAT
      , FT_COLR_PAINT_EXTEND_REFLECT
     :: (Eq a, Num a) => a
pattern FT_COLR_PAINT_EXTEND_PAD     = #const FT_COLR_PAINT_EXTEND_PAD
pattern FT_COLR_PAINT_EXTEND_REPEAT  = #const FT_COLR_PAINT_EXTEND_REPEAT
pattern FT_COLR_PAINT_EXTEND_REFLECT = #const FT_COLR_PAINT_EXTEND_REFLECT



pattern FT_COLR_COMPOSITE_CLEAR
      , FT_COLR_COMPOSITE_SRC
      , FT_COLR_COMPOSITE_DEST
      , FT_COLR_COMPOSITE_SRC_OVER
      , FT_COLR_COMPOSITE_DEST_OVER
      , FT_COLR_COMPOSITE_SRC_IN
      , FT_COLR_COMPOSITE_DEST_IN
      , FT_COLR_COMPOSITE_SRC_OUT
      , FT_COLR_COMPOSITE_DEST_OUT
      , FT_COLR_COMPOSITE_SRC_ATOP
      , FT_COLR_COMPOSITE_DEST_ATOP
      , FT_COLR_COMPOSITE_XOR
      , FT_COLR_COMPOSITE_PLUS
      , FT_COLR_COMPOSITE_SCREEN
      , FT_COLR_COMPOSITE_OVERLAY
      , FT_COLR_COMPOSITE_DARKEN
      , FT_COLR_COMPOSITE_LIGHTEN
      , FT_COLR_COMPOSITE_COLOR_DODGE
      , FT_COLR_COMPOSITE_COLOR_BURN
      , FT_COLR_COMPOSITE_HARD_LIGHT
      , FT_COLR_COMPOSITE_SOFT_LIGHT
      , FT_COLR_COMPOSITE_DIFFERENCE
      , FT_COLR_COMPOSITE_EXCLUSION
      , FT_COLR_COMPOSITE_MULTIPLY
      , FT_COLR_COMPOSITE_HSL_HUE
      , FT_COLR_COMPOSITE_HSL_SATURATION
      , FT_COLR_COMPOSITE_HSL_COLOR
      , FT_COLR_COMPOSITE_HSL_LUMINOSITY
      , FT_COLR_COMPOSITE_MAX
     :: (Eq a, Num a) => a
pattern FT_COLR_COMPOSITE_CLEAR          = #const FT_COLR_COMPOSITE_CLEAR
pattern FT_COLR_COMPOSITE_SRC            = #const FT_COLR_COMPOSITE_SRC
pattern FT_COLR_COMPOSITE_DEST           = #const FT_COLR_COMPOSITE_DEST
pattern FT_COLR_COMPOSITE_SRC_OVER       = #const FT_COLR_COMPOSITE_SRC_OVER
pattern FT_COLR_COMPOSITE_DEST_OVER      = #const FT_COLR_COMPOSITE_DEST_OVER
pattern FT_COLR_COMPOSITE_SRC_IN         = #const FT_COLR_COMPOSITE_SRC_IN
pattern FT_COLR_COMPOSITE_DEST_IN        = #const FT_COLR_COMPOSITE_DEST_IN
pattern FT_COLR_COMPOSITE_SRC_OUT        = #const FT_COLR_COMPOSITE_SRC_OUT
pattern FT_COLR_COMPOSITE_DEST_OUT       = #const FT_COLR_COMPOSITE_DEST_OUT
pattern FT_COLR_COMPOSITE_SRC_ATOP       = #const FT_COLR_COMPOSITE_SRC_ATOP
pattern FT_COLR_COMPOSITE_DEST_ATOP      = #const FT_COLR_COMPOSITE_DEST_ATOP
pattern FT_COLR_COMPOSITE_XOR            = #const FT_COLR_COMPOSITE_XOR
pattern FT_COLR_COMPOSITE_PLUS           = #const FT_COLR_COMPOSITE_PLUS
pattern FT_COLR_COMPOSITE_SCREEN         = #const FT_COLR_COMPOSITE_SCREEN
pattern FT_COLR_COMPOSITE_OVERLAY        = #const FT_COLR_COMPOSITE_OVERLAY
pattern FT_COLR_COMPOSITE_DARKEN         = #const FT_COLR_COMPOSITE_DARKEN
pattern FT_COLR_COMPOSITE_LIGHTEN        = #const FT_COLR_COMPOSITE_LIGHTEN
pattern FT_COLR_COMPOSITE_COLOR_DODGE    = #const FT_COLR_COMPOSITE_COLOR_DODGE
pattern FT_COLR_COMPOSITE_COLOR_BURN     = #const FT_COLR_COMPOSITE_COLOR_BURN
pattern FT_COLR_COMPOSITE_HARD_LIGHT     = #const FT_COLR_COMPOSITE_HARD_LIGHT
pattern FT_COLR_COMPOSITE_SOFT_LIGHT     = #const FT_COLR_COMPOSITE_SOFT_LIGHT
pattern FT_COLR_COMPOSITE_DIFFERENCE     = #const FT_COLR_COMPOSITE_DIFFERENCE
pattern FT_COLR_COMPOSITE_EXCLUSION      = #const FT_COLR_COMPOSITE_EXCLUSION
pattern FT_COLR_COMPOSITE_MULTIPLY       = #const FT_COLR_COMPOSITE_MULTIPLY
pattern FT_COLR_COMPOSITE_HSL_HUE        = #const FT_COLR_COMPOSITE_HSL_HUE
pattern FT_COLR_COMPOSITE_HSL_SATURATION = #const FT_COLR_COMPOSITE_HSL_SATURATION
pattern FT_COLR_COMPOSITE_HSL_COLOR      = #const FT_COLR_COMPOSITE_HSL_COLOR
pattern FT_COLR_COMPOSITE_HSL_LUMINOSITY = #const FT_COLR_COMPOSITE_HSL_LUMINOSITY
pattern FT_COLR_COMPOSITE_MAX            = #const FT_COLR_COMPOSITE_MAX



pattern FT_COLOR_INCLUDE_ROOT_TRANSFORM
      , FT_COLOR_NO_ROOT_TRANSFORM
      , FT_COLOR_ROOT_TRANSFORM_MAX
     :: (Eq a, Num a) => a
pattern FT_COLOR_INCLUDE_ROOT_TRANSFORM = #const FT_COLOR_INCLUDE_ROOT_TRANSFORM
pattern FT_COLOR_NO_ROOT_TRANSFORM      = #const FT_COLOR_NO_ROOT_TRANSFORM
pattern FT_COLOR_ROOT_TRANSFORM_MAX     = #const FT_COLOR_ROOT_TRANSFORM_MAX



foreign import ccall "FT_Get_Color_Glyph_Paint"
  ft_Get_Color_Glyph_Paint
    :: FT_Face                 -- ^ face
    -> FT_UInt                 -- ^ base_glyph
    -> FT_Color_Root_Transform -- ^ root_transform
    -> Ptr FT_OpaquePaint      -- ^ paint
    -> IO FT_Bool



foreign import ccall "FT_Get_Color_Glyph_ClipBox"
  ft_Get_Color_Glyph_ClipBox
    :: FT_Face        -- ^ face
    -> FT_UInt        -- ^ base_glyph
    -> Ptr FT_ClipBox -- ^ clip_box
    -> IO FT_Bool



foreign import ccall "FT_Get_Paint_Layers"
  ft_Get_Paint_Layers
    :: FT_Face              -- ^ face
    -> Ptr FT_LayerIterator -- ^ iterator
    -> Ptr FT_OpaquePaint   -- ^ paint
    -> IO FT_Bool



foreign import ccall "FT_Get_Colorline_Stops"
  ft_Get_Colorline_Stops
    :: FT_Face                  -- ^ face
    -> Ptr FT_ColorStop         -- ^ color_stop
    -> Ptr FT_ColorStopIterator -- ^ iterator
    -> IO FT_Bool



foreign import ccall "FT_Get_Paint_Plus"
  ft_Get_Paint
    :: FT_Face           -- ^ face
    -> Ptr FT_OpaquePaint-- ^ opaque_paint
    -> Ptr FT_COLR_Paint -- ^ paint
    -> IO FT_Bool
