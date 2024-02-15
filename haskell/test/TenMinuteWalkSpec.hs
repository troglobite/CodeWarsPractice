module TenMinuteWalkSpec (spec) where

import TenMinuteWalk (isValidWalk)
import Control.Monad (when)
import Test.Hspec
import Test.QuickCheck
import Types.Server (Direction (..))

spec :: Spec
spec = do
  describe "isValidWalk" $ do
    it "should work for some examples" $ do
      isValidWalk [North,South,North,South,North,South,North,South,North,South] ??? "should return True  on valid walk"
      isValidWalk [North,South,North,South,North,South,North,South,North,North] ??! "should return False on invalid walk"
      isValidWalk [North,South]    ??! "should return False on too short walk"
      isValidWalk (repeat North) ??! "should return False on infinite walk"
      isValidWalk [North,South,East,West,North,South,East,West,North,South] ??? "should return True on valid walk"
    it "should reject short walks" $ do
      property $ 
        forAll (choose (1,9)) $ \n ->
        forAll (listOf1 $ elements [North, South, East, West]) $ \xs ->
          let walk = take n xs 
          in isValidWalk walk ??! "the walk \""++(show walk)++"\" is too short and should be rejected"
    it "should work for semi-random valid walks" $ do
      property $ 
        forAll (choose (0,3)) $ \n ->
          let k = 5 - n
              w = replicate n South ++ replicate n North ++ replicate k West ++ replicate k East
          in isValidWalk w ??? "the walk \""++(show w)++"\" is valid short and should be accepted"
    -- it "should reject infinite lists" $ do
    --   property $ forAll infiniteList $ \walk ->
    --     isValidWalk walk ??! "this infinite walk should have been rejected"
      
-- | Additional helpers to provide better error messages
--   on boolean functions.
(???), (??!) :: Bool -> String -> Expectation
(??!) p = when p       . expectationFailure
(???) p = when (not p) . expectationFailure

infix 0 ??!, ???