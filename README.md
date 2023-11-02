# Mass Curl Checker
Check a list of URLs to make sure you are getting the right response.

Perfect for quickly testing APIs.

## How To:
1. Fill out **urls.txt** with a list of line-separated URLs
```
https://google.com
...
```
2. Fill out **expected.txt** with the expected response
```
<HTML><HEAD><meta http-equiv="content-type" content="text/html;charset=utf-8">
<TITLE>301 Moved</TITLE></HEAD><BODY>
<H1>301 Moved</H1>
The document has moved
<A HREF="https://www.google.com/">here</A>.
</BODY></HTML>
```
3. Run **mass-curl.sh**
```
./mass-curl.sh
```
