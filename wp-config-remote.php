<?php
// your database on the remote server goes here
define('DB_NAME', '');
define('DB_USER', '');
define('DB_PASSWORD', '');
define('DB_HOST', 'localhost');
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', '');
$table_prefix  = 'wrdprss_';

define('WPLANG', 'de_DE');

// for automatic background updates define ftp-user and pass here
define('FTP_USER', '');
define('FTP_PASS', '');
define('FTP_HOST', '');

// define your home and siteul here rather than in the DB
define('WP_HOME', 'http://wordpress.live');
define('WP_SITEURL', 'http://wordpress.live');

// overwrite some of these values for increased security
define('AUTH_KEY',         '=DE}d+-Ki{Wmx)1;lBLlBj0293ujr0f2ij<,g;O=Q<VP_?4+5?D<xLp.gT|dBKy^');
define('SECURE_AUTH_KEY',  'o;X=GI^psLR|r%1vzb@B1kYB%py/?;?75)(@#$FJw0943bF]!M/08O^//17Z_2_$');
define('LOGGED_IN_KEY',    'pj8-Gs,`7eFlqK+,.%7LupJlnuxR5`]K?s[B@LxUwy|q0293jf0A(1vpb{xNSt|z');
define('NONCE_KEY',        '^[M5^hV vc:7W*|jFQWss00Yg[jgDOsa)G9qzjkmf<S$36yGT 2093rjHj}^U=Nt');
define('AUTH_SALT',        '_u~O9`raM6Sd|Y#zE)X]9{8#x [5d;gp7L#1q!2039jr.+Uq=55q o?}gGxFv`>D');
define('SECURE_AUTH_SALT', 'H|?a^<frz~7mWKL=^hZ9k+fM2]#v  hKP5Cf[))M+`2@#()JF@3aIB_jeG|PD+N,');
define('LOGGED_IN_SALT',   'p?lpPiN.11y)3_$+052H)@(#JF#+Hn{U.wbOI2j!6;qSIeZUw8~huamh6</gKd|z');
define('NONCE_SALT',       '-H0F+uJkZ6)@/^W{F2+LDA fV9)@(#FJWSE)(RS[)M+IA4KTAkT-lgGdv7lIo!^8');

// custom stuff and debuggung
define ('WPCF7_LOAD_JS', false ); // no contact form styles
define ('WPCF7_LOAD_CSS', false );
// define('NGG_SKIP_LOAD_SCRIPTS', 'true'); // no NGG styles

define('WP_POST_REVISIONS', false); // no post-revisions
define('AUTOSAVE_INTERVAL', 300); // autosave in seconds
define('WP_DEBUG', false);

// ============== DON'T EDIT BELOW ============== //
// ============================================== //

if (!defined('ABSPATH')) define('ABSPATH', dirname(__FILE__) . '/');
require_once(ABSPATH . 'wp-settings.php');
