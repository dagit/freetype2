{-# LANGUAGE DataKinds
           , TypeApplications #-}

module Main where

import           FreeType

import           Control.Exception
import           Control.Monad
import           Data.Foldable
import           Data.Word
import           Foreign.C.String
import           Foreign.Marshal.Alloc
import           Foreign.Marshal.Array
import           Foreign.Ptr
import           Foreign.Storable
import           Foreign.Storable.Offset
import           System.Environment
import           System.Exit



withFreeType :: (FT_Library -> IO a) -> IO a
withFreeType f =
  alloca $ \ptr ->
    let action = do e <- ft_Init_FreeType ptr
                    if e == 0
                      then peek ptr
                      else error $ "Could not initialize FreeType (" <> show e <> ")"

    in bracket action (void . ft_Done_FreeType) f



withFace :: FT_Library -> FilePath -> (FT_Face -> IO a) -> IO a
withFace lib path f =
  withCString path $ \pathPtr ->
    alloca $ \ptr ->
      let action = do e <- ft_New_Face lib (castPtr pathPtr) 0 ptr
                      if e == 0
                        then peek ptr
                        else error $ "Could not open face (" <> show e <> ")"

      in bracket action (void . ft_Done_Face) f



withBitmap :: FT_Library -> Ptr FT_Bitmap -> (Ptr FT_Bitmap -> IO a) -> IO a
withBitmap lib src f = do
  mode <- peek $ offset @"pixel_mode" src
  case mode of
    FT_PIXEL_MODE_GRAY -> f src
    _                  ->
      alloca $ \dest ->
        bracket_ (ft_Bitmap_Init dest) (ft_Bitmap_Done lib dest) $ do
          e <- ft_Bitmap_Convert lib src dest 8
          when (e /= 0) $
            error "Bitmap conversion error"
          f dest



color :: Word8 -> Char
color a | a == 0    = ' '
        | a < 85    = '░'
        | a < 170   = '▒'
        | a < 255   = '▓'
        | otherwise = '█'

drawBitmap :: Int -> Int -> [Word8] -> IO ()
drawBitmap _ _ [] = return ()
drawBitmap w p ls = do
  let (as, rest) = splitAt p ls
  putStrLn $ color <$> as
  drawBitmap w p rest



-- | Takes a font filepath and a string as commanline arguments, printing to stdout
--   every character from the string provided at size 16 if the bitmap is scalable.
--
--   Arguments after the first two are discarded.
main :: IO ()
main = do
  paths <- getArgs
  (filepath, phrase) <- case paths of
                          (_:[]:[]) -> die "Empty character list"
                          (filepath:phrase:_) -> return (filepath, phrase)
                          _ -> die "Program accepts two arguments: first one is filepath, \
                                   \second is a set of characters you wish to print"
  withFreeType $ \lib ->
    withFace lib filepath $ \face -> do
      scalable <- FT_IS_SCALABLE face
      when scalable $ do
        e <- ft_Set_Char_Size face 0 (16 * 64) 0 0
        when (e /= 0) $
          error "Font isn't scalable in spite of being reported as such"

      for_ phrase $ \char -> do
        e <- ft_Load_Char face (fromIntegral $ fromEnum char) FT_LOAD_RENDER
        when (e /= 0) $
          error $ "Error loading character '" <> show char <> "'"
        slot <- peek $ offset @"glyph" face
        withBitmap lib (offset @"bitmap" slot) $ \bitmap -> do
          rows  <- peek $ offset @"rows"  bitmap
          width <- peek $ offset @"width" bitmap
          pitch <- peek $ offset @"pitch" bitmap
          let size = fromIntegral rows * fromIntegral pitch
          buffer <- peek $ offset @"buffer" bitmap
          raw <- peekArray size buffer
          drawBitmap (fromIntegral width) (fromIntegral pitch) raw
