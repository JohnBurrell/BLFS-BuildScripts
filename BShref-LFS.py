#!/usr/bin/env python3

from requests import get
from bs4 import BeautifulSoup
import re
import sys, os

url=sys.argv[1]
pattern=sys.argv[2]
#pattern = 'iproute2'
#url="https://linuxfromscratch.org/lfs/view/systemd/chapter03/packages.html"
exts = (".xz", ".bz2", ".gz", ".lzma", ".tgz", ".zip")
page = get(url)
soup = BeautifulSoup(page.content, 'html.parser')
for link in soup.find_all('a', href=True):
  if link.get('href'):
      for anhref in link.get('href').split():
          if os.path.splitext(anhref)[-1] in exts:
              match = re.search(pattern, link.get('href'))
              if match:
                  print(match.string)

