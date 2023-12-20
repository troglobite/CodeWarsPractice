module RomanNumerals where

import GHC.Base (Symbol)
import GHC.Generics (V1, Generic)

-- Create a function taking a positive integer between 1 and 3999 (both included) as its parameter and returning a string containing the Roman Numeral representation of that integer.

-- Modern Roman numerals are written by expressing each digit separately starting with the left most digit and skipping any digit with a value of zero. In Roman numerals 1990 is rendered: 1000=M, 900=CM, 90=XC; resulting in MCMXC. 2008 is written as 2000=MM, 8=VIII; or MMVIII. 1666 uses each Roman symbol in descending order: MDCLXVI.

-- Example:

-- solution 1000 -- should return "M"

-- Help:

-- Symbol    Value
-- I          1
-- V          5
-- X          10
-- L          50
-- C          100
-- D          500
-- M          1,000

-- Remember that there can't be more than 3 identical symbols in a row.

data RomanNumber
  = I
  | V
  | X
  | L
  | C
  | D
  | M
  deriving (Show, Eq)

toString :: RomanNumber -> String
toString r =
  case r of
    I -> "I"
    V -> "V"
    X -> "X"
    L -> "L"
    C -> "C"
    D -> "D"
    M -> "M"

fromString :: String -> Maybe RomanNumber
fromString s =
  case s of
    "I" -> Just I
    "V" -> Just V
    "X" -> Just X
    "L" -> Just L
    "C" -> Just C
    "D" -> Just D
    "M" -> Just M
    _ -> Nothing

toRomanNumeral :: Integer -> Maybe RomanNumber
toRomanNumeral i =
  case i of
    1 -> Just I
    5 -> Just V
    10 -> Just X
    50 -> Just L
    100 -> Just C
    500 -> Just D
    1000 -> Just M
    _ -> Nothing

fromRomanNumeral :: RomanNumber -> Integer
fromRomanNumeral s =
  case s of
    I -> 1
    V -> 5
    X -> 10
    L -> 50
    C -> 100
    D -> 500
    M -> 1000

solution :: Integer -> String
solution n = do
  let x = show n -- Turn int into string, i.e. "1989"
      y = length x - 1 -- Count of all but the last digit, i.e. 3
      z = reverse [0..y] -- Creates an numbered index, i.e. [1,2,3]
      -- Merges the numbered index with the string, this breaks the string
      -- up into each placement and pairs them each with a number that 
      -- represents the amount of zeros that follow it, i.e. [('1',3),('9',2),('8',1),('9',0)]
      x' = zip x z
      -- Takes the mapping and adds the appropriate amount of zeros to each digit
      -- i.e. ["1000","900","80","9"]
      y' = map (\x -> concat $ [[fst x]] ++ [replicate (snd x) '0']) x'
  show y'

-- Need to take a string like "9" and split it into its composite parts
-- So "9" would be (1, 10). Position will most likely be important here 
-- as it means 1 less then 10 and not 1 more then 10.
-- Needs to be strictly in terms of RomanNumerals, i.e. 8 = (1, 1, 1, 5) 3 more than 5
-- And not (3, 5)
splitIntoNumerals :: String -> (Int, Int)
splitIntoNumerals x = do
  let x' = (read x :: Integer)
  case toRomanNumeral x' of
    Just n -> (0, x') -- This is a Concrete Numeral 
    Nothing -> do
      case x' of
        (< 5) -> (5 - x', 5) 
        (< 10)
        (< 50)
        (< 100)
        (< 500)
        (< 1000)


    




  -- Notes and other rambeling:
  -- Conceptually im breaking this down to concreate and composite numbers
  -- concreate numerals are those which are respresented by eaxactly one symbol, i.e. I, X V ... etc
  -- composite numerals are those which are represented by a combination of concreate numerals, i.e. VI, IX, XI ... etc
  -- All concreate numerals have accompaning composites, which are all composites within 2 digits of itself, i.e. V composites are (IIV, IV, VI, VII)
  -- Composite Numerals cannot be longer than 4 digits, 8 = VIII which is four digits already so 9 needs to be in terms of the next numeral which is X so 9 = IX or 1 less than 10 
