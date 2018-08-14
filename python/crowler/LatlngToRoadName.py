from selenium import webdriver
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By
from selenium.common.exceptions import TimeoutException
from bs4 import BeautifulSoup

timeout =3
driver = webdriver.Chrome("chromedriver")

driver.get("https://www.google.co.kr/maps")

assert "Google" in driver.title
elem = driver.find_element_by_name("q")

elem.clear()

elem.send_keys("37.4357039 127.1341305")

elem.submit()

elem = driver.find_element_by_id("searchbox-directions")
elem.click()

driver.implicitly_wait(timeout)

elem = driver.find_element_by_xpath("//*[@class='widget-directions-icon reverse']")
elem.click()



assert "No results found." not in driver.page_source


html = driver.page_source
soup = BeautifulSoup(html, 'html.parser')
elem = soup.select('li.748> span[button*=vet]')
print(elem)