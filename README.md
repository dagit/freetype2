# freetype2

Bindings to the [FreeType2](https://www.freetype.org/) C library,
following the [API reference](https://www.freetype.org/freetype2/docs/reference/index.html).

These are _mostly_ raw with a few key changes:
- Every function that returns a `FT_Error` throws a `FtError` exception instead
  (defined in `FreeType.Exception`);
- A lot of the functions are wrappers that automatically allocate memory
  so you do not have to `alloca`/`peek`/`withCString` constantly;
- Field names are lens-compatible with all of the lens in the package
  (lens themselves are defined in `FreeType.Lens`);
- Deprecated values that are simply synonyms to other values are omitted.
- Every function that was modified by this library has a raw counterpart
  in a matching `*.Internal` module.

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
