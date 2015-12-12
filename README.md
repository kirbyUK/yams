yams
====

![Canned Yams](https://raw.guthubusercontent.com/kirbyUK/yams/master/canned-yams.png")
*Don't you think it's cheating that your mother is using canned yams?*

Yet Another Music Server for [UWCS](https://uwcs.co.uk) LAN parties. Use a
simple web interface to queue video/song links or upload files which get
placed into 'buckets'. Each user is allowed one file per bucket. The server
simulataneously goes through each file sequentially and plays it.

Why?
---

Why use this server over any of the
[many](https://uwcs.co.uk/cms/about/gaming/lans/music-servers/) that already
exists? This one tries to bring something new to the table:

* Seperation between web client and music/video playback. This allows the parts
  to be replaced or substituted out as required, and hopefully get to the point
  where the two could be run on seperate machines.

* Attempts to be incredibly simple - little to no JavaScript or over overly
  flashy things.

* Should be fully scriptable. Users should be able to `curl` URLs to the server
  if they so desire, and be able to get information back from the server with
  ease.

Running
-------

This will be updated more as the project goes on, but the project is written in
Perl. The web end makes use of the [Dancer2](http://perldancer.org) module.

License
-------

Licensing is under the [ISC License](https://en.wikipedia.org/wiki/ISC_license).
See the LICENSE file for full details.
