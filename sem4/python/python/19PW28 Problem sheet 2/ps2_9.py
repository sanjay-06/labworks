import numpy as np
def abs(x):
    if(np.iscomplex(x)):
        return str(pow(x.imag**2+x.real**2,0.5))
    else:
        if(x<0):
            return str(-x)
        else:
            return str(x)
n=int(input("Enter 1 for real number\nEnter 2 for complex number"))
if(n==1):
    num=int(input("Enter the number: "))
    print("The number is given by "+abs(num))
elif(n==2):
    real,img=input("Enter the real and imaginary parts like a,b: ").split(",")
    comp=complex(int(real),int(img))
    print("The complex number is as follows: "+abs(comp))
