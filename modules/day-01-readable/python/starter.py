scores = [88, 91, 76, 95, 84]
attendance = [1, 1, 0, 1, 1]
bonus = [2, 2, 0, 3, 1]
n = ["ana", "ben", "cam", "dev", "eli"]

f = []
for i in range(len(scores)):
    f.append((scores[i] * 0.8) + (attendance[i] * 10) + bonus[i])

print("results")
for i in range(len(f)):
    if f[i] >= 90:
        print(n[i], "did great")
    elif f[i] >= 80:
        print(n[i], "ok")
    else:
        print(n[i], "needs help")

print(sum(f) / len(f))
