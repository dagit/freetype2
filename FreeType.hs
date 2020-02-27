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

module FreeType
  ( -- * Core API
    module FreeType.Core.Version
  , module FreeType.Core.Types
  , module FreeType.Core.Base
  , module FreeType.Core.Unicode
  , module FreeType.Core.Color
  , module FreeType.Core.Layer
  , module FreeType.Core.Glyph
  , module FreeType.Core.Mac
  , module FreeType.Core.Size
    -- * Format-specific API
  , module FreeType.Format.Multiple
  , module FreeType.Format.TrueType
  , module FreeType.Format.Type1
  , module FreeType.Format.SFNT
  , module FreeType.Format.BDF
  , module FreeType.Format.CID
  , module FreeType.Format.PFR
  , module FreeType.Format.WinFNT
  , module FreeType.Format.Font
  , module FreeType.Format.Gasp
    -- * Controlling FreeType modules
  , module FreeType.Control.Driver
  , module FreeType.Control.Parameter
  , module FreeType.Control.Subpixel
    -- * Cache Sub-System
  , module FreeType.Cache
    -- * Support API
  , module FreeType.Support.Computations
  , module FreeType.Support.List
  , module FreeType.Support.Bitmap
  , module FreeType.Support.Outline
  , module FreeType.Support.Scanline
  , module FreeType.Support.Advance
  , module FreeType.Support.Glyph
  , module FreeType.Support.System
  , module FreeType.Support.Module
  , module FreeType.Support.GZIP
  , module FreeType.Support.LZW
  , module FreeType.Support.BZIP2
    -- * Error Codes
  , module FreeType.Error.Enumerations
  , module FreeType.Error.Values
    -- * Miscellaneous
  , module FreeType.Miscellaneous.OpenType
  , module FreeType.Miscellaneous.Incremental
  , module FreeType.Miscellaneous.TrueType
  , module FreeType.Miscellaneous.TrueTypeGX
  ) where



import           FreeType.Core.Version
import           FreeType.Core.Types
import           FreeType.Core.Base
import           FreeType.Core.Unicode
import           FreeType.Core.Color
import           FreeType.Core.Layer
import           FreeType.Core.Glyph
import           FreeType.Core.Mac
import           FreeType.Core.Size
import           FreeType.Format.Multiple
import           FreeType.Format.TrueType
import           FreeType.Format.Type1
import           FreeType.Format.SFNT
import           FreeType.Format.BDF
import           FreeType.Format.CID
import           FreeType.Format.PFR
import           FreeType.Format.WinFNT
import           FreeType.Format.Font
import           FreeType.Format.Gasp
import           FreeType.Control.Driver
import           FreeType.Control.Parameter
import           FreeType.Control.Subpixel
import           FreeType.Cache
import           FreeType.Support.Computations
import           FreeType.Support.List
import           FreeType.Support.Bitmap
import           FreeType.Support.Outline
import           FreeType.Support.Scanline
import           FreeType.Support.Advance
import           FreeType.Support.Glyph
import           FreeType.Support.System
import           FreeType.Support.Module
import           FreeType.Support.GZIP
import           FreeType.Support.LZW
import           FreeType.Support.BZIP2
import           FreeType.Error.Enumerations
import           FreeType.Error.Values
import           FreeType.Miscellaneous.OpenType
import           FreeType.Miscellaneous.Incremental
import           FreeType.Miscellaneous.TrueType
import           FreeType.Miscellaneous.TrueTypeGX
