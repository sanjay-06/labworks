import numpy as np
def issymmetric(matrix,row):
    for i in range(row):
        for j in range(row):
            if(matrix[i][j]!=matrix[j][i]):
               return False
    return True

def sumcolumn(m, column):
    total = 0
    for row in range(len(m)):
        total += m[row][column]
    return total

def orthogonal(matrix1,row):
    nump=np.matrix(matrix1)
    transpose=nump.transpose()
    mul=np.matmul(transpose,nump)
    iden=np.identity(row)
    return np.array_equal(iden,mul)

def stochastic(matrix1,row):
    i=0
    while(i<row):
        sum=0
        for j in range(row):
            sum+=matrix[j][i]
        if(sum != 1):
            return False
        i+=1
    return True

row=int(input("Enter the number of rows: "))
column=int(input("Enter the number of columns: "))
matrix=[]
print("Enter the value of matrix row-wise: ")
for i in range(row):
    a=[]
    for j in range(column):
        a.append(float(input("")))
    matrix.append(a)
print("The matrix: ")
for i in range(row):
    for j in range(column):
        print(matrix[i][j],end=" ")
    print("")
if(row != column):
    print("is Not a Symmetric Matrix")
    print("is Not orthogonal")
    print("is Not stochastic")
    exit(0)
if(issymmetric(matrix,row)):
    print("is a Symmetric Matrix")
else:
    print("is Not a Symmetric Matrix")

if(orthogonal(matrix,row)):
    print("is orthogonal")
else:
    print("is Not orthogonal")

if(stochastic(matrix,row)):
    print("is stochastic")
else:
    print("is Not stochastic")
