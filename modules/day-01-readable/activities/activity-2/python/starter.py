x = ["ana", "ben", "cam", "dev", "eli", "fay"]
y = [88, 91, 76, 95, 84, 79]
z = [1, 1, 0, 1, 1, 0]
q = [2, 2, 0, 3, 1, 2]
late = [0, 1, 0, 0, 2, 1]

r = []
for i in range(len(y)):
    t = (y[i] * 0.85) + (z[i] * 10) + q[i] - (late[i] * 1.5)
    if t > 100:
        t = 100
    r.append(t)

print("stuff")
for i in range(len(r)):
    if r[i] >= 90:
        print(x[i], "ready")
    elif r[i] >= 80:
        print(x[i], "close")
    else:
        print(x[i], "review")

print(sum(r) / len(r))

a = 0
b = 0
c = 0

for i in range(len(r)):
    if r[i] >= 90:
        a += 1
    elif r[i] >= 80:
        b += 1
    else:
        c += 1

print([a, b, c])
