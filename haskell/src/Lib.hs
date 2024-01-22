module Lib
    ( someFunc
    , SolutionsAPI (..)
    , solutionServer
    , statusHandler
    ) where

import DeadFish
import Pagination
import TenMinuteWalk
import Server

someFunc :: IO ()
someFunc = putStrLn "someFunc"
