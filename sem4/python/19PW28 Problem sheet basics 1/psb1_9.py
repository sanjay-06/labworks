def center_average(num):
    return (sum(num)-max(num)- min(num))/(len(num)-2)

array=[]
n=int(input("Enter the size of the array: "))
print("Enter the array ")
for i  in range(0,int(n)):
    array.append(int(input()))
print(array)
value=(sum(array)-max(array)- min(array))/(len(array)-2)
print("The centered average of the array {} is {}".format(array,int(value)))
