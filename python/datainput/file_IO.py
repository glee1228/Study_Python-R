import os
#os.makedirs("C:\\parser\\IOTEST") # 첫번쨰에만 디렉토리 생성 후 아래의 파일 생성
#f = open("C:\\parser\\IOTEST\\test.txt","w")   # w모드는 새로 계속 만드는 작업
#f = open("C:\\parser\\IOTEST\\test.txt","a",encoding='utf-8')   # a모드는 이어서 내용을 덮어쓰고, 존재하지 않으면 생성
#inputmsg = str(input("삽입할 텍스트내용 : "))
#f.write(inputmsg)    #input 입력

#f = open("C:\\parser\\IOTEST\\test.txt","r",encoding="utf-8")   # r모드
#while True:                                 #반복문
#    str = f.readline()                      #다음 한줄 읽음
#    print(f.tell())                         #현재 읽는 포인터위치 출력
#    print(str)
#    if not str :
#        break

#lines = f.readlines()
#for line in lines:
 #   print(line)

k_image = open("C:\\parser\\DH.jpg","rb")
k_image_2 = open("C:\\parser\\DH2.jpg","wb")
k_image_2.write(k_image.read())
k_image.close()
k_image_2.close()


#f.close()