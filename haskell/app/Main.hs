module Main (main) where

import Lib
import Servant
import qualified Server

main :: IO ()
-- main = run 8000 (serve SolutionsAPI solutionServer)
main = Server.start
