import csv

x = [4.2, 4.8, 5.1, 5.0]
y = [{"v": value, "d": value - (sum(x) / len(x))} for value in x]

with open("out-python.csv", "w", newline="") as handle:
    writer = csv.DictWriter(handle, fieldnames=["v", "d"])
    writer.writeheader()
    writer.writerows(y)

print(sum(x) / len(x))
