def ceaser_cipher(word):
    string=""
    for letter in word:
        val=ord(letter)+shift
        string+=chr(val)
    return word,string

shift=int(input("Enter the value to shift: "))
word=input("Enter the word: ")
word,string=ceaser_cipher(word)
print("The input word is: "+word)
print("The encrypted word in ceaser cipher is: "+string)
