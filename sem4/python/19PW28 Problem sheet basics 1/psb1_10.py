def has22(array):
    for i in range(len(array)):
        if((array[i] == 2 ) and (array[i+1] ==2)):
          return True
    else:
        return False

array=[]
n=int(input("Enter the size of the array: "))
print("Enter the array ")
for i  in range(0,int(n)):
    array.append(int(input()))

if(has22(array)):
   print("Yes adjacent 2s")
else:
   print("No adjacent 2s")
