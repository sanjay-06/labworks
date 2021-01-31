count=0
for m in range(2,100):
    for n in range(1,100):
        a=m*m-n*n
        b=2*m*n
        c=m*m+n*n
        if 0<a<100 and 0<b<100 and 0<c<100:
            print("({},{},{})".format(a,b,c))
            count+=1
print("There are {} points".format(count))
