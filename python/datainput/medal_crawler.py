import requests
from bs4 import BeautifulSoup

url = "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=2018+%EC%95%84%EC%8B%9C%EC%95%88%EA%B2%8C%EC%9E%84+%EB%A9%94%EB%8B%AC&oquery=2018+%EC%95%84%EC%8B%9C%EC%95%88%EA%B2%8C%EC%9E%84&tqi=TGgtMdpVuFZssaJDtdwssssstgC-409764"
res=requests.get(url)
bs4=BeautifulSoup(res.content, 'html.parser')

print(res) # 된건지 확인
"""
name = bs4.select_one('a.nation_name')
nation_names =bs4.select('a.nation_name')

for nation in nation_names:
    print(nation.text)

type(nation_names)"""