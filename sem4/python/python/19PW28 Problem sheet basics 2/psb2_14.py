def removeduplicate(listpara):
   return list(set(listpara))

n=int(input("Enter the size of the list: "))

listpara=[]
print("Enter the list:")
for i in range(0,n):
    listpara.append(input(""))

print("The list is {}".format(listpara))

print("The duplicated removed list is {}".format(removeduplicate(listpara)))
