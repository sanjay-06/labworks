import re
list=[]
suffix=[]
print("Press ctrl-c to terminate while loop")
try:
   while True:
      string=input("Enter the website address: ")
      list.append(string)
except KeyboardInterrupt:
    print("\n")
    pass

print("The suffix of the websites are: ")
for web in list:
    ext=web.split(".")[-1:]
    print("".join(ext))
