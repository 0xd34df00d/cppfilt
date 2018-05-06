{-# LANGUAGE FlexibleInstances #-}

{-|
 Module      : Data.CStringRepresentable
 Description : Type class for string-like objects nicely mapping to 'CString's
 Stability   : experimental

 This module provides the type class (and a few implementations) for values that
 can be efficiently converted to/from 'CString'. Instances for 'String' and
 strict 'BS.ByteString' are provided, and the use of 'BS.ByteString' is
 recommended if performance is a concern.
 -}

module Data.CStringRepresentable where

import qualified Data.ByteString.Char8 as BS
import Foreign.C

-- | Represents values that can be efficiently converted to and from 'CString's.
class CStringRepresentable a where
  -- | Perform a function on the 'CString' representation of the value.
  toCString :: a -> (CString -> IO b) -> IO b
  -- | Convert 'CString' to a value of the type. The ownership is not transferred.
  fromCString :: CString -> IO a

-- | 'String's can be represented as 'CString's (albeit conversions are inefficient).
instance CStringRepresentable String where
  toCString = withCString
  fromCString = peekCString

-- | 'BS.ByteString's can be represented as 'CString's.
instance CStringRepresentable BS.ByteString where
  toCString = BS.useAsCString
  fromCString = BS.packCString
