Browserbadge
=

Simple API to generate SVG browser icon budgets with version

Documentation
=
To get browser budge send GET request to http://browserbadge.com with parameters 'browser', 'version' and 'size'

`http://browserbadge.com/browser/version/size`

Supported browsers
-
Chrome  | Opera | Firefox | Safari | Internet Explorer
-------- | -------- | -------- | -------- | --------
![chrome](http://browserbadge.com/chrome) | ![Opera](http://browserbadge.com/opera) | ![firefox](http://browserbadge.com/firefox) | ![safari](http://browserbadge.com/safari) |  ![ie](http://browserbadge.com/ie)

Parameters:
-
**browser**: chrome | opera | firefox | ie | safari

**version**: any 1-3 digits number will be added to logo image with '+'. If not present return logo without any text

**size**: `<size>px`. Can be 1..9999 px. All badgets are square. If not present return `32px x 32px`

Default size of images is `32px x 32px`. But on your page you can set any picture size and SVG icon will be increased or reduced to this size.

Example:
=
Request  | Respond
-------- | --------
http://browserbadge.com/chrome/42 | ![Chrome](http://browserbadge.com/chrome/42)
http://browserbadge.com/opera | ![Opera](http://browserbadge.com/opera)
http://browserbadge.com/firefox/28/80px | ![Firefox](http://browserbadge.com/firefox/28/80px)
http://browserbadge.com/firefox/1234 | ![not_found](http://browserbadge.com/not_found)
http://browserbadge.com/explorer | ![not_found](http://browserbadge.com/not_found)
Or other error in parameters | ![not_found](http://browserbadge.com/not_found)

Using
=
You can use generated images in `<img>` tag. Specify the desired size of `<img>` element or just send size as parameter
```
<img height='50' width='50' src='http://browserbadge.com/chrome/42'/>
<img src='http://browserbadge.com/chrome/42/50px'/>
```
Or in markdown syntax. Some markdown processors support inclusion of HTML, so you can use this tip.
```
![Alt text](http://browserbadge/chrome/42)
![Alt text](http://browserbadge/chrome/42/50px)
```

Active Bridge, LLC
