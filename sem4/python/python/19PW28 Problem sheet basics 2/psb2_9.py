color=set()
color.add("White")
color.add("Red")
color.add("Blue")
color.add("Green")
print("The set is {}".format(color))
color.remove("Red")
print("The set after red removed is {}".format(color))
if("Yellow" in color):
    print("Yes present")
else:
    print("No,not present")
