word="EVAPORATE"
print("Welcome to Hangman!")
guesses = ''
while True:
    failed = 0
    for char in word:
        if char in guesses:
            print(char,end=" ")
        else:
            print("_",end=" ")
            failed += 1
    if failed == 0:
        print("\nThe word is: ", word)
        break
    guess = input("\nGuess your letter: ")
    guesses += guess.upper()
