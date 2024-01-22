import Test.Hspec

import qualified DeadFishSpec
import qualified TenMinuteWalkSpec
import qualified PaginationSpec
import qualified RomanNumeralsSpec
import qualified ReverseSpec
import qualified ClockyMcClockFaceSpec

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "DeadFish" DeadFishSpec.spec
  describe "TenMinuteWalk" TenMinuteWalkSpec.spec
  describe "Pagination" PaginationSpec.spec
  -- describe "RomanNumerals" RomanNumeralsSpec.spec -- TODO: finish RomanNumeral module
  describe "Reverse" ReverseSpec.spec -- TODO: implement reverse module
  -- describe "ClockyMcClockFace" ClockyMcClockFaceSpec.spec
