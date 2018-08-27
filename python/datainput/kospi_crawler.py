import requests
from bs4 import BeautifulSoup
import re

url = 'https://finance.naver.com/sise'
res = requests.get(url)
result = BeautifulSoup(res.content, 'html.parser')
kospi = result.select_one('#KOSPI_now')

print('현재 코스피 지수는 {}입니다.'.format(kospi.text))
print(type(res.content))
print(type(result))