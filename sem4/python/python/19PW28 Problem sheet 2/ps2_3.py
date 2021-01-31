import re
import numpy as np
import math

def euclidean_distance(u,v):
    return math.dist(u,v)


vect1=input("Enter the first vector values: eg:(3i+4j+2k) note: type 1i+2j+3k not as i+2j+3k\n")
vect2=input("Enter the second vector values: eg:(7i-2j-2k) note: type 1i+2j+3k not as i+2j+3k\n")
listvect1=re.findall(r"[0-9]+",vect1)
listvect2=re.findall(r"[0-9]+",vect2)
list1=[]
list2=[]
for num in listvect1:
    list1.append(int(num))
for num in listvect2:
    list2.append(int(num))
val=np.linalg.norm(list1)*np.linalg.norm(list1)
dot=0
for i in range(len(list1)-1):
    dot+=list1[i]*list2[i]
val1=dot/val
print("The euclidean distance is: "+str(euclidean_distance(list1,list2)))
print("The cosine value is given by: ")
print("cos θ = "+str(val1))
print("θ = "+str(math.cos(val1)))
if (euclidean_distance(list1,list2) > val1):
    print("The euclidean distance is greater")
else:
    print("The cosine value is greater")
