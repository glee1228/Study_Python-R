import urllib.request as req
import urllib.parse
d = req.urlopen("http://wikidocs.net/")
#print(d.read())
status = d.getheaders()
#for s in status:
  #  print(s)

def input_query():
    q = str(input("검색어 입력하세요:"))
    return "&query="+q
print(input_query())

def input_query2():
    q = urllib.parse.quote_plus(str(input("검색어 입력하세요:")))
    return "&query= " +q

print(input_query2())
