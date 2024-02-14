module TenMinuteWalk (isValidWalk, isValidWalk', countOf) where

import Data.List (findIndices)
import Types.Server (Direction (..))


-- You live in the city of Cartesia where all roads are laid out in a perfect grid.
-- You arrived ten minutes too early to an appointment, so you decided to take the
-- opportunity to go for a short walk. 
-- The city provides its citizens with a Walk Generating App on their phones
-- everytime you press the button it sends you an array of one-letter strings
-- representing directions to walk (eg. ['n', 's', 'w', 'e']). 
-- You always walk only a single block for each letter (direction) 
-- and you know it takes you one minute to traverse one city block,
-- so create a function that will return true if the walk the app gives
-- you will take you exactly ten minutes (you don't want to be early or late!)
--  and will, of course, return you to your starting point. Return false otherwise.


isValidWalk :: [Direction] -> Bool
isValidWalk walk
   -- Probably better way to do this, but this is still non-linear so its safe on inifinit lists
  | (\x -> (x > 10) || (x < 10)) . length $ take 11 walk = False
  | otherwise = isValidWalk' walk-- format walk

isValidWalk' :: [Direction] -> Bool
isValidWalk' xs =
  let
    ns = countOf North xs
    ss = countOf South xs
    es = countOf East xs
    ws = countOf West xs
  in
    (ns == ss) && (es == ws)


countOf :: Direction -> [Direction] -> Int
countOf x xs = length $ findIndices (== x) xs
