{-# LANGUAGE ForeignFunctionInterface #-}
{-# LANGUAGE TemplateHaskell #-}

module FreeType.Core.Size
  ( -- ** FT_New_Size
    ft_New_Size
    -- ** FT_Done_Size
  , ft_Done_Size
    -- ** FT_Activate_Size
  , ft_Activate_Size
  ) where

import           FreeType.Core.Base.Types
import           FreeType.Core.Size.Internal
import           FreeType.Exception.Internal



ft_New_Size :: FT_Face -> IO FT_Size
ft_New_Size =
  autoAllocaError 'ft_New_Size ft_New_Size'



ft_Done_Size :: FT_Size -> IO ()
ft_Done_Size =
  autoError 'ft_Done_Size ft_Done_Size'



ft_Activate_Size :: FT_Size -> IO ()
ft_Activate_Size =
  autoError 'ft_Activate_Size ft_Activate_Size'
