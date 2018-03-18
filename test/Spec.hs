import Test.Hspec

import System.Demangle

demangledIs :: String -> String -> IO ()
demangledIs mangled ref = do
  res <- demangle mangled
  res `shouldBe` Just ref

main :: IO ()
main = hspec $ do
  describe "demangle" $ do
    it "demangles some operators" $ do
      "_ZrsR11QDataStreamR5QUuid" `demangledIs` "operator>>(QDataStream&, QUuid&)"
