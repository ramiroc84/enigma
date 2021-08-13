module Main where

import Data.Char ( isLetter )
import Data.Maybe ( fromMaybe )
import Data.List ( elemIndex )
import Aux ( charToN, nToChar )
import Rotors ( Rotor, Letter, machineParts ) 



encryptLetterR :: [Rotor] -> Letter -> Letter
encryptLetterR rs x = foldr encrypt x rs where
  encrypt rs x = nToChar $ rs !! (charToN x - 1)

encryptLetterL :: [Rotor] -> Letter -> Letter
encryptLetterL rs x = foldr encrypt x rs where
  encrypt rs x = nToChar $ fromMaybe 0 (charToN x `elemIndex` rs) + 1

encryptLetter :: [Rotor] -> Letter -> Letter
encryptLetter rs x = encryptLetterL (drop 1 (reverse rs)) (encryptLetterR rs x)

encryptText :: String -> [Rotor] -> String 
encryptText xs rs = [encryptLetter rs x | x <- xs, isLetter x]



run :: String -> String
run xs = encryptText xs (machineParts ["IC","IIC","IIIC","Reflector A"])

main :: IO ()
main = putStrLn "Hello, Haskell!"
