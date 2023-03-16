#!/usr/bin/env python3

from bs4 import BeautifulSoup
import requests
import sys, os

url=sys.argv[1]

page = requests.get(url)
soup = BeautifulSoup(page.text, 'html.parser')
pkgs = {} # set up a dict

for tag in soup.select('#pkgsrcslist a'):
    pkgs.update({
        tag.text:tag.get('href')
    })

#print(pkgs)
print(tag.text) # only need the tarfile name
