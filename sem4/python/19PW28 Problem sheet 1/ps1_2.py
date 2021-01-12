def findmax(list,n):
   if n==1:
      return list[0]  #base condition

   return max(list[n-1],findmax(list,n-1)) #recursive call

n=int(input("Enter the size of the list: "))
print("Enter the list values: ")
list=[]
for i in range(0,n):
    list.append(int(input("")))     #input
print("The maximum in the list {} is: {}".format(list,findmax(list,n))) #function call
