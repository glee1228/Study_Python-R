from bs4 import BeautifulSoup
import urllib.request as req

html = req.urlopen("http://wikidocs.net/")
bs = BeautifulSoup(html, 'html.parser')
#print(bs.prettify())
#print(bs.find("title"))
body_tag = bs.find('body')
#print(body_tag.get_text('-',strip=True))
p_tag=body_tag.findAll('p')
