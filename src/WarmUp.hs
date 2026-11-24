-- | Warm-up: Advent of Code 2025 day 1, registered as day 0 in "Days".
module WarmUp where

import AoC (Solution (Solution))

solution :: Solution
solution = Solution part1 part2

moves :: String -> [Int]
moves s = [ sign dir * read dist | dir : dist <- lines s]
    where
        sign 'L' = -1
        sign _ = 1

-- | Break each move into steps of one click.
clicks :: [Int] -> [Int]
clicks = concatMap (\m -> replicate (abs m) (signum m))

countZeros :: [Int] -> Int
countZeros = length . filter (== 0) . map (`mod` 100) . scanl (+) 50

part1 :: String -> String
part1 = show . countZeros . moves

part2 :: String -> String
part2 = show . countZeros . clicks . moves
