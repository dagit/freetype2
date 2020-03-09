{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE TemplateHaskell #-}

{- | Please refer to the    
     [Support API > Glyph Stroker](https://www.freetype.org/freetype2/docs/reference/ft2-glyph_stroker.html)
     chapter of the reference.    
    
     Internal: "FreeType.Support.Glyph.Internal".    
 -}

module FreeType.Support.Glyph
  ( -- ** FT_Stroker
    FT_Stroker
    -- ** FT_Stroker_LineJoin
  , FT_Stroker_LineJoin
  , pattern FT_STROKER_LINEJOIN_ROUND
  , pattern FT_STROKER_LINEJOIN_BEVEL
  , pattern FT_STROKER_LINEJOIN_MITER_VARIABLE
  , pattern FT_STROKER_LINEJOIN_MITER
  , pattern FT_STROKER_LINEJOIN_MITER_FIXED
    -- ** FT_Stroker_LineCap
  , FT_Stroker_LineCap
  , pattern FT_STROKER_LINECAP_BUTT
  , pattern FT_STROKER_LINECAP_ROUND
  , pattern FT_STROKER_LINECAP_SQUARE
    -- ** FT_StrokerBorder
  , FT_StrokerBorder
  , pattern FT_STROKER_BORDER_LEFT
  , pattern FT_STROKER_BORDER_RIGHT
    -- ** FT_Outline_GetInsideBorder
  , ft_Outline_GetInsideBorder
    -- ** FT_Outline_GetOutsideBorder
  , ft_Outline_GetOutsideBorder
    -- ** FT_Glyph_Stroke
  , ft_Glyph_Stroke
    -- ** FT_Glyph_StrokeBorder
  , ft_Glyph_StrokeBorder
    -- ** FT_Stroker_New
  , ft_Stroker_New
  , ft_Stroker_With
    -- ** FT_Stroker_Set
  , ft_Stroker_Set
    -- ** FT_Stroker_Rewind
  , ft_Stroker_Rewind
    -- ** FT_Stroker_ParseOutline
  , ft_Stroker_ParseOutline
    -- ** FT_Stroker_Done
  , ft_Stroker_Done
    -- ** FT_Stroker_BeginSubPath
  , ft_Stroker_BeginSubPath
    -- ** FT_Stroker_EndSubPath
  , ft_Stroker_EndSubPath
    -- ** FT_Stroker_LineTo
  , ft_Stroker_LineTo
    -- ** FT_Stroker_ConicTo
  , ft_Stroker_ConicTo
    -- ** FT_Stroker_CubicTo
  , ft_Stroker_CubicTo
    -- ** FT_Stroker_GetBorderCounts
  , ft_Stroker_GetBorderCounts
    -- ** FT_Stroker_ExportBorder
  , ft_Stroker_ExportBorder
    -- ** FT_Stroker_GetCounts
  , ft_Stroker_GetCounts
    -- ** FT_Stroker_Export
  , ft_Stroker_Export
  ) where

import           FreeType.Core.Base
import           FreeType.Core.Glyph
import           FreeType.Core.Types.Types
import           FreeType.Exception.Internal
import           FreeType.Support.Glyph.Internal
import           FreeType.Support.Glyph.Types
import           FreeType.Support.Outline

import           Control.Exception
import           Data.Bool (bool)
import           Foreign.Marshal.Alloc
import           Foreign.Marshal.Utils
import           Foreign.Ptr
import           Foreign.Storable

#include "ft2build.h"
#include FT_STROKER_H

pattern FT_STROKER_LINEJOIN_ROUND
      , FT_STROKER_LINEJOIN_BEVEL
      , FT_STROKER_LINEJOIN_MITER_VARIABLE
      , FT_STROKER_LINEJOIN_MITER
      , FT_STROKER_LINEJOIN_MITER_FIXED
     :: FT_Stroker_LineJoin
pattern FT_STROKER_LINEJOIN_ROUND          = #const FT_STROKER_LINEJOIN_ROUND
pattern FT_STROKER_LINEJOIN_BEVEL          = #const FT_STROKER_LINEJOIN_BEVEL
pattern FT_STROKER_LINEJOIN_MITER_VARIABLE = #const FT_STROKER_LINEJOIN_MITER_VARIABLE
pattern FT_STROKER_LINEJOIN_MITER          = #const FT_STROKER_LINEJOIN_MITER
pattern FT_STROKER_LINEJOIN_MITER_FIXED    = #const FT_STROKER_LINEJOIN_MITER_FIXED



pattern FT_STROKER_LINECAP_BUTT
      , FT_STROKER_LINECAP_ROUND
      , FT_STROKER_LINECAP_SQUARE
     :: FT_Stroker_LineCap
pattern FT_STROKER_LINECAP_BUTT   = #const FT_STROKER_LINECAP_BUTT
pattern FT_STROKER_LINECAP_ROUND  = #const FT_STROKER_LINECAP_ROUND
pattern FT_STROKER_LINECAP_SQUARE = #const FT_STROKER_LINECAP_SQUARE



pattern FT_STROKER_BORDER_LEFT
      , FT_STROKER_BORDER_RIGHT
     :: FT_StrokerBorder
pattern FT_STROKER_BORDER_LEFT  = #const FT_STROKER_BORDER_LEFT
pattern FT_STROKER_BORDER_RIGHT = #const FT_STROKER_BORDER_LEFT



foreign import ccall "FT_Outline_GetInsideBorder"
  ft_Outline_GetInsideBorder
    :: Ptr FT_Outline      -- ^ outline
    -> IO FT_StrokerBorder



foreign import ccall "FT_Outline_GetOutsideBorder"
  ft_Outline_GetOutsideBorder
    :: Ptr FT_Outline      -- ^ outline
    -> IO FT_StrokerBorder



ft_Glyph_Stroke
  :: FT_Glyph    -- ^ glyph
  -> FT_Stroker  -- ^ stroker
  -> Bool        -- ^ destroy
  -> IO FT_Glyph
ft_Glyph_Stroke glyph stroker destroy =
  with glyph $ \glyphPtr -> do
    ftError 'ft_Glyph_Stroke . ft_Glyph_Stroke' glyphPtr stroker $ bool 0 1 destroy
    peek glyphPtr



ft_Glyph_StrokeBorder
  :: FT_Glyph    -- ^ glyph
  -> FT_Stroker  -- ^ stroker
  -> Bool        -- ^ inside
  -> Bool        -- ^ destroy
  -> IO FT_Glyph
ft_Glyph_StrokeBorder glyph stroker inside destroy =
  with glyph $ \glyphPtr -> do
    ftError 'ft_Glyph_StrokeBorder
      . ft_Glyph_StrokeBorder' glyphPtr stroker (bool 0 1 inside) $ bool 0 1 destroy
    peek glyphPtr



ft_Stroker_New
  :: FT_Library    -- ^ library
  -> IO FT_Stroker -- ^ stroker
ft_Stroker_New =
  autoAllocaError 'ft_Stroker_New ft_Stroker_New'



-- | 'bracket' over 'ft_Stroker_New' and 'ft_Stroker_Done'.
--
--   The provided 'FT_Stroker' should not be used after this function terminates.
ft_Stroker_With
  :: FT_Library           -- ^ library
  -> (FT_Stroker -> IO a)
  -> IO a
ft_Stroker_With lib = bracket (ft_Stroker_New lib) ft_Stroker_Done



foreign import ccall "FT_Stroker_Set"
  ft_Stroker_Set
    :: FT_Stroker          -- ^ stroker
    -> FT_Fixed            -- ^ radius
    -> FT_Stroker_LineCap  -- ^ line_cap
    -> FT_Stroker_LineJoin -- ^ line_join
    -> FT_Fixed            -- ^ miter_limit
    -> IO ()



foreign import ccall "FT_Stroker_Rewind"
  ft_Stroker_Rewind
    :: FT_Stroker -- ^ stroker
    -> IO ()



ft_Stroker_ParseOutline
  :: FT_Stroker     -- ^ stroker
  -> Ptr FT_Outline -- ^ outline
  -> Bool           -- ^ opened
  -> IO ()
ft_Stroker_ParseOutline stroker outlinePtr opened =
  ftError 'ft_Stroker_ParseOutline
    . ft_Stroker_ParseOutline' stroker outlinePtr $ bool 0 1 opened



foreign import ccall "FT_Stroker_Done"
  ft_Stroker_Done :: FT_Stroker -> IO ()



ft_Stroker_BeginSubPath
  :: FT_Stroker -- ^ stroker
  -> FT_Vector  -- ^ to
  -> Bool       -- ^ open
  -> IO ()
ft_Stroker_BeginSubPath stroker to open =
  with to $ \toPtr ->
    ftError 'ft_Stroker_BeginSubPath
      . ft_Stroker_BeginSubPath' stroker toPtr $ bool 0 1 open



ft_Stroker_EndSubPath
  :: FT_Stroker -- ^ stroker
  -> IO ()
ft_Stroker_EndSubPath =
  autoError 'ft_Stroker_EndSubPath ft_Stroker_EndSubPath'



ft_Stroker_LineTo
  :: FT_Stroker -- ^ stroker
  -> FT_Vector  -- ^ to
  -> IO ()
ft_Stroker_LineTo stroker to =
  with to $
    ftError 'ft_Stroker_LineTo . ft_Stroker_LineTo' stroker



ft_Stroker_ConicTo
  :: FT_Stroker -- ^ stroker
  -> FT_Vector  -- ^ control
  -> FT_Vector  -- ^ to
  -> IO ()
ft_Stroker_ConicTo stroker control to =
  with control $ \controlPtr ->
    with to $
      ftError 'ft_Stroker_ConicTo . ft_Stroker_ConicTo' stroker controlPtr



ft_Stroker_CubicTo
  :: FT_Stroker -- ^ stroker
  -> FT_Vector  -- ^ control1
  -> FT_Vector  -- ^ control2
  -> FT_Vector  -- ^ to
  -> IO ()
ft_Stroker_CubicTo stroker control1 control2 to =
  with control1 $ \control1Ptr ->
    with control2 $ \control2Ptr ->
      with to $
        ftError 'ft_Stroker_CubicTo . ft_Stroker_CubicTo' stroker control1Ptr control2Ptr



ft_Stroker_GetBorderCounts
  :: FT_Stroker            -- ^ stroker
  -> FT_StrokerBorder      -- ^ border
  -> IO (FT_UInt, FT_UInt) -- ^ (num_points, num_contours)
ft_Stroker_GetBorderCounts stroker border =
  alloca $ \pointsPtr ->
    alloca $ \contoursPtr -> do
      ftError 'ft_Stroker_GetBorderCounts
        $ ft_Stroker_GetBorderCounts' stroker border pointsPtr contoursPtr
      (,)
        <$> peek pointsPtr
        <*> peek contoursPtr



foreign import ccall "FT_Stroker_ExportBorder"
  ft_Stroker_ExportBorder :: FT_Stroker -> FT_StrokerBorder -> Ptr FT_Outline -> IO ()



ft_Stroker_GetCounts
  :: FT_Stroker            -- ^ stroker
  -> IO (FT_UInt, FT_UInt) -- ^ (num_points, num_contours)
ft_Stroker_GetCounts stroker =
  alloca $ \pointsPtr -> do
    alloca $ \contoursPtr -> do
      ftError 'ft_Stroker_GetCounts
        $ ft_Stroker_GetCounts' stroker pointsPtr contoursPtr
      (,)
        <$> peek pointsPtr
        <*> peek contoursPtr


foreign import ccall "FT_Stroker_Export"
  ft_Stroker_Export
    :: FT_Stroker     -- ^ stroker
    -> Ptr FT_Outline -- ^ outline
    -> IO ()
