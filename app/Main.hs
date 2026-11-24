module Main (main) where

import AoC (inputPath, testInputPath)
import Data.List (partition)
import Data.Map.Strict qualified as Map
import Days (days)
import Run (tryRunDayOn)
import System.Directory (doesFileExist)
import System.Environment (getArgs, getProgName)
import System.Exit (die)
import Text.Read (readMaybe)

-- | Usage:
--
-- > AdventOfCode2026            -- run every day whose input file exists
-- > AdventOfCode2026 DAY        -- run one day on data/DAY.txt
-- > AdventOfCode2026 DAY FILE   -- run one day on another file
--
-- Add @-t@ or @--test@ to the first two forms to use the worked examples in
-- @data/DAY-test.txt@ instead.
main :: IO ()
main = do
  (flags, positional) <- partition (`elem` ["-t", "--test"]) <$> getArgs
  let pathFor = if null flags then inputPath else testInputPath
  case positional of
    [] -> mapM_ (runIfInput pathFor) (Map.keys days)
    [d] | Just day <- readMaybe d -> run day (pathFor day)
    [d, path] | Just day <- readMaybe d, null flags -> run day path
    _ -> do
      name <- getProgName
      die ("usage: " <> name <> " [-t|--test] [DAY [FILE]]")

run :: Int -> FilePath -> IO ()
run day path = tryRunDayOn day path >>= either die pure

runIfInput :: (Int -> FilePath) -> Int -> IO ()
runIfInput pathFor day = do
  exists <- doesFileExist (pathFor day)
  if exists
    then run day (pathFor day)
    else putStrLn ("Day " <> show day <> ": no input at " <> pathFor day)
