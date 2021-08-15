module Main where

import Data.Char ( isLetter )
import Data.Maybe ( fromMaybe )
import Data.List ( elemIndex )
import Aux ( charToN, nToChar, filterText )
import Rotors ( Rotor, Letter, Pos, rotorConf, shiftRotors, incremRotor )

encryptLetterR :: [Rotor] -> Letter -> Letter
encryptLetterR [] x = x
encryptLetterR (r:rs) x = encryptLetterR rs (encrypt r x) where
  encrypt rot l = nToChar $ rot !! (charToN l - 1)

encryptLetterL :: [Rotor] -> Letter -> Letter
encryptLetterL [] x = x
encryptLetterL (r:rs) x = encryptLetterL rs (encrypt r x) where
  encrypt rot l = nToChar $ fromMaybe 0 (charToN l `elemIndex` rot) + 1

encryptLetter :: [Rotor] -> Letter -> Letter
encryptLetter rs x = encryptLetterL (drop 1 (reverse rs)) (encryptLetterR rs x)

encryptText' :: String -> [Rotor] -> String
encryptText' xs rs = [encryptLetter rs x | x <- xs, isLetter x]

{-
encryptText' :: String -> [Rotor] -> String 
encryptText' xs rs = [encryptLetter rots x | x <- xs, isLetter x] where
  rots = shiftRotors rs ps
  pos = -1 : take 
-}

encryptText :: String -> [Rotor] -> [Pos] -> String
encryptText xs [] _ = xs
encryptText [] _ _ = []
encryptText (x:xs) rs ps = encryptLetter rots x : encryptText xs rs pos where
  rots = shiftRotors rs pos
  pos =  take (length ps - 1) (incremRotor 1 ps) ++ [0]


run :: String -> String
run xs = encryptText (filterText xs) (rotorConf [("III", 'A'),("II", 'A'),("I", 'A'),("Reflector B",'A')]) [-1,0,0,0]
-- run xs = encryptText xs (rotorConf [("IC", 'D'),("IIC", 'X'),("IIIC", 'A'),("Reflector A",'A')])
-- https://www.codesandciphers.org.uk/enigma/example1.htm

main :: IO ()
main = putStrLn "Hello, Haskell!"
