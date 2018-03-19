module System.Demangle.Pure where

import qualified Data.ByteString.Char8 as BS
import qualified Data.ByteString.Lazy.Char8 as LBS
import System.IO.Unsafe

import qualified System.Demangle as D

demangle :: String -> Maybe String
demangle = unsafePerformIO . D.demangle

demangleBS :: BS.ByteString -> Maybe BS.ByteString
demangleBS = unsafePerformIO . D.demangleBS

demangleLBS :: LBS.ByteString -> Maybe LBS.ByteString
demangleLBS = unsafePerformIO . D.demangleLBS
