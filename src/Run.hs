-- | Run a day by number. 'runDay' and 'testDay' are meant for GHCi:
--
-- > $ cabal repl
-- > ghci> testDay 1   -- both parts on data/01-test.txt
-- > ghci> runDay 1    -- both parts on data/01.txt
-- > ghci> :r          -- reload after editing, then repeat
--
-- 'input' and 'testInput' give the raw text, for poking at a solution by hand:
--
-- > ghci> s <- testInput 1
-- > ghci> lines s
-- > ghci> Day01.part1 s
module Run
  ( runDay,
    testDay,
    input,
    testInput,
    runDayOn,
    tryRunDayOn,
  )
where

import AoC (inputPath, runSolution, testInputPath)
import Data.Map.Strict qualified as Map
import Days (days)
import System.Directory (doesFileExist)
import System.IO (hPutStrLn, stderr)

-- | Run both parts of a day on its real input, @data/NN.txt@.
runDay :: Int -> IO ()
runDay day = runDayOn day (inputPath day)

-- | Run both parts of a day on its worked example, @data/NN-test.txt@.
testDay :: Int -> IO ()
testDay day = runDayOn day (testInputPath day)

-- | The contents of a day's real input, @data/NN.txt@.
input :: Int -> IO String
input = readFile . inputPath

-- | The contents of a day's worked example, @data/NN-test.txt@.
testInput :: Int -> IO String
testInput = readFile . testInputPath

-- | Run both parts of a day on any file, reporting problems on stderr.
runDayOn :: Int -> FilePath -> IO ()
runDayOn day path = tryRunDayOn day path >>= either (hPutStrLn stderr) pure

-- | Like 'runDayOn', but returns the problem instead of printing it.
tryRunDayOn :: Int -> FilePath -> IO (Either String ())
tryRunDayOn day path = case Map.lookup day days of
  Nothing -> pure (Left ("day " <> show day <> " is not in the table in src/Days.hs"))
  Just solution -> do
    exists <- doesFileExist path
    if exists
      then Right <$> runSolution day path solution
      else pure (Left ("input file not found: " <> path))
