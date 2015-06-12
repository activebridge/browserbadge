Browserbadge
=

Simple API to generate SVG browser icon budgets with version

Documentation
=
To get browser budge send GET request to http://browserbadge.com with parameters 'browser' and 'version'.

`http://browserbadge.com/browser/version`

Supported browsers
-

Chrome	Opera	Firefox	Internet Explorer	Safari

Parameters:
-
browser: chrome | opera | firefox | ie | safari
version: any 1-3 digits number will be added to logo image with '+'. If not present return logo without any text

Example:
=
Request  | Respond
-------- | --------
http://browserbadge.com/chrome/42 | ![Chrome42](http://browserbadge.com/chrome/42 =250x250)
http://browserbadge.com/opera | ![Opera](http://browserbadge.com/opera =100x100)
http://browserbadge.com/firefox/1234 | ![not_found](http://browserbadge.com/not_found =100x100)
http://browserbadge.com/explorer | ![not_found](http://browserbadge.com/not_found =100x100)
Or other error in parameters | ![not_found](http://browserbadge.com/not_found =100x100)

Using
=
You can use generated images in `<img>` tag. Specify the desired size of img element.
```
<img height='50' width='50' src='http://browserbadge.com/chrome/42'/>
```
Or in markdown syntax
```
![Alt text](http://browserbadge/chrome/42)
![Alt text](http://browserbadge/chrome/42 =100x100) // set size of image using markdowb syntax
![Alt text](http://browserbadge/chrome/42 =50x200)
```

Active Bridge LLC
