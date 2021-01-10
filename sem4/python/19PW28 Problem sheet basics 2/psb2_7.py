A=set()
B=set()
B1=set()
B2=set()
n1=int(input("Enter the size of set A"))
print("Enter the details of set A")
for i in range(0,n1):
    A.add(input(""))
n2=int(input("Enter the size of set B"))
print("Enter the details of set B")
for i in range(0,n2):
    B.add(input(""))
if(set(A).intersection(B)==A):
    print("The two sets A and B are equal")
else:
    B1={x for x in B if x not in A}
    B2={x for x in A if x not in B}
    print("The set B1 is {}".format(B1))
    print("The set B2 is {}".format(B2))
