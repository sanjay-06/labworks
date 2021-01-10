string="WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWBWWWWWWWWWWWWWW"
encoding=""
count=0
i=0

while i < len(string):
    count=1
    while i+1<len(string) and string[i]==string[i+1]:
         count+=1
         i+=1
    encoding+=str(count)+string[i]
    i+=1
print(encoding)
