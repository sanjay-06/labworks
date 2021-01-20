def checkmeta(key,value):
    keydict={}
    valuedict={}
    if len(key) != len(value):                                      #logic I have applied is that
       return key,value,0                                           #when the frequency of letters in both the
    else:                                                           #words are same then it is metathesis
        for letter in key:
            keydict[letter]=keydict.get(letter,0)+1
        for letter in value:
            valuedict[letter]=valuedict.get(letter,0)+1
        return key,value,keydict == valuedict

list=[]
index=[]
n=int(input("Enter the number of pairs you need to find: "))
for i in range(n):
    list.append(input("Enter first string: "))                           #creating a list for first word of pair
    index.append(input("Enter the second string: "))                     #creating a list for second word of pair

for i in range(n):
    word1,word2,bool=checkmeta(list[i],index[i])                         #function call
    print("\n")
    if(bool):
        print("The words {} and {} is metathesis pairs".format(word1,word2))
    else:
        print("The words {} and {} are not metathesis pairs".format(word1,word2))
