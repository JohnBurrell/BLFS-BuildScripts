#!/usr/bin/env python3
from bs4 import BeautifulSoup
import urllib.request, urllib.parse, urllib.error
import lxml
import sys, os
url=sys.argv[1]
exts = (".xz", ".bz2", ".gz", ".lzma", ".tgz", ".zip", ".patch", ".deb", ".jar")
packages = urllib.request.urlopen(url).read()
soup = BeautifulSoup(packages, features="xml")
for link in soup.find_all('a'):
    if link.get('href'): # remove None
        for anhref in link.get('href').split():
            if os.path.splitext(anhref)[-1] in exts:
                print((link.get('href')))
