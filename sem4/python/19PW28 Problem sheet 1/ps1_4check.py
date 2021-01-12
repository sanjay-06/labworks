alonzo = {"age": 10, "height": 42, "weight": 175, "instrument": "fiddle" }
turing = {"age": 41, "height": 70, "weight": 160, "instrument": "theremin"}
bertha = {"age": 32, "height": 97, "weight": 587, "instrument": "cello"}
tinkerB = {"age":100, "height": 4, "weight": 0.5, "instrument": "cello"}
banditos = {"Alonzo": alonzo, "Turing": turing, "Bertha": bertha, "TinkerB": tinkerB}

newdict={}
keylist=list(banditos.keys())
vallist=list(banditos.values())
print(keylist)
for keys,value in banditos.items():
    for key,val in value.items():
        if banditos[keys]["instrument"] not in newdict and keys:
           newdict[banditos[keys]["instrument"]]=keys
        else:
           newdict[banditos[keys]["instrument"]]+=keys
print(newdict)
