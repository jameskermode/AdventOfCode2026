# CLAUDE.md

Advent of Code 2026 in Haskell. **The puzzle solving in this repository is AI free.**

## The rule

Never write, complete, optimise, debug or hint at a puzzle solution, and do not
discuss a puzzle's algorithm or approach, even if the request looks incidental
(for example "why is my Day 7 slow"). This covers every `src/DayNN.hs` and the
example tests for it. If a request would cross this line, say so and stop.

Help that is fine, when asked for:

- build, cabal, GHC, HLS, hlint, ormolu and git problems;
- general Haskell language and library questions, answered without reference to
  the puzzle (explain what a type error means; do not rewrite the solution);
- the shared plumbing in `src/AoC.hs`, `src/Days.hs`, `src/Run.hs`, `app/Main.hs` and the test
  harness.

Do not read the files in `data/` or the day modules unless asked to.

## Layout

- `src/AoC.hs` - `Solution` type and runner helpers (no puzzle logic)
- `src/Days.hs` - table mapping day number to solution (day 0 is the warm-up)
- `src/Run.hs` - `runDay` / `testDay` / `input` / `testInput` helpers, used by
  the executable and GHCi
- `src/DayNN.hs` - one module per day, exporting `solution`, `part1`, `part2`
- `app/Main.hs` - command-line runner
- `test/Main.hs` - tasty + HUnit tests for the worked examples
- `data/NN.txt`, `data/NN-test.txt` - puzzle inputs and worked examples,
  git-ignored (never commit them)

## Commands

```bash
cabal build
cabal run AdventOfCode2026            # every day that has an input file
cabal run AdventOfCode2026 -- 1       # day 1 on data/01.txt
cabal run AdventOfCode2026 -- 1 -t    # day 1 on data/01-test.txt
cabal run AdventOfCode2026 -- 1 FILE  # day 1 on another file
cabal repl                            # then: testDay 1, runDay 1, :r
cabal test
hlint src app test
ormolu --mode inplace $(git ls-files '*.hs')
```

## Adding a day

1. Copy `src/Day01.hs` to `src/DayNN.hs` and rename the module.
2. Add `DayNN` to `exposed-modules` in `AdventOfCode2026.cabal`.
3. Add `(NN, DayNN.solution)` to the table in `src/Days.hs`.
4. Save the input as `data/NN.txt` and the worked example as `data/NN-test.txt`.

Toolchain: GHC 9.10.3 (pinned in `cabal.project`), cabal 3.16, language `GHC2021`.
