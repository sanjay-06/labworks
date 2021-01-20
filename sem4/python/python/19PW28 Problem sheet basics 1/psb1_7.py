def checkpan(string):
    str="abcdefghijklmnopqrstuvwxyz"
    for char in str:
        if char not in string.lower():
            return False
    return True

string=input("Enter the sentence :")
if(checkpan(string.strip())==True):
  print("Yes it is pangram")
else:
  print("No it is not pangram")
