module FreeType.Miscellaneous.TrueType.Types where

import           Data.Word

#include "ft2build.h"
#include FT_MODULE_H



type FT_TrueTypeEngineType = #type enum FT_TrueTypeEngineType_
