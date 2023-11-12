module Main where
-- Add stuffs in attempt to decode block-data 
-- | CBOR serialisation
import           Prelude
import           Data.ByteString (ByteString)
import qualified Data.ByteString as ByteString
import           Cardano.Binary (FromCBOR, ToCBOR)
import qualified Cardano.Binary as CBOR

loadBlockData :: IO ()
loadBlockData = do
  raw_block <- ByteString.readFile "cardano-playground/app/data/blocks-21.dat"
  print raw_block
  --
  -- still haven't found clues to take use of CBOR from here. 
  --

main :: IO ()
main = do
  Prelude.putStrLn "Hello, Haskell!"
  loadBlockData