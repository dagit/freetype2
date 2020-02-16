{-# LANGUAGE EmptyDataDecls #-}
{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}
{-# OPTIONS_GHC -fno-warn-orphans #-}

module FreeType.Raw.Core.Glyph
  ( module FreeType.Raw.Core.Glyph.Internal
  ) where

import           FreeType.Raw.Circular ()
import           FreeType.Raw.Core.Glyph.Internal
import           FreeType.Lens

import           Foreign.Storable
import           Lens.Micro ((^.))

#include "ft2build.h"
#include FT_GLYPH_H

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
    #{poke struct FT_GlyphRec_, library} ptr $ val^.library
    #{poke struct FT_GlyphRec_, clazz  } ptr $ val^.clazz
    #{poke struct FT_GlyphRec_, format } ptr $ val^.format
    #{poke struct FT_GlyphRec_, advance} ptr $ val^.advance



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
    #{poke struct FT_BitmapGlyphRec_, root  } ptr $ val^.root
    #{poke struct FT_BitmapGlyphRec_, left  } ptr $ val^.left
    #{poke struct FT_BitmapGlyphRec_, top   } ptr $ val^.top
    #{poke struct FT_BitmapGlyphRec_, bitmap} ptr $ val^.bitmap



instance Storable FT_OutlineGlyphRec where
  sizeOf _    = #size      struct FT_OutlineGlyphRec_
  alignment _ = #alignment struct FT_OutlineGlyphRec_

  peek ptr =
    FT_OutlineGlyphRec
      <$> #{peek struct FT_OutlineGlyphRec_, root   } ptr
      <*> #{peek struct FT_OutlineGlyphRec_, outline} ptr

  poke ptr val = do
    #{poke struct FT_OutlineGlyphRec_, root   } ptr $ val^.root
    #{poke struct FT_OutlineGlyphRec_, outline} ptr $ val^.outline
