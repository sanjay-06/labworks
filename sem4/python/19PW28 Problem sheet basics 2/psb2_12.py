a = [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]

newlist=[x for x in a if x % 2 == 0]

print("The even number list is {}".format(newlist))
