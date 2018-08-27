import requests
from bs4 import BeautifulSoup
import re

url = 'https://finance.naver.com/sise'
res = requests.get(url)
result = BeautifulSoup(res.content, 'html.parser')
kospi = result.select_one('#KOSPI_now')
num = str(kospi)
print(num)

r1 = re.compile('[0-9][,][0-9][0-9][0-9][.][0-9][0-9]')
print(r1.findall(num))
parse_list = r1.findall(num)
result = str(parse_list)
print('현재 코스피 지수는 {}입니다.'.format(result))