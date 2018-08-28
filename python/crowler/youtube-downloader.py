import pytube
import os
import subprocess  #터미널 커맨드 명령어 실행 가능 임포트

youtubeUrl = input("유튜브 Url을 입력하세요")

#다운받을 동영상 URL 지정
yt = pytube.YouTube(youtubeUrl)
videos = yt.streams.all()

print('videos',videos)

for i in range(len(videos)) :
    print(i, ' , ',videos[i])

cNum = int(input("다운 받을 화질은?(0~21 입력)"))

down_dir = "c:\youtube"

videos[cNum].download(down_dir)
mp3YesorNot = input("mp3로 변환하시려면 Y를, 안하려면 N을 누르세요  ")

if (mp3YesorNot == "y") :
    newFileName = input("변환할 mp3 파일명은?")
    oriFileName = videos[cNum].default_filename

    subprocess.call(['ffmpeg','-i',
    os.path.join(down_dir,oriFileName),
    os.path.join(down_dir,newFileName)
    ])
    print("동영상 다운로드 및 mp3 변환완료!")
else :
    print("동영상만 다운로드!")
