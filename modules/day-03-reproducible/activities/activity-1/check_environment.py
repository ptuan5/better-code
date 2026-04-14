from pathlib import Path
import sys

import matplotlib
import pandas as pd


def main():
    output_path = Path("results/environment_check.txt")
    output_path.parent.mkdir(parents=True, exist_ok=True)

    output = [
        f"python={sys.version.split()[0]}",
        f"pandas={pd.__version__}",
        f"matplotlib={matplotlib.__version__}",
    ]
    output_path.write_text("\n".join(output) + "\n", encoding="utf-8")

    print("Environment check passed.")
    print("This Python setup covers Activity 2 starter.py.")
    print(f"Python version: {sys.version.split()[0]}")
    print(f"pandas version: {pd.__version__}")
    print(f"matplotlib version: {matplotlib.__version__}")
    print(f"Wrote: {output_path}")


if __name__ == "__main__":
    main()
