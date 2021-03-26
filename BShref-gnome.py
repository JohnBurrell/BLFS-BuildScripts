#!/usr/bin/env python3

from bs4 import BeautifulSoup
import requests
import re
import sys, os

headers = {
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'GET',
    'Access-Control-Allow-Headers': 'Content-Type',
    'Access-Control-Max-Age': '3600',
    'User-Agent': 'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:52.0) Gecko/20100101 Firefox/52.0'
    }

URL=sys.argv[1]
tar_file_link = ""
#URL="https://download.gnome.org/sources/gnome-desktop"
page = requests.get(URL)
soup = BeautifulSoup(page.content, "html.parser")
links=soup.find_all("a", href=re.compile("[0-9]"))
latest_link = links[-1].get_text()

URL+="/"+latest_link
page = requests.get(URL)
soup = BeautifulSoup(page.content, "html.parser")
rows = soup.find_all("a", text=re.compile(".tar.xz"))
tar_file_link = rows[-1].get_text()
if tar_file_link != "":
#    URL+=tar_file_link
    print(tar_file_link)
