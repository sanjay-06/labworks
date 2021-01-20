def checkkep(number):
    sq_numb=number**2
    string=str(sq_numb)
    list=[]
    for num in string:
        list.append(str(num))
        list1 ="".join(list[:len(list)//2])
        list2 ="".join(list[len(list)//2:])
    sum=int(list1)+int(list2)
    if(number==sum):
      return True
    else:
      return False


num=input("Enter the number: ")
if(checkkep(int(num))):
    print("Yes it is keprekar")
else:
    print("No it is not a keprekar")
