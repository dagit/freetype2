{-| This module collects together all of the bindings for FreeType library.
    Due to the sheer number of these, none of them are implicitly documented.
    Instead you should use the [FreeType API Reference](https://www.freetype.org/freetype2/docs/reference/index.html)
    or, if some of the functions are removed in upcoming FreeType versions,
    the definitions from the files at @freetype2\/freetype2\/include\/freetype@ at
    [this project's git](https://github.com/dagit/freetype2).

    Structurally the module tree mirrors the API reference, omitting modules from which
    nothing can be exported and certain functions that are impossible to
    marshal without modifying freetype code (e.g. FT_Bitmap_Blend).
-}

module FreeType.Raw
  ( -- * Core API
    module FreeType.Raw.Core.Version
  , module FreeType.Raw.Core.Types
  , module FreeType.Raw.Core.Base
  , module FreeType.Raw.Core.Unicode
  , module FreeType.Raw.Core.Color
  , module FreeType.Raw.Core.Layer
  , module FreeType.Raw.Core.Glyph
  , module FreeType.Raw.Core.Mac
  , module FreeType.Raw.Core.Size
    -- * Format-specific API
  , module FreeType.Raw.Format.Multiple
  , module FreeType.Raw.Format.TrueType
  , module FreeType.Raw.Format.Type1
  , module FreeType.Raw.Format.SFNT
  , module FreeType.Raw.Format.BDF
  , module FreeType.Raw.Format.CID
  , module FreeType.Raw.Format.PFR
  , module FreeType.Raw.Format.WinFNT
  , module FreeType.Raw.Format.Font
  , module FreeType.Raw.Format.Gasp
    -- * Controlling FreeType modules
  , module FreeType.Raw.Control.Driver
  , module FreeType.Raw.Control.Parameter
  , module FreeType.Raw.Control.Subpixel
    -- * Cache Sub-System
  , module FreeType.Raw.Cache
    -- * Support API
  , module FreeType.Raw.Support.Computations
  , module FreeType.Raw.Support.List
  , module FreeType.Raw.Support.Bitmap
  , module FreeType.Raw.Support.Outline
  , module FreeType.Raw.Support.Scanline
  , module FreeType.Raw.Support.Advance
  , module FreeType.Raw.Support.Glyph
  , module FreeType.Raw.Support.System
  , module FreeType.Raw.Support.Module
  , module FreeType.Raw.Support.GZIP
  , module FreeType.Raw.Support.LZW
  , module FreeType.Raw.Support.BZIP2
    -- * Error Codes
  , module FreeType.Raw.Error.Enumerations
  , module FreeType.Raw.Error.Values
    -- * Miscellaneous
  , module FreeType.Raw.Miscellaneous.OpenType
  , module FreeType.Raw.Miscellaneous.Incremental
  , module FreeType.Raw.Miscellaneous.TrueType
  , module FreeType.Raw.Miscellaneous.TrueTypeGX
  ) where



import FreeType.Raw.Core.Version
import FreeType.Raw.Core.Types
import FreeType.Raw.Core.Base
import FreeType.Raw.Core.Unicode
import FreeType.Raw.Core.Color
import FreeType.Raw.Core.Layer
import FreeType.Raw.Core.Glyph
import FreeType.Raw.Core.Mac
import FreeType.Raw.Core.Size
import FreeType.Raw.Format.Multiple
import FreeType.Raw.Format.TrueType
import FreeType.Raw.Format.Type1
import FreeType.Raw.Format.SFNT
import FreeType.Raw.Format.BDF
import FreeType.Raw.Format.CID
import FreeType.Raw.Format.PFR
import FreeType.Raw.Format.WinFNT
import FreeType.Raw.Format.Font
import FreeType.Raw.Format.Gasp
import FreeType.Raw.Control.Driver
import FreeType.Raw.Control.Parameter
import FreeType.Raw.Control.Subpixel
import FreeType.Raw.Cache
import FreeType.Raw.Support.Computations
import FreeType.Raw.Support.List
import FreeType.Raw.Support.Bitmap
import FreeType.Raw.Support.Outline
import FreeType.Raw.Support.Scanline
import FreeType.Raw.Support.Advance
import FreeType.Raw.Support.Glyph
import FreeType.Raw.Support.System
import FreeType.Raw.Support.Module
import FreeType.Raw.Support.GZIP
import FreeType.Raw.Support.LZW
import FreeType.Raw.Support.BZIP2
import FreeType.Raw.Error.Enumerations
import FreeType.Raw.Error.Values
import FreeType.Raw.Miscellaneous.OpenType
import FreeType.Raw.Miscellaneous.Incremental
import FreeType.Raw.Miscellaneous.TrueType
import FreeType.Raw.Miscellaneous.TrueTypeGX
