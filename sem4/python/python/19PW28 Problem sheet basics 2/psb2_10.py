dict={}
with open('index.txt') as f:
     for i, l in enumerate(f):
         for word in l.strip().split(" "):
              if word in dict.keys():
                  dict[word].append(i+1)
              else:
                  dict[word]=[i+1]
r=list()
print('"Word -- Linenumber"\n')
for l,r in dict.items():
    print("{} -- {}".format(l,r))
