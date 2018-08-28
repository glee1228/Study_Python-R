from urllib.parse import urljoin

baseUrl = "http://test.com/html/a.html"

print(">>",urljoin(baseUrl,"b.html"))
print(">>",urljoin(baseUrl,"sub/b.html"))   #상대경로
print(">>",urljoin(baseUrl,"../index.html"))   #절대경로
print(">>",urljoin(baseUrl,"../img/img.jpg"))
print(">>",urljoin(baseUrl,"../img/img.css"))
