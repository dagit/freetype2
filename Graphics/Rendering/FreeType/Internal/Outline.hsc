{-# LANGUAGE ForeignFunctionInterface #-}
module Graphics.Rendering.FreeType.Internal.Outline
( FT_Outline(..)
, FT_Outline_MoveToFunc
, FT_Outline_LineToFunc
, FT_Outline_ConicToFunc
, FT_Outline_CubicToFunc
, FT_Outline_Funcs(..)
) where

import Foreign hiding (shift)
import Foreign.C.Types
import Foreign.C.String

import Graphics.Rendering.FreeType.Internal.Vector
import Graphics.Rendering.FreeType.Internal.PrimitiveTypes

#include <stddef.h>
#let alignment t = "%lu", (unsigned long)offsetof(struct {char x__; t (y__); }, y__)

#include "ft2build.h"
#include FT_FREETYPE_H

#include "freetype/ftimage.h"

data FT_Outline = FT_Outline
  { n_contours :: CShort
  , n_points   :: CShort
  , points     :: Ptr FT_Vector
  , tags       :: CString
  , contours   :: Ptr CShort
  , flags      :: FT_OUTLINE_FLAGS
  }

instance Storable FT_Outline where
  sizeOf    _ = #size FT_Outline
  alignment _ = #alignment FT_Outline
  peek ptr = do
    n_contours' <- (#peek FT_Outline, n_contours) ptr
    n_points'   <- (#peek FT_Outline, n_points)   ptr
    points'     <- (#peek FT_Outline, points)     ptr
    tags'       <- (#peek FT_Outline, tags)       ptr
    contours'   <- (#peek FT_Outline, contours)   ptr
    flags'      <- (#peek FT_Outline, flags)      ptr
    return $ FT_Outline
      { n_contours = n_contours'
      , n_points   = n_points'
      , points     = points'
      , tags       = tags'
      , contours   = contours'
      , flags      = flags'
      }
  poke ptr val = do
    (#poke FT_Outline, n_contours) ptr (n_contours val)
    (#poke FT_Outline, n_points)   ptr (n_points   val)
    (#poke FT_Outline, points)     ptr (points     val)
    (#poke FT_Outline, tags)       ptr (tags       val)
    (#poke FT_Outline, contours)   ptr (contours   val)
    (#poke FT_Outline, flags)      ptr (flags      val)

type FT_Outline_MoveToFunc = FunPtr
  (Ptr FT_Vector -> Ptr () -> IO CInt)

type FT_Outline_LineToFunc = FunPtr
  (Ptr FT_Vector -> Ptr () -> IO CInt)

type FT_Outline_ConicToFunc = FunPtr
  (Ptr FT_Vector -> Ptr FT_Vector -> Ptr () -> IO CInt)

type FT_Outline_CubicToFunc = FunPtr
  (Ptr FT_Vector -> Ptr FT_Vector -> Ptr FT_Vector -> Ptr () -> IO CInt)

data FT_Outline_Funcs = FT_Outline_Funcs
  { move_to  :: FT_Outline_MoveToFunc
  , line_to  :: FT_Outline_LineToFunc
  , conic_to :: FT_Outline_ConicToFunc
  , cubic_to :: FT_Outline_CubicToFunc
  , shift    :: CInt
  , delta    :: FT_Pos
  }

instance Storable FT_Outline_Funcs where
  sizeOf    _ = #size FT_Outline_Funcs
  alignment _ = #alignment FT_Outline_Funcs
  peek ptr = do
    move_to'  <- (#peek FT_Outline_Funcs, move_to) ptr
    line_to'  <- (#peek FT_Outline_Funcs, line_to) ptr
    conic_to' <- (#peek FT_Outline_Funcs, conic_to) ptr
    cubic_to' <- (#peek FT_Outline_Funcs, cubic_to) ptr
    shift'    <- (#peek FT_Outline_Funcs, shift) ptr
    delta'    <- (#peek FT_Outline_Funcs, delta) ptr
    return $ FT_Outline_Funcs
      { move_to  = move_to'
      , line_to  = line_to'
      , conic_to = conic_to'
      , cubic_to = cubic_to'
      , shift    = shift'
      , delta    = delta'
      }
  poke ptr val = do
    (#poke FT_Outline_Funcs, move_to) ptr (move_to val)
    (#poke FT_Outline_Funcs, line_to) ptr (line_to val)
    (#poke FT_Outline_Funcs, conic_to) ptr (conic_to val)
    (#poke FT_Outline_Funcs, cubic_to) ptr (cubic_to val)
    (#poke FT_Outline_Funcs, shift) ptr (shift val)
    (#poke FT_Outline_Funcs, delta) ptr (delta val)

