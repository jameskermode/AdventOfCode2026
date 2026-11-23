# Advent of Code 2026

My solutions to [Advent of Code 2026](https://adventofcode.com/2026) in Haskell.

The puzzle solutions are written without AI assistance. The project scaffolding
(runner, test harness, build configuration) was set up with Claude Code.

## Usage

Requires GHC 9.10.3 and cabal. Puzzle inputs are not included; save yours as
`data/NN.txt`.

```bash
cabal run AdventOfCode2026            # every day that has an input file
cabal run AdventOfCode2026 -- 1       # day 1 on data/01.txt
cabal run AdventOfCode2026 -- 1 FILE  # day 1 on another file
cabal test                            # worked examples from the puzzle text
```

## Layout

- `src/DayNN.hs` - one module per day
- `src/AoC.hs`, `src/Days.hs`, `app/Main.hs` - runner plumbing
- `test/Main.hs` - tests

## Previous years

[2025](https://github.com/jameskermode/AdventOfCode2025) ·
[2024](https://github.com/jameskermode/AdventOfCode2024) ·
[2023](https://github.com/jameskermode/adventofcode2023)
