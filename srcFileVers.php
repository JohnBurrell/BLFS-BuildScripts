#!/usr/bin/env php

<?php

function getPage($url, $proxy) {
// create curl resource
$ch = curl_init();
// set url
curl_setopt($ch, CURLOPT_URL, $url);
// return the transfer as a string
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
// set proxy
curl_setopt($ch, CURLOPT_PROXY, $proxy);
// set referer to be the site
curl_setopt($ch, CURLOPT_REFERER, $url);
// UA is firefox 37.0.2
curl_setopt($ch, CURLOPT_USERAGENT, 'Mozilla/37.0 (X11; U; Linux 3.19.3 i686, en) Gecko/20150410 Firefox/37.0.2');
curl_setopt($ch, CURLOPT_AUTOREFERER, true);
curl_setopt($ch, CURLOPT_TIMEOUT, 10);
// check a CA certificate
//curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, true);
//curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 2);
//curl_setopt($ch, CURLOPT_CAINFO, getcwd() . "/CAcerts/BuiltinObjectToken-EquifaxSecureCA.crt");
curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
curl_setopt($ch, CURLOPT_FRESH_CONNECT, 1);

// $result contains the output string
$result = curl_exec($ch);

//$result[‘EXE’] = curl_exec($ch);
//$result[‘INF’] = curl_getinfo($ch);
//$result[‘ERR’] = curl_error($ch);
// close curl resource
curl_close($ch);

return $result;
}

error_reporting(0); // don't show warnings about the code of the web page
//$url = "http://sourceforge.net/projects/sqlite.mirror/files/SQLite%203.8.9/";
$url = $argv[3];
//$start = "sqlite";
$start = $argv[4]; // start of pattern to match
$proxy = "192.168.1.146:3128";
$page = getPage($url, $proxy);
// make any HREFs lowercase
$page = preg_replace('/HREF/', 'href', $page);
//print_r($page);
$dom = new DOMDocument;
$dom->loadHTML($page);
$xpath = new DOMXPath($dom);
//$nodes = $xpath->query("//a[contains(@href,'sqlite-autoconf-')]");
$nodes = $xpath->query("//a[contains(@href,'$argv[2]')]");
$rgxprexz=".*(?<!pre[0-9])\.tar\.xz$";
$rgxprebz2=".*(?<!pre[0-9])\.tar\.bz2$"; // don't want pre versions
$rgxrc=".*(?<!rc[0-9])\.tar\.bz2$"; // don't want rc versions
$rgxchar=".*(?<![a-z])\.tar\.bz2$"; // don't want [a-z].tar versions
$rgxgzchar=".*(?<![a-z])\.tar\.gz$"; // don't want [a-z].tar versions
$rgxwin=".*(?<![a-z])\.zip$"; // don't want [a-z].zip windows version
$rgxwin32=".*(?<!win32)\.zip$"; // don't want [a-z].zip windows 32 bit version
foreach($nodes as $href) {
    if (fnmatch("*.tar.xz", $href->getAttribute('href')) and preg_match("/$rgxprexz/", $href->getAttribute('href'))) {
        echo $href->getAttribute('href'), PHP_EOL;
    } elseif (fnmatch("*.tar.lzma", $href->getAttribute('href'))) {
        echo $href->getAttribute('href'), PHP_EOL;
    } elseif (fnmatch("*source.tar.bz2", $href->getAttribute('href'))) {
        echo $href->getAttribute('href'), PHP_EOL;
    } elseif (preg_match("/$rgxprebz2/", $href->getAttribute('href')) and preg_match("/$rgxrc/", $href->getAttribute('href')) and preg_match("/$rgxchar/", $href->getAttribute('href'))) {
        echo $href->getAttribute('href'), PHP_EOL;
    } elseif (fnmatch("*.tar.gz", $href->getAttribute('href'))) {
        echo $href->getAttribute('href'), PHP_EOL;
    } elseif (fnmatch("*.tgz", $href->getAttribute('href'))) {
        echo $href->getAttribute('href'), PHP_EOL;
    } elseif (fnmatch("*.zip", $href->getAttribute('href')) and preg_match("/$rgxwin/", $href->getAttribute('href')) and preg_match("/$rgxwin32/", $href->getAttribute('href'))) {
        echo $href->getAttribute('href'), PHP_EOL;
    } elseif (fnmatch("*-signed.tar", $href->getAttribute('href'))) {
        echo $href->getAttribute('href'), PHP_EOL;
    } elseif ($start == "vlc" or $start == "Mako" or $start == "setuptools" or $start == "bind") {
        echo $href->getAttribute('href'), PHP_EOL;
    } elseif ($start == "mariadb" or $start == "mesa") {
        echo $href->getAttribute('href'), PHP_EOL;
    } else {
        echo $href->getAttribute('title'), PHP_EOL;
    }
//    var_dump($href->getAttribute('title'));
}
//echo $href->textContent; // the last value of $nodes when foreach ends
?>
