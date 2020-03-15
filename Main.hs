module Main where

import           FreeType

import           Control.Monad
import           Data.Char
import           Data.Word
import           Foreign.Marshal.Array
import           Foreign.Marshal.Utils
import           Foreign.Storable
import           System.Environment
import           System.Exit



-- | Takes a font filepath and a string as commanline arguments, printing to stdout
--   every character from the string provided at size 16 if the bitmap is scalable.
--
--   Arguments after the first two are discarded.
main :: IO ()
main = do
  paths <- getArgs
  (filepath, phrase) <- case paths of
                          (filepath:phrase:_) -> return (filepath, phrase)
                          _ -> die "Program accepts two arguments: first one is filepath, \
                                   \second is a set of characters you wish to print"
  forM_ phrase $ \charcode ->
    ft_With_FreeType $ \lib ->
      ft_With_Face lib filepath 0 $ \face -> do
        isScalable <- FT_IS_SCALABLE face
        when isScalable
          $ ft_Set_Char_Size face 0 (16 * 64) 0 0
        ft_Load_Char face (fromIntegral $ ord charcode) FT_LOAD_RENDER
        slot <- peek . frGlyph =<< peek face
        withBitmap lib (gsrBitmap slot) $ \bmap -> do
          let bufferSize = fromIntegral $ (bRows bmap) * fromIntegral (bPitch bmap)
          buffr <- peekArray bufferSize $ bBuffer bmap
          drawBitmap (fromIntegral $ bPitch bmap) buffr



withBitmap :: FT_Library -> FT_Bitmap -> (FT_Bitmap -> IO a) -> IO a
withBitmap lib source f =
  if any (== fromIntegral (bPixel_mode source))
       [ FT_PIXEL_MODE_MONO, FT_PIXEL_MODE_GRAY2
       , FT_PIXEL_MODE_GRAY4, FT_PIXEL_MODE_BGRA
       ]
    then ft_Bitmap_With lib $ \targetPtr -> do
           with source $ \sourcePtr -> do
             ft_Bitmap_Convert lib sourcePtr targetPtr . fromIntegral $ bPixel_mode source
             f =<< peek targetPtr
    else f source



drawBitmap :: Int -> [Word8] -> IO ()
drawBitmap n []   = return ()
drawBitmap n list = do
  putStrLn $ color <$> take n list
  drawBitmap n $ drop n list
  where
    color :: Word8 -> Char
    color a =
      case () of
        () | a == 0    -> ' '
           | a < 85    -> '░'
           | a < 170   -> '▒'
           | a < 255   -> '▓'
           | otherwise -> '█'
