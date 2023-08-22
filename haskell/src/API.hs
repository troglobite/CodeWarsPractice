module API where

import Data.Text (Text)
import Servant

type SolutionsAPI =
  "solutions" :> "deadfish" :> Get '[JSON] DeadFishRequest



data DeadFishRequest = Text
