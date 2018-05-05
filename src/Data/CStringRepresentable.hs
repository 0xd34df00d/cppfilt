{-# LANGUAGE FlexibleInstances #-}

module Data.CStringRepresentable where

import qualified Data.ByteString.Char8 as BS
import Foreign.C

class CStringRepresentable a where
  toCString :: a -> (CString -> IO b) -> IO b
  fromCString :: CString -> IO a

instance CStringRepresentable String where
  toCString = withCString
  fromCString = peekCString

instance CStringRepresentable BS.ByteString where
  toCString = BS.useAsCString
  fromCString = BS.packCString
