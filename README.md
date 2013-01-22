Header Code Encoder/Decoder Utility 
====================================

What we have here is a little Perl web application that uses [HTTP::Server::Simple] [1] to host a C-style header file constant definition decoder and encoder based on a local header file (you know, those **.h** files)

The project was created for a coworker who had to constantly open an enormous header file to hunt down constants. Chuck's xmas present which will hopefully save him some time.

The configuration file can be used to customize a few features. I'm sure that I'll add some other silly options later. It's a pretty self explanatory **.ini**-style format that uses [Config::Simple] [2] as a parser.  

Also included is a customary **.css** file which can be used to tweak basic appearance. Examination of the code should allow the hosting of other static files such as **.js**, etc.   

Features
---------

* decode **and** encode capability (simultaneously, woo!)
* comment filtering
* strict matching
* fun random quotes from [QuoteDB] [3]
* witty error messages including educational YouTube links

TODO
-----

* remote header code files
* access version controlled header files (SVN - I know, blasphemy)
* extract more inline styles to stylesheet

[1]: http://search.cpan.org/~jesse/HTTP-Server-Simple-0.44/lib/HTTP/Server/Simple.pm	"HTTP::Server::Simple"
[2]: http://search.cpan.org/~sherzodr/Config-Simple-4.59/Simple.pm "Config::Simple"
[3]: http://www.quotedb.com/	"QuoteDB"