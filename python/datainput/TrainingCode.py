import os
import sys
import re

#암호화하는 프로그램과 복호화 하는 프로그램은 함수로 작성
def makePW(input) :
    return input^123

def makeRC(input):
    return input^123

tmp = 0
#데이터 출력하는 프로그램은 메인에서

while True:    #반복문으로 전체 프로그램 반복

    menu = int(input("1: 입력숫자 암호화  2: 입력한 숫자 복호화  3. 프로그램 종료 \n"))
    if menu==1:
        num = int(input("숫자 입력 : "))
        tmp = makePW(num)
        print("암호화된 숫자 :" ,str(tmp))
        path = str(input("저장할 파일경로와 파일명을 입력하세요(default= C:\\parser\\)\n"))
        if os.path.split(path)[1] == path:
            path = "C:\\parser\\" + path
        f = open(path, "a", encoding="utf-8")
        path =""                    #path값 초기화
        f.write("입력 : "+str(num)+"\n암호화된 숫자 :"+str(tmp)+"\n")
        f.close()

    elif menu==2:
        try:
            path = str(input("불러올 파일경로와 파일명을 입력하세요(default= C:\\parser\\)\n"))
            #print(os.path.split(path)[1])
            if os.path.split(path)[1]==path:
               # print("C:\\\\"+path)
                path = "C:\\parser\\" + path

            f2 = open(path, "r", encoding="utf-8")
            path=""                                   #path값 초기화
            file = f2.readlines()
            inputlist = []
            pwlist = []
            check=1
            for line in file:
                cw = re.compile(r'\b\d+')
                #print(type(cw.findall(line)))             #리스트 출력 findall
                #print(type("".join(cw.findall(line))))    #리스트를 문자열로
                print(line)
                if check%2==1:
                    inputlist.append("".join(cw.findall(line)))
                else :
                    pwlist.append("".join(cw.findall(line)))


                check+=1

            whatinfo=input("1: 입력값 받기 , 2: 암호화된 숫자 받기\n")
            whatcount =int(input("몇 번째 값을 받으시겠습니까?\n"))
            if whatinfo=="1":
                print(inputlist[whatcount-1])
            elif whatinfo=="2":
                print(pwlist[whatcount-1])
            f2.close()
        except:
            print("입력오류입니다")

    elif menu==3:
        print("프로그램 종료")
        sys.exit()
    retry = input("계속하시겠습니까? Y or N\n ")
    if retry == "Y" or retry == "y":
        continue
    elif retry == "N" or retry == "n":
        print("프로그램 종료")
        sys.exit()
    else:
        print("잘못입력하셨습니다. 계속 진행합니다.")

f.close()
#사용자 입력 암호화 데이터 파일에 저장





#복호화는 사용자로부터 파일 입력하고 해당 파일 데이터를 이용,존재하지 않는 파일은 입력오류 출력


#파일 이름은 사용자로부터 입력받음. 사용자가 파일명만 입력하면 c:\\에 해당파일을 저장.
#파일 경로까지 입력하면 해당 경로에 저장한다.(디렉터리 없으면 새로 생성)