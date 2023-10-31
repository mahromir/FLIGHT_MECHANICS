import pandas as pd

# out = open("input/outcx2412.txt", "w")
out = open("input/out_cx.txt", "w")
# f = open("input/cx.txt", "r")
f = open("input/cx.txt", "r")

out.write("cz\tcx\n")
for row in f:
    row = row.replace(",", ".")

    row = row.replace(" ", ",")

    out.write(row)


f.close()
out.close()
