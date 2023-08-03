import Test.Hspec

import qualified DeadFishSpec
import qualified TenMinuteWalkSpec
import qualified PaginationSpec

main :: IO ()
main = hspec spec

spec :: Spec
spec = do
  describe "DeadFish" DeadFishSpec.spec
  describe "TenMinuteWalk" TenMinuteWalkSpec.spec
  describe "Pagination" PaginationSpec.spec
