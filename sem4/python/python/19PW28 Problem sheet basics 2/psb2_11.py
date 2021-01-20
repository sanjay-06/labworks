import re
str=input('"Type let variable = expression to execute the expression"\n')
list=re.findall("[^=]*$",str)
list1=re.findall("^let[^=]*",str)
print("The evaluated expression value of {} is {}".format(list1[0],eval(list[0])))
str=input('"Type print expression to execute the expression"\n').split(" ")
print("The printed expression is  {}".format("".join(str[1])))
