from password_generator import PasswordGenerator
pwo=PasswordGenerator()
pwo.minlen = 30
pwo.maxlen=30
pwo.minuchars = 2
pwo.minlchars = 3
pwo.minnumbers = 1
pwo.minschars = 1
n=input("Press Enter to generate password....")
print("Your generated password is {}".format(pwo.generate()))
