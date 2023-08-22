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

toRomanNumeral :: Integer -> RomanNumber
toRomanNumeral i =
  case i of
    1 -> I
    5 -> V
    10 -> X
    50 -> L
    100 -> C
    500 -> D
    1000 -> M

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
solution n = undefined
