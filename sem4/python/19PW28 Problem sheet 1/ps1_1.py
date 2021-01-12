def most_frequent(string):
   count={}
   for letter in string:
      count[letter]=count.get(letter,0)+1       #initialize it to default 1
   dict=dict(sorted(count.items(),key=lambda item: item[1],reverse=True)) #sorting according to values in dictionary not keys using lambda
   return dict

string=input("Enter the string: ")
count=most_frequent(string)
print("The descending dictionary: ")
for key,val in count.items():
    print("{} -- {}".format(key,val))
