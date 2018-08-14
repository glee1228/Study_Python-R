import sys

secretnum="0"

def encryption(inputnum):
    return inputnum ^ 456123
def decryption(inputnum):
    return inputnum ^ 456123

while True:
    menu = input("1. 주민번호 입력, 2. 복호화, 3. 종료\n")
    if menu=="1":
        inputnum = int(input("주민번호 입력\n"))
        secretnum = encryption(inputnum)
        print(secretnum)

    elif menu=="2":
        recovernum = encryption(secretnum)
        print(recovernum)

    elif menu=="3":
        sys.exit()






