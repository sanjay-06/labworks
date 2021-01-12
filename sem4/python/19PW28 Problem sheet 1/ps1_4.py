alonzo = {"age": 10, "height": 42, "weight": 175, "instrument": "fiddle" }
turing = {"age": 41, "height": 70, "weight": 160, "instrument": "theremin"}
bertha = {"age": 32, "height": 97, "weight": 587, "instrument": "cello"}
tinkerB = {"age":100, "height": 4, "weight": 0.5, "instrument": "cello"}
banditos = {"Alonzo": alonzo, "Turing": turing, "Bertha": bertha, "TinkerB": tinkerB}

def findperson(instrument):
    dict={}
    for key,values in banditos.items():
        if values["instrument"] == instrument:         #compare key value and parameter
            dict.update({key:values["instrument"]})    #creating a new dictionary with key as instrument value
    return list(dict.keys())                           #returning the instrument users

string=input("Enter the instrument: ")
print("The instrument {} is played by {}".format(string,",".join(findperson(string))))
