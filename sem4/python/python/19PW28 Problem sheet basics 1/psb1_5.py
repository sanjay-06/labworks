def isprime(n):
   if(n<1):
     return "not prime"
   for i in range(2,n):
      if(n%i==0):
        return "not prime"
   return "prime"

dict={}
lower=input("Enter the lowerbase index: ")
for i in range(lower,50):
    dict[i]=isprime(i)

print(dict)
