module Main where

import qualified MyLib (someFunc)
import Crypto.Hash.MerkleTree
import Data.ByteString as BS
import Data.Char (ord)
import qualified Data.ByteString.Char8 as B
import Data.ByteString.Base16 (encode)
import Debug.Trace



stringToBytes :: String -> B.ByteString
stringToBytes = B.pack

-- byteStringToHex :: B.ByteString -> String
-- byteStringToHex bs = unpack (encode bs)

mkTreeRoot :: [B.ByteString] -> ByteString
mkTreeRoot x = do 
  let mTree = mkMerkleTree x
  let hashRoot = mtHash mTree
  traceShow ("hashRoot: " ++ show hashRoot) hashRoot

printMerkleTree :: IO ()
printMerkleTree = do
  let datax = [ stringToBytes "aaa" ,  stringToBytes "bbb" , stringToBytes "ccc" , stringToBytes "ddd"]
  B.putStrLn (mkTreeRoot datax)

loadBlockData :: IO ()
loadBlockData = do
  bs <- BS.readFile "haskell-go-ffi-test/app/data/blocks-21.dat"
  let byteArray = B.unpack bs
  B.putStrLn bs
  Prelude.putStrLn byteArray

main :: IO ()
main = do
  Prelude.putStrLn "Hello, Haskell!"
  MyLib.someFunc
  printMerkleTree
  -- loadBlockData

-- import Data.ByteString.Char8 as B
-- import Data.ByteString.Base16 (encode)

-- -- Function to convert ByteString to a hexadecimal string
-- byteStringToHex :: B.ByteString -> String
-- byteStringToHex bs = unpack (encode bs)

-- main :: IO ()
-- main = do
--   let inputString = "aaa"  -- Replace this with your ByteString
--   let byteString = B.pack inputString
--   let hexString = byteStringToHex byteString
--   Prelude.putStrLn hexString