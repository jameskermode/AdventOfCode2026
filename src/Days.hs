-- | The table of implemented days. Add one line per new day.
-- Day 0 is the warm-up.
module Days (days) where

import AoC (Solution)
import Data.Map.Strict (Map)
import Data.Map.Strict qualified as Map
import Day01 qualified
import WarmUp qualified

days :: Map Int Solution
days =
  Map.fromList
    [ (0, WarmUp.solution),
      (1, Day01.solution)
    ]
