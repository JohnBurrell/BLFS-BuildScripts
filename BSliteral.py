#!/usr/bin/env python3
from bs4 import BeautifulSoup
import urllib.request, urllib.parse, urllib.error
import sys
url = sys.argv[1]
packages = urllib.request.urlopen(url).read()
soup = BeautifulSoup(packages, "lxml")
cl = soup.findAll('code', {'class': 'literal'})
for eachLine in cl:
    print(eachLine)
