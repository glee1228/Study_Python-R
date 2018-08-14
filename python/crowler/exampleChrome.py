from selenium import webdriver
from bs4 import BeautifulSoup

driver = webdriver.Chrome("chromedriver")

driver.get("https://www.google.co.kr/maps")

assert "Google" in driver.title
elem = driver.find_element_by_name("q")

elem.clear()

elem.send_keys("L’AsduFallafel")

elem.submit()

elem = driver.find_element_by_id("searchbox-searchbutton")
elem.click()

elem = driver.find_element_by_id("widget-pane-toggle-button-container")
elem.click()

assert "No results found." not in driver.page_source

html = driver.page_source
soup = BeautifulSoup(html, 'html.parser')
elem = soup.select('li.748> span[button*=vet]')
print(elem)
