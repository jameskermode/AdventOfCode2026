module Main (main) where

import AoC (inputPath)
import Data.Map.Strict qualified as Map
import Days (days)
import Test.Tasty (TestTree, defaultMain, testGroup)
import Test.Tasty.HUnit (testCase, (@?=))

main :: IO ()
main = defaultMain tests

-- Add a group per day with the worked examples from the puzzle text, e.g.
--
-- > testGroup "Day 1"
-- >   [ testCase "part 1 example" $ Day01.part1 example01 @?= "42" ]
tests :: TestTree
tests =
  testGroup
    "AdventOfCode2026"
    [ testGroup
        "plumbing"
        [ testCase "input path is zero padded" $ inputPath 1 @?= "data/01.txt",
          testCase "day 1 is registered" $ Map.member 1 days @?= True
        ]
    ]
