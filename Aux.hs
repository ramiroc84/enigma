module Aux where

import Data.Char ( ord, chr, toUpper, isLetter)

charToN :: Char -> Int
charToN x = - 64 + ord (toUpper x)

nToChar :: Int -> Char
nToChar n = chr (n + 64)

stringToNs :: String -> [Int]
stringToNs = map charToN

nsToString :: [Int] -> String
nsToString = map nToChar

filterText :: String -> String
filterText xs = [x | x <- xs, isLetter x]