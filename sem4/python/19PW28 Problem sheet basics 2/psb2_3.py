list1=[1,3,6,78,35,55]
list2=[12,24,35,24,88,120,155]

newlist=[value1 for value1 in list1 if value1 in list2]

print("Intersection of lists is {}".format(newlist))
