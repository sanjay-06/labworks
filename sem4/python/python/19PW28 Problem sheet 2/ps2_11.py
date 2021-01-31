n=int(input("Enter the first number to create list: "))
a=[i*n for i in range(1,9)]
print("The list a before slicing is "+str(a))
sliced=slice(3,5)
c=list(a[sliced])
b=a
print("The list b after taking copy "+str(b))
print("The list c after slicing is "+str(c))
del a[3:5]
print("The list a after slicing is "+str(a))
c.reverse()
for j in c:
    a.insert(3,j)
print("The list a after restoring: "+str(a))
