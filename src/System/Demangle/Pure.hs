module System.Demangle.Pure where

import System.IO.Unsafe

import qualified System.Demangle as D

demangle :: String -> Maybe String
demangle = unsafePerformIO . D.demangle
