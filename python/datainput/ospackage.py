import os

print(os.getcwd())        #현재 워크스페이스 출력

#os.chdir("c:\\temp")     #워크스페이스 변경
#print(os.getcwd())      #현재 워크스페이스 출력

#os.makedirs("C:\\temp\\dir1\\dir2\\dir3")   #경로를 따라 디렉토리 생성

#os.listdir("C:\\temp")   #안에 있는 디렉토리 조회

#os.removedirs("C:\\Temp\\dir1\\dir2\\dir3")   #디렉토리 삭제

print(os.path.isdir("C:\\Temp"))   #폴더 유무 판단
print(os.path.isfile("C:\\parser"))    #파일 유무 판단

print(os.path.split("C:\\parser\\여운중.txt"))   #파일명과 경로 쪼개기
join = os.path.split("C:\\parser\\여운중.txt")    # 쪼갠 튜플을 join에 삽입
print(os.path.join(join[0],join[1]))     #join함수를 이용하여 경로와 파일명을 합치기

print(os.path.splitext("C:\\parser\\여운중.txt"))    #확장자와 파일까지의 경로 쪼개기

print(os.path.dirname("C:\\parser\\여운중.txt"))    #디렉토리명 출력
print(os.path.basename("C:\\parser\\여운중.txt"))    #파일명만 출력



