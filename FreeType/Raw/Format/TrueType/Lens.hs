{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE FunctionalDependencies #-}
{-# LANGUAGE TemplateHaskell #-}
{-# OPTIONS_HADDOCK hide #-}

module FreeType.Raw.Format.TrueType.Lens where

import           FreeType.Internal.Lens
import           FreeType.Raw.Format.TrueType.Internal



makeFieldsFT ''TT_Header

makeFieldsFT ''TT_HoriHeader

makeFieldsFT ''TT_VertHeader

makeFieldsFT ''TT_OS2

makeFieldsFT ''TT_Postscript

makeFieldsFT ''TT_PCLT

makeFieldsFT ''TT_MaxProfile
