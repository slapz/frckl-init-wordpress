<?php
/**
 * In dieser Datei werden die Grundeinstellungen für WordPress vorgenommen.
 *
 * Zu diesen Einstellungen gehören: MySQL-Zugangsdaten, Tabellenpräfix,
 * Secret-Keys, Sprache und ABSPATH. Mehr Informationen zur wp-config.php gibt es auf der {@link http://codex.wordpress.org/Editing_wp-config.php
 * wp-config.php editieren} Seite im Codex. Die Informationen für die MySQL-Datenbank bekommst du von deinem Webhoster.
 *
 * Diese Datei wird von der wp-config.php-Erzeugungsroutine verwendet. Sie wird ausgeführt, wenn noch keine wp-config.php (aber eine wp-config-sample.php) vorhanden ist,
 * und die Installationsroutine (/wp-admin/install.php) aufgerufen wird.
 * Man kann aber auch direkt in dieser Datei alle Eingaben vornehmen und sie von wp-config-sample.php in wp-config.php umbenennen und die Installation starten.
 *
 * @package WordPress
 */

/**  MySQL Einstellungen - diese Angaben bekommst du von deinem Webhoster. */
/**  Ersetze database_name_here mit dem Namen der Datenbank, die du verwenden möchtest. */
define('DB_NAME', '');

/** Ersetze username_here mit deinem MySQL-Datenbank-Benutzernamen */
define('DB_USER', '');

/** Ersetze password_here mit deinem MySQL-Passwort */
define('DB_PASSWORD', '');

/** Ersetze localhost mit der MySQL-Serveradresse */
define('DB_HOST', 'localhost');

/** Der Datenbankzeichensatz der beim Erstellen der Datenbanktabellen verwendet werden soll */
define('DB_CHARSET', 'utf8');

/** Der collate type sollte nicht geändert werden */
define('DB_COLLATE', '');

/** Slideshow Fuckage - Remove JS */
define('NGG_SKIP_LOAD_SCRIPTS', 'true');

/**#@+
 * Sicherheitsschlüssel
 *
 * Ändere jeden KEY in eine beliebige, möglichst einzigartige Phrase.
 * Auf der Seite {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service} kannst du dir alle KEYS generieren lassen.
 * Bitte trage für jeden KEY eine eigene Phrase ein. Du kannst die Schlüssel jederzeit wieder ändern, alle angemeldeten Benutzer müssen sich danach erneut anmelden.
 *
 * @seit 2.6.0
 */
define('AUTH_KEY',         '=DE}d+-Ki{Wmx)1;lBLlBjy:%R{>:2uIAq<,g;O=Q<VP_?4+5?D<xLp.gT|dBKy^');
define('SECURE_AUTH_KEY',  'o;X=GI^psLR|r%1vzb@B1kYB%py/?;?752a*ui$;&_lD3bF]!M/08O^//17Z_2_$');
define('LOGGED_IN_KEY',    'pj8-Gs,`7eFlqK+,.%7LupJlnuxR5`]K?s[B@LxUwy| gk/)jDKA(1vpb{xNSt|z');
define('NONCE_KEY',        '^[M5^hV vc:7W*|jFQWss00Yg[jgDOsa)G9qzjkmf<S$36yGT y0#&71Hj}^U=Nt');
define('AUTH_SALT',        '_u~O9`raM6Sd|Y#zE)X]9{8#x [5d;gp7L#1q!gM-yn8.+Uq=55q o?}gGxFv`>D');
define('SECURE_AUTH_SALT', 'H|?a^<frz~7mWKL=^hZ9k+fM2]#v  hKP5Cf[))M+`2#)+Kc9nGaIB_jeG|PD+N,');
define('LOGGED_IN_SALT',   'p?lpPiN.11y)3_$+052Hj_Xom,4+Hn{U.wbOI2j!6;qSIeZUw8~huamh6</gKd|z');
define('NONCE_SALT',       '-H0F+uJkZ6)@/^W{F2+LDA fV9$1D}`N:y[(,)Q[)M+IA4KTAkT-lgGdv7lIo!^8');

/**#@-*/

/**
 * WordPress Datenbanktabellen-Präfix
 *
 *  Wenn du verschiedene Präfixe benutzt, kannst du innerhalb einer Datenbank
 *  verschiedene WordPress-Installationen betreiben. Nur Zahlen, Buchstaben und Unterstriche bitte!
 */
$table_prefix  = 'wrdprss_';

/**
 * WordPress Sprachdatei
 *
 * Hier kannst du einstellen, welche Sprachdatei benutzt werden soll. Die entsprechende
 * Sprachdatei muss im Ordner wp-content/languages vorhanden sein, beispielsweise de_DE.mo
 * Wenn du nichts einträgst, wird Englisch genommen.
 */
define('WPLANG', 'de_DE');

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
