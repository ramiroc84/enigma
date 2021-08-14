module Rotors where

import Aux ( stringToNs, charToN )

type Rotor = [Int]
type RotorCode = String
type Pos = Integer
type Letter = Char

getRotor :: RotorCode -> Rotor
getRotor [] = []
getRotor "IC"               = stringToNs "DMTWSILRUYQNKFEJCAZBPGXOHV"
getRotor "IIC"              = stringToNs "HQZGPJTMOBLNCIFDYAWVEUSRKX"
getRotor "IIIC"             = stringToNs "UQNTLSZFMREHDPXKIBVYGJCWOA"
getRotor "IR"               = stringToNs "JGDQOXUSCAMIFRVTPNEWKBLZYH"
getRotor "IIR"              = stringToNs "NTZPSFBOKMWRCJDIVLAEYUXHGQ"
getRotor "IIIR"             = stringToNs "JVIUBHTCDYAKEQZPOSGXNRMWFL"
getRotor "UKW"              = stringToNs "QYHOGNECVPUZTFDJAXWMKISRBL"
getRotor "ETW"              = stringToNs "QWERTZUIOASDFGHJKPYXCVBNML"
getRotor "I-K"              = stringToNs "PEZUOHXSCVFMTBGLRINQJWAYDK"
getRotor "II-K"             = stringToNs "ZOUESYDKFWPCIQXHMVBLGNJRAT"
getRotor "III-K"            = stringToNs "EHRVXGAOBQUSIMZFLYNWKTPDJC"
getRotor "UKW-K"            = stringToNs "IMETCGFRAYSQBZXWLHKDVUPOJN"
getRotor "ETW-K"            = stringToNs "QWERTZUIOASDFGHJKPYXCVBNML"
getRotor "I"                = stringToNs "EKMFLGDQVZNTOWYHXUSPAIBRCJ"
getRotor "II"               = stringToNs "AJDKSIRUXBLHWTMCQGZNPYFVOE"
getRotor "III"              = stringToNs "BDFHJLCPRTXVZNYEIWGAKMUSQO"
getRotor "IV"               = stringToNs "ESOVPZJAYQUIRHXLNFTGKDCMWB"
getRotor "V"                = stringToNs "VZBRGITYUPSDNHLXAWMJQOFECK"
getRotor "VI"               = stringToNs "JPGVOUMFYQBENHZRDKASXLICTW"
getRotor "VII"              = stringToNs "NZJHGRCXMYSWBOUFAIVLPEKQDT"
getRotor "VIII"             = stringToNs "FKQHTLXOCBJSPDZRAMEWNIUYGV"
getRotor "Beta"             = stringToNs "LEYJVCNIXWPBQMDRTAKZGFUHOS"
getRotor "Gamma"            = stringToNs "FSOKANUERHMBTIYCWLQPZXVGJD"
getRotor "Reflector A"      = stringToNs "EJMZALYXVBWFCRQUONTSPIKHGD"
getRotor "Reflector B"      = stringToNs "YRUHQSLDPXNGOKMIEBFZCWVJAT"
getRotor "Reflector C"      = stringToNs "FVPJIAOYEDRZXWGCTKUQSBNMHL"
getRotor "Reflector B Thin" = stringToNs "ENKQAUYWJICOPBLMDXZVFTHRGS"
getRotor "Reflector C Thin" = stringToNs "RDOBJNTKVEHMLFCWZAXGYIPSUQ"
getRotor "ETWei"            = stringToNs "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
getRotor _ = []

shiftRotor :: Pos -> Rotor -> Rotor
shiftRotor _ [] = []
shiftRotor 0 rs = rs
shiftRotor n rs =  drop (length rs - fromInteger n `mod` length rs) rs ++ take (length rs - fromInteger n `mod` length rs) rs

rotorConf :: [(RotorCode, Letter)] -> [Rotor]
rotorConf [] = []
rotorConf xs = [shiftRotor (toInteger $ charToN l - 1) (getRotor code) | (code, l) <- xs]