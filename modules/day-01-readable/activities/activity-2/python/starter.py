g = ["LIF", "SOCS3", "STAT3", "MALAT1", "IL6", "NEAT1"]
m = [10.4, 9.7, 8.9, 7.5, 6.8, 8.1]
v = [2.1, 1.8, 1.6, 0.7, 2.4, 1.1]
z = [0, 0, 1, 2, 3, 1]
b = [2, 2, 1, 0, 3, 1]

r = []
for i in range(len(m)):
    t = (m[i] * 1.2) + (v[i] * 3) + b[i] - (z[i] * 1.5)
    if t > 20:
        t = 20
    r.append(t)

print("things")
for i in range(len(r)):
    if r[i] >= 15:
        print(g[i], "plot")
    elif r[i] >= 11:
        print(g[i], "check")
    else:
        print(g[i], "ignore")

print(sum(r) / len(r))

a = 0
b2 = 0
c = 0

for i in range(len(r)):
    if r[i] >= 15:
        a += 1
    elif r[i] >= 11:
        b2 += 1
    else:
        c += 1

print([a, b2, c])
