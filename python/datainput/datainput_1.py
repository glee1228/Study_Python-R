students =[]
i = 0
while True:
    name = input("이름을 입력하세요\n")
    if name=="q":
        break
    stunum = input("학번을 입력하세요\n")
    stuaddr= input("주소를 입력하세요\n")
    stubirth = input("생일을 입력하세요(ex.19930120)\n")
    tostr = name, stunum, stuaddr, stubirth
    print(tostr)
    students.append(tostr)

tostr=""
print(students)
