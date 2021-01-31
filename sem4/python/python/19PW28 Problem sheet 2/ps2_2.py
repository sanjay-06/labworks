import re
import math

def euclidean_distance(u,v):
    listu=map(int,re.findall(r"[0-9]+",u))
    listv=map(int,re.findall(r"[0-9]+",v))
    dist=math.dist(listu,listv)
    return str(dist)

u=input("Enter the first coordinates eg: (x1,x2,...,xn)\n")
v=input("Enter the first coordinates eg: (y1,y2,...,yn)\n")

print("The distance between u and v is "+euclidean_distance(u,v))
