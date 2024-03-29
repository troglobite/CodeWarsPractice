module Reverse where

import Data.List

--  the function that accepts a string parameter, and reverses each word in the string.
-- All spaces in the string should be retained.

reverseWords :: String -> String
reverseWords x = do
  unwords $ map reverse $ words x
