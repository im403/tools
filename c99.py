import requests
from bs4 import BeautifulSoup
url = requests.get("https://subdomainfinder.c99.nl/scans/2020-05-05/lifesizecloud.com").text
s = BeautifulSoup(url,"lxml")
tab = s.find('table',{'id':'result_table'})
l = s.findAll("a")
for l1 in l:
    check = l1.getText()
    if check.endswith('.lifesizecloud.com'):
        print(check)
