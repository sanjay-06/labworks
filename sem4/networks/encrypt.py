from AesEverywhere import aes256

def encrypt(file):
    for each in file:
        encrypted = aes256.encrypt(each, 'PASSWORD')
    files=open("encrypt.txt","wb")
    files.write(encrypted)


def decrypt():
    file=open("encrypt.txt","r")
    filewrite=open("decrypt.txt","wb")
    enc=""
    for word in file:
        enc+=word
    filewrite.write(aes256.decrypt(enc, 'PASSWORD'))
    file.close()
    filewrite.close()

file=open("file.txt","r")
encrypt(file)
file.close()
decrypt()
