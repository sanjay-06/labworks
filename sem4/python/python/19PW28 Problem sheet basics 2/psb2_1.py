sentence=input("Enter the sentence: ").split(" ")
checksentence=[]
for i in sentence:
    if i not in checksentence:
       checksentence.append(i)
    else:
       pass
checksentence.sort()
print("Output is : {}".format(" ".join(checksentence)))
