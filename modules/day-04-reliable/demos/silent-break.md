# Edge Cases Demo

## Demo Goal

Show how code can run, look plausible, and still be wrong because of a hidden
assumption.

## Files

- `silent-break.Rmd`
- `silent-break.ipynb`

## Scenario

We will look at two code examples that run without crashing. That is exactly why they are useful to showcase reliability. The reliability question is not "does the code execute?" The reliability question is "does it match the scientific intent?"

## Demo 1a: Silent Break - Boxplot 

You have a boxplot overlayed with individual data points. 

Ask:
- What potential problems may occur?
- How do you check that?

That is a reliability problem in visualization rather than a crash.

## Demo 1b: Silent Break - Moving Average

You have noisy time-series data for many individuals. Each row is a sample, and
each column is the minute from which the measurement was recorded. 

The data is quite noisy, I smooth the data using a moving average. Then I plot the
trend over time aggregated for each group.

Ask:
- What potential problems may occur?
- How do I check that?

## Demo Moves

1. Open Demo 1a and ask participants to identify what's wrong.
2. Show patterns with 'duplicated' outliers, then correct the code.
3. Switch to Demo 1b and explain the smoothing process.
4. Test different parameters to see unexpected trend.
5. Explain smoothing along the wrong axis. 
6. Encourage thinking of extra pitfalls: time gap not continuous, missing data.

## Suggested Talking Points

- Silent wrong behavior is often more dangerous than a loud crash.
- The output shape looking right does not mean the logic is right.
- Visualization code & summary statistics can be unreliable even when the figure looks polished.
- Check intermediate results.