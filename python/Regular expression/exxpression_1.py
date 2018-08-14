import re

str = '''aaa.html
bbb.html
ccc.xml
ddd.html
1.html
b.hhtml
hihihi.java
itpangpang.txt
ab123456a.js
Good.css
itit.html
ititkkk.htmlggg
hahahaha.htmlmlml
cabd_a.html'''

str2='''
전화번호 : 011-000-0000
전화번호 : 017-111-1111
전화번호 : 010-9999-9999'''

str3='''https://search.daum.net/search?nil_suggest=btn&nil_ch=&rtupcoll=&w=tot&m=&f=&lpp=&DA=SBC&sug=&sq=&o=&sugo=&q=reg
 ?nil_suggest=btn&nil_ch=&rtupcoll=&w=tot&m=&f=&lpp=&DA=SBC&sug=&sq=&o=&sugo=&q=reg
'''

str4='''RegExr v3 was created by gskinner.com, and is proudly hosted. by Media Temple.
Edit the Expression & Text! to see matches. 
Roll? over matches or the expression% for details. PCRE & Javascript flavors of RegEx are supported.
The side bar includes a Cheatsheet, full Reference, and Help. 
You can also Save & Share with the Community, and view patterns. you create# or favorite in My Patterns.
Explore results with the Tools below. Replace & List output~ custom results.
Details lists capture groups. Explain describes your expression in plain English'''

str5='''https://search.daum.net/search?nil_suggest=btn&nil_ch=&rtupcoll=&w=tot&m=&f=&lpp=&DA=SBC&sug=&sq=&o=&sugo=&q=reg
 ?nil_suggest=btn&nil_ch=&rtupcoll=&w=tot&m=&f=&lpp=&DA=SBC&sug=&sq=&o=&sugo=&q=reg
'''

a = '\w+\.html'
b = r'\w+\.html\b'   #\b가 있으면 정확한 데이터를 찾게 도와줌.
c = '[A-Z]\w+'
d = r'\b[a-z]\w+'
e = r'\b[a-z]\w+\.'
f = r'[^?]+=.*'
g = r'\w+\=\w+|\w+\='
#a = '(\d{3})-(\d{3,4})-(\d{4})'

r = re.compile(a)
r2 = re.compile(b)
r3 = re.compile(c)
r4 = re.compile(d)
r5 = re.compile(e)
r6 = re.compile(f)
r7 = re.compile(g)

print(r.findall(str))
print(r2.findall(str))
print(r3.findall(str4))
print(r4.findall(str4))
print(r5.findall(str4))
print(r6.findall(str5))
print(r7.findall(str5))