{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}

module Main(main) where

import GHC.Generics
import Data.Aeson
import Data.Text


data Person = Person {
      name :: Text
    , age  :: Int
    } deriving (Generic, Show, Eq)

instance ToJSON Person where
    toEncoding = genericToEncoding defaultOptions

instance FromJSON Person where

main :: IO ()
main = do
  let p = Person {name = "Joe", age = 12}
  let enc = encode p
  putStrLn $ show enc
  case eitherDecode' enc of
    Left err -> putStrLn err
    Right np ->
      if np == p
        then putStrLn "Equal"
        else putStrLn "Not Equal"
