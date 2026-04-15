# Edge Cases Demo

## Demo Goal

Show how code can run, look plausible, and still be wrong because of a hidden
assumption.

## Files

- `silent-break.R`
- `silent-break.py`

## Scenario

Use this framing:

Both examples run without crashing. That is exactly why they are useful for Day
4. The reliability question is not "does the code execute?" The reliability
question is "does it match the scientific intent once the data shape or data
distribution becomes slightly uncomfortable?"

## Demo 1a: Silent Break - Moving Average

Frame it like this:

You have a small time-series matrix where each row is a time point and each
column is a sample. The code says it is computing a moving average across rows,
but the implementation accidentally smooths across columns instead.

That bug is easy to miss because the output still has the right shape and still
contains plausible numbers.

### What To Inspect

| Check | Why it matters |
|---|---|
| which dimension represents time | the whole function depends on this assumption |
| whether neighboring rows or neighboring columns are averaged | this is the actual silent bug |
| whether a toy matrix makes the mistake obvious | simple numbers reveal orientation errors faster than realistic ones |
| what should happen when `window` is invalid | reliability also includes failing clearly |

## Demo 1b: Silent Break - Boxplot Plus Jitter

Frame it like this:

You overlay a boxplot with jittered points to show both a summary and the raw
observations. With a tidy dataset, the plot looks fine. Once an outlier appears,
the same point can be drawn twice: once by the boxplot outlier layer and once by
the jitter layer.

That is a reliability problem in visualization rather than a crash.

### What To Inspect

| Check | Why it matters |
|---|---|
| whether the no-outlier version looks acceptable | the code feels trustworthy at first glance |
| what changes when one group contains an outlier | this is when the plotting bug becomes visible |
| whether the extreme point is shown once or twice | duplicated marks can exaggerate the story |
| whether the plot is truthful or just attractive | DS review includes the visual contract too |

## Common Edge-Case Patterns To Name Out Loud

- orientation or axis assumptions:
  are we averaging over the intended dimension?
- plotting duplication:
  is one observation being drawn by multiple layers?
- distribution shifts:
  does the code still behave when an outlier appears?
- empty or singleton inputs:
  what happens with zero rows or one row?
- invalid settings:
  should a bad window size fail clearly?

## Demo Moves

1. Open Demo 1a and read the function name before reading the implementation.
2. Ask which dimension is supposed to represent time.
3. Run the toy matrix and inspect the intermediate output, not just the final
   claim that it is "smoothed."
4. Switch to Demo 1b and show the version without outliers first.
5. Add the outlier and ask whether the plot is showing new information or
   accidentally double-plotting the same point.
6. Close by asking what review comment or small test would have caught each issue
   sooner.

## Suggested Talking Points

- Silent wrong behavior is often more dangerous than a loud crash.
- The output shape looking right does not mean the logic is right.
- Visualization code can be unreliable even when the figure looks polished.
- A tiny toy example is often the fastest way to expose an axis mistake.
- Reliability work includes checking scientific intent, not only syntax.
