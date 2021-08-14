module Main where

import Data.Char ( isLetter )
import Data.Maybe ( fromMaybe )
import Data.List ( elemIndex )
import Aux ( charToN, nToChar )
import Rotors ( Rotor, Letter, rotorConf ) 

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

encryptText :: String -> [Rotor] -> String 
encryptText xs rs = [encryptLetter rs x | x <- xs, isLetter x]

run :: String -> String
run xs = encryptText xs (rotorConf [("IC", 'D'),("IIC", 'X'),("IIIC", 'A'),("Reflector A",'A')])

main :: IO ()
main = putStrLn "Hello, Haskell!"
