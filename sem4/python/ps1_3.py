def split(string):
    return [char for char in string]
count={}
str=[]
str=split("AAGTTAGTCA")
for letter in str:
    count[letter]=count.get(letter,0)+1
print(count)
