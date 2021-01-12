
count={}
str="AAGTTAGTCA"
for letter in str:
    count[letter]=count.get(letter,0)+1 #initial condition with value 1
print(count)
