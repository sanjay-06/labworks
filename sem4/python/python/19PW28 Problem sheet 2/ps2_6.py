import numpy as np
row=int(input("Enter the number of rows: "))
column=int(input("Enter the number of columns: "))
matrix=[]
print("Enter the value of matrix row-wise: ")
for i in range(row):
    a=[]
    for j in range(column):
        a.append(int(input("")))
    matrix.append(a)
print("The matrix is given by: ")
for i in range(row):
    for j in range(column):
        print(matrix[i][j],end=" ")
    print("")

inverse=np.linalg.pinv(matrix)
print("The inverse of matrix is given by: ")
for i in range(row):
    for j in range(column):
        print(inverse[i][j],end=" ")
    print("")
