alice_ratings = {"alonzo": 1, "bob": 3, "turing" : 2}
bob_ratings = {"alice": 1, "alonzo": 2, "turing": 3}
alonzo_ratings = {"alice": 3, "bob": 2, "turing": 1}
turing_ratings = {"alice": 2, "alonzo": 1, "bob": 3}
friends = {"alice": alice_ratings, "bob": bob_ratings, "alonzo": alonzo_ratings,"turing": turing_ratings}

def more_popular(friends):
    dict={}
    for key in friends.keys():
        dict[key]=0                                   #initializing a dictionary with keys as in friends dictionary and value as 0
    for keys,values in friends.items():               #iterating through 2-D array
        for key,value in values.items():
            if key not in dict:
                dict[key]=value/3                    #if not in dictionary add the value
            else:
                dict[key]+=value/3                  #if exists in dictionary add with exisiting one
    keylist=list(dict.keys())
    vallist=list(dict.values())
    return keylist[vallist.index(min(vallist))]     #return the minimum keylist value

print("The student with lowest average score is '{}'".format(more_popular(friends)))
