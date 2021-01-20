def splitstr(string):
    return [letter for letter in string]

string=input("Enter the string: ")
list=[]
list=splitstr(string)
print("Enter the index position and letter(leave space between them and dont press enter)")
index,letter=input().split()
list[int(index)]=letter
print("The replaced word is given by {}".format("".join(list)))
