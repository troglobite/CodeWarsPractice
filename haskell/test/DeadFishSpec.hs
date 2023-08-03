module DeadFishSpec (spec) where

import DeadFish (parse)
import Test.Hspec

spec = do
  describe "Happy Path" $ do
    it "Follow basic happy path instructions" $ do
      parse "iiisdoso" `shouldBe` [ 8, 64 ]