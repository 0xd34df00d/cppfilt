import Test.Hspec

import qualified System.Demangle as D
import qualified System.Demangle.Pure as DP

ioDemangledIs :: String -> String -> IO ()
ioDemangledIs mangled ref = do
  res <- D.demangle mangled
  res `shouldBe` Just ref

pureDemangledIs :: String -> String -> IO ()
pureDemangledIs mangled ref = DP.demangle mangled `shouldBe` Just ref

main :: IO ()
main = hspec $ do
  describe "IO demangle" $ do
    it "demangles some operators" $ do
      "_ZrsR11QDataStreamR5QUuid" `ioDemangledIs` "operator>>(QDataStream&, QUuid&)"
  describe "pure demangle" $ do
    it "demangles some operators" $ do
      "_ZrsR11QDataStreamR5QUuid" `pureDemangledIs` "operator>>(QDataStream&, QUuid&)"
