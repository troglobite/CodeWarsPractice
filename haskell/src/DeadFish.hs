module DeadFish (parse) where

-- Deadfish has 4 commands, each 1 character long:

--     i increments the value (initially 0)
--     d decrements the value
--     s squares the value
--     o outputs the value into the return array

-- Invalid characters should be ignored.

parse :: String -> [Int]
parse = instructions 0 []


instructions :: Int -> [Int] -> [Char] -> [Int]
instructions _ returnArray [] = returnArray
instructions previousValue returnArray (inst : insts) =
  case inst of
    'i' -> instructions (previousValue + 1) returnArray insts
    'd' -> instructions (previousValue - 1) returnArray insts
    's' -> instructions (previousValue ^ (2 :: Integer)) returnArray insts
    'o' -> instructions previousValue (returnArray ++ [previousValue]) insts
    _   -> instructions previousValue returnArray insts