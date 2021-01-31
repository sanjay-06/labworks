def countval(n):
    count=0
    while n!=0:
        n//=10
        count+=1
    return str(count)
n=int(input("Enter the number: "))
print("The number of digits is: "+countval(n))
