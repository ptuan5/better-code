"""Day 4 demo: two silent-break examples with plausible but wrong behavior."""

import numpy as np


def centered_moving_average_1d(values, window=3):
    values = np.asarray(values, dtype=float)

    if values.ndim != 1 or values.size == 0:
        raise ValueError("values must be a non-empty 1D array")

    if not isinstance(window, int) or window < 1:
        raise ValueError("window must be a positive integer")

    half_window = window // 2
    smoothed = np.zeros(values.shape[0], dtype=float)

    for index in range(values.shape[0]):
        start = max(0, index - half_window)
        stop = min(values.shape[0], index + half_window + 1)
        smoothed[index] = values[start:stop].mean()

    return smoothed


def moving_average_rows(values, window=3):
    """Buggy on purpose: this should smooth down rows, but smooths across columns."""
    matrix = np.asarray(values, dtype=float)

    if matrix.ndim != 2 or matrix.shape[0] == 0 or matrix.shape[1] == 0:
        raise ValueError("values must be a non-empty 2D array")

    if not isinstance(window, int) or window < 1:
        raise ValueError("window must be a positive integer")

    if window > matrix.shape[0]:
        raise ValueError("window cannot be larger than the number of rows")

    return np.apply_along_axis(
        centered_moving_average_1d,
        axis=1,
        arr=matrix,
        window=window,
    )


def build_time_series_example():
    return np.array(
        [
            [1, 10, 100],
            [2, 20, 200],
            [3, 30, 300],
            [4, 40, 400],
        ],
        dtype=float,
    )


def build_expression_groups(with_outlier=False):
    groups = {
        "control": np.array([8.2, 8.4, 8.5, 8.7, 8.9, 9.0], dtype=float),
        "treated": np.array([10.1, 10.2, 10.4, 10.5, 10.7, 10.8], dtype=float),
        "rescued": np.array([11.8, 12.0, 12.2, 12.3, 12.5, 12.6], dtype=float),
    }

    if with_outlier:
        groups["treated"] = np.append(groups["treated"], 14.8)

    return groups


def plot_boxplot_with_jitter(ax, groups, title, rng):
    labels = list(groups.keys())
    values = [groups[label] for label in labels]
    positions = np.arange(1, len(labels) + 1)

    ax.boxplot(values, tick_labels=labels)

    for position, group_values in zip(positions, values):
        jitter = rng.uniform(-0.08, 0.08, size=group_values.shape[0])
        ax.scatter(
            np.full(group_values.shape[0], position) + jitter,
            group_values,
            color="black",
            alpha=0.75,
            s=25,
        )

    ax.set_title(title)
    ax.set_ylabel("Mean expression")


def run_demo_1a():
    values = build_time_series_example()
    smoothed = moving_average_rows(values, window=3)

    print("Demo 1a: silent break - moving average")
    print("Rows are time points; columns are samples.")
    print("Input matrix:")
    print(values)
    print()
    print("Output from the current function:")
    print(np.round(smoothed, 2))
    print()
    print("Question: did we smooth over time, or across samples?")

    return values, smoothed


def run_demo_1b():
    import matplotlib.pyplot as plt

    rng = np.random.default_rng(2026)
    fig, axes = plt.subplots(1, 2, figsize=(10, 4), sharey=True)

    plot_boxplot_with_jitter(
        axes[0],
        build_expression_groups(with_outlier=False),
        "No obvious outlier",
        rng,
    )
    plot_boxplot_with_jitter(
        axes[1],
        build_expression_groups(with_outlier=True),
        "Outlier appears twice",
        rng,
    )

    fig.suptitle("Demo 1b: silent break - boxplot plus jitter")
    fig.tight_layout()

    print("Demo 1b: silent break - boxplot plus jitter")
    print("The second panel uses the same plotting code.")
    print("Question: when an outlier appears, is it drawn once or twice?")

    return fig, axes


if __name__ == "__main__":
    run_demo_1a()
    run_demo_1b()
