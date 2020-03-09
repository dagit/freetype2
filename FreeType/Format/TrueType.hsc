{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE PatternSynonyms #-}
{-# LANGUAGE TemplateHaskell #-}

{- | Please refer to the
     [Format-Specific API > TrueType Tables](https://www.freetype.org/freetype2/docs/reference/ft2-truetype_tables.html)
     chapter of the reference.

     Internal: "FreeType.Format.TrueType.Internal".
 -}

module FreeType.Format.TrueType
  ( -- ** TT_Header
    TT_Header (..)
    -- ** TT_HoriHeader
  , TT_HoriHeader (..)
    -- ** TT_VertHeader
  , TT_VertHeader (..)
    -- ** TT_OS2
  , TT_OS2 (..)
    -- ** TT_Postscript
  , TT_Postscript (..)
    -- ** TT_PCLT
  , TT_PCLT (..)
    -- ** TT_MaxProfile
  , TT_MaxProfile (..)
    -- ** FT_Sfnt_Tag
  , FT_Sfnt_Tag
  , pattern FT_SFNT_HEAD
  , pattern FT_SFNT_MAXP
  , pattern FT_SFNT_OS2
  , pattern FT_SFNT_HHEA
  , pattern FT_SFNT_VHEA
  , pattern FT_SFNT_POST
  , pattern FT_SFNT_PCLT
    -- ** FT_Get_Sfnt_Table
  , ft_Get_Sfnt_Table
    -- ** FT_Load_Sfnt_Table
  , ft_Load_Sfnt_Table
    -- ** FT_Sfnt_Table_Info
  , ft_Sfnt_Table_Info
    -- ** FT_Get_CMap_Language_ID
  , ft_Get_CMap_Language_ID
    -- ** FT_Get_CMap_Format
  , ft_Get_CMap_Format
    -- ** FT_PARAM_TAG_UNPATENTED_HINTING
    -- | Deprecated: 'FT_PARAM_TAG_UNPATENTED_HINTING'.

    -- ** TT_PLATFORM_XXX
    -- | 'TT_PLATFORM_ISO' is deprecated.
  , pattern TT_PLATFORM_APPLE_UNICODE
  , pattern TT_PLATFORM_MACINTOSH
  , pattern TT_PLATFORM_MICROSOFT
  , pattern TT_PLATFORM_CUSTOM
  , pattern TT_PLATFORM_ADOBE
    -- ** TT_APPLE_ID_XXX
    -- | 'TT_APPLE_ID_ISO_10646' is deprecated.
  , pattern TT_APPLE_ID_DEFAULT
  , pattern TT_APPLE_ID_UNICODE_1_1
  , pattern TT_APPLE_ID_UNICODE_2_0
  , pattern TT_APPLE_ID_UNICODE_32
  , pattern TT_APPLE_ID_VARIANT_SELECTOR
  , pattern TT_APPLE_ID_FULL_UNICODE
    -- ** TT_MAC_ID_XXX
  , pattern TT_MAC_ID_ROMAN
  , pattern TT_MAC_ID_JAPANESE
  , pattern TT_MAC_ID_TRADITIONAL_CHINESE
  , pattern TT_MAC_ID_KOREAN
  , pattern TT_MAC_ID_ARABIC
  , pattern TT_MAC_ID_HEBREW
  , pattern TT_MAC_ID_GREEK
  , pattern TT_MAC_ID_RUSSIAN
  , pattern TT_MAC_ID_RSYMBOL
  , pattern TT_MAC_ID_DEVANAGARI
  , pattern TT_MAC_ID_GURMUKHI
  , pattern TT_MAC_ID_GUJARATI
  , pattern TT_MAC_ID_ORIYA
  , pattern TT_MAC_ID_BENGALI
  , pattern TT_MAC_ID_TAMIL
  , pattern TT_MAC_ID_TELUGU
  , pattern TT_MAC_ID_KANNADA
  , pattern TT_MAC_ID_MALAYALAM
  , pattern TT_MAC_ID_SINHALESE
  , pattern TT_MAC_ID_BURMESE
  , pattern TT_MAC_ID_KHMER
  , pattern TT_MAC_ID_THAI
  , pattern TT_MAC_ID_LAOTIAN
  , pattern TT_MAC_ID_GEORGIAN
  , pattern TT_MAC_ID_ARMENIAN
  , pattern TT_MAC_ID_MALDIVIAN
  , pattern TT_MAC_ID_SIMPLIFIED_CHINESE
  , pattern TT_MAC_ID_TIBETAN
  , pattern TT_MAC_ID_MONGOLIAN
  , pattern TT_MAC_ID_GEEZ
  , pattern TT_MAC_ID_SLAVIC
  , pattern TT_MAC_ID_VIETNAMESE
  , pattern TT_MAC_ID_SINDHI
  , pattern TT_MAC_ID_UNINTERP
    -- ** TT_ISO_ID_XXX
    -- | Deprecated: 'TT_ISO_ID_7BIT_ASCII', 'TT_ISO_ID_10646', 'TT_ISO_ID_8859_1'.

    -- ** TT_MS_ID_XXX
  , pattern TT_MS_ID_SYMBOL_CS
  , pattern TT_MS_ID_UNICODE_CS
  , pattern TT_MS_ID_SJIS
  , pattern TT_MS_ID_PRC
  , pattern TT_MS_ID_BIG_5
  , pattern TT_MS_ID_WANSUNG
  , pattern TT_MS_ID_JOHAB
  , pattern TT_MS_ID_UCS_4
  , pattern TT_MS_ID_GB2312
    -- ** TT_ADOBE_ID_XXX
  , pattern TT_ADOBE_ID_STANDARD
  , pattern TT_ADOBE_ID_EXPERT
  , pattern TT_ADOBE_ID_CUSTOM
  , pattern TT_ADOBE_ID_LATIN_1
    -- ** TT_MAC_LANGID_XXX
  , pattern TT_MAC_LANGID_ENGLISH
  , pattern TT_MAC_LANGID_FRENCH
  , pattern TT_MAC_LANGID_GERMAN
  , pattern TT_MAC_LANGID_ITALIAN
  , pattern TT_MAC_LANGID_DUTCH
  , pattern TT_MAC_LANGID_SWEDISH
  , pattern TT_MAC_LANGID_SPANISH
  , pattern TT_MAC_LANGID_DANISH
  , pattern TT_MAC_LANGID_PORTUGUESE
  , pattern TT_MAC_LANGID_NORWEGIAN
  , pattern TT_MAC_LANGID_HEBREW
  , pattern TT_MAC_LANGID_JAPANESE
  , pattern TT_MAC_LANGID_ARABIC
  , pattern TT_MAC_LANGID_FINNISH
  , pattern TT_MAC_LANGID_GREEK
  , pattern TT_MAC_LANGID_ICELANDIC
  , pattern TT_MAC_LANGID_MALTESE
  , pattern TT_MAC_LANGID_TURKISH
  , pattern TT_MAC_LANGID_CROATIAN
  , pattern TT_MAC_LANGID_CHINESE_TRADITIONAL
  , pattern TT_MAC_LANGID_URDU
  , pattern TT_MAC_LANGID_HINDI
  , pattern TT_MAC_LANGID_THAI
  , pattern TT_MAC_LANGID_KOREAN
  , pattern TT_MAC_LANGID_LITHUANIAN
  , pattern TT_MAC_LANGID_POLISH
  , pattern TT_MAC_LANGID_HUNGARIAN
  , pattern TT_MAC_LANGID_ESTONIAN
  , pattern TT_MAC_LANGID_LETTISH
  , pattern TT_MAC_LANGID_SAAMISK
  , pattern TT_MAC_LANGID_FAEROESE
  , pattern TT_MAC_LANGID_FARSI
  , pattern TT_MAC_LANGID_RUSSIAN
  , pattern TT_MAC_LANGID_CHINESE_SIMPLIFIED
  , pattern TT_MAC_LANGID_FLEMISH
  , pattern TT_MAC_LANGID_IRISH
  , pattern TT_MAC_LANGID_ALBANIAN
  , pattern TT_MAC_LANGID_ROMANIAN
  , pattern TT_MAC_LANGID_CZECH
  , pattern TT_MAC_LANGID_SLOVAK
  , pattern TT_MAC_LANGID_SLOVENIAN
  , pattern TT_MAC_LANGID_YIDDISH
  , pattern TT_MAC_LANGID_SERBIAN
  , pattern TT_MAC_LANGID_MACEDONIAN
  , pattern TT_MAC_LANGID_BULGARIAN
  , pattern TT_MAC_LANGID_UKRAINIAN
  , pattern TT_MAC_LANGID_BYELORUSSIAN
  , pattern TT_MAC_LANGID_UZBEK
  , pattern TT_MAC_LANGID_KAZAKH
  , pattern TT_MAC_LANGID_AZERBAIJANI
  , pattern TT_MAC_LANGID_AZERBAIJANI_CYRILLIC_SCRIPT
  , pattern TT_MAC_LANGID_AZERBAIJANI_ARABIC_SCRIPT
  , pattern TT_MAC_LANGID_ARMENIAN
  , pattern TT_MAC_LANGID_GEORGIAN
  , pattern TT_MAC_LANGID_MOLDAVIAN
  , pattern TT_MAC_LANGID_KIRGHIZ
  , pattern TT_MAC_LANGID_TAJIKI
  , pattern TT_MAC_LANGID_TURKMEN
  , pattern TT_MAC_LANGID_MONGOLIAN
  , pattern TT_MAC_LANGID_MONGOLIAN_MONGOLIAN_SCRIPT
  , pattern TT_MAC_LANGID_MONGOLIAN_CYRILLIC_SCRIPT
  , pattern TT_MAC_LANGID_PASHTO
  , pattern TT_MAC_LANGID_KURDISH
  , pattern TT_MAC_LANGID_KASHMIRI
  , pattern TT_MAC_LANGID_SINDHI
  , pattern TT_MAC_LANGID_TIBETAN
  , pattern TT_MAC_LANGID_NEPALI
  , pattern TT_MAC_LANGID_SANSKRIT
  , pattern TT_MAC_LANGID_MARATHI
  , pattern TT_MAC_LANGID_BENGALI
  , pattern TT_MAC_LANGID_ASSAMESE
  , pattern TT_MAC_LANGID_GUJARATI
  , pattern TT_MAC_LANGID_PUNJABI
  , pattern TT_MAC_LANGID_ORIYA
  , pattern TT_MAC_LANGID_MALAYALAM
  , pattern TT_MAC_LANGID_KANNADA
  , pattern TT_MAC_LANGID_TAMIL
  , pattern TT_MAC_LANGID_TELUGU
  , pattern TT_MAC_LANGID_SINHALESE
  , pattern TT_MAC_LANGID_BURMESE
  , pattern TT_MAC_LANGID_KHMER
  , pattern TT_MAC_LANGID_LAO
  , pattern TT_MAC_LANGID_VIETNAMESE
  , pattern TT_MAC_LANGID_INDONESIAN
  , pattern TT_MAC_LANGID_TAGALOG
  , pattern TT_MAC_LANGID_MALAY_ROMAN_SCRIPT
  , pattern TT_MAC_LANGID_MALAY_ARABIC_SCRIPT
  , pattern TT_MAC_LANGID_AMHARIC
  , pattern TT_MAC_LANGID_TIGRINYA
  , pattern TT_MAC_LANGID_GALLA
  , pattern TT_MAC_LANGID_SOMALI
  , pattern TT_MAC_LANGID_SWAHILI
  , pattern TT_MAC_LANGID_RUANDA
  , pattern TT_MAC_LANGID_RUNDI
  , pattern TT_MAC_LANGID_CHEWA
  , pattern TT_MAC_LANGID_MALAGASY
  , pattern TT_MAC_LANGID_ESPERANTO
  , pattern TT_MAC_LANGID_WELSH
  , pattern TT_MAC_LANGID_BASQUE
  , pattern TT_MAC_LANGID_CATALAN
  , pattern TT_MAC_LANGID_LATIN
  , pattern TT_MAC_LANGID_QUECHUA
  , pattern TT_MAC_LANGID_GUARANI
  , pattern TT_MAC_LANGID_AYMARA
  , pattern TT_MAC_LANGID_TATAR
  , pattern TT_MAC_LANGID_UIGHUR
  , pattern TT_MAC_LANGID_DZONGKHA
  , pattern TT_MAC_LANGID_JAVANESE
  , pattern TT_MAC_LANGID_SUNDANESE
  , pattern TT_MAC_LANGID_GALICIAN
  , pattern TT_MAC_LANGID_AFRIKAANS
  , pattern TT_MAC_LANGID_BRETON
  , pattern TT_MAC_LANGID_INUKTITUT
  , pattern TT_MAC_LANGID_SCOTTISH_GAELIC
  , pattern TT_MAC_LANGID_MANX_GAELIC
  , pattern TT_MAC_LANGID_IRISH_GAELIC
  , pattern TT_MAC_LANGID_TONGAN
  , pattern TT_MAC_LANGID_GREEK_POLYTONIC
  , pattern TT_MAC_LANGID_GREELANDIC
  , pattern TT_MAC_LANGID_AZERBAIJANI_ROMAN_SCRIPT
    -- ** TT_MS_LANGID_XXX
  , pattern TT_MS_LANGID_ARABIC_SAUDI_ARABIA
  , pattern TT_MS_LANGID_ARABIC_IRAQ
  , pattern TT_MS_LANGID_ARABIC_EGYPT
  , pattern TT_MS_LANGID_ARABIC_LIBYA
  , pattern TT_MS_LANGID_ARABIC_ALGERIA
  , pattern TT_MS_LANGID_ARABIC_MOROCCO
  , pattern TT_MS_LANGID_ARABIC_TUNISIA
  , pattern TT_MS_LANGID_ARABIC_OMAN
  , pattern TT_MS_LANGID_ARABIC_YEMEN
  , pattern TT_MS_LANGID_ARABIC_SYRIA
  , pattern TT_MS_LANGID_ARABIC_JORDAN
  , pattern TT_MS_LANGID_ARABIC_LEBANON
  , pattern TT_MS_LANGID_ARABIC_KUWAIT
  , pattern TT_MS_LANGID_ARABIC_UAE
  , pattern TT_MS_LANGID_ARABIC_BAHRAIN
  , pattern TT_MS_LANGID_ARABIC_QATAR
  , pattern TT_MS_LANGID_BULGARIAN_BULGARIA
  , pattern TT_MS_LANGID_CATALAN_CATALAN
  , pattern TT_MS_LANGID_CHINESE_TAIWAN
  , pattern TT_MS_LANGID_CHINESE_PRC
  , pattern TT_MS_LANGID_CHINESE_HONG_KONG
  , pattern TT_MS_LANGID_CHINESE_SINGAPORE
  , pattern TT_MS_LANGID_CHINESE_MACAO
  , pattern TT_MS_LANGID_CZECH_CZECH_REPUBLIC
  , pattern TT_MS_LANGID_DANISH_DENMARK
  , pattern TT_MS_LANGID_GERMAN_GERMANY
  , pattern TT_MS_LANGID_GERMAN_SWITZERLAND
  , pattern TT_MS_LANGID_GERMAN_AUSTRIA
  , pattern TT_MS_LANGID_GERMAN_LUXEMBOURG
  , pattern TT_MS_LANGID_GERMAN_LIECHTENSTEIN
  , pattern TT_MS_LANGID_GREEK_GREECE
  , pattern TT_MS_LANGID_ENGLISH_UNITED_STATES
  , pattern TT_MS_LANGID_ENGLISH_UNITED_KINGDOM
  , pattern TT_MS_LANGID_ENGLISH_AUSTRALIA
  , pattern TT_MS_LANGID_ENGLISH_CANADA
  , pattern TT_MS_LANGID_ENGLISH_NEW_ZEALAND
  , pattern TT_MS_LANGID_ENGLISH_IRELAND
  , pattern TT_MS_LANGID_ENGLISH_SOUTH_AFRICA
  , pattern TT_MS_LANGID_ENGLISH_JAMAICA
  , pattern TT_MS_LANGID_ENGLISH_CARIBBEAN
  , pattern TT_MS_LANGID_ENGLISH_BELIZE
  , pattern TT_MS_LANGID_ENGLISH_TRINIDAD
  , pattern TT_MS_LANGID_ENGLISH_ZIMBABWE
  , pattern TT_MS_LANGID_ENGLISH_PHILIPPINES
  , pattern TT_MS_LANGID_ENGLISH_INDIA
  , pattern TT_MS_LANGID_ENGLISH_MALAYSIA
  , pattern TT_MS_LANGID_ENGLISH_SINGAPORE
  , pattern TT_MS_LANGID_SPANISH_SPAIN_TRADITIONAL_SORT
  , pattern TT_MS_LANGID_SPANISH_MEXICO
  , pattern TT_MS_LANGID_SPANISH_SPAIN_MODERN_SORT
  , pattern TT_MS_LANGID_SPANISH_GUATEMALA
  , pattern TT_MS_LANGID_SPANISH_COSTA_RICA
  , pattern TT_MS_LANGID_SPANISH_PANAMA
  , pattern TT_MS_LANGID_SPANISH_DOMINICAN_REPUBLIC
  , pattern TT_MS_LANGID_SPANISH_VENEZUELA
  , pattern TT_MS_LANGID_SPANISH_COLOMBIA
  , pattern TT_MS_LANGID_SPANISH_PERU
  , pattern TT_MS_LANGID_SPANISH_ARGENTINA
  , pattern TT_MS_LANGID_SPANISH_ECUADOR
  , pattern TT_MS_LANGID_SPANISH_CHILE
  , pattern TT_MS_LANGID_SPANISH_URUGUAY
  , pattern TT_MS_LANGID_SPANISH_PARAGUAY
  , pattern TT_MS_LANGID_SPANISH_BOLIVIA
  , pattern TT_MS_LANGID_SPANISH_EL_SALVADOR
  , pattern TT_MS_LANGID_SPANISH_HONDURAS
  , pattern TT_MS_LANGID_SPANISH_NICARAGUA
  , pattern TT_MS_LANGID_SPANISH_PUERTO_RICO
  , pattern TT_MS_LANGID_SPANISH_UNITED_STATES
  , pattern TT_MS_LANGID_FINNISH_FINLAND
  , pattern TT_MS_LANGID_FRENCH_FRANCE
  , pattern TT_MS_LANGID_FRENCH_BELGIUM
  , pattern TT_MS_LANGID_FRENCH_CANADA
  , pattern TT_MS_LANGID_FRENCH_SWITZERLAND
  , pattern TT_MS_LANGID_FRENCH_LUXEMBOURG
  , pattern TT_MS_LANGID_FRENCH_MONACO
  , pattern TT_MS_LANGID_HEBREW_ISRAEL
  , pattern TT_MS_LANGID_HUNGARIAN_HUNGARY
  , pattern TT_MS_LANGID_ICELANDIC_ICELAND
  , pattern TT_MS_LANGID_ITALIAN_ITALY
  , pattern TT_MS_LANGID_ITALIAN_SWITZERLAND
  , pattern TT_MS_LANGID_JAPANESE_JAPAN
  , pattern TT_MS_LANGID_KOREAN_KOREA
  , pattern TT_MS_LANGID_DUTCH_NETHERLANDS
  , pattern TT_MS_LANGID_DUTCH_BELGIUM
  , pattern TT_MS_LANGID_NORWEGIAN_NORWAY_BOKMAL
  , pattern TT_MS_LANGID_NORWEGIAN_NORWAY_NYNORSK
  , pattern TT_MS_LANGID_POLISH_POLAND
  , pattern TT_MS_LANGID_PORTUGUESE_BRAZIL
  , pattern TT_MS_LANGID_PORTUGUESE_PORTUGAL
  , pattern TT_MS_LANGID_ROMANSH_SWITZERLAND
  , pattern TT_MS_LANGID_ROMANIAN_ROMANIA
  , pattern TT_MS_LANGID_RUSSIAN_RUSSIA
  , pattern TT_MS_LANGID_CROATIAN_CROATIA
  , pattern TT_MS_LANGID_SERBIAN_SERBIA_LATIN
  , pattern TT_MS_LANGID_SERBIAN_SERBIA_CYRILLIC
  , pattern TT_MS_LANGID_CROATIAN_BOSNIA_HERZEGOVINA
  , pattern TT_MS_LANGID_BOSNIAN_BOSNIA_HERZEGOVINA
  , pattern TT_MS_LANGID_SERBIAN_BOSNIA_HERZ_LATIN
  , pattern TT_MS_LANGID_SERBIAN_BOSNIA_HERZ_CYRILLIC
  , pattern TT_MS_LANGID_BOSNIAN_BOSNIA_HERZ_CYRILLIC
  , pattern TT_MS_LANGID_SLOVAK_SLOVAKIA
  , pattern TT_MS_LANGID_ALBANIAN_ALBANIA
  , pattern TT_MS_LANGID_SWEDISH_SWEDEN
  , pattern TT_MS_LANGID_SWEDISH_FINLAND
  , pattern TT_MS_LANGID_THAI_THAILAND
  , pattern TT_MS_LANGID_TURKISH_TURKEY
  , pattern TT_MS_LANGID_URDU_PAKISTAN
  , pattern TT_MS_LANGID_INDONESIAN_INDONESIA
  , pattern TT_MS_LANGID_UKRAINIAN_UKRAINE
  , pattern TT_MS_LANGID_BELARUSIAN_BELARUS
  , pattern TT_MS_LANGID_SLOVENIAN_SLOVENIA
  , pattern TT_MS_LANGID_ESTONIAN_ESTONIA
  , pattern TT_MS_LANGID_LATVIAN_LATVIA
  , pattern TT_MS_LANGID_LITHUANIAN_LITHUANIA
  , pattern TT_MS_LANGID_TAJIK_TAJIKISTAN
  , pattern TT_MS_LANGID_VIETNAMESE_VIET_NAM
  , pattern TT_MS_LANGID_ARMENIAN_ARMENIA
  , pattern TT_MS_LANGID_AZERI_AZERBAIJAN_LATIN
  , pattern TT_MS_LANGID_AZERI_AZERBAIJAN_CYRILLIC
  , pattern TT_MS_LANGID_BASQUE_BASQUE
  , pattern TT_MS_LANGID_UPPER_SORBIAN_GERMANY
  , pattern TT_MS_LANGID_LOWER_SORBIAN_GERMANY
  , pattern TT_MS_LANGID_MACEDONIAN_MACEDONIA
  , pattern TT_MS_LANGID_SETSWANA_SOUTH_AFRICA
  , pattern TT_MS_LANGID_ISIXHOSA_SOUTH_AFRICA
  , pattern TT_MS_LANGID_ISIZULU_SOUTH_AFRICA
  , pattern TT_MS_LANGID_AFRIKAANS_SOUTH_AFRICA
  , pattern TT_MS_LANGID_GEORGIAN_GEORGIA
  , pattern TT_MS_LANGID_FAEROESE_FAEROE_ISLANDS
  , pattern TT_MS_LANGID_HINDI_INDIA
  , pattern TT_MS_LANGID_MALTESE_MALTA
  , pattern TT_MS_LANGID_SAMI_NORTHERN_NORWAY
  , pattern TT_MS_LANGID_SAMI_NORTHERN_SWEDEN
  , pattern TT_MS_LANGID_SAMI_NORTHERN_FINLAND
  , pattern TT_MS_LANGID_SAMI_LULE_NORWAY
  , pattern TT_MS_LANGID_SAMI_LULE_SWEDEN
  , pattern TT_MS_LANGID_SAMI_SOUTHERN_NORWAY
  , pattern TT_MS_LANGID_SAMI_SOUTHERN_SWEDEN
  , pattern TT_MS_LANGID_SAMI_SKOLT_FINLAND
  , pattern TT_MS_LANGID_SAMI_INARI_FINLAND
  , pattern TT_MS_LANGID_IRISH_IRELAND
  , pattern TT_MS_LANGID_MALAY_MALAYSIA
  , pattern TT_MS_LANGID_MALAY_BRUNEI_DARUSSALAM
  , pattern TT_MS_LANGID_KAZAKH_KAZAKHSTAN
  , pattern TT_MS_LANGID_KYRGYZ_KYRGYZSTAN
  , pattern TT_MS_LANGID_KISWAHILI_KENYA
  , pattern TT_MS_LANGID_TURKMEN_TURKMENISTAN
  , pattern TT_MS_LANGID_UZBEK_UZBEKISTAN_LATIN
  , pattern TT_MS_LANGID_UZBEK_UZBEKISTAN_CYRILLIC
  , pattern TT_MS_LANGID_TATAR_RUSSIA
  , pattern TT_MS_LANGID_BENGALI_INDIA
  , pattern TT_MS_LANGID_BENGALI_BANGLADESH
  , pattern TT_MS_LANGID_PUNJABI_INDIA
  , pattern TT_MS_LANGID_GUJARATI_INDIA
  , pattern TT_MS_LANGID_ODIA_INDIA
  , pattern TT_MS_LANGID_TAMIL_INDIA
  , pattern TT_MS_LANGID_TELUGU_INDIA
  , pattern TT_MS_LANGID_KANNADA_INDIA
  , pattern TT_MS_LANGID_MALAYALAM_INDIA
  , pattern TT_MS_LANGID_ASSAMESE_INDIA
  , pattern TT_MS_LANGID_MARATHI_INDIA
  , pattern TT_MS_LANGID_SANSKRIT_INDIA
  , pattern TT_MS_LANGID_MONGOLIAN_MONGOLIA
  , pattern TT_MS_LANGID_MONGOLIAN_PRC
  , pattern TT_MS_LANGID_TIBETAN_PRC
  , pattern TT_MS_LANGID_WELSH_UNITED_KINGDOM
  , pattern TT_MS_LANGID_KHMER_CAMBODIA
  , pattern TT_MS_LANGID_LAO_LAOS
  , pattern TT_MS_LANGID_GALICIAN_GALICIAN
  , pattern TT_MS_LANGID_KONKANI_INDIA
  , pattern TT_MS_LANGID_SYRIAC_SYRIA
  , pattern TT_MS_LANGID_SINHALA_SRI_LANKA
  , pattern TT_MS_LANGID_INUKTITUT_CANADA
  , pattern TT_MS_LANGID_INUKTITUT_CANADA_LATIN
  , pattern TT_MS_LANGID_AMHARIC_ETHIOPIA
  , pattern TT_MS_LANGID_TAMAZIGHT_ALGERIA
  , pattern TT_MS_LANGID_NEPALI_NEPAL
  , pattern TT_MS_LANGID_FRISIAN_NETHERLANDS
  , pattern TT_MS_LANGID_PASHTO_AFGHANISTAN
  , pattern TT_MS_LANGID_FILIPINO_PHILIPPINES
  , pattern TT_MS_LANGID_DHIVEHI_MALDIVES
  , pattern TT_MS_LANGID_HAUSA_NIGERIA
  , pattern TT_MS_LANGID_YORUBA_NIGERIA
  , pattern TT_MS_LANGID_QUECHUA_BOLIVIA
  , pattern TT_MS_LANGID_QUECHUA_ECUADOR
  , pattern TT_MS_LANGID_QUECHUA_PERU
  , pattern TT_MS_LANGID_SESOTHO_SA_LEBOA_SOUTH_AFRICA
  , pattern TT_MS_LANGID_BASHKIR_RUSSIA
  , pattern TT_MS_LANGID_LUXEMBOURGISH_LUXEMBOURG
  , pattern TT_MS_LANGID_GREENLANDIC_GREENLAND
  , pattern TT_MS_LANGID_IGBO_NIGERIA
  , pattern TT_MS_LANGID_YI_PRC
  , pattern TT_MS_LANGID_MAPUDUNGUN_CHILE
  , pattern TT_MS_LANGID_MOHAWK_MOHAWK
  , pattern TT_MS_LANGID_BRETON_FRANCE
  , pattern TT_MS_LANGID_UIGHUR_PRC
  , pattern TT_MS_LANGID_MAORI_NEW_ZEALAND
  , pattern TT_MS_LANGID_OCCITAN_FRANCE
  , pattern TT_MS_LANGID_CORSICAN_FRANCE
  , pattern TT_MS_LANGID_ALSATIAN_FRANCE
  , pattern TT_MS_LANGID_YAKUT_RUSSIA
  , pattern TT_MS_LANGID_KICHE_GUATEMALA
  , pattern TT_MS_LANGID_KINYARWANDA_RWANDA
  , pattern TT_MS_LANGID_WOLOF_SENEGAL
  , pattern TT_MS_LANGID_DARI_AFGHANISTAN
    -- ** TT_NAME_ID_XXX
  , pattern TT_NAME_ID_COPYRIGHT
  , pattern TT_NAME_ID_FONT_FAMILY
  , pattern TT_NAME_ID_FONT_SUBFAMILY
  , pattern TT_NAME_ID_UNIQUE_ID
  , pattern TT_NAME_ID_FULL_NAME
  , pattern TT_NAME_ID_VERSION_STRING
  , pattern TT_NAME_ID_PS_NAME
  , pattern TT_NAME_ID_TRADEMARK
  , pattern TT_NAME_ID_MANUFACTURER
  , pattern TT_NAME_ID_DESIGNER
  , pattern TT_NAME_ID_DESCRIPTION
  , pattern TT_NAME_ID_VENDOR_URL
  , pattern TT_NAME_ID_DESIGNER_URL
  , pattern TT_NAME_ID_LICENSE
  , pattern TT_NAME_ID_LICENSE_URL
  , pattern TT_NAME_ID_TYPOGRAPHIC_FAMILY
  , pattern TT_NAME_ID_TYPOGRAPHIC_SUBFAMILY
  , pattern TT_NAME_ID_MAC_FULL_NAME
  , pattern TT_NAME_ID_SAMPLE_TEXT
  , pattern TT_NAME_ID_CID_FINDFONT_NAME
  , pattern TT_NAME_ID_WWS_FAMILY
  , pattern TT_NAME_ID_WWS_SUBFAMILY
  , pattern TT_NAME_ID_LIGHT_BACKGROUND
  , pattern TT_NAME_ID_DARK_BACKGROUND
  , pattern TT_NAME_ID_VARIATIONS_PREFIX
    -- ** TT_UCR_XXX
    -- *** ulUnicodeRange1
  , pattern TT_UCR_BASIC_LATIN
  , pattern TT_UCR_LATIN1_SUPPLEMENT
  , pattern TT_UCR_LATIN_EXTENDED_A
  , pattern TT_UCR_LATIN_EXTENDED_B
  , pattern TT_UCR_IPA_EXTENSIONS
  , pattern TT_UCR_SPACING_MODIFIER
  , pattern TT_UCR_COMBINING_DIACRITICAL_MARKS
  , pattern TT_UCR_GREEK
  , pattern TT_UCR_COPTIC
  , pattern TT_UCR_CYRILLIC
  , pattern TT_UCR_ARMENIAN
  , pattern TT_UCR_HEBREW
  , pattern TT_UCR_VAI
  , pattern TT_UCR_ARABIC
  , pattern TT_UCR_NKO
  , pattern TT_UCR_DEVANAGARI
  , pattern TT_UCR_BENGALI
  , pattern TT_UCR_GURMUKHI
  , pattern TT_UCR_GUJARATI
  , pattern TT_UCR_ORIYA
  , pattern TT_UCR_TAMIL
  , pattern TT_UCR_TELUGU
  , pattern TT_UCR_KANNADA
  , pattern TT_UCR_MALAYALAM
  , pattern TT_UCR_THAI
  , pattern TT_UCR_LAO
  , pattern TT_UCR_GEORGIAN
  , pattern TT_UCR_BALINESE
  , pattern TT_UCR_HANGUL_JAMO
  , pattern TT_UCR_LATIN_EXTENDED_ADDITIONAL
  , pattern TT_UCR_GREEK_EXTENDED
  , pattern TT_UCR_GENERAL_PUNCTUATION
    -- *** ulUnicodeRange2
  , pattern TT_UCR_SUPERSCRIPTS_SUBSCRIPTS
  , pattern TT_UCR_CURRENCY_SYMBOLS
  , pattern TT_UCR_COMBINING_DIACRITICAL_MARKS_SYMB
  , pattern TT_UCR_LETTERLIKE_SYMBOLS
  , pattern TT_UCR_NUMBER_FORMS
  , pattern TT_UCR_ARROWS
  , pattern TT_UCR_MATHEMATICAL_OPERATORS
  , pattern TT_UCR_MISCELLANEOUS_TECHNICAL
  , pattern TT_UCR_CONTROL_PICTURES
  , pattern TT_UCR_OCR
  , pattern TT_UCR_ENCLOSED_ALPHANUMERICS
  , pattern TT_UCR_BOX_DRAWING
  , pattern TT_UCR_BLOCK_ELEMENTS
  , pattern TT_UCR_GEOMETRIC_SHAPES
  , pattern TT_UCR_MISCELLANEOUS_SYMBOLS
  , pattern TT_UCR_DINGBATS
  , pattern TT_UCR_CJK_SYMBOLS
  , pattern TT_UCR_HIRAGANA
  , pattern TT_UCR_KATAKANA
  , pattern TT_UCR_BOPOMOFO
  , pattern TT_UCR_HANGUL_COMPATIBILITY_JAMO
  , pattern TT_UCR_CJK_MISC
  , pattern TT_UCR_ENCLOSED_CJK_LETTERS_MONTHS
  , pattern TT_UCR_CJK_COMPATIBILITY
  , pattern TT_UCR_HANGUL
  , pattern TT_UCR_SURROGATES
  , pattern TT_UCR_NON_PLANE_0
  , pattern TT_UCR_PHOENICIAN
  , pattern TT_UCR_CJK_UNIFIED_IDEOGRAPHS
  , pattern TT_UCR_PRIVATE_USE
  , pattern TT_UCR_CJK_COMPATIBILITY_IDEOGRAPHS
  , pattern TT_UCR_ALPHABETIC_PRESENTATION_FORMS
  , pattern TT_UCR_ARABIC_PRESENTATION_FORMS_A
    -- *** ulUnicodeRange3
  , pattern TT_UCR_COMBINING_HALF_MARKS
  , pattern TT_UCR_CJK_COMPATIBILITY_FORMS
  , pattern TT_UCR_SMALL_FORM_VARIANTS
  , pattern TT_UCR_ARABIC_PRESENTATION_FORMS_B
  , pattern TT_UCR_HALFWIDTH_FULLWIDTH_FORMS
  , pattern TT_UCR_SPECIALS
  , pattern TT_UCR_TIBETAN
  , pattern TT_UCR_SYRIAC
  , pattern TT_UCR_THAANA
  , pattern TT_UCR_SINHALA
  , pattern TT_UCR_MYANMAR
  , pattern TT_UCR_ETHIOPIC
  , pattern TT_UCR_CHEROKEE
  , pattern TT_UCR_CANADIAN_ABORIGINAL_SYLLABICS
  , pattern TT_UCR_OGHAM
  , pattern TT_UCR_RUNIC
  , pattern TT_UCR_KHMER
  , pattern TT_UCR_MONGOLIAN
  , pattern TT_UCR_BRAILLE
  , pattern TT_UCR_YI
  , pattern TT_UCR_PHILIPPINE
  , pattern TT_UCR_OLD_ITALIC
  , pattern TT_UCR_GOTHIC
  , pattern TT_UCR_DESERET
  , pattern TT_UCR_MUSICAL_SYMBOLS
  , pattern TT_UCR_MATH_ALPHANUMERIC_SYMBOLS
  , pattern TT_UCR_PRIVATE_USE_SUPPLEMENTARY
  , pattern TT_UCR_VARIATION_SELECTORS
  , pattern TT_UCR_TAGS
  , pattern TT_UCR_LIMBU
  , pattern TT_UCR_TAI_LE
  , pattern TT_UCR_NEW_TAI_LUE
    -- *** ulUnicodeRange4
  , pattern TT_UCR_BUGINESE
  , pattern TT_UCR_GLAGOLITIC
  , pattern TT_UCR_TIFINAGH
  , pattern TT_UCR_YIJING
  , pattern TT_UCR_SYLOTI_NAGRI
  , pattern TT_UCR_LINEAR_B
  , pattern TT_UCR_ANCIENT_GREEK_NUMBERS
  , pattern TT_UCR_UGARITIC
  , pattern TT_UCR_OLD_PERSIAN
  , pattern TT_UCR_SHAVIAN
  , pattern TT_UCR_OSMANYA
  , pattern TT_UCR_CYPRIOT_SYLLABARY
  , pattern TT_UCR_KHAROSHTHI
  , pattern TT_UCR_TAI_XUAN_JING
  , pattern TT_UCR_CUNEIFORM
  , pattern TT_UCR_COUNTING_ROD_NUMERALS
  , pattern TT_UCR_SUNDANESE
  , pattern TT_UCR_LEPCHA
  , pattern TT_UCR_OL_CHIKI
  , pattern TT_UCR_SAURASHTRA
  , pattern TT_UCR_KAYAH_LI
  , pattern TT_UCR_REJANG
  , pattern TT_UCR_CHAM
  , pattern TT_UCR_ANCIENT_SYMBOLS
  , pattern TT_UCR_PHAISTOS_DISC
  , pattern TT_UCR_OLD_ANATOLIAN
  , pattern TT_UCR_GAME_TILES
  ) where

import           FreeType.Core.Base.Types
import           FreeType.Core.Types.Types
import           FreeType.Exception.Internal
import           FreeType.Format.TrueType.Internal
import           FreeType.Format.TrueType.Types

import           Foreign.Marshal.Alloc
import           Foreign.Marshal.Array
import           Foreign.Marshal.Utils
import           Foreign.Ptr
import           Foreign.Storable

#include "ft2build.h"
#include FT_TRUETYPE_TABLES_H
#include FT_TRUETYPE_IDS_H

pattern FT_SFNT_HEAD
      , FT_SFNT_MAXP
      , FT_SFNT_OS2
      , FT_SFNT_HHEA
      , FT_SFNT_VHEA
      , FT_SFNT_POST
      , FT_SFNT_PCLT
     :: FT_Sfnt_Tag
pattern FT_SFNT_HEAD = #const FT_SFNT_HEAD
pattern FT_SFNT_MAXP = #const FT_SFNT_MAXP
pattern FT_SFNT_OS2  = #const FT_SFNT_OS2
pattern FT_SFNT_HHEA = #const FT_SFNT_HHEA
pattern FT_SFNT_VHEA = #const FT_SFNT_VHEA
pattern FT_SFNT_POST = #const FT_SFNT_POST
pattern FT_SFNT_PCLT = #const FT_SFNT_PCLT



ft_Get_Sfnt_Table
  :: FT_Face             -- ^ face
  -> FT_Sfnt_Tag         -- ^ tag
  -> IO (Maybe (Ptr ()))
ft_Get_Sfnt_Table face tag = do
  result <- ft_Get_Sfnt_Table' face tag
  return $ if result == nullPtr
             then Nothing
             else Just result



-- | If @length@ is zero, 'ft_Load_Sfnt_Table' automatically reruns the
--   the underlying function with the returned table length.
--
--   The returned buffer is allocated with 'malloc' and therefore must be 'free'd
--   manually.
ft_Load_Sfnt_Table
  :: FT_Face          -- ^ face
  -> FT_ULong         -- ^ tag
  -> FT_Long          -- ^ offset
  -> FT_ULong         -- ^ length
  -> IO (Ptr FT_Byte) -- ^ buffer
ft_Load_Sfnt_Table face tag offset 0 =
  alloca $ \lengthPtr -> do
    ftError 'ft_Load_Sfnt_Table $ ft_Load_Sfnt_Table' face tag offset nullPtr lengthPtr
    length_ <- peek lengthPtr
    bufferPtr <- mallocArray $ fromIntegral length_
    ftError 'ft_Load_Sfnt_Table $ ft_Load_Sfnt_Table' face tag offset bufferPtr lengthPtr
    return bufferPtr

ft_Load_Sfnt_Table face tag offset length_ =
  with length_ $ \lengthPtr -> do
    bufferPtr <- mallocArray $ fromIntegral length_
    ftError 'ft_Load_Sfnt_Table $ ft_Load_Sfnt_Table' face tag offset bufferPtr lengthPtr
    return bufferPtr



ft_Sfnt_Table_Info
  :: FT_Face        -- ^ face
  -> FT_UInt        -- ^ table_index
  -> Maybe FT_ULong -- ^ tag
  -> IO FT_ULong    -- ^ length
ft_Sfnt_Table_Info face index Nothing =
  alloca $ \lengthPtr -> do
    ftError 'ft_Sfnt_Table_Info $ ft_Sfnt_Table_Info' face index nullPtr lengthPtr
    peek lengthPtr

ft_Sfnt_Table_Info face index (Just tag) =
  with tag $ \tagPtr ->
    alloca $ \lengthPtr -> do
      ftError 'ft_Sfnt_Table_Info $ ft_Sfnt_Table_Info' face index tagPtr lengthPtr
      peek lengthPtr



foreign import ccall "FT_Get_CMap_Language_ID"
  ft_Get_CMap_Language_ID :: FT_CharMap -> IO FT_ULong



foreign import ccall "FT_Get_CMap_Format"
  ft_Get_CMap_Format :: FT_CharMap -> IO FT_Long



pattern TT_PLATFORM_APPLE_UNICODE
      , TT_PLATFORM_MACINTOSH
      , TT_PLATFORM_MICROSOFT
      , TT_PLATFORM_CUSTOM
      , TT_PLATFORM_ADOBE
     :: FT_UShort
pattern TT_PLATFORM_APPLE_UNICODE = #const TT_PLATFORM_APPLE_UNICODE
pattern TT_PLATFORM_MACINTOSH     = #const TT_PLATFORM_MACINTOSH
pattern TT_PLATFORM_MICROSOFT     = #const TT_PLATFORM_MICROSOFT
pattern TT_PLATFORM_CUSTOM        = #const TT_PLATFORM_CUSTOM
pattern TT_PLATFORM_ADOBE         = #const TT_PLATFORM_ADOBE



pattern TT_APPLE_ID_DEFAULT
      , TT_APPLE_ID_UNICODE_1_1
      , TT_APPLE_ID_UNICODE_2_0
      , TT_APPLE_ID_UNICODE_32
      , TT_APPLE_ID_VARIANT_SELECTOR
      , TT_APPLE_ID_FULL_UNICODE
     :: FT_UShort
pattern TT_APPLE_ID_DEFAULT          = #const TT_APPLE_ID_DEFAULT
pattern TT_APPLE_ID_UNICODE_1_1      = #const TT_APPLE_ID_UNICODE_1_1
pattern TT_APPLE_ID_UNICODE_2_0      = #const TT_APPLE_ID_UNICODE_2_0
pattern TT_APPLE_ID_UNICODE_32       = #const TT_APPLE_ID_UNICODE_32
pattern TT_APPLE_ID_VARIANT_SELECTOR = #const TT_APPLE_ID_VARIANT_SELECTOR
pattern TT_APPLE_ID_FULL_UNICODE     = #const TT_APPLE_ID_FULL_UNICODE



pattern TT_MAC_ID_ROMAN
      , TT_MAC_ID_JAPANESE
      , TT_MAC_ID_TRADITIONAL_CHINESE
      , TT_MAC_ID_KOREAN
      , TT_MAC_ID_ARABIC
      , TT_MAC_ID_HEBREW
      , TT_MAC_ID_GREEK
      , TT_MAC_ID_RUSSIAN
      , TT_MAC_ID_RSYMBOL
      , TT_MAC_ID_DEVANAGARI
      , TT_MAC_ID_GURMUKHI
      , TT_MAC_ID_GUJARATI
      , TT_MAC_ID_ORIYA
      , TT_MAC_ID_BENGALI
      , TT_MAC_ID_TAMIL
      , TT_MAC_ID_TELUGU
      , TT_MAC_ID_KANNADA
      , TT_MAC_ID_MALAYALAM
      , TT_MAC_ID_SINHALESE
      , TT_MAC_ID_BURMESE
      , TT_MAC_ID_KHMER
      , TT_MAC_ID_THAI
      , TT_MAC_ID_LAOTIAN
      , TT_MAC_ID_GEORGIAN
      , TT_MAC_ID_ARMENIAN
      , TT_MAC_ID_MALDIVIAN
      , TT_MAC_ID_SIMPLIFIED_CHINESE
      , TT_MAC_ID_TIBETAN
      , TT_MAC_ID_MONGOLIAN
      , TT_MAC_ID_GEEZ
      , TT_MAC_ID_SLAVIC
      , TT_MAC_ID_VIETNAMESE
      , TT_MAC_ID_SINDHI
      , TT_MAC_ID_UNINTERP
     :: FT_UShort
pattern TT_MAC_ID_ROMAN               = #const TT_MAC_ID_ROMAN
pattern TT_MAC_ID_JAPANESE            = #const TT_MAC_ID_JAPANESE
pattern TT_MAC_ID_TRADITIONAL_CHINESE = #const TT_MAC_ID_TRADITIONAL_CHINESE
pattern TT_MAC_ID_KOREAN              = #const TT_MAC_ID_KOREAN
pattern TT_MAC_ID_ARABIC              = #const TT_MAC_ID_ARABIC
pattern TT_MAC_ID_HEBREW              = #const TT_MAC_ID_HEBREW
pattern TT_MAC_ID_GREEK               = #const TT_MAC_ID_GREEK
pattern TT_MAC_ID_RUSSIAN             = #const TT_MAC_ID_RUSSIAN
pattern TT_MAC_ID_RSYMBOL             = #const TT_MAC_ID_RSYMBOL
pattern TT_MAC_ID_DEVANAGARI          = #const TT_MAC_ID_DEVANAGARI
pattern TT_MAC_ID_GURMUKHI            = #const TT_MAC_ID_GURMUKHI
pattern TT_MAC_ID_GUJARATI            = #const TT_MAC_ID_GUJARATI
pattern TT_MAC_ID_ORIYA               = #const TT_MAC_ID_ORIYA
pattern TT_MAC_ID_BENGALI             = #const TT_MAC_ID_BENGALI
pattern TT_MAC_ID_TAMIL               = #const TT_MAC_ID_TAMIL
pattern TT_MAC_ID_TELUGU              = #const TT_MAC_ID_TELUGU
pattern TT_MAC_ID_KANNADA             = #const TT_MAC_ID_KANNADA
pattern TT_MAC_ID_MALAYALAM           = #const TT_MAC_ID_MALAYALAM
pattern TT_MAC_ID_SINHALESE           = #const TT_MAC_ID_SINHALESE
pattern TT_MAC_ID_BURMESE             = #const TT_MAC_ID_BURMESE
pattern TT_MAC_ID_KHMER               = #const TT_MAC_ID_KHMER
pattern TT_MAC_ID_THAI                = #const TT_MAC_ID_THAI
pattern TT_MAC_ID_LAOTIAN             = #const TT_MAC_ID_LAOTIAN
pattern TT_MAC_ID_GEORGIAN            = #const TT_MAC_ID_GEORGIAN
pattern TT_MAC_ID_ARMENIAN            = #const TT_MAC_ID_ARMENIAN
pattern TT_MAC_ID_MALDIVIAN           = #const TT_MAC_ID_MALDIVIAN
pattern TT_MAC_ID_SIMPLIFIED_CHINESE  = #const TT_MAC_ID_SIMPLIFIED_CHINESE
pattern TT_MAC_ID_TIBETAN             = #const TT_MAC_ID_TIBETAN
pattern TT_MAC_ID_MONGOLIAN           = #const TT_MAC_ID_MONGOLIAN
pattern TT_MAC_ID_GEEZ                = #const TT_MAC_ID_GEEZ
pattern TT_MAC_ID_SLAVIC              = #const TT_MAC_ID_SLAVIC
pattern TT_MAC_ID_VIETNAMESE          = #const TT_MAC_ID_VIETNAMESE
pattern TT_MAC_ID_SINDHI              = #const TT_MAC_ID_SINDHI
pattern TT_MAC_ID_UNINTERP            = #const TT_MAC_ID_UNINTERP



pattern TT_MS_ID_SYMBOL_CS
      , TT_MS_ID_UNICODE_CS
      , TT_MS_ID_SJIS
      , TT_MS_ID_PRC
      , TT_MS_ID_BIG_5
      , TT_MS_ID_WANSUNG
      , TT_MS_ID_JOHAB
      , TT_MS_ID_UCS_4
      , TT_MS_ID_GB2312
     :: FT_UShort
pattern TT_MS_ID_SYMBOL_CS  = #const TT_MS_ID_SYMBOL_CS
pattern TT_MS_ID_UNICODE_CS = #const TT_MS_ID_UNICODE_CS
pattern TT_MS_ID_SJIS       = #const TT_MS_ID_SJIS
pattern TT_MS_ID_PRC        = #const TT_MS_ID_PRC
pattern TT_MS_ID_BIG_5      = #const TT_MS_ID_BIG_5
pattern TT_MS_ID_WANSUNG    = #const TT_MS_ID_WANSUNG
pattern TT_MS_ID_JOHAB      = #const TT_MS_ID_JOHAB
pattern TT_MS_ID_UCS_4      = #const TT_MS_ID_UCS_4
pattern TT_MS_ID_GB2312     = #const TT_MS_ID_GB2312



pattern TT_ADOBE_ID_STANDARD
      , TT_ADOBE_ID_EXPERT
      , TT_ADOBE_ID_CUSTOM
      , TT_ADOBE_ID_LATIN_1
     :: FT_UShort
pattern TT_ADOBE_ID_STANDARD = #const TT_ADOBE_ID_STANDARD
pattern TT_ADOBE_ID_EXPERT   = #const TT_ADOBE_ID_EXPERT
pattern TT_ADOBE_ID_CUSTOM   = #const TT_ADOBE_ID_CUSTOM
pattern TT_ADOBE_ID_LATIN_1  = #const TT_ADOBE_ID_LATIN_1



pattern TT_MAC_LANGID_ENGLISH
      , TT_MAC_LANGID_FRENCH
      , TT_MAC_LANGID_GERMAN
      , TT_MAC_LANGID_ITALIAN
      , TT_MAC_LANGID_DUTCH
      , TT_MAC_LANGID_SWEDISH
      , TT_MAC_LANGID_SPANISH
      , TT_MAC_LANGID_DANISH
      , TT_MAC_LANGID_PORTUGUESE
      , TT_MAC_LANGID_NORWEGIAN
      , TT_MAC_LANGID_HEBREW
      , TT_MAC_LANGID_JAPANESE
      , TT_MAC_LANGID_ARABIC
      , TT_MAC_LANGID_FINNISH
      , TT_MAC_LANGID_GREEK
      , TT_MAC_LANGID_ICELANDIC
      , TT_MAC_LANGID_MALTESE
      , TT_MAC_LANGID_TURKISH
      , TT_MAC_LANGID_CROATIAN
      , TT_MAC_LANGID_CHINESE_TRADITIONAL
      , TT_MAC_LANGID_URDU
      , TT_MAC_LANGID_HINDI
      , TT_MAC_LANGID_THAI
      , TT_MAC_LANGID_KOREAN
      , TT_MAC_LANGID_LITHUANIAN
      , TT_MAC_LANGID_POLISH
      , TT_MAC_LANGID_HUNGARIAN
      , TT_MAC_LANGID_ESTONIAN
      , TT_MAC_LANGID_LETTISH
      , TT_MAC_LANGID_SAAMISK
      , TT_MAC_LANGID_FAEROESE
      , TT_MAC_LANGID_FARSI
      , TT_MAC_LANGID_RUSSIAN
      , TT_MAC_LANGID_CHINESE_SIMPLIFIED
      , TT_MAC_LANGID_FLEMISH
      , TT_MAC_LANGID_IRISH
      , TT_MAC_LANGID_ALBANIAN
      , TT_MAC_LANGID_ROMANIAN
      , TT_MAC_LANGID_CZECH
      , TT_MAC_LANGID_SLOVAK
      , TT_MAC_LANGID_SLOVENIAN
      , TT_MAC_LANGID_YIDDISH
      , TT_MAC_LANGID_SERBIAN
      , TT_MAC_LANGID_MACEDONIAN
      , TT_MAC_LANGID_BULGARIAN
      , TT_MAC_LANGID_UKRAINIAN
      , TT_MAC_LANGID_BYELORUSSIAN
      , TT_MAC_LANGID_UZBEK
      , TT_MAC_LANGID_KAZAKH
      , TT_MAC_LANGID_AZERBAIJANI
      , TT_MAC_LANGID_AZERBAIJANI_CYRILLIC_SCRIPT
      , TT_MAC_LANGID_AZERBAIJANI_ARABIC_SCRIPT
      , TT_MAC_LANGID_ARMENIAN
      , TT_MAC_LANGID_GEORGIAN
      , TT_MAC_LANGID_MOLDAVIAN
      , TT_MAC_LANGID_KIRGHIZ
      , TT_MAC_LANGID_TAJIKI
      , TT_MAC_LANGID_TURKMEN
      , TT_MAC_LANGID_MONGOLIAN
      , TT_MAC_LANGID_MONGOLIAN_MONGOLIAN_SCRIPT
      , TT_MAC_LANGID_MONGOLIAN_CYRILLIC_SCRIPT
      , TT_MAC_LANGID_PASHTO
      , TT_MAC_LANGID_KURDISH
      , TT_MAC_LANGID_KASHMIRI
      , TT_MAC_LANGID_SINDHI
      , TT_MAC_LANGID_TIBETAN
      , TT_MAC_LANGID_NEPALI
      , TT_MAC_LANGID_SANSKRIT
      , TT_MAC_LANGID_MARATHI
      , TT_MAC_LANGID_BENGALI
      , TT_MAC_LANGID_ASSAMESE
      , TT_MAC_LANGID_GUJARATI
      , TT_MAC_LANGID_PUNJABI
      , TT_MAC_LANGID_ORIYA
      , TT_MAC_LANGID_MALAYALAM
      , TT_MAC_LANGID_KANNADA
      , TT_MAC_LANGID_TAMIL
      , TT_MAC_LANGID_TELUGU
      , TT_MAC_LANGID_SINHALESE
      , TT_MAC_LANGID_BURMESE
      , TT_MAC_LANGID_KHMER
      , TT_MAC_LANGID_LAO
      , TT_MAC_LANGID_VIETNAMESE
      , TT_MAC_LANGID_INDONESIAN
      , TT_MAC_LANGID_TAGALOG
      , TT_MAC_LANGID_MALAY_ROMAN_SCRIPT
      , TT_MAC_LANGID_MALAY_ARABIC_SCRIPT
      , TT_MAC_LANGID_AMHARIC
      , TT_MAC_LANGID_TIGRINYA
      , TT_MAC_LANGID_GALLA
      , TT_MAC_LANGID_SOMALI
      , TT_MAC_LANGID_SWAHILI
      , TT_MAC_LANGID_RUANDA
      , TT_MAC_LANGID_RUNDI
      , TT_MAC_LANGID_CHEWA
      , TT_MAC_LANGID_MALAGASY
      , TT_MAC_LANGID_ESPERANTO
      , TT_MAC_LANGID_WELSH
      , TT_MAC_LANGID_BASQUE
      , TT_MAC_LANGID_CATALAN
      , TT_MAC_LANGID_LATIN
      , TT_MAC_LANGID_QUECHUA
      , TT_MAC_LANGID_GUARANI
      , TT_MAC_LANGID_AYMARA
      , TT_MAC_LANGID_TATAR
      , TT_MAC_LANGID_UIGHUR
      , TT_MAC_LANGID_DZONGKHA
      , TT_MAC_LANGID_JAVANESE
      , TT_MAC_LANGID_SUNDANESE
      , TT_MAC_LANGID_GALICIAN
      , TT_MAC_LANGID_AFRIKAANS
      , TT_MAC_LANGID_BRETON
      , TT_MAC_LANGID_INUKTITUT
      , TT_MAC_LANGID_SCOTTISH_GAELIC
      , TT_MAC_LANGID_MANX_GAELIC
      , TT_MAC_LANGID_IRISH_GAELIC
      , TT_MAC_LANGID_TONGAN
      , TT_MAC_LANGID_GREEK_POLYTONIC
      , TT_MAC_LANGID_GREELANDIC
      , TT_MAC_LANGID_AZERBAIJANI_ROMAN_SCRIPT
     :: FT_UInt
pattern TT_MAC_LANGID_ENGLISH                     = #const TT_MAC_LANGID_ENGLISH
pattern TT_MAC_LANGID_FRENCH                      = #const TT_MAC_LANGID_FRENCH
pattern TT_MAC_LANGID_GERMAN                      = #const TT_MAC_LANGID_GERMAN
pattern TT_MAC_LANGID_ITALIAN                     = #const TT_MAC_LANGID_ITALIAN
pattern TT_MAC_LANGID_DUTCH                       = #const TT_MAC_LANGID_DUTCH
pattern TT_MAC_LANGID_SWEDISH                     = #const TT_MAC_LANGID_SWEDISH
pattern TT_MAC_LANGID_SPANISH                     = #const TT_MAC_LANGID_SPANISH
pattern TT_MAC_LANGID_DANISH                      = #const TT_MAC_LANGID_DANISH
pattern TT_MAC_LANGID_PORTUGUESE                  = #const TT_MAC_LANGID_PORTUGUESE
pattern TT_MAC_LANGID_NORWEGIAN                   = #const TT_MAC_LANGID_NORWEGIAN
pattern TT_MAC_LANGID_HEBREW                      = #const TT_MAC_LANGID_HEBREW
pattern TT_MAC_LANGID_JAPANESE                    = #const TT_MAC_LANGID_JAPANESE
pattern TT_MAC_LANGID_ARABIC                      = #const TT_MAC_LANGID_ARABIC
pattern TT_MAC_LANGID_FINNISH                     = #const TT_MAC_LANGID_FINNISH
pattern TT_MAC_LANGID_GREEK                       = #const TT_MAC_LANGID_GREEK
pattern TT_MAC_LANGID_ICELANDIC                   = #const TT_MAC_LANGID_ICELANDIC
pattern TT_MAC_LANGID_MALTESE                     = #const TT_MAC_LANGID_MALTESE
pattern TT_MAC_LANGID_TURKISH                     = #const TT_MAC_LANGID_TURKISH
pattern TT_MAC_LANGID_CROATIAN                    = #const TT_MAC_LANGID_CROATIAN
pattern TT_MAC_LANGID_CHINESE_TRADITIONAL         = #const TT_MAC_LANGID_CHINESE_TRADITIONAL
pattern TT_MAC_LANGID_URDU                        = #const TT_MAC_LANGID_URDU
pattern TT_MAC_LANGID_HINDI                       = #const TT_MAC_LANGID_HINDI
pattern TT_MAC_LANGID_THAI                        = #const TT_MAC_LANGID_THAI
pattern TT_MAC_LANGID_KOREAN                      = #const TT_MAC_LANGID_KOREAN
pattern TT_MAC_LANGID_LITHUANIAN                  = #const TT_MAC_LANGID_LITHUANIAN
pattern TT_MAC_LANGID_POLISH                      = #const TT_MAC_LANGID_POLISH
pattern TT_MAC_LANGID_HUNGARIAN                   = #const TT_MAC_LANGID_HUNGARIAN
pattern TT_MAC_LANGID_ESTONIAN                    = #const TT_MAC_LANGID_ESTONIAN
pattern TT_MAC_LANGID_LETTISH                     = #const TT_MAC_LANGID_LETTISH
pattern TT_MAC_LANGID_SAAMISK                     = #const TT_MAC_LANGID_SAAMISK
pattern TT_MAC_LANGID_FAEROESE                    = #const TT_MAC_LANGID_FAEROESE
pattern TT_MAC_LANGID_FARSI                       = #const TT_MAC_LANGID_FARSI
pattern TT_MAC_LANGID_RUSSIAN                     = #const TT_MAC_LANGID_RUSSIAN
pattern TT_MAC_LANGID_CHINESE_SIMPLIFIED          = #const TT_MAC_LANGID_CHINESE_SIMPLIFIED
pattern TT_MAC_LANGID_FLEMISH                     = #const TT_MAC_LANGID_FLEMISH
pattern TT_MAC_LANGID_IRISH                       = #const TT_MAC_LANGID_IRISH
pattern TT_MAC_LANGID_ALBANIAN                    = #const TT_MAC_LANGID_ALBANIAN
pattern TT_MAC_LANGID_ROMANIAN                    = #const TT_MAC_LANGID_ROMANIAN
pattern TT_MAC_LANGID_CZECH                       = #const TT_MAC_LANGID_CZECH
pattern TT_MAC_LANGID_SLOVAK                      = #const TT_MAC_LANGID_SLOVAK
pattern TT_MAC_LANGID_SLOVENIAN                   = #const TT_MAC_LANGID_SLOVENIAN
pattern TT_MAC_LANGID_YIDDISH                     = #const TT_MAC_LANGID_YIDDISH
pattern TT_MAC_LANGID_SERBIAN                     = #const TT_MAC_LANGID_SERBIAN
pattern TT_MAC_LANGID_MACEDONIAN                  = #const TT_MAC_LANGID_MACEDONIAN
pattern TT_MAC_LANGID_BULGARIAN                   = #const TT_MAC_LANGID_BULGARIAN
pattern TT_MAC_LANGID_UKRAINIAN                   = #const TT_MAC_LANGID_UKRAINIAN
pattern TT_MAC_LANGID_BYELORUSSIAN                = #const TT_MAC_LANGID_BYELORUSSIAN
pattern TT_MAC_LANGID_UZBEK                       = #const TT_MAC_LANGID_UZBEK
pattern TT_MAC_LANGID_KAZAKH                      = #const TT_MAC_LANGID_KAZAKH
pattern TT_MAC_LANGID_AZERBAIJANI                 = #const TT_MAC_LANGID_AZERBAIJANI
pattern TT_MAC_LANGID_AZERBAIJANI_CYRILLIC_SCRIPT = #const TT_MAC_LANGID_AZERBAIJANI_CYRILLIC_SCRIPT
pattern TT_MAC_LANGID_AZERBAIJANI_ARABIC_SCRIPT   = #const TT_MAC_LANGID_AZERBAIJANI_ARABIC_SCRIPT
pattern TT_MAC_LANGID_ARMENIAN                    = #const TT_MAC_LANGID_ARMENIAN
pattern TT_MAC_LANGID_GEORGIAN                    = #const TT_MAC_LANGID_GEORGIAN
pattern TT_MAC_LANGID_MOLDAVIAN                   = #const TT_MAC_LANGID_MOLDAVIAN
pattern TT_MAC_LANGID_KIRGHIZ                     = #const TT_MAC_LANGID_KIRGHIZ
pattern TT_MAC_LANGID_TAJIKI                      = #const TT_MAC_LANGID_TAJIKI
pattern TT_MAC_LANGID_TURKMEN                     = #const TT_MAC_LANGID_TURKMEN
pattern TT_MAC_LANGID_MONGOLIAN                   = #const TT_MAC_LANGID_MONGOLIAN
pattern TT_MAC_LANGID_MONGOLIAN_MONGOLIAN_SCRIPT  = #const TT_MAC_LANGID_MONGOLIAN_MONGOLIAN_SCRIPT
pattern TT_MAC_LANGID_MONGOLIAN_CYRILLIC_SCRIPT   = #const TT_MAC_LANGID_MONGOLIAN_CYRILLIC_SCRIPT
pattern TT_MAC_LANGID_PASHTO                      = #const TT_MAC_LANGID_PASHTO
pattern TT_MAC_LANGID_KURDISH                     = #const TT_MAC_LANGID_KURDISH
pattern TT_MAC_LANGID_KASHMIRI                    = #const TT_MAC_LANGID_KASHMIRI
pattern TT_MAC_LANGID_SINDHI                      = #const TT_MAC_LANGID_SINDHI
pattern TT_MAC_LANGID_TIBETAN                     = #const TT_MAC_LANGID_TIBETAN
pattern TT_MAC_LANGID_NEPALI                      = #const TT_MAC_LANGID_NEPALI
pattern TT_MAC_LANGID_SANSKRIT                    = #const TT_MAC_LANGID_SANSKRIT
pattern TT_MAC_LANGID_MARATHI                     = #const TT_MAC_LANGID_MARATHI
pattern TT_MAC_LANGID_BENGALI                     = #const TT_MAC_LANGID_BENGALI
pattern TT_MAC_LANGID_ASSAMESE                    = #const TT_MAC_LANGID_ASSAMESE
pattern TT_MAC_LANGID_GUJARATI                    = #const TT_MAC_LANGID_GUJARATI
pattern TT_MAC_LANGID_PUNJABI                     = #const TT_MAC_LANGID_PUNJABI
pattern TT_MAC_LANGID_ORIYA                       = #const TT_MAC_LANGID_ORIYA
pattern TT_MAC_LANGID_MALAYALAM                   = #const TT_MAC_LANGID_MALAYALAM
pattern TT_MAC_LANGID_KANNADA                     = #const TT_MAC_LANGID_KANNADA
pattern TT_MAC_LANGID_TAMIL                       = #const TT_MAC_LANGID_TAMIL
pattern TT_MAC_LANGID_TELUGU                      = #const TT_MAC_LANGID_TELUGU
pattern TT_MAC_LANGID_SINHALESE                   = #const TT_MAC_LANGID_SINHALESE
pattern TT_MAC_LANGID_BURMESE                     = #const TT_MAC_LANGID_BURMESE
pattern TT_MAC_LANGID_KHMER                       = #const TT_MAC_LANGID_KHMER
pattern TT_MAC_LANGID_LAO                         = #const TT_MAC_LANGID_LAO
pattern TT_MAC_LANGID_VIETNAMESE                  = #const TT_MAC_LANGID_VIETNAMESE
pattern TT_MAC_LANGID_INDONESIAN                  = #const TT_MAC_LANGID_INDONESIAN
pattern TT_MAC_LANGID_TAGALOG                     = #const TT_MAC_LANGID_TAGALOG
pattern TT_MAC_LANGID_MALAY_ROMAN_SCRIPT          = #const TT_MAC_LANGID_MALAY_ROMAN_SCRIPT
pattern TT_MAC_LANGID_MALAY_ARABIC_SCRIPT         = #const TT_MAC_LANGID_MALAY_ARABIC_SCRIPT
pattern TT_MAC_LANGID_AMHARIC                     = #const TT_MAC_LANGID_AMHARIC
pattern TT_MAC_LANGID_TIGRINYA                    = #const TT_MAC_LANGID_TIGRINYA
pattern TT_MAC_LANGID_GALLA                       = #const TT_MAC_LANGID_GALLA
pattern TT_MAC_LANGID_SOMALI                      = #const TT_MAC_LANGID_SOMALI
pattern TT_MAC_LANGID_SWAHILI                     = #const TT_MAC_LANGID_SWAHILI
pattern TT_MAC_LANGID_RUANDA                      = #const TT_MAC_LANGID_RUANDA
pattern TT_MAC_LANGID_RUNDI                       = #const TT_MAC_LANGID_RUNDI
pattern TT_MAC_LANGID_CHEWA                       = #const TT_MAC_LANGID_CHEWA
pattern TT_MAC_LANGID_MALAGASY                    = #const TT_MAC_LANGID_MALAGASY
pattern TT_MAC_LANGID_ESPERANTO                   = #const TT_MAC_LANGID_ESPERANTO
pattern TT_MAC_LANGID_WELSH                       = #const TT_MAC_LANGID_WELSH
pattern TT_MAC_LANGID_BASQUE                      = #const TT_MAC_LANGID_BASQUE
pattern TT_MAC_LANGID_CATALAN                     = #const TT_MAC_LANGID_CATALAN
pattern TT_MAC_LANGID_LATIN                       = #const TT_MAC_LANGID_LATIN
pattern TT_MAC_LANGID_QUECHUA                     = #const TT_MAC_LANGID_QUECHUA
pattern TT_MAC_LANGID_GUARANI                     = #const TT_MAC_LANGID_GUARANI
pattern TT_MAC_LANGID_AYMARA                      = #const TT_MAC_LANGID_AYMARA
pattern TT_MAC_LANGID_TATAR                       = #const TT_MAC_LANGID_TATAR
pattern TT_MAC_LANGID_UIGHUR                      = #const TT_MAC_LANGID_UIGHUR
pattern TT_MAC_LANGID_DZONGKHA                    = #const TT_MAC_LANGID_DZONGKHA
pattern TT_MAC_LANGID_JAVANESE                    = #const TT_MAC_LANGID_JAVANESE
pattern TT_MAC_LANGID_SUNDANESE                   = #const TT_MAC_LANGID_SUNDANESE
pattern TT_MAC_LANGID_GALICIAN                    = #const TT_MAC_LANGID_GALICIAN
pattern TT_MAC_LANGID_AFRIKAANS                   = #const TT_MAC_LANGID_AFRIKAANS
pattern TT_MAC_LANGID_BRETON                      = #const TT_MAC_LANGID_BRETON
pattern TT_MAC_LANGID_INUKTITUT                   = #const TT_MAC_LANGID_INUKTITUT
pattern TT_MAC_LANGID_SCOTTISH_GAELIC             = #const TT_MAC_LANGID_SCOTTISH_GAELIC
pattern TT_MAC_LANGID_MANX_GAELIC                 = #const TT_MAC_LANGID_MANX_GAELIC
pattern TT_MAC_LANGID_IRISH_GAELIC                = #const TT_MAC_LANGID_IRISH_GAELIC
pattern TT_MAC_LANGID_TONGAN                      = #const TT_MAC_LANGID_TONGAN
pattern TT_MAC_LANGID_GREEK_POLYTONIC             = #const TT_MAC_LANGID_GREEK_POLYTONIC
pattern TT_MAC_LANGID_GREELANDIC                  = #const TT_MAC_LANGID_GREELANDIC
pattern TT_MAC_LANGID_AZERBAIJANI_ROMAN_SCRIPT    = #const TT_MAC_LANGID_AZERBAIJANI_ROMAN_SCRIPT



pattern TT_MS_LANGID_ARABIC_SAUDI_ARABIA
      , TT_MS_LANGID_ARABIC_IRAQ
      , TT_MS_LANGID_ARABIC_EGYPT
      , TT_MS_LANGID_ARABIC_LIBYA
      , TT_MS_LANGID_ARABIC_ALGERIA
      , TT_MS_LANGID_ARABIC_MOROCCO
      , TT_MS_LANGID_ARABIC_TUNISIA
      , TT_MS_LANGID_ARABIC_OMAN
      , TT_MS_LANGID_ARABIC_YEMEN
      , TT_MS_LANGID_ARABIC_SYRIA
      , TT_MS_LANGID_ARABIC_JORDAN
      , TT_MS_LANGID_ARABIC_LEBANON
      , TT_MS_LANGID_ARABIC_KUWAIT
      , TT_MS_LANGID_ARABIC_UAE
      , TT_MS_LANGID_ARABIC_BAHRAIN
      , TT_MS_LANGID_ARABIC_QATAR
      , TT_MS_LANGID_BULGARIAN_BULGARIA
      , TT_MS_LANGID_CATALAN_CATALAN
      , TT_MS_LANGID_CHINESE_TAIWAN
      , TT_MS_LANGID_CHINESE_PRC
      , TT_MS_LANGID_CHINESE_HONG_KONG
      , TT_MS_LANGID_CHINESE_SINGAPORE
      , TT_MS_LANGID_CHINESE_MACAO
      , TT_MS_LANGID_CZECH_CZECH_REPUBLIC
      , TT_MS_LANGID_DANISH_DENMARK
      , TT_MS_LANGID_GERMAN_GERMANY
      , TT_MS_LANGID_GERMAN_SWITZERLAND
      , TT_MS_LANGID_GERMAN_AUSTRIA
      , TT_MS_LANGID_GERMAN_LUXEMBOURG
      , TT_MS_LANGID_GERMAN_LIECHTENSTEIN
      , TT_MS_LANGID_GREEK_GREECE
      , TT_MS_LANGID_ENGLISH_UNITED_STATES
      , TT_MS_LANGID_ENGLISH_UNITED_KINGDOM
      , TT_MS_LANGID_ENGLISH_AUSTRALIA
      , TT_MS_LANGID_ENGLISH_CANADA
      , TT_MS_LANGID_ENGLISH_NEW_ZEALAND
      , TT_MS_LANGID_ENGLISH_IRELAND
      , TT_MS_LANGID_ENGLISH_SOUTH_AFRICA
      , TT_MS_LANGID_ENGLISH_JAMAICA
      , TT_MS_LANGID_ENGLISH_CARIBBEAN
      , TT_MS_LANGID_ENGLISH_BELIZE
      , TT_MS_LANGID_ENGLISH_TRINIDAD
      , TT_MS_LANGID_ENGLISH_ZIMBABWE
      , TT_MS_LANGID_ENGLISH_PHILIPPINES
      , TT_MS_LANGID_ENGLISH_INDIA
      , TT_MS_LANGID_ENGLISH_MALAYSIA
      , TT_MS_LANGID_ENGLISH_SINGAPORE
      , TT_MS_LANGID_SPANISH_SPAIN_TRADITIONAL_SORT
      , TT_MS_LANGID_SPANISH_MEXICO
      , TT_MS_LANGID_SPANISH_SPAIN_MODERN_SORT
      , TT_MS_LANGID_SPANISH_GUATEMALA
      , TT_MS_LANGID_SPANISH_COSTA_RICA
      , TT_MS_LANGID_SPANISH_PANAMA
      , TT_MS_LANGID_SPANISH_DOMINICAN_REPUBLIC
      , TT_MS_LANGID_SPANISH_VENEZUELA
      , TT_MS_LANGID_SPANISH_COLOMBIA
      , TT_MS_LANGID_SPANISH_PERU
      , TT_MS_LANGID_SPANISH_ARGENTINA
      , TT_MS_LANGID_SPANISH_ECUADOR
      , TT_MS_LANGID_SPANISH_CHILE
      , TT_MS_LANGID_SPANISH_URUGUAY
      , TT_MS_LANGID_SPANISH_PARAGUAY
      , TT_MS_LANGID_SPANISH_BOLIVIA
      , TT_MS_LANGID_SPANISH_EL_SALVADOR
      , TT_MS_LANGID_SPANISH_HONDURAS
      , TT_MS_LANGID_SPANISH_NICARAGUA
      , TT_MS_LANGID_SPANISH_PUERTO_RICO
      , TT_MS_LANGID_SPANISH_UNITED_STATES
      , TT_MS_LANGID_FINNISH_FINLAND
      , TT_MS_LANGID_FRENCH_FRANCE
      , TT_MS_LANGID_FRENCH_BELGIUM
      , TT_MS_LANGID_FRENCH_CANADA
      , TT_MS_LANGID_FRENCH_SWITZERLAND
      , TT_MS_LANGID_FRENCH_LUXEMBOURG
      , TT_MS_LANGID_FRENCH_MONACO
      , TT_MS_LANGID_HEBREW_ISRAEL
      , TT_MS_LANGID_HUNGARIAN_HUNGARY
      , TT_MS_LANGID_ICELANDIC_ICELAND
      , TT_MS_LANGID_ITALIAN_ITALY
      , TT_MS_LANGID_ITALIAN_SWITZERLAND
      , TT_MS_LANGID_JAPANESE_JAPAN
      , TT_MS_LANGID_KOREAN_KOREA
      , TT_MS_LANGID_DUTCH_NETHERLANDS
      , TT_MS_LANGID_DUTCH_BELGIUM
      , TT_MS_LANGID_NORWEGIAN_NORWAY_BOKMAL
      , TT_MS_LANGID_NORWEGIAN_NORWAY_NYNORSK
      , TT_MS_LANGID_POLISH_POLAND
      , TT_MS_LANGID_PORTUGUESE_BRAZIL
      , TT_MS_LANGID_PORTUGUESE_PORTUGAL
      , TT_MS_LANGID_ROMANSH_SWITZERLAND
      , TT_MS_LANGID_ROMANIAN_ROMANIA
      , TT_MS_LANGID_RUSSIAN_RUSSIA
      , TT_MS_LANGID_CROATIAN_CROATIA
      , TT_MS_LANGID_SERBIAN_SERBIA_LATIN
      , TT_MS_LANGID_SERBIAN_SERBIA_CYRILLIC
      , TT_MS_LANGID_CROATIAN_BOSNIA_HERZEGOVINA
      , TT_MS_LANGID_BOSNIAN_BOSNIA_HERZEGOVINA
      , TT_MS_LANGID_SERBIAN_BOSNIA_HERZ_LATIN
      , TT_MS_LANGID_SERBIAN_BOSNIA_HERZ_CYRILLIC
      , TT_MS_LANGID_BOSNIAN_BOSNIA_HERZ_CYRILLIC
      , TT_MS_LANGID_SLOVAK_SLOVAKIA
      , TT_MS_LANGID_ALBANIAN_ALBANIA
      , TT_MS_LANGID_SWEDISH_SWEDEN
      , TT_MS_LANGID_SWEDISH_FINLAND
      , TT_MS_LANGID_THAI_THAILAND
      , TT_MS_LANGID_TURKISH_TURKEY
      , TT_MS_LANGID_URDU_PAKISTAN
      , TT_MS_LANGID_INDONESIAN_INDONESIA
      , TT_MS_LANGID_UKRAINIAN_UKRAINE
      , TT_MS_LANGID_BELARUSIAN_BELARUS
      , TT_MS_LANGID_SLOVENIAN_SLOVENIA
      , TT_MS_LANGID_ESTONIAN_ESTONIA
      , TT_MS_LANGID_LATVIAN_LATVIA
      , TT_MS_LANGID_LITHUANIAN_LITHUANIA
      , TT_MS_LANGID_TAJIK_TAJIKISTAN
      , TT_MS_LANGID_VIETNAMESE_VIET_NAM
      , TT_MS_LANGID_ARMENIAN_ARMENIA
      , TT_MS_LANGID_AZERI_AZERBAIJAN_LATIN
      , TT_MS_LANGID_AZERI_AZERBAIJAN_CYRILLIC
      , TT_MS_LANGID_BASQUE_BASQUE
      , TT_MS_LANGID_UPPER_SORBIAN_GERMANY
      , TT_MS_LANGID_LOWER_SORBIAN_GERMANY
      , TT_MS_LANGID_MACEDONIAN_MACEDONIA
      , TT_MS_LANGID_SETSWANA_SOUTH_AFRICA
      , TT_MS_LANGID_ISIXHOSA_SOUTH_AFRICA
      , TT_MS_LANGID_ISIZULU_SOUTH_AFRICA
      , TT_MS_LANGID_AFRIKAANS_SOUTH_AFRICA
      , TT_MS_LANGID_GEORGIAN_GEORGIA
      , TT_MS_LANGID_FAEROESE_FAEROE_ISLANDS
      , TT_MS_LANGID_HINDI_INDIA
      , TT_MS_LANGID_MALTESE_MALTA
      , TT_MS_LANGID_SAMI_NORTHERN_NORWAY
      , TT_MS_LANGID_SAMI_NORTHERN_SWEDEN
      , TT_MS_LANGID_SAMI_NORTHERN_FINLAND
      , TT_MS_LANGID_SAMI_LULE_NORWAY
      , TT_MS_LANGID_SAMI_LULE_SWEDEN
      , TT_MS_LANGID_SAMI_SOUTHERN_NORWAY
      , TT_MS_LANGID_SAMI_SOUTHERN_SWEDEN
      , TT_MS_LANGID_SAMI_SKOLT_FINLAND
      , TT_MS_LANGID_SAMI_INARI_FINLAND
      , TT_MS_LANGID_IRISH_IRELAND
      , TT_MS_LANGID_MALAY_MALAYSIA
      , TT_MS_LANGID_MALAY_BRUNEI_DARUSSALAM
      , TT_MS_LANGID_KAZAKH_KAZAKHSTAN
      , TT_MS_LANGID_KYRGYZ_KYRGYZSTAN
      , TT_MS_LANGID_KISWAHILI_KENYA
      , TT_MS_LANGID_TURKMEN_TURKMENISTAN
      , TT_MS_LANGID_UZBEK_UZBEKISTAN_LATIN
      , TT_MS_LANGID_UZBEK_UZBEKISTAN_CYRILLIC
      , TT_MS_LANGID_TATAR_RUSSIA
      , TT_MS_LANGID_BENGALI_INDIA
      , TT_MS_LANGID_BENGALI_BANGLADESH
      , TT_MS_LANGID_PUNJABI_INDIA
      , TT_MS_LANGID_GUJARATI_INDIA
      , TT_MS_LANGID_ODIA_INDIA
      , TT_MS_LANGID_TAMIL_INDIA
      , TT_MS_LANGID_TELUGU_INDIA
      , TT_MS_LANGID_KANNADA_INDIA
      , TT_MS_LANGID_MALAYALAM_INDIA
      , TT_MS_LANGID_ASSAMESE_INDIA
      , TT_MS_LANGID_MARATHI_INDIA
      , TT_MS_LANGID_SANSKRIT_INDIA
      , TT_MS_LANGID_MONGOLIAN_MONGOLIA
      , TT_MS_LANGID_MONGOLIAN_PRC
      , TT_MS_LANGID_TIBETAN_PRC
      , TT_MS_LANGID_WELSH_UNITED_KINGDOM
      , TT_MS_LANGID_KHMER_CAMBODIA
      , TT_MS_LANGID_LAO_LAOS
      , TT_MS_LANGID_GALICIAN_GALICIAN
      , TT_MS_LANGID_KONKANI_INDIA
      , TT_MS_LANGID_SYRIAC_SYRIA
      , TT_MS_LANGID_SINHALA_SRI_LANKA
      , TT_MS_LANGID_INUKTITUT_CANADA
      , TT_MS_LANGID_INUKTITUT_CANADA_LATIN
      , TT_MS_LANGID_AMHARIC_ETHIOPIA
      , TT_MS_LANGID_TAMAZIGHT_ALGERIA
      , TT_MS_LANGID_NEPALI_NEPAL
      , TT_MS_LANGID_FRISIAN_NETHERLANDS
      , TT_MS_LANGID_PASHTO_AFGHANISTAN
      , TT_MS_LANGID_FILIPINO_PHILIPPINES
      , TT_MS_LANGID_DHIVEHI_MALDIVES
      , TT_MS_LANGID_HAUSA_NIGERIA
      , TT_MS_LANGID_YORUBA_NIGERIA
      , TT_MS_LANGID_QUECHUA_BOLIVIA
      , TT_MS_LANGID_QUECHUA_ECUADOR
      , TT_MS_LANGID_QUECHUA_PERU
      , TT_MS_LANGID_SESOTHO_SA_LEBOA_SOUTH_AFRICA
      , TT_MS_LANGID_BASHKIR_RUSSIA
      , TT_MS_LANGID_LUXEMBOURGISH_LUXEMBOURG
      , TT_MS_LANGID_GREENLANDIC_GREENLAND
      , TT_MS_LANGID_IGBO_NIGERIA
      , TT_MS_LANGID_YI_PRC
      , TT_MS_LANGID_MAPUDUNGUN_CHILE
      , TT_MS_LANGID_MOHAWK_MOHAWK
      , TT_MS_LANGID_BRETON_FRANCE
      , TT_MS_LANGID_UIGHUR_PRC
      , TT_MS_LANGID_MAORI_NEW_ZEALAND
      , TT_MS_LANGID_OCCITAN_FRANCE
      , TT_MS_LANGID_CORSICAN_FRANCE
      , TT_MS_LANGID_ALSATIAN_FRANCE
      , TT_MS_LANGID_YAKUT_RUSSIA
      , TT_MS_LANGID_KICHE_GUATEMALA
      , TT_MS_LANGID_KINYARWANDA_RWANDA
      , TT_MS_LANGID_WOLOF_SENEGAL
      , TT_MS_LANGID_DARI_AFGHANISTAN
     :: FT_UInt
pattern TT_MS_LANGID_ARABIC_SAUDI_ARABIA            = #const TT_MS_LANGID_ARABIC_SAUDI_ARABIA
pattern TT_MS_LANGID_ARABIC_IRAQ                    = #const TT_MS_LANGID_ARABIC_IRAQ
pattern TT_MS_LANGID_ARABIC_EGYPT                   = #const TT_MS_LANGID_ARABIC_EGYPT
pattern TT_MS_LANGID_ARABIC_LIBYA                   = #const TT_MS_LANGID_ARABIC_LIBYA
pattern TT_MS_LANGID_ARABIC_ALGERIA                 = #const TT_MS_LANGID_ARABIC_ALGERIA
pattern TT_MS_LANGID_ARABIC_MOROCCO                 = #const TT_MS_LANGID_ARABIC_MOROCCO
pattern TT_MS_LANGID_ARABIC_TUNISIA                 = #const TT_MS_LANGID_ARABIC_TUNISIA
pattern TT_MS_LANGID_ARABIC_OMAN                    = #const TT_MS_LANGID_ARABIC_OMAN
pattern TT_MS_LANGID_ARABIC_YEMEN                   = #const TT_MS_LANGID_ARABIC_YEMEN
pattern TT_MS_LANGID_ARABIC_SYRIA                   = #const TT_MS_LANGID_ARABIC_SYRIA
pattern TT_MS_LANGID_ARABIC_JORDAN                  = #const TT_MS_LANGID_ARABIC_JORDAN
pattern TT_MS_LANGID_ARABIC_LEBANON                 = #const TT_MS_LANGID_ARABIC_LEBANON
pattern TT_MS_LANGID_ARABIC_KUWAIT                  = #const TT_MS_LANGID_ARABIC_KUWAIT
pattern TT_MS_LANGID_ARABIC_UAE                     = #const TT_MS_LANGID_ARABIC_UAE
pattern TT_MS_LANGID_ARABIC_BAHRAIN                 = #const TT_MS_LANGID_ARABIC_BAHRAIN
pattern TT_MS_LANGID_ARABIC_QATAR                   = #const TT_MS_LANGID_ARABIC_QATAR
pattern TT_MS_LANGID_BULGARIAN_BULGARIA             = #const TT_MS_LANGID_BULGARIAN_BULGARIA
pattern TT_MS_LANGID_CATALAN_CATALAN                = #const TT_MS_LANGID_CATALAN_CATALAN
pattern TT_MS_LANGID_CHINESE_TAIWAN                 = #const TT_MS_LANGID_CHINESE_TAIWAN
pattern TT_MS_LANGID_CHINESE_PRC                    = #const TT_MS_LANGID_CHINESE_PRC
pattern TT_MS_LANGID_CHINESE_HONG_KONG              = #const TT_MS_LANGID_CHINESE_HONG_KONG
pattern TT_MS_LANGID_CHINESE_SINGAPORE              = #const TT_MS_LANGID_CHINESE_SINGAPORE
pattern TT_MS_LANGID_CHINESE_MACAO                  = #const TT_MS_LANGID_CHINESE_MACAO
pattern TT_MS_LANGID_CZECH_CZECH_REPUBLIC           = #const TT_MS_LANGID_CZECH_CZECH_REPUBLIC
pattern TT_MS_LANGID_DANISH_DENMARK                 = #const TT_MS_LANGID_DANISH_DENMARK
pattern TT_MS_LANGID_GERMAN_GERMANY                 = #const TT_MS_LANGID_GERMAN_GERMANY
pattern TT_MS_LANGID_GERMAN_SWITZERLAND             = #const TT_MS_LANGID_GERMAN_SWITZERLAND
pattern TT_MS_LANGID_GERMAN_AUSTRIA                 = #const TT_MS_LANGID_GERMAN_AUSTRIA
pattern TT_MS_LANGID_GERMAN_LUXEMBOURG              = #const TT_MS_LANGID_GERMAN_LUXEMBOURG
pattern TT_MS_LANGID_GERMAN_LIECHTENSTEIN           = #const TT_MS_LANGID_GERMAN_LIECHTENSTEIN
pattern TT_MS_LANGID_GREEK_GREECE                   = #const TT_MS_LANGID_GREEK_GREECE
pattern TT_MS_LANGID_ENGLISH_UNITED_STATES          = #const TT_MS_LANGID_ENGLISH_UNITED_STATES
pattern TT_MS_LANGID_ENGLISH_UNITED_KINGDOM         = #const TT_MS_LANGID_ENGLISH_UNITED_KINGDOM
pattern TT_MS_LANGID_ENGLISH_AUSTRALIA              = #const TT_MS_LANGID_ENGLISH_AUSTRALIA
pattern TT_MS_LANGID_ENGLISH_CANADA                 = #const TT_MS_LANGID_ENGLISH_CANADA
pattern TT_MS_LANGID_ENGLISH_NEW_ZEALAND            = #const TT_MS_LANGID_ENGLISH_NEW_ZEALAND
pattern TT_MS_LANGID_ENGLISH_IRELAND                = #const TT_MS_LANGID_ENGLISH_IRELAND
pattern TT_MS_LANGID_ENGLISH_SOUTH_AFRICA           = #const TT_MS_LANGID_ENGLISH_SOUTH_AFRICA
pattern TT_MS_LANGID_ENGLISH_JAMAICA                = #const TT_MS_LANGID_ENGLISH_JAMAICA
pattern TT_MS_LANGID_ENGLISH_CARIBBEAN              = #const TT_MS_LANGID_ENGLISH_CARIBBEAN
pattern TT_MS_LANGID_ENGLISH_BELIZE                 = #const TT_MS_LANGID_ENGLISH_BELIZE
pattern TT_MS_LANGID_ENGLISH_TRINIDAD               = #const TT_MS_LANGID_ENGLISH_TRINIDAD
pattern TT_MS_LANGID_ENGLISH_ZIMBABWE               = #const TT_MS_LANGID_ENGLISH_ZIMBABWE
pattern TT_MS_LANGID_ENGLISH_PHILIPPINES            = #const TT_MS_LANGID_ENGLISH_PHILIPPINES
pattern TT_MS_LANGID_ENGLISH_INDIA                  = #const TT_MS_LANGID_ENGLISH_INDIA
pattern TT_MS_LANGID_ENGLISH_MALAYSIA               = #const TT_MS_LANGID_ENGLISH_MALAYSIA
pattern TT_MS_LANGID_ENGLISH_SINGAPORE              = #const TT_MS_LANGID_ENGLISH_SINGAPORE
pattern TT_MS_LANGID_SPANISH_SPAIN_TRADITIONAL_SORT = #const TT_MS_LANGID_SPANISH_SPAIN_TRADITIONAL_SORT
pattern TT_MS_LANGID_SPANISH_MEXICO                 = #const TT_MS_LANGID_SPANISH_MEXICO
pattern TT_MS_LANGID_SPANISH_SPAIN_MODERN_SORT      = #const TT_MS_LANGID_SPANISH_SPAIN_MODERN_SORT
pattern TT_MS_LANGID_SPANISH_GUATEMALA              = #const TT_MS_LANGID_SPANISH_GUATEMALA
pattern TT_MS_LANGID_SPANISH_COSTA_RICA             = #const TT_MS_LANGID_SPANISH_COSTA_RICA
pattern TT_MS_LANGID_SPANISH_PANAMA                 = #const TT_MS_LANGID_SPANISH_PANAMA
pattern TT_MS_LANGID_SPANISH_DOMINICAN_REPUBLIC     = #const TT_MS_LANGID_SPANISH_DOMINICAN_REPUBLIC
pattern TT_MS_LANGID_SPANISH_VENEZUELA              = #const TT_MS_LANGID_SPANISH_VENEZUELA
pattern TT_MS_LANGID_SPANISH_COLOMBIA               = #const TT_MS_LANGID_SPANISH_COLOMBIA
pattern TT_MS_LANGID_SPANISH_PERU                   = #const TT_MS_LANGID_SPANISH_PERU
pattern TT_MS_LANGID_SPANISH_ARGENTINA              = #const TT_MS_LANGID_SPANISH_ARGENTINA
pattern TT_MS_LANGID_SPANISH_ECUADOR                = #const TT_MS_LANGID_SPANISH_ECUADOR
pattern TT_MS_LANGID_SPANISH_CHILE                  = #const TT_MS_LANGID_SPANISH_CHILE
pattern TT_MS_LANGID_SPANISH_URUGUAY                = #const TT_MS_LANGID_SPANISH_URUGUAY
pattern TT_MS_LANGID_SPANISH_PARAGUAY               = #const TT_MS_LANGID_SPANISH_PARAGUAY
pattern TT_MS_LANGID_SPANISH_BOLIVIA                = #const TT_MS_LANGID_SPANISH_BOLIVIA
pattern TT_MS_LANGID_SPANISH_EL_SALVADOR            = #const TT_MS_LANGID_SPANISH_EL_SALVADOR
pattern TT_MS_LANGID_SPANISH_HONDURAS               = #const TT_MS_LANGID_SPANISH_HONDURAS
pattern TT_MS_LANGID_SPANISH_NICARAGUA              = #const TT_MS_LANGID_SPANISH_NICARAGUA
pattern TT_MS_LANGID_SPANISH_PUERTO_RICO            = #const TT_MS_LANGID_SPANISH_PUERTO_RICO
pattern TT_MS_LANGID_SPANISH_UNITED_STATES          = #const TT_MS_LANGID_SPANISH_UNITED_STATES
pattern TT_MS_LANGID_FINNISH_FINLAND                = #const TT_MS_LANGID_FINNISH_FINLAND
pattern TT_MS_LANGID_FRENCH_FRANCE                  = #const TT_MS_LANGID_FRENCH_FRANCE
pattern TT_MS_LANGID_FRENCH_BELGIUM                 = #const TT_MS_LANGID_FRENCH_BELGIUM
pattern TT_MS_LANGID_FRENCH_CANADA                  = #const TT_MS_LANGID_FRENCH_CANADA
pattern TT_MS_LANGID_FRENCH_SWITZERLAND             = #const TT_MS_LANGID_FRENCH_SWITZERLAND
pattern TT_MS_LANGID_FRENCH_LUXEMBOURG              = #const TT_MS_LANGID_FRENCH_LUXEMBOURG
pattern TT_MS_LANGID_FRENCH_MONACO                  = #const TT_MS_LANGID_FRENCH_MONACO
pattern TT_MS_LANGID_HEBREW_ISRAEL                  = #const TT_MS_LANGID_HEBREW_ISRAEL
pattern TT_MS_LANGID_HUNGARIAN_HUNGARY              = #const TT_MS_LANGID_HUNGARIAN_HUNGARY
pattern TT_MS_LANGID_ICELANDIC_ICELAND              = #const TT_MS_LANGID_ICELANDIC_ICELAND
pattern TT_MS_LANGID_ITALIAN_ITALY                  = #const TT_MS_LANGID_ITALIAN_ITALY
pattern TT_MS_LANGID_ITALIAN_SWITZERLAND            = #const TT_MS_LANGID_ITALIAN_SWITZERLAND
pattern TT_MS_LANGID_JAPANESE_JAPAN                 = #const TT_MS_LANGID_JAPANESE_JAPAN
pattern TT_MS_LANGID_KOREAN_KOREA                   = #const TT_MS_LANGID_KOREAN_KOREA
pattern TT_MS_LANGID_DUTCH_NETHERLANDS              = #const TT_MS_LANGID_DUTCH_NETHERLANDS
pattern TT_MS_LANGID_DUTCH_BELGIUM                  = #const TT_MS_LANGID_DUTCH_BELGIUM
pattern TT_MS_LANGID_NORWEGIAN_NORWAY_BOKMAL        = #const TT_MS_LANGID_NORWEGIAN_NORWAY_BOKMAL
pattern TT_MS_LANGID_NORWEGIAN_NORWAY_NYNORSK       = #const TT_MS_LANGID_NORWEGIAN_NORWAY_NYNORSK
pattern TT_MS_LANGID_POLISH_POLAND                  = #const TT_MS_LANGID_POLISH_POLAND
pattern TT_MS_LANGID_PORTUGUESE_BRAZIL              = #const TT_MS_LANGID_PORTUGUESE_BRAZIL
pattern TT_MS_LANGID_PORTUGUESE_PORTUGAL            = #const TT_MS_LANGID_PORTUGUESE_PORTUGAL
pattern TT_MS_LANGID_ROMANSH_SWITZERLAND            = #const TT_MS_LANGID_ROMANSH_SWITZERLAND
pattern TT_MS_LANGID_ROMANIAN_ROMANIA               = #const TT_MS_LANGID_ROMANIAN_ROMANIA
pattern TT_MS_LANGID_RUSSIAN_RUSSIA                 = #const TT_MS_LANGID_RUSSIAN_RUSSIA
pattern TT_MS_LANGID_CROATIAN_CROATIA               = #const TT_MS_LANGID_CROATIAN_CROATIA
pattern TT_MS_LANGID_SERBIAN_SERBIA_LATIN           = #const TT_MS_LANGID_SERBIAN_SERBIA_LATIN
pattern TT_MS_LANGID_SERBIAN_SERBIA_CYRILLIC        = #const TT_MS_LANGID_SERBIAN_SERBIA_CYRILLIC
pattern TT_MS_LANGID_CROATIAN_BOSNIA_HERZEGOVINA    = #const TT_MS_LANGID_CROATIAN_BOSNIA_HERZEGOVINA
pattern TT_MS_LANGID_BOSNIAN_BOSNIA_HERZEGOVINA     = #const TT_MS_LANGID_BOSNIAN_BOSNIA_HERZEGOVINA
pattern TT_MS_LANGID_SERBIAN_BOSNIA_HERZ_LATIN      = #const TT_MS_LANGID_SERBIAN_BOSNIA_HERZ_LATIN
pattern TT_MS_LANGID_SERBIAN_BOSNIA_HERZ_CYRILLIC   = #const TT_MS_LANGID_SERBIAN_BOSNIA_HERZ_CYRILLIC
pattern TT_MS_LANGID_BOSNIAN_BOSNIA_HERZ_CYRILLIC   = #const TT_MS_LANGID_BOSNIAN_BOSNIA_HERZ_CYRILLIC
pattern TT_MS_LANGID_SLOVAK_SLOVAKIA                = #const TT_MS_LANGID_SLOVAK_SLOVAKIA
pattern TT_MS_LANGID_ALBANIAN_ALBANIA               = #const TT_MS_LANGID_ALBANIAN_ALBANIA
pattern TT_MS_LANGID_SWEDISH_SWEDEN                 = #const TT_MS_LANGID_SWEDISH_SWEDEN
pattern TT_MS_LANGID_SWEDISH_FINLAND                = #const TT_MS_LANGID_SWEDISH_FINLAND
pattern TT_MS_LANGID_THAI_THAILAND                  = #const TT_MS_LANGID_THAI_THAILAND
pattern TT_MS_LANGID_TURKISH_TURKEY                 = #const TT_MS_LANGID_TURKISH_TURKEY
pattern TT_MS_LANGID_URDU_PAKISTAN                  = #const TT_MS_LANGID_URDU_PAKISTAN
pattern TT_MS_LANGID_INDONESIAN_INDONESIA           = #const TT_MS_LANGID_INDONESIAN_INDONESIA
pattern TT_MS_LANGID_UKRAINIAN_UKRAINE              = #const TT_MS_LANGID_UKRAINIAN_UKRAINE
pattern TT_MS_LANGID_BELARUSIAN_BELARUS             = #const TT_MS_LANGID_BELARUSIAN_BELARUS
pattern TT_MS_LANGID_SLOVENIAN_SLOVENIA             = #const TT_MS_LANGID_SLOVENIAN_SLOVENIA
pattern TT_MS_LANGID_ESTONIAN_ESTONIA               = #const TT_MS_LANGID_ESTONIAN_ESTONIA
pattern TT_MS_LANGID_LATVIAN_LATVIA                 = #const TT_MS_LANGID_LATVIAN_LATVIA
pattern TT_MS_LANGID_LITHUANIAN_LITHUANIA           = #const TT_MS_LANGID_LITHUANIAN_LITHUANIA
pattern TT_MS_LANGID_TAJIK_TAJIKISTAN               = #const TT_MS_LANGID_TAJIK_TAJIKISTAN
pattern TT_MS_LANGID_VIETNAMESE_VIET_NAM            = #const TT_MS_LANGID_VIETNAMESE_VIET_NAM
pattern TT_MS_LANGID_ARMENIAN_ARMENIA               = #const TT_MS_LANGID_ARMENIAN_ARMENIA
pattern TT_MS_LANGID_AZERI_AZERBAIJAN_LATIN         = #const TT_MS_LANGID_AZERI_AZERBAIJAN_LATIN
pattern TT_MS_LANGID_AZERI_AZERBAIJAN_CYRILLIC      = #const TT_MS_LANGID_AZERI_AZERBAIJAN_CYRILLIC
pattern TT_MS_LANGID_BASQUE_BASQUE                  = #const TT_MS_LANGID_BASQUE_BASQUE
pattern TT_MS_LANGID_UPPER_SORBIAN_GERMANY          = #const TT_MS_LANGID_UPPER_SORBIAN_GERMANY
pattern TT_MS_LANGID_LOWER_SORBIAN_GERMANY          = #const TT_MS_LANGID_LOWER_SORBIAN_GERMANY
pattern TT_MS_LANGID_MACEDONIAN_MACEDONIA           = #const TT_MS_LANGID_MACEDONIAN_MACEDONIA
pattern TT_MS_LANGID_SETSWANA_SOUTH_AFRICA          = #const TT_MS_LANGID_SETSWANA_SOUTH_AFRICA
pattern TT_MS_LANGID_ISIXHOSA_SOUTH_AFRICA          = #const TT_MS_LANGID_ISIXHOSA_SOUTH_AFRICA
pattern TT_MS_LANGID_ISIZULU_SOUTH_AFRICA           = #const TT_MS_LANGID_ISIZULU_SOUTH_AFRICA
pattern TT_MS_LANGID_AFRIKAANS_SOUTH_AFRICA         = #const TT_MS_LANGID_AFRIKAANS_SOUTH_AFRICA
pattern TT_MS_LANGID_GEORGIAN_GEORGIA               = #const TT_MS_LANGID_GEORGIAN_GEORGIA
pattern TT_MS_LANGID_FAEROESE_FAEROE_ISLANDS        = #const TT_MS_LANGID_FAEROESE_FAEROE_ISLANDS
pattern TT_MS_LANGID_HINDI_INDIA                    = #const TT_MS_LANGID_HINDI_INDIA
pattern TT_MS_LANGID_MALTESE_MALTA                  = #const TT_MS_LANGID_MALTESE_MALTA
pattern TT_MS_LANGID_SAMI_NORTHERN_NORWAY           = #const TT_MS_LANGID_SAMI_NORTHERN_NORWAY
pattern TT_MS_LANGID_SAMI_NORTHERN_SWEDEN           = #const TT_MS_LANGID_SAMI_NORTHERN_SWEDEN
pattern TT_MS_LANGID_SAMI_NORTHERN_FINLAND          = #const TT_MS_LANGID_SAMI_NORTHERN_FINLAND
pattern TT_MS_LANGID_SAMI_LULE_NORWAY               = #const TT_MS_LANGID_SAMI_LULE_NORWAY
pattern TT_MS_LANGID_SAMI_LULE_SWEDEN               = #const TT_MS_LANGID_SAMI_LULE_SWEDEN
pattern TT_MS_LANGID_SAMI_SOUTHERN_NORWAY           = #const TT_MS_LANGID_SAMI_SOUTHERN_NORWAY
pattern TT_MS_LANGID_SAMI_SOUTHERN_SWEDEN           = #const TT_MS_LANGID_SAMI_SOUTHERN_SWEDEN
pattern TT_MS_LANGID_SAMI_SKOLT_FINLAND             = #const TT_MS_LANGID_SAMI_SKOLT_FINLAND
pattern TT_MS_LANGID_SAMI_INARI_FINLAND             = #const TT_MS_LANGID_SAMI_INARI_FINLAND
pattern TT_MS_LANGID_IRISH_IRELAND                  = #const TT_MS_LANGID_IRISH_IRELAND
pattern TT_MS_LANGID_MALAY_MALAYSIA                 = #const TT_MS_LANGID_MALAY_MALAYSIA
pattern TT_MS_LANGID_MALAY_BRUNEI_DARUSSALAM        = #const TT_MS_LANGID_MALAY_BRUNEI_DARUSSALAM
pattern TT_MS_LANGID_KAZAKH_KAZAKHSTAN              = #const TT_MS_LANGID_KAZAKH_KAZAKHSTAN
pattern TT_MS_LANGID_KYRGYZ_KYRGYZSTAN              = #const TT_MS_LANGID_KYRGYZ_KYRGYZSTAN
pattern TT_MS_LANGID_KISWAHILI_KENYA                = #const TT_MS_LANGID_KISWAHILI_KENYA
pattern TT_MS_LANGID_TURKMEN_TURKMENISTAN           = #const TT_MS_LANGID_TURKMEN_TURKMENISTAN
pattern TT_MS_LANGID_UZBEK_UZBEKISTAN_LATIN         = #const TT_MS_LANGID_UZBEK_UZBEKISTAN_LATIN
pattern TT_MS_LANGID_UZBEK_UZBEKISTAN_CYRILLIC      = #const TT_MS_LANGID_UZBEK_UZBEKISTAN_CYRILLIC
pattern TT_MS_LANGID_TATAR_RUSSIA                   = #const TT_MS_LANGID_TATAR_RUSSIA
pattern TT_MS_LANGID_BENGALI_INDIA                  = #const TT_MS_LANGID_BENGALI_INDIA
pattern TT_MS_LANGID_BENGALI_BANGLADESH             = #const TT_MS_LANGID_BENGALI_BANGLADESH
pattern TT_MS_LANGID_PUNJABI_INDIA                  = #const TT_MS_LANGID_PUNJABI_INDIA
pattern TT_MS_LANGID_GUJARATI_INDIA                 = #const TT_MS_LANGID_GUJARATI_INDIA
pattern TT_MS_LANGID_ODIA_INDIA                     = #const TT_MS_LANGID_ODIA_INDIA
pattern TT_MS_LANGID_TAMIL_INDIA                    = #const TT_MS_LANGID_TAMIL_INDIA
pattern TT_MS_LANGID_TELUGU_INDIA                   = #const TT_MS_LANGID_TELUGU_INDIA
pattern TT_MS_LANGID_KANNADA_INDIA                  = #const TT_MS_LANGID_KANNADA_INDIA
pattern TT_MS_LANGID_MALAYALAM_INDIA                = #const TT_MS_LANGID_MALAYALAM_INDIA
pattern TT_MS_LANGID_ASSAMESE_INDIA                 = #const TT_MS_LANGID_ASSAMESE_INDIA
pattern TT_MS_LANGID_MARATHI_INDIA                  = #const TT_MS_LANGID_MARATHI_INDIA
pattern TT_MS_LANGID_SANSKRIT_INDIA                 = #const TT_MS_LANGID_SANSKRIT_INDIA
pattern TT_MS_LANGID_MONGOLIAN_MONGOLIA             = #const TT_MS_LANGID_MONGOLIAN_MONGOLIA
pattern TT_MS_LANGID_MONGOLIAN_PRC                  = #const TT_MS_LANGID_MONGOLIAN_PRC
pattern TT_MS_LANGID_TIBETAN_PRC                    = #const TT_MS_LANGID_TIBETAN_PRC
pattern TT_MS_LANGID_WELSH_UNITED_KINGDOM           = #const TT_MS_LANGID_WELSH_UNITED_KINGDOM
pattern TT_MS_LANGID_KHMER_CAMBODIA                 = #const TT_MS_LANGID_KHMER_CAMBODIA
pattern TT_MS_LANGID_LAO_LAOS                       = #const TT_MS_LANGID_LAO_LAOS
pattern TT_MS_LANGID_GALICIAN_GALICIAN              = #const TT_MS_LANGID_GALICIAN_GALICIAN
pattern TT_MS_LANGID_KONKANI_INDIA                  = #const TT_MS_LANGID_KONKANI_INDIA
pattern TT_MS_LANGID_SYRIAC_SYRIA                   = #const TT_MS_LANGID_SYRIAC_SYRIA
pattern TT_MS_LANGID_SINHALA_SRI_LANKA              = #const TT_MS_LANGID_SINHALA_SRI_LANKA
pattern TT_MS_LANGID_INUKTITUT_CANADA               = #const TT_MS_LANGID_INUKTITUT_CANADA
pattern TT_MS_LANGID_INUKTITUT_CANADA_LATIN         = #const TT_MS_LANGID_INUKTITUT_CANADA_LATIN
pattern TT_MS_LANGID_AMHARIC_ETHIOPIA               = #const TT_MS_LANGID_AMHARIC_ETHIOPIA
pattern TT_MS_LANGID_TAMAZIGHT_ALGERIA              = #const TT_MS_LANGID_TAMAZIGHT_ALGERIA
pattern TT_MS_LANGID_NEPALI_NEPAL                   = #const TT_MS_LANGID_NEPALI_NEPAL
pattern TT_MS_LANGID_FRISIAN_NETHERLANDS            = #const TT_MS_LANGID_FRISIAN_NETHERLANDS
pattern TT_MS_LANGID_PASHTO_AFGHANISTAN             = #const TT_MS_LANGID_PASHTO_AFGHANISTAN
pattern TT_MS_LANGID_FILIPINO_PHILIPPINES           = #const TT_MS_LANGID_FILIPINO_PHILIPPINES
pattern TT_MS_LANGID_DHIVEHI_MALDIVES               = #const TT_MS_LANGID_DHIVEHI_MALDIVES
pattern TT_MS_LANGID_HAUSA_NIGERIA                  = #const TT_MS_LANGID_HAUSA_NIGERIA
pattern TT_MS_LANGID_YORUBA_NIGERIA                 = #const TT_MS_LANGID_YORUBA_NIGERIA
pattern TT_MS_LANGID_QUECHUA_BOLIVIA                = #const TT_MS_LANGID_QUECHUA_BOLIVIA
pattern TT_MS_LANGID_QUECHUA_ECUADOR                = #const TT_MS_LANGID_QUECHUA_ECUADOR
pattern TT_MS_LANGID_QUECHUA_PERU                   = #const TT_MS_LANGID_QUECHUA_PERU
pattern TT_MS_LANGID_SESOTHO_SA_LEBOA_SOUTH_AFRICA  = #const TT_MS_LANGID_SESOTHO_SA_LEBOA_SOUTH_AFRICA
pattern TT_MS_LANGID_BASHKIR_RUSSIA                 = #const TT_MS_LANGID_BASHKIR_RUSSIA
pattern TT_MS_LANGID_LUXEMBOURGISH_LUXEMBOURG       = #const TT_MS_LANGID_LUXEMBOURGISH_LUXEMBOURG
pattern TT_MS_LANGID_GREENLANDIC_GREENLAND          = #const TT_MS_LANGID_GREENLANDIC_GREENLAND
pattern TT_MS_LANGID_IGBO_NIGERIA                   = #const TT_MS_LANGID_IGBO_NIGERIA
pattern TT_MS_LANGID_YI_PRC                         = #const TT_MS_LANGID_YI_PRC
pattern TT_MS_LANGID_MAPUDUNGUN_CHILE               = #const TT_MS_LANGID_MAPUDUNGUN_CHILE
pattern TT_MS_LANGID_MOHAWK_MOHAWK                  = #const TT_MS_LANGID_MOHAWK_MOHAWK
pattern TT_MS_LANGID_BRETON_FRANCE                  = #const TT_MS_LANGID_BRETON_FRANCE
pattern TT_MS_LANGID_UIGHUR_PRC                     = #const TT_MS_LANGID_UIGHUR_PRC
pattern TT_MS_LANGID_MAORI_NEW_ZEALAND              = #const TT_MS_LANGID_MAORI_NEW_ZEALAND
pattern TT_MS_LANGID_OCCITAN_FRANCE                 = #const TT_MS_LANGID_OCCITAN_FRANCE
pattern TT_MS_LANGID_CORSICAN_FRANCE                = #const TT_MS_LANGID_CORSICAN_FRANCE
pattern TT_MS_LANGID_ALSATIAN_FRANCE                = #const TT_MS_LANGID_ALSATIAN_FRANCE
pattern TT_MS_LANGID_YAKUT_RUSSIA                   = #const TT_MS_LANGID_YAKUT_RUSSIA
pattern TT_MS_LANGID_KICHE_GUATEMALA                = #const TT_MS_LANGID_KICHE_GUATEMALA
pattern TT_MS_LANGID_KINYARWANDA_RWANDA             = #const TT_MS_LANGID_KINYARWANDA_RWANDA
pattern TT_MS_LANGID_WOLOF_SENEGAL                  = #const TT_MS_LANGID_WOLOF_SENEGAL
pattern TT_MS_LANGID_DARI_AFGHANISTAN               = #const TT_MS_LANGID_DARI_AFGHANISTAN



pattern TT_NAME_ID_COPYRIGHT
      , TT_NAME_ID_FONT_FAMILY
      , TT_NAME_ID_FONT_SUBFAMILY
      , TT_NAME_ID_UNIQUE_ID
      , TT_NAME_ID_FULL_NAME
      , TT_NAME_ID_VERSION_STRING
      , TT_NAME_ID_PS_NAME
      , TT_NAME_ID_TRADEMARK
      , TT_NAME_ID_MANUFACTURER
      , TT_NAME_ID_DESIGNER
      , TT_NAME_ID_DESCRIPTION
      , TT_NAME_ID_VENDOR_URL
      , TT_NAME_ID_DESIGNER_URL
      , TT_NAME_ID_LICENSE
      , TT_NAME_ID_LICENSE_URL
      , TT_NAME_ID_TYPOGRAPHIC_FAMILY
      , TT_NAME_ID_TYPOGRAPHIC_SUBFAMILY
      , TT_NAME_ID_MAC_FULL_NAME
      , TT_NAME_ID_SAMPLE_TEXT
      , TT_NAME_ID_CID_FINDFONT_NAME
      , TT_NAME_ID_WWS_FAMILY
      , TT_NAME_ID_WWS_SUBFAMILY
      , TT_NAME_ID_LIGHT_BACKGROUND
      , TT_NAME_ID_DARK_BACKGROUND
      , TT_NAME_ID_VARIATIONS_PREFIX
     :: FT_Int32
pattern TT_NAME_ID_COPYRIGHT             = #const TT_NAME_ID_COPYRIGHT
pattern TT_NAME_ID_FONT_FAMILY           = #const TT_NAME_ID_FONT_FAMILY
pattern TT_NAME_ID_FONT_SUBFAMILY        = #const TT_NAME_ID_FONT_SUBFAMILY
pattern TT_NAME_ID_UNIQUE_ID             = #const TT_NAME_ID_UNIQUE_ID
pattern TT_NAME_ID_FULL_NAME             = #const TT_NAME_ID_FULL_NAME
pattern TT_NAME_ID_VERSION_STRING        = #const TT_NAME_ID_VERSION_STRING
pattern TT_NAME_ID_PS_NAME               = #const TT_NAME_ID_PS_NAME
pattern TT_NAME_ID_TRADEMARK             = #const TT_NAME_ID_TRADEMARK
pattern TT_NAME_ID_MANUFACTURER          = #const TT_NAME_ID_MANUFACTURER
pattern TT_NAME_ID_DESIGNER              = #const TT_NAME_ID_DESIGNER
pattern TT_NAME_ID_DESCRIPTION           = #const TT_NAME_ID_DESCRIPTION
pattern TT_NAME_ID_VENDOR_URL            = #const TT_NAME_ID_VENDOR_URL
pattern TT_NAME_ID_DESIGNER_URL          = #const TT_NAME_ID_DESIGNER_URL
pattern TT_NAME_ID_LICENSE               = #const TT_NAME_ID_LICENSE
pattern TT_NAME_ID_LICENSE_URL           = #const TT_NAME_ID_LICENSE_URL
pattern TT_NAME_ID_TYPOGRAPHIC_FAMILY    = #const TT_NAME_ID_TYPOGRAPHIC_FAMILY
pattern TT_NAME_ID_TYPOGRAPHIC_SUBFAMILY = #const TT_NAME_ID_TYPOGRAPHIC_SUBFAMILY
pattern TT_NAME_ID_MAC_FULL_NAME         = #const TT_NAME_ID_MAC_FULL_NAME
pattern TT_NAME_ID_SAMPLE_TEXT           = #const TT_NAME_ID_SAMPLE_TEXT
pattern TT_NAME_ID_CID_FINDFONT_NAME     = #const TT_NAME_ID_CID_FINDFONT_NAME
pattern TT_NAME_ID_WWS_FAMILY            = #const TT_NAME_ID_WWS_FAMILY
pattern TT_NAME_ID_WWS_SUBFAMILY         = #const TT_NAME_ID_WWS_SUBFAMILY
pattern TT_NAME_ID_LIGHT_BACKGROUND      = #const TT_NAME_ID_LIGHT_BACKGROUND
pattern TT_NAME_ID_DARK_BACKGROUND       = #const TT_NAME_ID_DARK_BACKGROUND
pattern TT_NAME_ID_VARIATIONS_PREFIX     = #const TT_NAME_ID_VARIATIONS_PREFIX



pattern TT_UCR_BASIC_LATIN
      , TT_UCR_LATIN1_SUPPLEMENT
      , TT_UCR_LATIN_EXTENDED_A
      , TT_UCR_LATIN_EXTENDED_B
      , TT_UCR_IPA_EXTENSIONS
      , TT_UCR_SPACING_MODIFIER
      , TT_UCR_COMBINING_DIACRITICAL_MARKS
      , TT_UCR_GREEK
      , TT_UCR_COPTIC
      , TT_UCR_CYRILLIC
      , TT_UCR_ARMENIAN
      , TT_UCR_HEBREW
      , TT_UCR_VAI
      , TT_UCR_ARABIC
      , TT_UCR_NKO
      , TT_UCR_DEVANAGARI
      , TT_UCR_BENGALI
      , TT_UCR_GURMUKHI
      , TT_UCR_GUJARATI
      , TT_UCR_ORIYA
      , TT_UCR_TAMIL
      , TT_UCR_TELUGU
      , TT_UCR_KANNADA
      , TT_UCR_MALAYALAM
      , TT_UCR_THAI
      , TT_UCR_LAO
      , TT_UCR_GEORGIAN
      , TT_UCR_BALINESE
      , TT_UCR_HANGUL_JAMO
      , TT_UCR_LATIN_EXTENDED_ADDITIONAL
      , TT_UCR_GREEK_EXTENDED
      , TT_UCR_GENERAL_PUNCTUATION
      , TT_UCR_SUPERSCRIPTS_SUBSCRIPTS
      , TT_UCR_CURRENCY_SYMBOLS
      , TT_UCR_COMBINING_DIACRITICAL_MARKS_SYMB
      , TT_UCR_LETTERLIKE_SYMBOLS
      , TT_UCR_NUMBER_FORMS
      , TT_UCR_ARROWS
      , TT_UCR_MATHEMATICAL_OPERATORS
      , TT_UCR_MISCELLANEOUS_TECHNICAL
      , TT_UCR_CONTROL_PICTURES
      , TT_UCR_OCR
      , TT_UCR_ENCLOSED_ALPHANUMERICS
      , TT_UCR_BOX_DRAWING
      , TT_UCR_BLOCK_ELEMENTS
      , TT_UCR_GEOMETRIC_SHAPES
      , TT_UCR_MISCELLANEOUS_SYMBOLS
      , TT_UCR_DINGBATS
      , TT_UCR_CJK_SYMBOLS
      , TT_UCR_HIRAGANA
      , TT_UCR_KATAKANA
      , TT_UCR_BOPOMOFO
      , TT_UCR_HANGUL_COMPATIBILITY_JAMO
      , TT_UCR_CJK_MISC
      , TT_UCR_ENCLOSED_CJK_LETTERS_MONTHS
      , TT_UCR_CJK_COMPATIBILITY
      , TT_UCR_HANGUL
      , TT_UCR_SURROGATES
      , TT_UCR_NON_PLANE_0
      , TT_UCR_PHOENICIAN
      , TT_UCR_CJK_UNIFIED_IDEOGRAPHS
      , TT_UCR_PRIVATE_USE
      , TT_UCR_CJK_COMPATIBILITY_IDEOGRAPHS
      , TT_UCR_ALPHABETIC_PRESENTATION_FORMS
      , TT_UCR_ARABIC_PRESENTATION_FORMS_A
      , TT_UCR_COMBINING_HALF_MARKS
      , TT_UCR_CJK_COMPATIBILITY_FORMS
      , TT_UCR_SMALL_FORM_VARIANTS
      , TT_UCR_ARABIC_PRESENTATION_FORMS_B
      , TT_UCR_HALFWIDTH_FULLWIDTH_FORMS
      , TT_UCR_SPECIALS
      , TT_UCR_TIBETAN
      , TT_UCR_SYRIAC
      , TT_UCR_THAANA
      , TT_UCR_SINHALA
      , TT_UCR_MYANMAR
      , TT_UCR_ETHIOPIC
      , TT_UCR_CHEROKEE
      , TT_UCR_CANADIAN_ABORIGINAL_SYLLABICS
      , TT_UCR_OGHAM
      , TT_UCR_RUNIC
      , TT_UCR_KHMER
      , TT_UCR_MONGOLIAN
      , TT_UCR_BRAILLE
      , TT_UCR_YI
      , TT_UCR_PHILIPPINE
      , TT_UCR_OLD_ITALIC
      , TT_UCR_GOTHIC
      , TT_UCR_DESERET
      , TT_UCR_MUSICAL_SYMBOLS
      , TT_UCR_MATH_ALPHANUMERIC_SYMBOLS
      , TT_UCR_PRIVATE_USE_SUPPLEMENTARY
      , TT_UCR_VARIATION_SELECTORS
      , TT_UCR_TAGS
      , TT_UCR_LIMBU
      , TT_UCR_TAI_LE
      , TT_UCR_NEW_TAI_LUE
      , TT_UCR_BUGINESE
      , TT_UCR_GLAGOLITIC
      , TT_UCR_TIFINAGH
      , TT_UCR_YIJING
      , TT_UCR_SYLOTI_NAGRI
      , TT_UCR_LINEAR_B
      , TT_UCR_ANCIENT_GREEK_NUMBERS
      , TT_UCR_UGARITIC
      , TT_UCR_OLD_PERSIAN
      , TT_UCR_SHAVIAN
      , TT_UCR_OSMANYA
      , TT_UCR_CYPRIOT_SYLLABARY
      , TT_UCR_KHAROSHTHI
      , TT_UCR_TAI_XUAN_JING
      , TT_UCR_CUNEIFORM
      , TT_UCR_COUNTING_ROD_NUMERALS
      , TT_UCR_SUNDANESE
      , TT_UCR_LEPCHA
      , TT_UCR_OL_CHIKI
      , TT_UCR_SAURASHTRA
      , TT_UCR_KAYAH_LI
      , TT_UCR_REJANG
      , TT_UCR_CHAM
      , TT_UCR_ANCIENT_SYMBOLS
      , TT_UCR_PHAISTOS_DISC
      , TT_UCR_OLD_ANATOLIAN
      , TT_UCR_GAME_TILES
     :: FT_ULong
pattern TT_UCR_BASIC_LATIN                      = #const TT_UCR_BASIC_LATIN
pattern TT_UCR_LATIN1_SUPPLEMENT                = #const TT_UCR_LATIN1_SUPPLEMENT
pattern TT_UCR_LATIN_EXTENDED_A                 = #const TT_UCR_LATIN_EXTENDED_A
pattern TT_UCR_LATIN_EXTENDED_B                 = #const TT_UCR_LATIN_EXTENDED_B
pattern TT_UCR_IPA_EXTENSIONS                   = #const TT_UCR_IPA_EXTENSIONS
pattern TT_UCR_SPACING_MODIFIER                 = #const TT_UCR_SPACING_MODIFIER
pattern TT_UCR_COMBINING_DIACRITICAL_MARKS      = #const TT_UCR_COMBINING_DIACRITICAL_MARKS
pattern TT_UCR_GREEK                            = #const TT_UCR_GREEK
pattern TT_UCR_COPTIC                           = #const TT_UCR_COPTIC
pattern TT_UCR_CYRILLIC                         = #const TT_UCR_CYRILLIC
pattern TT_UCR_ARMENIAN                         = #const TT_UCR_ARMENIAN
pattern TT_UCR_HEBREW                           = #const TT_UCR_HEBREW
pattern TT_UCR_VAI                              = #const TT_UCR_VAI
pattern TT_UCR_ARABIC                           = #const TT_UCR_ARABIC
pattern TT_UCR_NKO                              = #const TT_UCR_NKO
pattern TT_UCR_DEVANAGARI                       = #const TT_UCR_DEVANAGARI
pattern TT_UCR_BENGALI                          = #const TT_UCR_BENGALI
pattern TT_UCR_GURMUKHI                         = #const TT_UCR_GURMUKHI
pattern TT_UCR_GUJARATI                         = #const TT_UCR_GUJARATI
pattern TT_UCR_ORIYA                            = #const TT_UCR_ORIYA
pattern TT_UCR_TAMIL                            = #const TT_UCR_TAMIL
pattern TT_UCR_TELUGU                           = #const TT_UCR_TELUGU
pattern TT_UCR_KANNADA                          = #const TT_UCR_KANNADA
pattern TT_UCR_MALAYALAM                        = #const TT_UCR_MALAYALAM
pattern TT_UCR_THAI                             = #const TT_UCR_THAI
pattern TT_UCR_LAO                              = #const TT_UCR_LAO
pattern TT_UCR_GEORGIAN                         = #const TT_UCR_GEORGIAN
pattern TT_UCR_BALINESE                         = #const TT_UCR_BALINESE
pattern TT_UCR_HANGUL_JAMO                      = #const TT_UCR_HANGUL_JAMO
pattern TT_UCR_LATIN_EXTENDED_ADDITIONAL        = #const TT_UCR_LATIN_EXTENDED_ADDITIONAL
pattern TT_UCR_GREEK_EXTENDED                   = #const TT_UCR_GREEK_EXTENDED
pattern TT_UCR_GENERAL_PUNCTUATION              = #const TT_UCR_GENERAL_PUNCTUATION
pattern TT_UCR_SUPERSCRIPTS_SUBSCRIPTS          = #const TT_UCR_SUPERSCRIPTS_SUBSCRIPTS
pattern TT_UCR_CURRENCY_SYMBOLS                 = #const TT_UCR_CURRENCY_SYMBOLS
pattern TT_UCR_COMBINING_DIACRITICAL_MARKS_SYMB = #const TT_UCR_COMBINING_DIACRITICAL_MARKS_SYMB
pattern TT_UCR_LETTERLIKE_SYMBOLS               = #const TT_UCR_LETTERLIKE_SYMBOLS
pattern TT_UCR_NUMBER_FORMS                     = #const TT_UCR_NUMBER_FORMS
pattern TT_UCR_ARROWS                           = #const TT_UCR_ARROWS
pattern TT_UCR_MATHEMATICAL_OPERATORS           = #const TT_UCR_MATHEMATICAL_OPERATORS
pattern TT_UCR_MISCELLANEOUS_TECHNICAL          = #const TT_UCR_MISCELLANEOUS_TECHNICAL
pattern TT_UCR_CONTROL_PICTURES                 = #const TT_UCR_CONTROL_PICTURES
pattern TT_UCR_OCR                              = #const TT_UCR_OCR
pattern TT_UCR_ENCLOSED_ALPHANUMERICS           = #const TT_UCR_ENCLOSED_ALPHANUMERICS
pattern TT_UCR_BOX_DRAWING                      = #const TT_UCR_BOX_DRAWING
pattern TT_UCR_BLOCK_ELEMENTS                   = #const TT_UCR_BLOCK_ELEMENTS
pattern TT_UCR_GEOMETRIC_SHAPES                 = #const TT_UCR_GEOMETRIC_SHAPES
pattern TT_UCR_MISCELLANEOUS_SYMBOLS            = #const TT_UCR_MISCELLANEOUS_SYMBOLS
pattern TT_UCR_DINGBATS                         = #const TT_UCR_DINGBATS
pattern TT_UCR_CJK_SYMBOLS                      = #const TT_UCR_CJK_SYMBOLS
pattern TT_UCR_HIRAGANA                         = #const TT_UCR_HIRAGANA
pattern TT_UCR_KATAKANA                         = #const TT_UCR_KATAKANA
pattern TT_UCR_BOPOMOFO                         = #const TT_UCR_BOPOMOFO
pattern TT_UCR_HANGUL_COMPATIBILITY_JAMO        = #const TT_UCR_HANGUL_COMPATIBILITY_JAMO
pattern TT_UCR_CJK_MISC                         = #const TT_UCR_CJK_MISC
pattern TT_UCR_ENCLOSED_CJK_LETTERS_MONTHS      = #const TT_UCR_ENCLOSED_CJK_LETTERS_MONTHS
pattern TT_UCR_CJK_COMPATIBILITY                = #const TT_UCR_CJK_COMPATIBILITY
pattern TT_UCR_HANGUL                           = #const TT_UCR_HANGUL
pattern TT_UCR_SURROGATES                       = #const TT_UCR_SURROGATES
pattern TT_UCR_NON_PLANE_0                      = #const TT_UCR_NON_PLANE_0
pattern TT_UCR_PHOENICIAN                       = #const TT_UCR_PHOENICIAN
pattern TT_UCR_CJK_UNIFIED_IDEOGRAPHS           = #const TT_UCR_CJK_UNIFIED_IDEOGRAPHS
pattern TT_UCR_PRIVATE_USE                      = #const TT_UCR_PRIVATE_USE
pattern TT_UCR_CJK_COMPATIBILITY_IDEOGRAPHS     = #const TT_UCR_CJK_COMPATIBILITY_IDEOGRAPHS
pattern TT_UCR_ALPHABETIC_PRESENTATION_FORMS    = #const TT_UCR_ALPHABETIC_PRESENTATION_FORMS
pattern TT_UCR_ARABIC_PRESENTATION_FORMS_A      = #const TT_UCR_ARABIC_PRESENTATION_FORMS_A
pattern TT_UCR_COMBINING_HALF_MARKS             = #const TT_UCR_COMBINING_HALF_MARKS
pattern TT_UCR_CJK_COMPATIBILITY_FORMS          = #const TT_UCR_CJK_COMPATIBILITY_FORMS
pattern TT_UCR_SMALL_FORM_VARIANTS              = #const TT_UCR_SMALL_FORM_VARIANTS
pattern TT_UCR_ARABIC_PRESENTATION_FORMS_B      = #const TT_UCR_ARABIC_PRESENTATION_FORMS_B
pattern TT_UCR_HALFWIDTH_FULLWIDTH_FORMS        = #const TT_UCR_HALFWIDTH_FULLWIDTH_FORMS
pattern TT_UCR_SPECIALS                         = #const TT_UCR_SPECIALS
pattern TT_UCR_TIBETAN                          = #const TT_UCR_TIBETAN
pattern TT_UCR_SYRIAC                           = #const TT_UCR_SYRIAC
pattern TT_UCR_THAANA                           = #const TT_UCR_THAANA
pattern TT_UCR_SINHALA                          = #const TT_UCR_SINHALA
pattern TT_UCR_MYANMAR                          = #const TT_UCR_MYANMAR
pattern TT_UCR_ETHIOPIC                         = #const TT_UCR_ETHIOPIC
pattern TT_UCR_CHEROKEE                         = #const TT_UCR_CHEROKEE
pattern TT_UCR_CANADIAN_ABORIGINAL_SYLLABICS    = #const TT_UCR_CANADIAN_ABORIGINAL_SYLLABICS
pattern TT_UCR_OGHAM                            = #const TT_UCR_OGHAM
pattern TT_UCR_RUNIC                            = #const TT_UCR_RUNIC
pattern TT_UCR_KHMER                            = #const TT_UCR_KHMER
pattern TT_UCR_MONGOLIAN                        = #const TT_UCR_MONGOLIAN
pattern TT_UCR_BRAILLE                          = #const TT_UCR_BRAILLE
pattern TT_UCR_YI                               = #const TT_UCR_YI
pattern TT_UCR_PHILIPPINE                       = #const TT_UCR_PHILIPPINE
pattern TT_UCR_OLD_ITALIC                       = #const TT_UCR_OLD_ITALIC
pattern TT_UCR_GOTHIC                           = #const TT_UCR_GOTHIC
pattern TT_UCR_DESERET                          = #const TT_UCR_DESERET
pattern TT_UCR_MUSICAL_SYMBOLS                  = #const TT_UCR_MUSICAL_SYMBOLS
pattern TT_UCR_MATH_ALPHANUMERIC_SYMBOLS        = #const TT_UCR_MATH_ALPHANUMERIC_SYMBOLS
pattern TT_UCR_PRIVATE_USE_SUPPLEMENTARY        = #const TT_UCR_PRIVATE_USE_SUPPLEMENTARY
pattern TT_UCR_VARIATION_SELECTORS              = #const TT_UCR_VARIATION_SELECTORS
pattern TT_UCR_TAGS                             = #const TT_UCR_TAGS
pattern TT_UCR_LIMBU                            = #const TT_UCR_LIMBU
pattern TT_UCR_TAI_LE                           = #const TT_UCR_TAI_LE
pattern TT_UCR_NEW_TAI_LUE                      = #const TT_UCR_NEW_TAI_LUE
pattern TT_UCR_BUGINESE                         = #const TT_UCR_BUGINESE
pattern TT_UCR_GLAGOLITIC                       = #const TT_UCR_GLAGOLITIC
pattern TT_UCR_TIFINAGH                         = #const TT_UCR_TIFINAGH
pattern TT_UCR_YIJING                           = #const TT_UCR_YIJING
pattern TT_UCR_SYLOTI_NAGRI                     = #const TT_UCR_SYLOTI_NAGRI
pattern TT_UCR_LINEAR_B                         = #const TT_UCR_LINEAR_B
pattern TT_UCR_ANCIENT_GREEK_NUMBERS            = #const TT_UCR_ANCIENT_GREEK_NUMBERS
pattern TT_UCR_UGARITIC                         = #const TT_UCR_UGARITIC
pattern TT_UCR_OLD_PERSIAN                      = #const TT_UCR_OLD_PERSIAN
pattern TT_UCR_SHAVIAN                          = #const TT_UCR_SHAVIAN
pattern TT_UCR_OSMANYA                          = #const TT_UCR_OSMANYA
pattern TT_UCR_CYPRIOT_SYLLABARY                = #const TT_UCR_CYPRIOT_SYLLABARY
pattern TT_UCR_KHAROSHTHI                       = #const TT_UCR_KHAROSHTHI
pattern TT_UCR_TAI_XUAN_JING                    = #const TT_UCR_TAI_XUAN_JING
pattern TT_UCR_CUNEIFORM                        = #const TT_UCR_CUNEIFORM
pattern TT_UCR_COUNTING_ROD_NUMERALS            = #const TT_UCR_COUNTING_ROD_NUMERALS
pattern TT_UCR_SUNDANESE                        = #const TT_UCR_SUNDANESE
pattern TT_UCR_LEPCHA                           = #const TT_UCR_LEPCHA
pattern TT_UCR_OL_CHIKI                         = #const TT_UCR_OL_CHIKI
pattern TT_UCR_SAURASHTRA                       = #const TT_UCR_SAURASHTRA
pattern TT_UCR_KAYAH_LI                         = #const TT_UCR_KAYAH_LI
pattern TT_UCR_REJANG                           = #const TT_UCR_REJANG
pattern TT_UCR_CHAM                             = #const TT_UCR_CHAM
pattern TT_UCR_ANCIENT_SYMBOLS                  = #const TT_UCR_ANCIENT_SYMBOLS
pattern TT_UCR_PHAISTOS_DISC                    = #const TT_UCR_PHAISTOS_DISC
pattern TT_UCR_OLD_ANATOLIAN                    = #const TT_UCR_OLD_ANATOLIAN
pattern TT_UCR_GAME_TILES                       = #const TT_UCR_GAME_TILES
