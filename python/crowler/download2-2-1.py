import sys
import io
import urllib.request as dw

sys.stdout = io.TextIOWrapper(sys.stdout.detach(),encoding='utf-8')
sys.stderr = io.TextIOWrapper(sys.stderr.detach(),encoding='utf-8')

imgUrl = "https://post-phinf.pstatic.net/20160621_227/1466477574871KUwBR_JPEG/src_10963493.jpg?type=w1200"
htmlURL = "https://google.com"

savePath1 = "c:/section2/test1.jpg"
savePath2 = "c:/index.html"

dw.urlretrieve(imgUrl,savePath1)
dw.urlretrieve(htmlURL,savePath2)

print("다운로드 완료!")
