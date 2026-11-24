-- | Shared plumbing for running a day's solution. No puzzle logic lives here.
module AoC
  ( Solution (..),
    inputPath,
    testInputPath,
    runSolution,
  )
where

import Text.Printf (printf)

-- | A day's two parts, each a function from the raw puzzle input to the
-- answer rendered as a string (use 'show' for numeric answers).
data Solution = Solution
  { part1 :: String -> String,
    part2 :: String -> String
  }

-- | Default location of the input for a given day, e.g. @data/01.txt@.
inputPath :: Int -> FilePath
inputPath = printf "data/%02d.txt"

-- | Location of the worked example for a given day, e.g. @data/01-test.txt@.
testInputPath :: Int -> FilePath
testInputPath = printf "data/%02d-test.txt"

-- | Read the input file and print both answers.
runSolution :: Int -> FilePath -> Solution -> IO ()
runSolution day path solution = do
  input <- readFile path
  printf "Day %02d part 1: %s\n" day (part1 solution input)
  printf "Day %02d part 2: %s\n" day (part2 solution input)
