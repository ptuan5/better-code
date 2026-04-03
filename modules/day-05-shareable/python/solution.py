"""Tiny analysis example with a clear entry point and output description."""


def calculate_mean_measurement(values):
    return sum(values) / len(values)


def run_analysis():
    measurements = [4.2, 4.8, 5.1, 5.0]
    mean_measurement = calculate_mean_measurement(measurements)
    print("Mean measurement:", mean_measurement)


if __name__ == "__main__":
    run_analysis()
