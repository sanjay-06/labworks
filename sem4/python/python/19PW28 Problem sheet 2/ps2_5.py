n=int(input("Enter the number of rows: "))
list=[]
for i in range(n):
    list.append(int(input("")))
print("The list is given by ")
print(list)
norm=[float(i)/max(list) for i in list]
print("The normalised list is given by ")
print(norm)
