-- | The table of implemented days. Add one line per new day.
module Days (days) where

import AoC (Solution)
import Data.Map.Strict (Map)
import Data.Map.Strict qualified as Map
import Day01 qualified

days :: Map Int Solution
days =
  Map.fromList
    [ (1, Day01.solution)
    ]
