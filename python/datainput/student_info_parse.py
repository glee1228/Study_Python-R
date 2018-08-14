import re

#f = open("data/Paulamazing.txt", 'r',encoding='UTF8')
r = re.compile(r'\b[가-힣]{1,5}')
r2 = re.compile(r'\b\d+')
#str1 = f.readline()
str1 = "안녕하세요adsfasdf : 123123123 운중형에게 보내는 message"
if r.findall(str1)==None:
    print("잘못입력")
else :
    print(r.findall(str1))
    print(r2.findall(str1))

#f.close()