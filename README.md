# Wordpress Kickstart

This is a complete collection of how I start developing on a wordpress-powered website.
It includes a default database dump, local/remote configuration for dandelion and 
all the fun and best practices from html5boilerplate. I will use scss from now on,
have a look at the theme-folder wp-content/themes. Most pages I do are in german, 
thus the whole german stuff is included/hardcoded and activated.

The database dump is in wp-content - be sure to delete it after importing. Default
base/home-URL is http://wordpress.dev, search and replace before importing if you
want sth. else. Default-User is admin and the password: 'password'.

## SCSS and compass

Fork this repository [https://github.com/nebelschwade/webgefrickel](https://github.com/nebelschwade/webgefrickel) 
and change the first line in wp-content/themes/theme/config.rb to where you forked it to. Start compass watch
on the theme-folder and you're ready to go.

## Basic recommended plugins (included) 

- [Theme Check](http://wordpress.org/extend/plugins/theme-check/) -- a plugin to check your theme for best practices and errors
- [Add Lightbox & Title](http://wordpress.org/extend/plugins/add-lightbox-title/download/) -- does exacly what it says, for use with the herein included colorbox
- [All in One SEO Pack](http://wordpress.org/extend/plugins/all-in-one-seo-pack/) -- SEO, nice page titles etc.
- [Antispam Bee](http://wordpress.org/extend/plugins/antispam-bee/) -- If you have problems with spam. Free Akismet, kinda.
- [Google XML Sitemaps](http://wordpress.org/extend/plugins/google-sitemap-generator/) -- a nice sitemap generator for SEO
- [WP-Beautifier](http://wordpress.org/extend/plugins/wp-beautifier/) -- For better code output
- [WP-PageNavi](http://wordpress.org/extend/plugins/wp-pagenavi/) -- A better page navigation

## Credits

This would not have been possible without:

- [http://html5boilerplate.com/](http://html5boilerplate.com/)
- [http://modernizr.com](http://modernizr.com)
- [http://jquery.com](http://jquery.com)
- [http://colorpowered.com/colorbox/](http://colorpowered.com/colorbox/)
- [http://necolas.github.com/normalize.css/](http://necolas.github.com/normalize.css/)

... and many many others. Thanks a lot, yeah.
