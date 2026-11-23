module Main (main) where

import AoC (inputPath, runSolution)
import Data.Map.Strict qualified as Map
import Days (days)
import System.Directory (doesFileExist)
import System.Environment (getArgs, getProgName)
import System.Exit (die)
import Text.Read (readMaybe)

-- | Usage:
--
-- > AdventOfCode2026            -- run every day whose input file exists
-- > AdventOfCode2026 DAY        -- run one day on data/DAY.txt
-- > AdventOfCode2026 DAY FILE   -- run one day on another file (e.g. an example)
main :: IO ()
main = do
  args <- getArgs
  case args of
    [] -> mapM_ runIfInput (Map.keys days)
    [d] | Just day <- readMaybe d -> run day (inputPath day)
    [d, path] | Just day <- readMaybe d -> run day path
    _ -> do
      name <- getProgName
      die ("usage: " <> name <> " [DAY [FILE]]")

run :: Int -> FilePath -> IO ()
run day path = case Map.lookup day days of
  Nothing -> die ("day " <> show day <> " is not in the table in src/Days.hs")
  Just solution -> do
    exists <- doesFileExist path
    if exists
      then runSolution day path solution
      else die ("input file not found: " <> path)

runIfInput :: Int -> IO ()
runIfInput day = do
  exists <- doesFileExist (inputPath day)
  if exists then run day (inputPath day) else putStrLn ("Day " <> show day <> ": no input at " <> inputPath day)
