{-# LANGUAGE DataKinds
           , DuplicateRecordFields
           , FlexibleInstances
           , MultiParamTypeClasses #-}
#if __GLASGOW_HASKELL__ >= 902
{-# LANGUAGE NoFieldSelectors #-}
#endif
{-# LANGUAGE TypeApplications #-}

module FreeType.Core.Layer.Types where

import           FreeType.Core.Types.Types

import           Data.Word
import           Foreign.Ptr
import           Foreign.Storable
import           Foreign.Storable.Offset
import           GHC.Records

#include "ft2build.h"
#include FT_COLOR_H

data FT_LayerIterator = FT_LayerIterator
                          { num_layers :: FT_UInt
                          , layer      :: FT_UInt
                          , p          :: Ptr FT_Byte
                          }

instance Offset "num_layers" FT_LayerIterator where rawOffset = #{offset struct FT_LayerIterator_, num_layers}
instance Offset "layer"      FT_LayerIterator where rawOffset = #{offset struct FT_LayerIterator_, layer     }
instance Offset "p"          FT_LayerIterator where rawOffset = #{offset struct FT_LayerIterator_, p         }

instance Storable FT_LayerIterator where
  sizeOf _    = #size      struct FT_LayerIterator_
  alignment _ = #alignment struct FT_LayerIterator_

  peek ptr =
    FT_LayerIterator
      <$> peek (offset @"num_layers" ptr)
      <*> peek (offset @"layer"      ptr)
      <*> peek (offset @"p"          ptr)

  poke ptr val = do
    pokeField @"num_layers" ptr val
    pokeField @"layer"      ptr val
    pokeField @"p"          ptr val




type FT_PaintFormat = #type enum FT_PaintFormat_



data FT_ColorStopIterator = FT_ColorStopIterator
                              { num_color_stops    :: FT_UInt
                              , current_color_stop :: FT_UInt
                              , p                  :: Ptr FT_Byte
                              }

instance Offset "num_color_stops"    FT_ColorStopIterator where rawOffset = #{offset struct FT_ColorStopIterator_, num_color_stops   }
instance Offset "current_color_stop" FT_ColorStopIterator where rawOffset = #{offset struct FT_ColorStopIterator_, current_color_stop}
instance Offset "p"                  FT_ColorStopIterator where rawOffset = #{offset struct FT_ColorStopIterator_, p                 }

instance Storable FT_ColorStopIterator where
  sizeOf _    = #size      struct FT_ColorStopIterator_
  alignment _ = #alignment struct FT_ColorStopIterator_

  peek ptr =
    FT_ColorStopIterator
      <$> peek (offset @"num_color_stops"    ptr)
      <*> peek (offset @"current_color_stop" ptr)
      <*> peek (offset @"p"                  ptr)

  poke ptr val = do
    pokeField @"num_color_stops"    ptr val
    pokeField @"current_color_stop" ptr val
    pokeField @"p"                  ptr val



data FT_ColorIndex = FT_ColorIndex
                       { palette_index :: FT_UInt16
                       , alpha         :: FT_F2Dot14
                       }

instance Offset "palette_index" FT_ColorIndex where rawOffset = #{offset struct FT_ColorIndex_, palette_index}
instance Offset "alpha"         FT_ColorIndex where rawOffset = #{offset struct FT_ColorIndex_, alpha        }

instance Storable FT_ColorIndex where
  sizeOf _    = #size      struct FT_ColorIndex_
  alignment _ = #alignment struct FT_ColorIndex_

  peek ptr =
    FT_ColorIndex
      <$> peek (offset @"palette_index" ptr)
      <*> peek (offset @"alpha"         ptr)

  poke ptr val = do
    pokeField @"palette_index" ptr val
    pokeField @"alpha"         ptr val



data FT_ColorStop = FT_ColorStop
                       { stop_offset :: FT_F2Dot14
                       , color       :: FT_ColorIndex
                       }

instance Offset "stop_offset" FT_ColorStop where rawOffset = #{offset struct FT_ColorStop_, stop_offset}
instance Offset "color"       FT_ColorStop where rawOffset = #{offset struct FT_ColorStop_, color      }

instance Storable FT_ColorStop where
  sizeOf _    = #size      struct FT_ColorStop_
  alignment _ = #alignment struct FT_ColorStop_

  peek ptr =
    FT_ColorStop
      <$> peek (offset @"stop_offset" ptr)
      <*> peek (offset @"color"       ptr)

  poke ptr val = do
    pokeField @"stop_offset" ptr val
    pokeField @"color"       ptr val



type FT_PaintExtend = #type enum FT_PaintExtend_



data FT_ColorLine = FT_ColorLine
                       { extend              :: FT_PaintExtend
                       , color_stop_iterator :: FT_ColorStopIterator
                       }

instance Offset "extend"              FT_ColorLine where rawOffset = #{offset struct FT_ColorLine_, extend             }
instance Offset "color_stop_iterator" FT_ColorLine where rawOffset = #{offset struct FT_ColorLine_, color_stop_iterator}

instance Storable FT_ColorLine where
  sizeOf _    = #size      struct FT_ColorLine_
  alignment _ = #alignment struct FT_ColorLine_

  peek ptr =
    FT_ColorLine
      <$> peek (offset @"extend"              ptr)
      <*> peek (offset @"color_stop_iterator" ptr)

  poke ptr val = do
    pokeField @"extend"              ptr val
    pokeField @"color_stop_iterator" ptr val



data FT_Affine23 = FT_Affine23
                     { xx :: FT_Fixed
                     , xy :: FT_Fixed
                     , dx :: FT_Fixed
                     , yx :: FT_Fixed
                     , yy :: FT_Fixed
                     , dy :: FT_Fixed
                     }

instance Offset "xx" FT_Affine23 where rawOffset = #{offset struct FT_Affine_23_, xx}
instance Offset "xy" FT_Affine23 where rawOffset = #{offset struct FT_Affine_23_, xy}
instance Offset "dx" FT_Affine23 where rawOffset = #{offset struct FT_Affine_23_, dx}
instance Offset "yx" FT_Affine23 where rawOffset = #{offset struct FT_Affine_23_, yx}
instance Offset "yy" FT_Affine23 where rawOffset = #{offset struct FT_Affine_23_, yy}
instance Offset "dy" FT_Affine23 where rawOffset = #{offset struct FT_Affine_23_, dy}

instance Storable FT_Affine23 where
  sizeOf _    = #size      struct FT_Affine_23_
  alignment _ = #alignment struct FT_Affine_23_

  peek ptr =
    FT_Affine23
      <$> peek (offset @"xx" ptr)
      <*> peek (offset @"xy" ptr)
      <*> peek (offset @"dx" ptr)
      <*> peek (offset @"yx" ptr)
      <*> peek (offset @"yy" ptr)
      <*> peek (offset @"dy" ptr)

  poke ptr val = do
    pokeField @"xx" ptr val
    pokeField @"xy" ptr val
    pokeField @"dx" ptr val
    pokeField @"yx" ptr val
    pokeField @"yy" ptr val
    pokeField @"dy" ptr val



type FT_Composite_Mode = #type enum FT_Composite_Mode_



data FT_OpaquePaint = FT_OpaquePaint
                        { p                     :: Ptr FT_Byte
                        , insert_root_transform :: FT_Bool
                        }

instance Offset "p"                     FT_OpaquePaint where rawOffset = #{offset struct FT_Opaque_Paint_, p                    }
instance Offset "insert_root_transform" FT_OpaquePaint where rawOffset = #{offset struct FT_Opaque_Paint_, insert_root_transform}

instance Storable FT_OpaquePaint where
  sizeOf _    = #size      struct FT_Opaque_Paint_
  alignment _ = #alignment struct FT_Opaque_Paint_

  peek ptr =
    FT_OpaquePaint
      <$> peek (offset @"p"                     ptr)
      <*> peek (offset @"insert_root_transform" ptr)

  poke ptr val = do
    pokeField @"p"                     ptr val
    pokeField @"insert_root_transform" ptr val



data FT_PaintColrLayers = FT_PaintColrLayers
                            { layer_iterator :: Ptr FT_Byte
                            }

instance Offset "layer_iterator" FT_PaintColrLayers where rawOffset = #{offset struct FT_PaintColrLayers_, layer_iterator}

instance Storable FT_PaintColrLayers where
  sizeOf _    = #size      struct FT_PaintColrLayers_
  alignment _ = #alignment struct FT_PaintColrLayers_

  peek ptr =
    FT_PaintColrLayers
      <$> peek (offset @"layer_iterator" ptr)

  poke ptr val = do
    pokeField @"layer_iterator" ptr val



data FT_PaintSolid = FT_PaintSolid
                       { color :: FT_ColorIndex
                       }

instance Offset "color" FT_PaintSolid where rawOffset = #{offset struct FT_PaintSolid_, color}

instance Storable FT_PaintSolid where
  sizeOf _    = #size      struct FT_PaintSolid_
  alignment _ = #alignment struct FT_PaintSolid_

  peek ptr =
    FT_PaintSolid
      <$> peek (offset @"color" ptr)

  poke ptr val = do
    pokeField @"color" ptr val



data FT_PaintLinearGradient = FT_PaintLinearGradient
                                { colorline :: FT_ColorLine
                                , p0        :: FT_Vector
                                , p1        :: FT_Vector
                                , p2        :: FT_Vector
                                }

instance Offset "colorline" FT_PaintLinearGradient where rawOffset = #{offset struct FT_PaintLinearGradient_, colorline}
instance Offset "p0"        FT_PaintLinearGradient where rawOffset = #{offset struct FT_PaintLinearGradient_, p0       }
instance Offset "p1"        FT_PaintLinearGradient where rawOffset = #{offset struct FT_PaintLinearGradient_, p1       }
instance Offset "p2"        FT_PaintLinearGradient where rawOffset = #{offset struct FT_PaintLinearGradient_, p2       }

instance Storable FT_PaintLinearGradient where
  sizeOf _    = #size      struct FT_PaintLinearGradient_
  alignment _ = #alignment struct FT_PaintLinearGradient_

  peek ptr =
    FT_PaintLinearGradient
      <$> peek (offset @"colorline" ptr)
      <*> peek (offset @"p0"        ptr)
      <*> peek (offset @"p1"        ptr)
      <*> peek (offset @"p2"        ptr)

  poke ptr val = do
    pokeField @"colorline" ptr val
    pokeField @"p0"        ptr val
    pokeField @"p1"        ptr val
    pokeField @"p2"        ptr val



data FT_PaintRadialGradient = FT_PaintRadialGradient
                                { colorline :: FT_ColorLine
                                , c0        :: FT_Vector
                                , r0        :: FT_Pos
                                , c1        :: FT_Vector
                                , r1        :: FT_Pos
                                }

instance Offset "colorline" FT_PaintRadialGradient where rawOffset = #{offset struct FT_PaintRadialGradient_, colorline}
instance Offset "c0"        FT_PaintRadialGradient where rawOffset = #{offset struct FT_PaintRadialGradient_, c0       }
instance Offset "r0"        FT_PaintRadialGradient where rawOffset = #{offset struct FT_PaintRadialGradient_, r0       }
instance Offset "c1"        FT_PaintRadialGradient where rawOffset = #{offset struct FT_PaintRadialGradient_, c1       }
instance Offset "r1"        FT_PaintRadialGradient where rawOffset = #{offset struct FT_PaintRadialGradient_, r1       }

instance Storable FT_PaintRadialGradient where
  sizeOf _    = #size      struct FT_PaintRadialGradient_
  alignment _ = #alignment struct FT_PaintRadialGradient_

  peek ptr =
    FT_PaintRadialGradient
      <$> peek (offset @"colorline" ptr)
      <*> peek (offset @"c0"        ptr)
      <*> peek (offset @"r0"        ptr)
      <*> peek (offset @"c1"        ptr)
      <*> peek (offset @"r1"        ptr)

  poke ptr val = do
    pokeField @"colorline" ptr val
    pokeField @"c0"        ptr val
    pokeField @"r0"        ptr val
    pokeField @"c1"        ptr val
    pokeField @"r1"        ptr val



data FT_PaintSweepGradient = FT_PaintSweepGradient
                                { colorline   :: FT_ColorLine
                                , center      :: FT_Vector
                                , start_angle :: FT_Fixed
                                , end_angle   :: FT_Fixed
                                }

instance Offset "colorline"   FT_PaintSweepGradient where rawOffset = #{offset struct FT_PaintSweepGradient_, colorline  }
instance Offset "center"      FT_PaintSweepGradient where rawOffset = #{offset struct FT_PaintSweepGradient_, center     }
instance Offset "start_angle" FT_PaintSweepGradient where rawOffset = #{offset struct FT_PaintSweepGradient_, start_angle}
instance Offset "end_angle"   FT_PaintSweepGradient where rawOffset = #{offset struct FT_PaintSweepGradient_, end_angle  }

instance Storable FT_PaintSweepGradient where
  sizeOf _    = #size      struct FT_PaintSweepGradient_
  alignment _ = #alignment struct FT_PaintSweepGradient_

  peek ptr =
    FT_PaintSweepGradient
      <$> peek (offset @"colorline"   ptr)
      <*> peek (offset @"center"      ptr)
      <*> peek (offset @"start_angle" ptr)
      <*> peek (offset @"end_angle"   ptr)

  poke ptr val = do
    pokeField @"colorline"   ptr val
    pokeField @"center"      ptr val
    pokeField @"start_angle" ptr val
    pokeField @"end_angle"   ptr val



data FT_PaintGlyph = FT_PaintGlyph
                       { paint   :: FT_OpaquePaint
                       , glyphID :: FT_UInt
                       }

instance Offset "paint"   FT_PaintGlyph where rawOffset = #{offset struct FT_PaintGlyph_, paint  }
instance Offset "glyphID" FT_PaintGlyph where rawOffset = #{offset struct FT_PaintGlyph_, glyphID}

instance Storable FT_PaintGlyph where
  sizeOf _    = #size      struct FT_PaintGlyph_
  alignment _ = #alignment struct FT_PaintGlyph_

  peek ptr =
    FT_PaintGlyph
      <$> peek (offset @"paint"   ptr)
      <*> peek (offset @"glyphID" ptr)

  poke ptr val = do
    pokeField @"paint"   ptr val
    pokeField @"glyphID" ptr val




data FT_PaintColrGlyph = FT_PaintColrGlyph
                           { glyphID :: FT_UInt
                           }

instance Offset "glyphID" FT_PaintColrGlyph where rawOffset = #{offset struct FT_PaintColrGlyph_, glyphID}

instance Storable FT_PaintColrGlyph where
  sizeOf _    = #size      struct FT_PaintColrGlyph_
  alignment _ = #alignment struct FT_PaintColrGlyph_

  peek ptr =
    FT_PaintColrGlyph
      <$> peek (offset @"glyphID" ptr)

  poke ptr val = do
    pokeField @"glyphID" ptr val




data FT_PaintTransform = FT_PaintTransform
                              { paint  :: FT_OpaquePaint
                              , affine :: FT_Affine23
                              }

instance Offset "paint"  FT_PaintTransform where rawOffset = #{offset struct FT_PaintTransform_, paint }
instance Offset "affine" FT_PaintTransform where rawOffset = #{offset struct FT_PaintTransform_, affine}

instance Storable FT_PaintTransform where
  sizeOf _    = #size      struct FT_PaintTransform_
  alignment _ = #alignment struct FT_PaintTransform_

  peek ptr =
    FT_PaintTransform
      <$> peek (offset @"paint"  ptr)
      <*> peek (offset @"affine" ptr)

  poke ptr val = do
    pokeField @"paint"  ptr val
    pokeField @"affine" ptr val



data FT_PaintTranslate = FT_PaintTranslate
                              { paint  :: FT_OpaquePaint
                              , dx     :: FT_Fixed
                              , dy     :: FT_Fixed
                              }

instance Offset "paint"  FT_PaintTranslate where rawOffset = #{offset struct FT_PaintTranslate_, paint}
instance Offset "dx"     FT_PaintTranslate where rawOffset = #{offset struct FT_PaintTranslate_, dx   }
instance Offset "dy"     FT_PaintTranslate where rawOffset = #{offset struct FT_PaintTranslate_, dy   }

instance Storable FT_PaintTranslate where
  sizeOf _    = #size      struct FT_PaintTranslate_
  alignment _ = #alignment struct FT_PaintTranslate_

  peek ptr =
    FT_PaintTranslate
      <$> peek (offset @"paint" ptr)
      <*> peek (offset @"dx"    ptr)
      <*> peek (offset @"dy"    ptr)

  poke ptr val = do
    pokeField @"paint" ptr val
    pokeField @"dx"    ptr val
    pokeField @"dy"    ptr val



data FT_PaintScale = FT_PaintScale
                              { paint    :: FT_OpaquePaint
                              , scale_x  :: FT_Fixed
                              , scale_y  :: FT_Fixed
                              , center_x :: FT_Fixed
                              , center_y :: FT_Fixed
                              }

instance Offset "paint"    FT_PaintScale where rawOffset = #{offset struct FT_PaintScale_, paint   }
instance Offset "scale_x"  FT_PaintScale where rawOffset = #{offset struct FT_PaintScale_, scale_x }
instance Offset "scale_y"  FT_PaintScale where rawOffset = #{offset struct FT_PaintScale_, scale_y }
instance Offset "center_x" FT_PaintScale where rawOffset = #{offset struct FT_PaintScale_, center_x}
instance Offset "center_y" FT_PaintScale where rawOffset = #{offset struct FT_PaintScale_, center_y}


instance Storable FT_PaintScale where
  sizeOf _    = #size      struct FT_PaintScale_
  alignment _ = #alignment struct FT_PaintScale_

  peek ptr =
    FT_PaintScale
      <$> peek (offset @"paint"    ptr)
      <*> peek (offset @"scale_x"  ptr)
      <*> peek (offset @"scale_y"  ptr)
      <*> peek (offset @"center_x" ptr)
      <*> peek (offset @"center_y" ptr)


  poke ptr val = do
    pokeField @"paint"    ptr val
    pokeField @"scale_x"  ptr val
    pokeField @"scale_y"  ptr val
    pokeField @"center_x" ptr val
    pokeField @"center_y" ptr val




data FT_PaintRotate = FT_PaintRotate
                              { paint    :: FT_OpaquePaint
                              , angle    :: FT_Fixed
                              , center_x :: FT_Fixed
                              , center_y :: FT_Fixed
                              }

instance Offset "paint"    FT_PaintRotate where rawOffset = #{offset struct FT_PaintRotate_, paint   }
instance Offset "angle"    FT_PaintRotate where rawOffset = #{offset struct FT_PaintRotate_, angle   }
instance Offset "center_x" FT_PaintRotate where rawOffset = #{offset struct FT_PaintRotate_, center_x}
instance Offset "center_y" FT_PaintRotate where rawOffset = #{offset struct FT_PaintRotate_, center_y}


instance Storable FT_PaintRotate where
  sizeOf _    = #size      struct FT_PaintRotate_
  alignment _ = #alignment struct FT_PaintRotate_

  peek ptr =
    FT_PaintRotate
      <$> peek (offset @"paint"    ptr)
      <*> peek (offset @"angle"    ptr)
      <*> peek (offset @"center_x" ptr)
      <*> peek (offset @"center_y" ptr)


  poke ptr val = do
    pokeField @"paint"    ptr val
    pokeField @"angle"    ptr val
    pokeField @"center_x" ptr val
    pokeField @"center_y" ptr val



data FT_PaintSkew = FT_PaintSkew
                              { paint        :: FT_OpaquePaint
                              , x_skew_angle :: FT_Fixed
                              , y_skew_angle :: FT_Fixed
                              , center_x     :: FT_Fixed
                              , center_y     :: FT_Fixed
                              }

instance Offset "paint"        FT_PaintSkew where rawOffset = #{offset struct FT_PaintSkew_, paint       }
instance Offset "x_skew_angle" FT_PaintSkew where rawOffset = #{offset struct FT_PaintSkew_, x_skew_angle}
instance Offset "y_skew_angle" FT_PaintSkew where rawOffset = #{offset struct FT_PaintSkew_, y_skew_angle}
instance Offset "center_x"     FT_PaintSkew where rawOffset = #{offset struct FT_PaintSkew_, center_x    }
instance Offset "center_y"     FT_PaintSkew where rawOffset = #{offset struct FT_PaintSkew_, center_y    }

instance Storable FT_PaintSkew where
  sizeOf _    = #size      struct FT_PaintSkew_
  alignment _ = #alignment struct FT_PaintSkew_

  peek ptr =
    FT_PaintSkew
      <$> peek (offset @"paint"        ptr)
      <*> peek (offset @"x_skew_angle" ptr)
      <*> peek (offset @"y_skew_angle" ptr)
      <*> peek (offset @"center_x"     ptr)
      <*> peek (offset @"center_y"     ptr)

  poke ptr val = do
    pokeField @"paint"        ptr val
    pokeField @"x_skew_angle" ptr val
    pokeField @"y_skew_angle" ptr val
    pokeField @"center_x"     ptr val
    pokeField @"center_y"     ptr val



data FT_PaintComposite = FT_PaintComposite
                           { source_paint   :: FT_OpaquePaint
                           , composite_mode :: FT_Composite_Mode
                           , backdrop_paint :: FT_OpaquePaint
                           }

instance Offset "source_paint"   FT_PaintComposite where rawOffset = #{offset struct FT_PaintComposite_, source_paint  }
instance Offset "composite_mode" FT_PaintComposite where rawOffset = #{offset struct FT_PaintComposite_, composite_mode}
instance Offset "backdrop_paint" FT_PaintComposite where rawOffset = #{offset struct FT_PaintComposite_, backdrop_paint}

instance Storable FT_PaintComposite where
  sizeOf _    = #size      struct FT_PaintComposite_
  alignment _ = #alignment struct FT_PaintComposite_

  peek ptr =
    FT_PaintComposite
      <$> peek (offset @"source_paint"   ptr)
      <*> peek (offset @"composite_mode" ptr)
      <*> peek (offset @"backdrop_paint" ptr)

  poke ptr val = do
    pokeField @"source_paint"   ptr val
    pokeField @"composite_mode" ptr val
    pokeField @"backdrop_paint" ptr val



data FT_COLR_Paint = FT_COLR_Paint
                       { format :: FT_PaintFormat
                       }

instance Offset "format"          FT_COLR_Paint where rawOffset = #{offset struct FT_COLR_Paint_, format           }
instance Offset "colr_layers"     FT_COLR_Paint where rawOffset = #{offset struct FT_COLR_Paint_, u.colr_layers    }
instance Offset "glyph"           FT_COLR_Paint where rawOffset = #{offset struct FT_COLR_Paint_, u.glyph          }
instance Offset "solid"           FT_COLR_Paint where rawOffset = #{offset struct FT_COLR_Paint_, u.solid          }
instance Offset "linear_gradient" FT_COLR_Paint where rawOffset = #{offset struct FT_COLR_Paint_, u.linear_gradient}
instance Offset "radial_gradient" FT_COLR_Paint where rawOffset = #{offset struct FT_COLR_Paint_, u.radial_gradient}
instance Offset "sweep_gradient"  FT_COLR_Paint where rawOffset = #{offset struct FT_COLR_Paint_, u.sweep_gradient }
instance Offset "transform"       FT_COLR_Paint where rawOffset = #{offset struct FT_COLR_Paint_, u.transform      }
instance Offset "translate"       FT_COLR_Paint where rawOffset = #{offset struct FT_COLR_Paint_, u.translate      }
instance Offset "scale"           FT_COLR_Paint where rawOffset = #{offset struct FT_COLR_Paint_, u.scale          }
instance Offset "rotate"          FT_COLR_Paint where rawOffset = #{offset struct FT_COLR_Paint_, u.rotate         }
instance Offset "skew"            FT_COLR_Paint where rawOffset = #{offset struct FT_COLR_Paint_, u.skew           }
instance Offset "composite"       FT_COLR_Paint where rawOffset = #{offset struct FT_COLR_Paint_, u.composite      }
instance Offset "colr_glyph"      FT_COLR_Paint where rawOffset = #{offset struct FT_COLR_Paint_, u.colr_glyph     }

instance HasField "colr_layers"     FT_COLR_Paint FT_PaintColrLayers     where
  getField = errorWithoutStackTrace "FT_COLR_Paint.colr_layers.getField: union field"

instance HasField "glyph"           FT_COLR_Paint FT_PaintGlyph          where
  getField = errorWithoutStackTrace "FT_COLR_Paint.glyph.getField: union field"

instance HasField "solid"           FT_COLR_Paint FT_PaintSolid          where
  getField = errorWithoutStackTrace "FT_COLR_Paint.solid.getField: union field"

instance HasField "linear_gradient" FT_COLR_Paint FT_PaintLinearGradient where
  getField = errorWithoutStackTrace "FT_COLR_Paint.linear_gradient.getField: union field"

instance HasField "radial_gradient" FT_COLR_Paint FT_PaintRadialGradient where
  getField = errorWithoutStackTrace "FT_COLR_Paint.radial_gradient.getField: union field"

instance HasField "sweep_gradient"  FT_COLR_Paint FT_PaintSweepGradient  where
  getField = errorWithoutStackTrace "FT_COLR_Paint.sweep_gradient.getField: union field"

instance HasField "transform"       FT_COLR_Paint FT_PaintTransform      where
  getField = errorWithoutStackTrace "FT_COLR_Paint.transform.getField: union field"

instance HasField "translate"       FT_COLR_Paint FT_PaintTranslate      where
  getField = errorWithoutStackTrace "FT_COLR_Paint.translate.getField: union field"

instance HasField "scale"           FT_COLR_Paint FT_PaintScale          where
  getField = errorWithoutStackTrace "FT_COLR_Paint.scale.getField: union field"

instance HasField "rotate"          FT_COLR_Paint FT_PaintRotate         where
  getField = errorWithoutStackTrace "FT_COLR_Paint.rotate.getField: union field"

instance HasField "skew"            FT_COLR_Paint FT_PaintSkew           where
  getField = errorWithoutStackTrace "FT_COLR_Paint.skew.getField: union field"

instance HasField "composite"       FT_COLR_Paint FT_PaintComposite      where
  getField = errorWithoutStackTrace "FT_COLR_Paint.composite.getField: union field"

instance HasField "colr_glyph"      FT_COLR_Paint FT_PaintColrGlyph      where
  getField = errorWithoutStackTrace "FT_COLR_Paint.colr_glyph.getField: union field"

instance Storable FT_COLR_Paint where
  sizeOf _    = #size      struct FT_COLR_Paint_
  alignment _ = #alignment struct FT_COLR_Paint_

  peek ptr =
    FT_COLR_Paint
      <$> peek (offset @"format" ptr)

  poke ptr val = do
    pokeField @"format" ptr val



type FT_Color_Root_Transform = #type enum FT_Color_Root_Transform_



data FT_ClipBox = FT_ClipBox
                              { bottom_left  :: FT_Vector
                              , top_left     :: FT_Vector
                              , top_right    :: FT_Vector
                              , bottom_right :: FT_Vector
                              }

instance Offset "bottom_left"  FT_ClipBox where rawOffset = #{offset struct FT_ClipBox_, bottom_left }
instance Offset "top_left"     FT_ClipBox where rawOffset = #{offset struct FT_ClipBox_, top_left    }
instance Offset "top_right"    FT_ClipBox where rawOffset = #{offset struct FT_ClipBox_, top_right   }
instance Offset "bottom_right" FT_ClipBox where rawOffset = #{offset struct FT_ClipBox_, bottom_right}

instance Storable FT_ClipBox where
  sizeOf _    = #size      struct FT_ClipBox_
  alignment _ = #alignment struct FT_ClipBox_

  peek ptr =
    FT_ClipBox
      <$> peek (offset @"bottom_left"  ptr)
      <*> peek (offset @"top_left"     ptr)
      <*> peek (offset @"top_right"    ptr)
      <*> peek (offset @"bottom_right" ptr)

  poke ptr val = do
    pokeField @"bottom_left"  ptr val
    pokeField @"top_left"     ptr val
    pokeField @"top_right"    ptr val
    pokeField @"bottom_right" ptr val


