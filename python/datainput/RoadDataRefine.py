import os
import sys
import re
import csv

#~로 로 끝나는 도로이름 슬라이싱 함수
def makeRoad3(input) :
    return input[0:3]
def makeRoad4(input):
    return input[0:4]
def makeRoad5(input):
    return input[0:5]
def makeRoad6(input):
    return input[0:6]
def makeRoad7(input):
    return input[0:7]
def makeRoad8(input):
    return input[0:8]

#csv 파일 쓰기
def setCsv(list):
    csvWriter = csv.writer(f2)
    csvWriter.writerow(list)


while True:    #반복문으로 전체 프로그램 반복

    menu = int(input("1: 입력데이터 문자열 슬라이싱 2. 프로그램 종료 \n"))

    if menu==1:
        try:
            path = str(input("불러올 파일경로와 파일명을 입력하세요(default= C:\\parser\\)\n"))
            print(os.path.split(path)[1])
            if os.path.split(path)[1]==path:
               # print("C:\\\\"+path)
                path = "C:\\parser\\" + path
            print(path)
            f = open(path, "r", encoding="utf-8")
            path=""                                   #path값 초기화
            file = f.readlines()

            resultlist = []

            for line in file:
                linelist=line.split(",")
                resultline=linelist[0:11]

                #정규식 -로로 끝나는 단어 추출
                r3 = re.compile(r'[가-힣][가-힣][로]')
                r4 = re.compile(r'[가-힣][가-힣][가-힣][로]')
                r5 = re.compile(r'[가-힣][가-힣][가-힣][가-힣][로]')
                r6 = re.compile(r'[가-힣][가-힣][가-힣][가-힣][가-힣][로]')
                r7 = re.compile(r'[가-힣][가-힣][가-힣][가-힣][가-힣][가-힣][로]')
                r8 = re.compile(r'[가-힣][가-힣][가-힣][가-힣][가-힣][가-힣][가-힣][로]')
                print(line)

                #데이터 쓰는 경로
                f2 = open("C:\\parser\\RoadResult.csv", "a")
                for i in linelist:
                    #print(i)
                    if r3.match(i)!=None:
                        ref=makeRoad3(i)
                        resultline.append(ref)
                        setCsv(resultline)
                        print(ref)

                    elif r4.match(i)!=None:
                        ref=makeRoad4(i)
                        resultline.append(ref)
                        setCsv(resultline)
                        print(ref)

                    elif r5.match(i)!=None:
                        ref=makeRoad5(i)
                        resultline.append(ref)
                        setCsv(resultline)
                        print(ref)

                    elif r6.match(i)!=None:
                        ref=makeRoad6(i)
                        resultline.append(ref)
                        setCsv(resultline)
                        print(ref)

                    elif r7.match(i)!=None:
                        ref=makeRoad7(i)
                        resultline.append(ref)
                        setCsv(resultline)
                        print(ref)
                    else :
                        continue

                #r'\b[가-힣]{1,5}'
                #print(type(r3.findall(line)))             #리스트 출력 findall
                #print(type("".join(cw.findall(line))))    #리스트를 문자열로
                #print(line)
            f2.close()
            f.close()
        except:
            print("입력오류입니다")
            sys.exit()

    elif menu==2:
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

