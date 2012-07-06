# Wordpress Kickstart

This is a complete collection of how I start developing on a wordpress-powered website.
It includes a default database dump, local/remote configuration for dandelion and 
all the fun and best practices from html5boilerplate etc. I heavily use compass and grunt,
have a look at the folder wp-content/themes/theme. Most pages I do are in german, 
thus the whole german stuff is included (hardcoded) and activated.

The database dump is in wp-content - be sure to delete it after importing. Default
base/home-URL is http://wordpress.dev, search and replace before importing if you
want sth. else. Default-User is admin and the password: 'password'. Change that, too!

I assume you have knowledge of setting up a local development environment
with Apache / MySQL and a virtual host for your project, and that you
have installed compass and node.js (for grunt).

## Installation

Fork this repository [https://github.com/nebelschwade/webgefrickel](https://github.com/nebelschwade/webgefrickel),
this is a collection of files I use globally in my projects, such as a custom normalize.css, some Javascript-libs etc.

Install grunt, grunt-compass, grunt-imagine and grunt-macreload if you
want to use the build-script included in the theme-folder. I highly recommend this!
You can install those packages globally, if you install them locally, remember
to change the last lines in the grunt.js file.

Change the `importPath`-variable at the top of the file wp-content/themes/theme/grunt.js 
file to where you forked the webgefrickel-repo to and add /js/.

Change the `add_import_path`-variable in wp-content/themes/theme/config.rb to 
where you forked the webgefrickel-repo to.

Run `grunt watch` in the theme folder. Uncomment or remove what you
don't need or don't like. Happy Coding!

## Deployment

In your theme folder, run `grunt deploy` to minify
your JavaScript files and CSS. After your have done that
you can use dandelion (a nice ruby-gem) for deployment,
a basic config is in the root dir of this project. Edit
that file, and run `dandelion deploy`. This does not deploy
your database - you will have to do that manually. Change
the file wp-config-remote.php for the remote-db-config.


## Basic recommended plugins (included) 

- [Add Lightbox & Title](http://wordpress.org/extend/plugins/add-lightbox-title/download/) -- does exacly what it says, for use with the herein included colorbox
- [All in One SEO Pack](http://wordpress.org/extend/plugins/all-in-one-seo-pack/) -- SEO, nice page titles etc.
- [Antispam Bee](http://wordpress.org/extend/plugins/antispam-bee/) -- If you have problems with spam. Free Akismet, kinda.
- [Google XML Sitemaps](http://wordpress.org/extend/plugins/google-sitemap-generator/) -- a nice sitemap generator for SEO
- [WP-Beautifier](http://wordpress.org/extend/plugins/wp-beautifier/) -- For better code output

## Credits

This would not have been possible without:

- [http://html5boilerplate.com/](http://html5boilerplate.com/)
- [http://modernizr.com](http://modernizr.com)
- [http://jquery.com](http://jquery.com)
- [http://colorpowered.com/colorbox/](http://colorpowered.com/colorbox/)
- [http://necolas.github.com/normalize.css/](http://necolas.github.com/normalize.css/)
- [https://github.com/asciidisco/grunt-imagine](https://github.com/asciidisco/grunt-imagine)
- [https://github.com/kahlil/grunt-compass](https://github.com/kahlil/grunt-compass)

... and many many others. Thanks a lot!
