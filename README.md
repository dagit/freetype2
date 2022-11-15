# freetype2

Raw bindings to the [FreeType2](https://www.freetype.org/) C library (version 2.12.1 as of when this was edited),
following the [API reference](https://www.freetype.org/freetype2/docs/reference/index.html)

This package reexports the
[Foreign.Storable.Offset](https://hackage.haskell.org/package/storable-offset-0.1.0.0/docs/Foreign-Storable-Offset.html)
module and implements the `Offset` instance for all the datatypes.
Alas Hackage currently does not show this (as per [haddock#563](https://github.com/haskell/haddock/issues/563)).

Caveats of this library:
- `FT_Get_Kerning` and all functions from `FreeType.Support.Computations` use unsafe FFI calls;

- `DuplicateRecordFields` (since GHC 9.2 also `NoFieldSelectors`) are turned on in all modules with datatype
  definitions, record field names are the same as in the C library.
  You should use `GHC.Records.getField` or record dot syntax to access datatype fields;

- `type` and `data` record fields are replaced with `type_` and `data_` respectively.
  `GHC.Records.HasField` and `Foreign.Storable.Offset.Offset` instances are defined over both variants.

- Union fields are accessible through `offset`, but `getField` is not defined for them;

- `FreeType.Core.Color.ft_Palette_Set_Foreground_Color`, `FreeType.Core.Layer.ft_Get_Paint` and
  `FreeType.Support.Bitmap.ft_Bitmap_Blend` do not match their C definitions as they rely on marshalling structs.

## Module structure

The whole package copies the API structure.
```
FreeType                                  - FreeType
├── Core API
│   ├── FreeType Version                  - FreeType.Core.Version
│   ├── Basic Data Types                  - FreeType.Core.Types
│   ├── Base Interface                    - FreeType.Core.Base
│   ├── Unicode Variation Sequences       - FreeType.Core.Unicode 
│   ├── Glyph Color Management            - FreeType.Core.Color
│   ├── Glyph Layer Management            - FreeType.Core.Layer
│   ├── Glyph Management                  - FreeType.Core.Glyph
│   ├── Mac Specific Interface            - FreeType.Core.Mac
│   └── Header File Macros                - FreeType.Core.Size
├── Format-specific API
│   ├── Multiple Masters                  - FreeType.Format.Multiple
│   ├── TrueType Tables                   - FreeType.Format.TrueType
│   ├── Type 1 Tables                     - FreeType.Format.Type1 
│   ├── SFNT Names                        - FreeType.Format.SFNT
│   ├── BDF and PCF Fonts                 - FreeType.Format.BDF     
│   ├── CID Fonts                         - FreeType.Format.CID
│   ├── PFR Fonts                         - FreeType.Format.PFR
│   ├── Window FNT Files                  - FreeType.Format.WinFNT 
│   ├── Font Formats                      - FreeType.Format.Font
│   └── Gasp Tables                       - FreeType.Format.Gasp 
├── Controlling FreeType modules
│   ├── Driver properties                 - FreeType.Control.Driver  
│   ├── Parameter Tags                    - FreeType.Control.Parameter
│   └── Subpixel Rendering                - FreeType.Control.Subpixel 
├── Cache Sub-System
│   └── Cache Sub-System                  - FreeType.Cache 
├── Support API
│   ├── Computations                      - FreeType.Support.Computations
│   ├── List Processing                   - FreeType.Support.List
│   ├── Outline Processing                - FreeType.Support.Bitmap
│   ├── Quick retrieval of advance values - FreeType.Support.Outline     
│   ├── Bitmap Handling                   - FreeType.Support.Scanline
│   ├── Scanline Converter                - FreeType.Support.Advance
│   ├── Glyph Stroker                     - FreeType.Support.Glyph
│   ├── System Interface                  - FreeType.Support.System
│   ├── Module Management                 - FreeType.Support.Module
│   ├── GZIP Streams                      - FreeType.Support.GZIP
│   ├── LZQ Streams                       - FreeType.Support.LZW
│   └── BZIP2 Streams                     - FreeType.Support.BZIP2
├── Error Codes
│   ├── Error Enumerations                - FreeType.Error.Enumerations 
│   └── Error Values                      - FreeType.Error.Values
└── Miscellaneous
    ├── OpenType Validation               - FreeType.Miscellaneous.OpenType
    ├── Incremental Loading               - FreeType.Miscellaneous.Incremental
    ├── The TrueType Engine               - FreeType.Miscellaneous.TrueType
    └── TrueTypeGX/AAT Validation         - FreeType.Miscellaneous.TrueTypeGX
```

## Maintenance
Some bindings are bound to have errors in them, feel free to report them through Github.
