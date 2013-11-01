# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.13)
# Datenbank: _wordpress
# Erstellungsdauer: 2013-11-01 12:42:24 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Export von Tabelle wrdprss_commentmeta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wrdprss_commentmeta`;

CREATE TABLE `wrdprss_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Export von Tabelle wrdprss_comments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wrdprss_comments`;

CREATE TABLE `wrdprss_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext NOT NULL,
  `comment_author_email` varchar(100) NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) NOT NULL DEFAULT '',
  `comment_type` varchar(20) NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Export von Tabelle wrdprss_links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wrdprss_links`;

CREATE TABLE `wrdprss_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL DEFAULT '',
  `link_name` varchar(255) NOT NULL DEFAULT '',
  `link_image` varchar(255) NOT NULL DEFAULT '',
  `link_target` varchar(25) NOT NULL DEFAULT '',
  `link_description` varchar(255) NOT NULL DEFAULT '',
  `link_visible` varchar(20) NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) NOT NULL DEFAULT '',
  `link_notes` mediumtext NOT NULL,
  `link_rss` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Export von Tabelle wrdprss_options
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wrdprss_options`;

CREATE TABLE `wrdprss_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) NOT NULL DEFAULT 'yes',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `wrdprss_options` WRITE;
/*!40000 ALTER TABLE `wrdprss_options` DISABLE KEYS */;

INSERT INTO `wrdprss_options` (`option_id`, `option_name`, `option_value`, `autoload`)
VALUES
	(1,'siteurl','http://wordpress.dev','yes'),
	(2,'blogname','Wordpress','yes'),
	(3,'blogdescription','Ein weiterer WordPress-Blog','yes'),
	(4,'users_can_register','0','yes'),
	(5,'admin_email','kontakt@webgefrickel.de','yes'),
	(6,'start_of_week','1','yes'),
	(7,'use_balanceTags','1','yes'),
	(8,'use_smilies','','yes'),
	(9,'require_name_email','1','yes'),
	(10,'comments_notify','1','yes'),
	(11,'posts_per_rss','10','yes'),
	(12,'rss_use_excerpt','0','yes'),
	(13,'mailserver_url','','yes'),
	(14,'mailserver_login','','yes'),
	(15,'mailserver_pass','','yes'),
	(16,'mailserver_port','0','yes'),
	(17,'default_category','1','yes'),
	(18,'default_comment_status','closed','yes'),
	(19,'default_ping_status','closed','yes'),
	(20,'default_pingback_flag','1','yes'),
	(22,'posts_per_page','10','yes'),
	(23,'date_format','j. F Y','yes'),
	(24,'time_format','H:i','yes'),
	(25,'links_updated_date_format','d. F Y H:i','yes'),
	(26,'links_recently_updated_prepend','<em>','yes'),
	(27,'links_recently_updated_append','</em>','yes'),
	(28,'links_recently_updated_time','120','yes'),
	(29,'comment_moderation','1','yes'),
	(30,'moderation_notify','1','yes'),
	(31,'permalink_structure','/%year%/%monthnum%/%day%/%postname%/','yes'),
	(32,'gzipcompression','0','yes'),
	(33,'hack_file','0','yes'),
	(34,'blog_charset','utf-8','yes'),
	(35,'moderation_keys','','no'),
	(36,'active_plugins','a:10:{i:0;s:27:\"acf-gallery/acf-gallery.php\";i:1;s:37:\"acf-options-page/acf-options-page.php\";i:2;s:29:\"acf-repeater/acf-repeater.php\";i:4;s:41:\"add-lightbox-title/add-lightbox-title.php\";i:5;s:30:\"advanced-custom-fields/acf.php\";i:6;s:49:\"ajax-thumbnail-rebuild/ajax-thumbnail-rebuild.php\";i:7;s:43:\"all-in-one-seo-pack/all_in_one_seo_pack.php\";i:8;s:29:\"antispam-bee/antispam_bee.php\";i:10;s:37:\"tinymce-advanced/tinymce-advanced.php\";i:11;s:28:\"wp-beautifier/beautifier.php\";}','yes'),
	(37,'home','http://wordpress.dev','yes'),
	(38,'category_base','/kategorie','yes'),
	(39,'ping_sites','http://rpc.pingomatic.com/','yes'),
	(40,'advanced_edit','0','yes'),
	(41,'comment_max_links','2','yes'),
	(42,'gmt_offset','','yes'),
	(43,'default_email_category','1','yes'),
	(44,'recently_edited','','no'),
	(45,'template','theme','yes'),
	(46,'stylesheet','theme','yes'),
	(47,'comment_whitelist','1','yes'),
	(48,'blacklist_keys','','no'),
	(49,'comment_registration','1','yes'),
	(51,'html_type','text/html','yes'),
	(52,'use_trackback','0','yes'),
	(53,'default_role','subscriber','yes'),
	(54,'db_version','25824','yes'),
	(55,'uploads_use_yearmonth_folders','1','yes'),
	(56,'upload_path','','yes'),
	(57,'blog_public','1','yes'),
	(58,'default_link_category','2','yes'),
	(59,'show_on_front','page','yes'),
	(60,'tag_base','/schlagwort','yes'),
	(61,'show_avatars','0','yes'),
	(62,'avatar_rating','G','yes'),
	(63,'upload_url_path','','yes'),
	(64,'thumbnail_size_w','150','yes'),
	(65,'thumbnail_size_h','150','yes'),
	(66,'thumbnail_crop','1','yes'),
	(67,'medium_size_w','300','yes'),
	(68,'medium_size_h','300','yes'),
	(69,'avatar_default','mystery','yes'),
	(72,'large_size_w','1200','yes'),
	(73,'large_size_h','900','yes'),
	(74,'image_default_link_type','','yes'),
	(75,'image_default_size','','yes'),
	(76,'image_default_align','','yes'),
	(77,'close_comments_for_old_posts','1','yes'),
	(78,'close_comments_days_old','1','yes'),
	(79,'thread_comments','','yes'),
	(80,'thread_comments_depth','5','yes'),
	(81,'page_comments','','yes'),
	(82,'comments_per_page','50','yes'),
	(83,'default_comments_page','newest','yes'),
	(84,'comment_order','asc','yes'),
	(85,'sticky_posts','a:0:{}','yes'),
	(86,'widget_categories','a:2:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),
	(87,'widget_text','a:2:{i:2;a:0:{}s:12:\"_multiwidget\";i:1;}','yes'),
	(88,'widget_rss','a:2:{i:2;a:0:{}s:12:\"_multiwidget\";i:1;}','yes'),
	(89,'timezone_string','Europe/Berlin','yes'),
	(91,'embed_size_w','','yes'),
	(92,'embed_size_h','900','yes'),
	(93,'page_for_posts','0','yes'),
	(94,'page_on_front','3','yes'),
	(95,'default_post_format','','yes'),
	(96,'wrdprss_user_roles','a:5:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:62:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:9:\"add_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}}','yes'),
	(97,'widget_search','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),
	(98,'widget_recent-posts','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),
	(99,'widget_recent-comments','a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}','yes'),
	(100,'widget_archives','a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}','yes'),
	(101,'widget_meta','a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}','yes'),
	(102,'sidebars_widgets','a:3:{s:19:\"wp_inactive_widgets\";a:13:{i:0;s:7:\"pages-2\";i:1;s:10:\"calendar-2\";i:2;s:7:\"links-2\";i:3;s:6:\"text-2\";i:4;s:5:\"rss-2\";i:5;s:11:\"tag_cloud-2\";i:6;s:10:\"nav_menu-2\";i:7;s:8:\"search-2\";i:8;s:14:\"recent-posts-2\";i:9;s:17:\"recent-comments-2\";i:10;s:10:\"archives-2\";i:11;s:12:\"categories-2\";i:12;s:6:\"meta-2\";}s:7:\"sidebar\";N;s:13:\"array_version\";i:3;}','yes'),
	(103,'cron','a:5:{i:1383319098;a:3:{s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1383319107;a:1:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1383328800;a:1:{s:20:\"wp_maybe_auto_update\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1383393323;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}s:7:\"version\";i:2;}','yes'),
	(110,'widget_pages','a:2:{i:2;a:0:{}s:12:\"_multiwidget\";i:1;}','yes'),
	(111,'widget_calendar','a:2:{i:2;a:0:{}s:12:\"_multiwidget\";i:1;}','yes'),
	(112,'widget_links','a:2:{i:2;a:0:{}s:12:\"_multiwidget\";i:1;}','yes'),
	(113,'widget_tag_cloud','a:2:{i:2;a:0:{}s:12:\"_multiwidget\";i:1;}','yes'),
	(114,'widget_nav_menu','a:2:{i:2;a:0:{}s:12:\"_multiwidget\";i:1;}','yes'),
	(115,'widget_widget_twentyeleven_ephemera','a:2:{i:2;a:0:{}s:12:\"_multiwidget\";i:1;}','yes'),
	(118,'dashboard_widget_options','a:4:{s:25:\"dashboard_recent_comments\";a:1:{s:5:\"items\";i:5;}s:24:\"dashboard_incoming_links\";a:5:{s:4:\"home\";s:20:\"http://wordpress.dev\";s:4:\"link\";s:96:\"http://blogsearch.google.com/blogsearch?scoring=d&partner=wordpress&q=link:http://wordpress.dev/\";s:3:\"url\";s:129:\"http://blogsearch.google.com/blogsearch_feeds?scoring=d&ie=utf-8&num=10&output=rss&partner=wordpress&q=link:http://wordpress.dev/\";s:5:\"items\";i:10;s:9:\"show_date\";b:0;}s:17:\"dashboard_primary\";a:7:{s:4:\"link\";s:38:\"http://blog.wordpress-deutschland.org/\";s:3:\"url\";s:43:\"http://blog.wordpress-deutschland.org/feed/\";s:5:\"title\";s:14:\"WordPress-Blog\";s:5:\"items\";i:2;s:12:\"show_summary\";i:1;s:11:\"show_author\";i:0;s:9:\"show_date\";i:1;}s:19:\"dashboard_secondary\";a:7:{s:4:\"link\";s:41:\"http://channel.wordpress-deutschland.org/\";s:3:\"url\";s:58:\"http://channel.wordpress-deutschland.org/rss-dashboard.php\";s:5:\"title\";s:22:\"Weitere WordPress-News\";s:5:\"items\";i:5;s:12:\"show_summary\";i:0;s:11:\"show_author\";i:0;s:9:\"show_date\";i:0;}}','yes'),
	(155,'_transient_random_seed','ae4fc64c74115c7a60784af7fa771230','yes'),
	(158,'recently_activated','a:2:{s:53:\"background-update-tester/background-update-tester.php\";i:1383309720;s:46:\"acf-wordpress-wysiwyg-field/acf-wp_wysiwyg.php\";i:1383307096;}','yes'),
	(162,'theme_mods__DEFAULT','a:3:{i:0;b:0;s:18:\"nav_menu_locations\";a:1:{s:10:\"custom_nav\";i:3;}s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1333980501;s:4:\"data\";a:1:{s:19:\"wp_inactive_widgets\";a:13:{i:0;s:7:\"pages-2\";i:1;s:10:\"calendar-2\";i:2;s:7:\"links-2\";i:3;s:6:\"text-2\";i:4;s:5:\"rss-2\";i:5;s:11:\"tag_cloud-2\";i:6;s:10:\"nav_menu-2\";i:7;s:8:\"search-2\";i:8;s:14:\"recent-posts-2\";i:9;s:17:\"recent-comments-2\";i:10;s:10:\"archives-2\";i:11;s:12:\"categories-2\";i:12;s:6:\"meta-2\";}}}}','yes'),
	(163,'category_children','a:0:{}','yes'),
	(190,'theme_mods_matala','a:1:{i:0;b:0;}','yes'),
	(217,'nav_menu_options','a:2:{i:0;b:0;s:8:\"auto_add\";a:0:{}}','yes'),
	(250,'initial_db_version','18226','yes'),
	(251,'db_upgraded','','yes'),
	(256,'_site_transient_update_themes','O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1383307046;s:7:\"checked\";a:1:{s:5:\"theme\";s:3:\"2.0\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}}','yes'),
	(258,'wp_beautifier_indent_flag','1','yes'),
	(259,'wp_beautifier_comments_flag','0','yes'),
	(260,'wp_beautifier_quotes_flag','1','yes'),
	(261,'wp_beautifier_regexps_flag','1','yes'),
	(262,'wp_beautifier_feed_flag','1','yes'),
	(263,'wp_beautifier_feed_regexps_flag','0','yes'),
	(264,'wp_beautifier_ignored_tags','pre, script, textarea','yes'),
	(265,'wp_beautifier_ignored_attributes','onabort, onblur, onchange, onclick, ondblclick, onerror, onfocus, onkeydown, onkeypress, onkeyup, onload, onmousedown, onmousemove, onmouseout, onmouseover, onmouseup, onreset, onselect, onsubmit, onunload','yes'),
	(266,'wp_beautifier_regexps','# Remove all of WordPress\'s generator tags:\n~<meta name=(\"|\')generator(\"|\')[^>]+>|<generator.*?>.+?</generator>|<!-- generator=\".+?\" -->~\n\n# Un-comment to remove <link> tags which have the \"rel\" attribute: index, canonical, next or prev:\n# ~<link rel=(\"|\')(index|canonical|next|prev)(\"|\')[^>]+>~\n\n# Add you own regular expressions...\n# ~(unwanted string)~','yes'),
	(267,'_transient_plugins_delete_result_1','1','yes'),
	(271,'acf_version','4.2.2','yes'),
	(272,'antispam_bee','a:24:{s:9:\"flag_spam\";i:1;s:12:\"email_notify\";i:1;s:14:\"cronjob_enable\";i:0;s:16:\"cronjob_interval\";i:0;s:9:\"no_notice\";i:1;s:15:\"dashboard_count\";i:0;s:15:\"dashboard_chart\";i:1;s:14:\"advanced_check\";i:1;s:7:\"spam_ip\";i:1;s:17:\"already_commented\";i:1;s:14:\"always_allowed\";i:0;s:12:\"ignore_pings\";i:0;s:13:\"ignore_filter\";i:0;s:11:\"ignore_type\";i:1;s:14:\"ignore_reasons\";a:0:{}s:9:\"honey_pot\";i:0;s:9:\"honey_key\";s:0:\"\";s:12:\"country_code\";i:0;s:13:\"country_black\";s:0:\"\";s:13:\"country_white\";s:0:\"\";s:12:\"ipinfodb_key\";s:0:\"\";s:13:\"translate_api\";i:0;s:14:\"translate_lang\";s:2:\"de\";s:9:\"tab_index\";i:0;}','no'),
	(273,'aioseop_options','a:40:{s:9:\"aiosp_can\";s:2:\"on\";s:12:\"aiosp_donate\";s:2:\"on\";s:16:\"aiosp_home_title\";s:24:\"Wordpress — Untertitel\";s:22:\"aiosp_home_description\";s:22:\"Beschreibung der Seite\";s:19:\"aiosp_home_keywords\";s:18:\"Keyword1, Keyword2\";s:23:\"aiosp_max_words_excerpt\";s:0:\"\";s:20:\"aiosp_rewrite_titles\";s:2:\"on\";s:23:\"aiosp_post_title_format\";s:27:\"%post_title% | %blog_title%\";s:23:\"aiosp_page_title_format\";s:27:\"%page_title% | %blog_title%\";s:27:\"aiosp_category_title_format\";s:31:\"%category_title% | %blog_title%\";s:26:\"aiosp_archive_title_format\";s:21:\"%date% | %blog_title%\";s:22:\"aiosp_tag_title_format\";s:20:\"%tag% | %blog_title%\";s:25:\"aiosp_search_title_format\";s:23:\"%search% | %blog_title%\";s:24:\"aiosp_description_format\";s:13:\"%description%\";s:22:\"aiosp_404_title_format\";s:36:\"Nichts gefunden für %request_words%\";s:18:\"aiosp_paged_format\";s:15:\" - Seite %page%\";s:25:\"aiosp_google_analytics_id\";s:0:\"\";s:29:\"aiosp_ga_track_outbound_links\";s:0:\"\";s:20:\"aiosp_use_categories\";s:0:\"\";s:32:\"aiosp_dynamic_postspage_keywords\";s:2:\"on\";s:22:\"aiosp_category_noindex\";s:0:\"\";s:21:\"aiosp_archive_noindex\";s:0:\"\";s:18:\"aiosp_tags_noindex\";s:0:\"\";s:14:\"aiosp_cap_cats\";s:2:\"on\";s:27:\"aiosp_generate_descriptions\";s:0:\"\";s:16:\"aiosp_debug_info\";s:0:\"\";s:20:\"aiosp_post_meta_tags\";s:0:\"\";s:20:\"aiosp_page_meta_tags\";s:0:\"\";s:20:\"aiosp_home_meta_tags\";s:0:\"\";s:13:\"aiosp_enabled\";s:1:\"1\";s:17:\"aiosp_enablecpost\";s:2:\"on\";s:26:\"aiosp_use_tags_as_keywords\";s:2:\"on\";s:16:\"aiosp_seopostcol\";s:0:\"\";s:18:\"aiosp_seocustptcol\";s:0:\"\";s:21:\"aiosp_posttypecolumns\";a:3:{i:0;s:4:\"post\";i:1;s:4:\"page\";i:2;s:12:\"custom_thing\";}s:12:\"aiosp_do_log\";s:0:\"\";s:22:\"aiosp_google_publisher\";s:0:\"\";s:15:\"aiosp_ga_domain\";s:0:\"\";s:21:\"aiosp_front_meta_tags\";s:0:\"\";s:14:\"aiosp_ex_pages\";s:0:\"\";}','yes'),
	(337,'theme_switched','','yes'),
	(351,'current_theme','Default Minimal Theme','yes'),
	(352,'theme_mods_theme','a:2:{i:0;b:0;s:18:\"nav_menu_locations\";a:1:{s:10:\"custom_nav\";i:3;}}','yes'),
	(383,'uninstall_plugins','a:3:{i:0;b:0;s:25:\"wp-beautifier/options.php\";s:20:\"beautifier_uninstall\";s:29:\"antispam-bee/antispam_bee.php\";a:2:{i:0;s:12:\"Antispam_Bee\";i:1;s:9:\"uninstall\";}}','no'),
	(411,'theme_mods_minimal','a:2:{i:0;b:0;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1341505494;s:4:\"data\";a:2:{s:19:\"wp_inactive_widgets\";a:13:{i:0;s:7:\"pages-2\";i:1;s:10:\"calendar-2\";i:2;s:7:\"links-2\";i:3;s:6:\"text-2\";i:4;s:5:\"rss-2\";i:5;s:11:\"tag_cloud-2\";i:6;s:10:\"nav_menu-2\";i:7;s:8:\"search-2\";i:8;s:14:\"recent-posts-2\";i:9;s:17:\"recent-comments-2\";i:10;s:10:\"archives-2\";i:11;s:12:\"categories-2\";i:12;s:6:\"meta-2\";}s:7:\"sidebar\";N;}}}','yes'),
	(418,'theme_mods_twentyeleven','a:2:{i:0;b:0;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1341505589;s:4:\"data\";a:1:{s:19:\"wp_inactive_widgets\";a:13:{i:0;s:7:\"pages-2\";i:1;s:10:\"calendar-2\";i:2;s:7:\"links-2\";i:3;s:6:\"text-2\";i:4;s:5:\"rss-2\";i:5;s:11:\"tag_cloud-2\";i:6;s:10:\"nav_menu-2\";i:7;s:8:\"search-2\";i:8;s:14:\"recent-posts-2\";i:9;s:17:\"recent-comments-2\";i:10;s:10:\"archives-2\";i:11;s:12:\"categories-2\";i:12;s:6:\"meta-2\";}}}}','yes'),
	(555,'tadv_version','3420','yes'),
	(556,'tadv_plugins','a:1:{i:0;s:8:\"advimage\";}','yes'),
	(557,'tadv_options','a:7:{s:8:\"advlink1\";i:0;s:8:\"advimage\";i:1;s:11:\"editorstyle\";i:0;s:11:\"hideclasses\";i:0;s:11:\"contextmenu\";i:0;s:8:\"no_autop\";i:0;s:7:\"advlist\";i:0;}','yes'),
	(558,'tadv_toolbars','a:4:{s:9:\"toolbar_1\";a:16:{i:0;s:12:\"formatselect\";i:1;s:11:\"styleselect\";i:2;s:10:\"separator3\";i:3;s:4:\"bold\";i:4;s:6:\"italic\";i:5;s:3:\"sup\";i:6;s:3:\"sub\";i:7;s:10:\"blockquote\";i:8;s:10:\"separator1\";i:9;s:7:\"bullist\";i:10;s:7:\"numlist\";i:11;s:7:\"outdent\";i:12;s:6:\"indent\";i:13;s:10:\"separator2\";i:14;s:4:\"link\";i:15;s:6:\"unlink\";}s:9:\"toolbar_2\";a:0:{}s:9:\"toolbar_3\";a:0:{}s:9:\"toolbar_4\";a:0:{}}','no'),
	(559,'tadv_btns1','a:16:{i:0;s:12:\"formatselect\";i:1;s:11:\"styleselect\";i:2;s:9:\"separator\";i:3;s:4:\"bold\";i:4;s:6:\"italic\";i:5;s:3:\"sup\";i:6;s:3:\"sub\";i:7;s:10:\"blockquote\";i:8;s:9:\"separator\";i:9;s:7:\"bullist\";i:10;s:7:\"numlist\";i:11;s:7:\"outdent\";i:12;s:6:\"indent\";i:13;s:9:\"separator\";i:14;s:4:\"link\";i:15;s:6:\"unlink\";}','no'),
	(560,'tadv_btns2','a:0:{}','no'),
	(561,'tadv_btns3','a:0:{}','no'),
	(562,'tadv_btns4','a:0:{}','no'),
	(563,'tadv_allbtns','a:66:{i:0;s:2:\"hr\";i:1;s:6:\"wp_adv\";i:2;s:10:\"blockquote\";i:3;s:4:\"bold\";i:4;s:6:\"italic\";i:5;s:13:\"strikethrough\";i:6;s:9:\"underline\";i:7;s:7:\"bullist\";i:8;s:7:\"numlist\";i:9;s:7:\"outdent\";i:10;s:6:\"indent\";i:11;s:11:\"justifyleft\";i:12;s:13:\"justifycenter\";i:13;s:12:\"justifyright\";i:14;s:11:\"justifyfull\";i:15;s:3:\"cut\";i:16;s:4:\"copy\";i:17;s:5:\"paste\";i:18;s:4:\"link\";i:19;s:6:\"unlink\";i:20;s:5:\"image\";i:21;s:7:\"wp_more\";i:22;s:7:\"wp_page\";i:23;s:6:\"search\";i:24;s:7:\"replace\";i:25;s:10:\"fontselect\";i:26;s:14:\"fontsizeselect\";i:27;s:7:\"wp_help\";i:28;s:10:\"fullscreen\";i:29;s:11:\"styleselect\";i:30;s:12:\"formatselect\";i:31;s:9:\"forecolor\";i:32;s:9:\"backcolor\";i:33;s:9:\"pastetext\";i:34;s:9:\"pasteword\";i:35;s:12:\"removeformat\";i:36;s:7:\"cleanup\";i:37;s:12:\"spellchecker\";i:38;s:7:\"charmap\";i:39;s:5:\"print\";i:40;s:4:\"undo\";i:41;s:4:\"redo\";i:42;s:13:\"tablecontrols\";i:43;s:4:\"cite\";i:44;s:3:\"ins\";i:45;s:3:\"del\";i:46;s:4:\"abbr\";i:47;s:7:\"acronym\";i:48;s:7:\"attribs\";i:49;s:5:\"layer\";i:50;s:5:\"advhr\";i:51;s:4:\"code\";i:52;s:11:\"visualchars\";i:53;s:11:\"nonbreaking\";i:54;s:3:\"sub\";i:55;s:3:\"sup\";i:56;s:9:\"visualaid\";i:57;s:10:\"insertdate\";i:58;s:10:\"inserttime\";i:59;s:6:\"anchor\";i:60;s:10:\"styleprops\";i:61;s:8:\"emotions\";i:62;s:5:\"media\";i:63;s:7:\"iespell\";i:64;s:9:\"separator\";i:65;s:1:\"|\";}','no'),
	(634,'link_manager_enabled','0','yes'),
	(880,'_site_transient_timeout_browser_a39e29ef31ef04f96f54107c93e81c27','1383756198','yes'),
	(881,'_site_transient_browser_a39e29ef31ef04f96f54107c93e81c27','a:9:{s:8:\"platform\";s:9:\"Macintosh\";s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:13:\"30.0.1599.101\";s:10:\"update_url\";s:28:\"http://www.google.com/chrome\";s:7:\"img_src\";s:49:\"http://s.wordpress.org/images/browsers/chrome.png\";s:11:\"img_src_ssl\";s:48:\"https://wordpress.org/images/browsers/chrome.png\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;}','yes'),
	(888,'rewrite_rules','a:72:{s:48:\"kategorie/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:43:\"kategorie/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:36:\"kategorie/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:18:\"kategorie/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:51:\"schlagwort/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:46:\"schlagwort/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"schlagwort/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:21:\"schlagwort/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:12:\"robots\\.txt$\";s:18:\"index.php?robots=1\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:38:\"index.php?&page_id=3&cpage=$matches[1]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:58:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:68:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:88:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:85:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1\";s:77:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:65:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(/[0-9]+)?/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]\";s:47:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:57:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:77:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]\";s:51:\"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]\";s:38:\"([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&cpage=$matches[2]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:20:\"(.?.+?)(/[0-9]+)?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";}','yes'),
	(889,'_site_transient_update_core','O:8:\"stdClass\":4:{s:7:\"updates\";a:2:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:49:\"http://de.wordpress.org/wordpress-3.7.1-de_DE.zip\";s:6:\"locale\";s:5:\"de_DE\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:49:\"http://de.wordpress.org/wordpress-3.7.1-de_DE.zip\";s:10:\"no_content\";b:0;s:11:\"new_bundled\";b:0;s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"3.7.1\";s:7:\"version\";s:5:\"3.7.1\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"3.6\";s:15:\"partial_version\";s:0:\"\";}i:1;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:41:\"https://wordpress.org/wordpress-3.7.1.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:41:\"https://wordpress.org/wordpress-3.7.1.zip\";s:10:\"no_content\";s:52:\"https://wordpress.org/wordpress-3.7.1-no-content.zip\";s:11:\"new_bundled\";s:53:\"https://wordpress.org/wordpress-3.7.1-new-bundled.zip\";s:7:\"partial\";b:0;s:8:\"rollback\";b:0;}s:7:\"current\";s:5:\"3.7.1\";s:7:\"version\";s:5:\"3.7.1\";s:11:\"php_version\";s:5:\"5.2.4\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"3.6\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1383307042;s:15:\"version_checked\";s:5:\"3.7.1\";s:12:\"translations\";a:0:{}}','yes'),
	(890,'rss_language','de','yes'),
	(891,'can_compress_scripts','1','yes'),
	(892,'_site_transient_update_plugins','O:8:\"stdClass\":4:{s:12:\"last_checked\";i:1383307044;s:7:\"checked\";a:19:{s:41:\"add-lightbox-title/add-lightbox-title.php\";s:3:\"1.5\";s:33:\"admin-menu-editor/menu-editor.php\";s:3:\"1.3\";s:30:\"advanced-custom-fields/acf.php\";s:5:\"4.2.2\";s:27:\"acf-gallery/acf-gallery.php\";s:5:\"1.1.0\";s:37:\"acf-options-page/acf-options-page.php\";s:5:\"1.2.0\";s:29:\"acf-repeater/acf-repeater.php\";s:5:\"1.0.1\";s:46:\"acf-wordpress-wysiwyg-field/acf-wp_wysiwyg.php\";s:5:\"1.0.0\";s:49:\"ajax-thumbnail-rebuild/ajax-thumbnail-rebuild.php\";s:4:\"1.09\";s:43:\"all-in-one-seo-pack/all_in_one_seo_pack.php\";s:5:\"2.0.4\";s:29:\"antispam-bee/antispam_bee.php\";s:5:\"2.5.9\";s:53:\"background-update-tester/background-update-tester.php\";s:3:\"1.1\";s:25:\"duplicator/duplicator.php\";s:5:\"0.4.6\";s:36:\"google-sitemap-generator/sitemap.php\";s:3:\"3.3\";s:29:\"gravityforms/gravityforms.php\";s:5:\"1.7.9\";s:29:\"image-widget/image-widget.php\";s:5:\"4.0.8\";s:38:\"post-duplicator/m4c-postduplicator.php\";s:3:\"2.3\";s:48:\"welcome-email-editor/sb_welcome_email_editor.php\";s:3:\"3.9\";s:37:\"tinymce-advanced/tinymce-advanced.php\";s:5:\"3.5.9\";s:28:\"wp-beautifier/beautifier.php\";s:5:\"1.3.1\";}s:8:\"response\";a:0:{}s:12:\"translations\";a:0:{}}','yes'),
	(897,'_site_transient_timeout_theme_roots','1383308845','yes'),
	(898,'_site_transient_theme_roots','a:1:{s:5:\"theme\";s:7:\"/themes\";}','yes'),
	(899,'_transient_timeout_feed_0234f6c28c3459442b82c8845e2f17f7','1383350249','no'),
	(900,'_transient_feed_0234f6c28c3459442b82c8845e2f17f7','a:4:{s:5:\"child\";a:1:{s:0:\"\";a:1:{s:3:\"rss\";a:1:{i:0;a:6:{s:4:\"data\";s:4:\"\n  \n\";s:7:\"attribs\";a:1:{s:0:\"\";a:1:{s:7:\"version\";s:3:\"2.0\";}}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:1:{s:0:\"\";a:1:{s:7:\"channel\";a:1:{i:0;a:6:{s:4:\"data\";s:83:\"\n    \n    \n    \n    \n    \n    \n    \n    \n    \n    \n    \n    \n    \n    \n    \n    \n  \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:4:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:47:\"link:http://wordpress.dev/ - Google Blog Search\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:84:\"http://www.google.com/search?ie=utf-8&q=link:http://wordpress.dev/&tbm=blg&tbs=sbd:1\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:23:\"About 3,980,000 results\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"item\";a:10:{i:0;a:6:{s:4:\"data\";s:47:\"\n      \n      \n      \n      \n      \n      \n    \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:3:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:103:\"New Firmware 3.1.11 in download section - VRBRAIN - &lt;b&gt;WordPress&lt;/b&gt; &lt;b&gt;...&lt;/b&gt;\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:80:\"http://vrbrain.wordpress.com/2013/11/01/new-firmware-3-1-11-in-download-section/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:319:\"<b>...</b> log download Yellow led on board now show Scheduler activity. Please upgrade to this release following this <em>link</em>.… <b>...</b> Download &middot; Version 3.1 &middot; Version 2.9.1.2 &middot; <em>Development</em> tools &middot; Installing <em>development</em> tools &middot; Compiling VR Brain code.\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:3:{s:9:\"publisher\";a:1:{i:0;a:5:{s:4:\"data\";s:7:\"VRBRAIN\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:16:\"emilecastelnuovo\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"date\";a:1:{i:0;a:5:{s:4:\"data\";s:29:\"Fri, 01 Nov 2013 11:46:31 GMT\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:1;a:6:{s:4:\"data\";s:47:\"\n      \n      \n      \n      \n      \n      \n    \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:3:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:106:\"A moderna gestão doentia - Osdilson Amorim Oliveira - &lt;b&gt;WordPress&lt;/b&gt; &lt;b&gt;...&lt;/b&gt;\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:66:\"http://osdilson.wordpress.com/2013/11/01/a-moderna-gestao-doentia/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:269:\"<b>...</b> nas últimas décadas. E segue a passos firmes. Em breve, estará em mais uma empresa, organização estatal ou ONG perto de você! Fonte: <em>http</em>://www.cartacapital.com.br/revista/772/management-doentio-6717.html (acesso em 31/10/2013)&nbsp;<b>...</b>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:3:{s:9:\"publisher\";a:1:{i:0;a:5:{s:4:\"data\";s:24:\"Osdilson Amorim Oliveira\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:8:\"osdilson\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"date\";a:1:{i:0;a:5:{s:4:\"data\";s:29:\"Fri, 01 Nov 2013 11:24:01 GMT\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:2;a:6:{s:4:\"data\";s:47:\"\n      \n      \n      \n      \n      \n      \n    \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:3:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:81:\"lenin 1922 lettera al congresso - RCpanic Blog - &lt;b&gt;WordPress&lt;/b&gt;.com\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:72:\"http://rcpanic.wordpress.com/2013/11/01/lenin-1922-lettera-al-congresso/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:259:\"tutto il lavoro <em>dev</em>&#39;essere diretto al suo miglioramento . La mia idea è che alcune decine di operai, entrando a far parte del CC, possono accingersi meglio di qualsiasi altro alla verifica, al miglioramento e al rinnovamento del nostro apparato.\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:3:{s:9:\"publisher\";a:1:{i:0;a:5:{s:4:\"data\";s:12:\"RCpanic Blog\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:7:\"rcpanic\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"date\";a:1:{i:0;a:5:{s:4:\"data\";s:29:\"Fri, 01 Nov 2013 10:53:43 GMT\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:3;a:6:{s:4:\"data\";s:47:\"\n      \n      \n      \n      \n      \n      \n    \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:3:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:54:\"Lenovo IdeaPad z500 vs Linux Debian 7 | Words are DUST\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:83:\"http://wordsaredust.wordpress.com/2013/11/01/lenovo-ideapad-z500-vs-linux-debian-7/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:365:\"See the following <em>link</em> for details: # <em>http</em>://who-t.blogspot.com/2010/11/how-t ... rrors.html MatchDevicePath &quot;/<em>dev</em>/input/event*&quot; Option &quot;TapButton1&quot; &quot;1&quot; Option &quot;TapButton2&quot; &quot;2&quot; Option &quot;TapButton3&quot; &quot;3&quot; Option &quot;ClickPad&quot; &quot;true&quot; Option&nbsp;<b>...</b>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:3:{s:9:\"publisher\";a:1:{i:0;a:5:{s:4:\"data\";s:14:\"Words are DUST\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:12:\"wordsaredust\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"date\";a:1:{i:0;a:5:{s:4:\"data\";s:29:\"Fri, 01 Nov 2013 09:05:42 GMT\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:4;a:6:{s:4:\"data\";s:47:\"\n      \n      \n      \n      \n      \n      \n    \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:3:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:92:\"herbal alternative %20warning - Τεχνολογικό Πανεπιστήμιο Κύπρου\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:39:\"http://cis.cut.ac.cy/wordpress/?p=12073\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:284:\"<em>dev</em>.comlounge.net gav memberdata portal portrait xanax dermolan para humanos &middot; Buy Discount Effexor Online <b>...</b> cheap <em>link</em> onlinemoveto byt 100 mg &middot; Buy Discount Sumycin Online <b>...</b> 2013 CISWordPress. Powered by <em>WordPress</em> and News.\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:3:{s:9:\"publisher\";a:1:{i:0;a:5:{s:4:\"data\";s:12:\"CISWordPress\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:8:\"Francosy\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"date\";a:1:{i:0;a:5:{s:4:\"data\";s:29:\"Fri, 01 Nov 2013 06:32:53 GMT\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:5;a:6:{s:4:\"data\";s:47:\"\n      \n      \n      \n      \n      \n      \n    \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:3:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:125:\"Happy With Freedom Life: [How To] ทำ Twitter Card ให้บล็อกหรือเว็บ &lt;b&gt;...&lt;/b&gt;\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:76:\"http://happyfreedomcreation.blogspot.com/2013/11/twitter-card-validator.html\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:1019:\"วิธีติดตั้ง Twitter Card ให้ <em>WordPress http</em>://t.co/5hVp9WLpzS via @9tana <b>...</b> แล้วเข้าไปที่ <em>https</em>://<em>dev</em>.twitter.com/docs/cards/validation/validator เพื่อทำการขอ Twitter Card สำหรับเว็บเราด้วยกัน <b>...</b> เพื่อบอกรายละเอียดของสินค้าได้; Photo Card : จะคล้ายๆ กับ Summary Card แต่จะแสดงเฉพาะรูปภาพ ชื่อรูป และ Twitter Account เท่านั้น; Large Image Summary Card : เหมือนกับ Summary Card ทุกประการ เพียงแค่รูปใหญ่เต็มตากว่าเดิม; Player Card : สามารถนำ <em>URL</em> ของไฟล์ที่จะสตรีมมิ่ง หรือ Embedded iframe เข้ามาเลย &nbsp;<b>...</b>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:3:{s:9:\"publisher\";a:1:{i:0;a:5:{s:4:\"data\";s:23:\"Happy With Freedom Life\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:22:\"Alongkon Am-mawongchit\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"date\";a:1:{i:0;a:5:{s:4:\"data\";s:29:\"Fri, 01 Nov 2013 05:57:00 GMT\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:6;a:6:{s:4:\"data\";s:47:\"\n      \n      \n      \n      \n      \n      \n    \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:3:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:26:\"Kasia Domanska - Feedgrids\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:49:\"http://feedgrids.com/source/sweet-station/p116771\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:533:\"Welcome to THE ultimate resource for creatives. Up-to-the-minute updates from over 180 of your favorite design/<em>dev</em>/photo blogs around the web, all in one place... Stay a while! <b>...</b> In Inspiration, by Sweet Station, October 31, 2013. Can you feel it ? That sudden chill from the beyond? Fill the silicone Boo Cubes tray with water, freeze, and release the spirits. Each tray makes 8 icy apparitions. Use this spooky tray to make gelatin treats too! <em>Link</em> here. Continue reading at Sweet Station&nbsp;<b>...</b>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:3:{s:9:\"publisher\";a:1:{i:0;a:5:{s:4:\"data\";s:25:\"Feedgrids.com Global Feed\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:21:\"connect@feedgrids.com\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"date\";a:1:{i:0;a:5:{s:4:\"data\";s:29:\"Fri, 01 Nov 2013 05:55:37 GMT\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:7;a:6:{s:4:\"data\";s:47:\"\n      \n      \n      \n      \n      \n      \n    \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:3:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:83:\"Free Softies Icons by ElegantThemes | Webbuds - Web &lt;b&gt;Dev&lt;/b&gt; Services\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:54:\"http://webbuds.fr/free-softies-icons-by-elegantthemes/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:611:\"Webbuds - Web <em>Dev</em> Services. Développements et Services Internet. Prestations. Interventions. Création website &middot; Extension website &middot; Web TV &middot; Optimisation website &middot; Sécurité website &middot; Performance website &middot; Référencement website. Suivis. Maintenance website &middot; Portfolio &middot; Contact; Informations. Société &middot; Compétences &middot; Devis &middot; Blog &middot; Annuaires &middot; Rss <b>...</b> Références. bijoux commerce culture mosaïque news peinture photographe spip sport tv videos <em>wordpress</em> électronique&nbsp;<b>...</b>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:3:{s:9:\"publisher\";a:1:{i:0;a:5:{s:4:\"data\";s:26:\"Webbuds - Web Dev Services\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:6:\"webbud\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"date\";a:1:{i:0;a:5:{s:4:\"data\";s:29:\"Fri, 01 Nov 2013 05:46:46 GMT\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:8;a:6:{s:4:\"data\";s:47:\"\n      \n      \n      \n      \n      \n      \n    \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:3:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:84:\"How To Growing A Mailing List Or Email Subscription With Best &lt;b&gt;...&lt;/b&gt;\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:116:\"http://wordpressmind.com/how-to-growing-a-mailing-list-or-email-subscription-with-best-newsletter-wordpress-plugins/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:533:\"We created you a list of 7 Best Premium &amp; Free newsletter <em>WordPress</em> plugins which will turn your site to professional and powerful tool for a growing mailing list. <b>...</b> export of subscribers – WYSIWYG editor for your emails – Quick-start Guide plus the comprehensive User Manual – Double opt-in confirmation <em>link</em> to new members – Automatic unsubscribe <em>link</em> in every email – Widgets so people can subscribe to your newsletters – Shortcodes to embed the opt-in form into pages and post.\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:3:{s:9:\"publisher\";a:1:{i:0;a:5:{s:4:\"data\";s:21:\"Wordpress Lovers Site\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:9:\"putracode\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"date\";a:1:{i:0;a:5:{s:4:\"data\";s:29:\"Fri, 01 Nov 2013 02:45:50 GMT\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}i:9;a:6:{s:4:\"data\";s:47:\"\n      \n      \n      \n      \n      \n      \n    \";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";s:5:\"child\";a:2:{s:0:\"\";a:3:{s:5:\"title\";a:1:{i:0;a:5:{s:4:\"data\";s:76:\"10+ Interesting Web &lt;b&gt;Dev&lt;/b&gt; Finds – October 2013 | jQuery4u\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"link\";a:1:{i:0;a:5:{s:4:\"data\";s:73:\"http://www.jquery4u.com/random/10-interesting-web-dev-finds-october-2013/\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:11:\"description\";a:1:{i:0;a:5:{s:4:\"data\";s:574:\"1. BladeRunnerJS. (BRJS) is a <em>development</em> tool kit and lightweight framework for building modular large-scale HTML5 single page web apps. BladeRunner-JS.jpg &middot; Source <b>...</b> 8. <em>Link</em> Anatomy. <em>Link</em> anatomy. <em>Link</em>-Anatomy.jpg &middot; Source <b>...</b> It is a lightweight PHP class for detecting mobile devices (including tablets). It uses the User-Agent string combined with specific <em>HTTP</em> headers to detect the mobile environment. Mobile-Detect.jpg &middot; SourceDemo. AUTHOR: Sam Deering. Find out more &nbsp;<b>...</b>\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}s:32:\"http://purl.org/dc/elements/1.1/\";a:3:{s:9:\"publisher\";a:1:{i:0;a:5:{s:4:\"data\";s:8:\"jQuery4u\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:7:\"creator\";a:1:{i:0;a:5:{s:4:\"data\";s:11:\"Sam Deering\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:4:\"date\";a:1:{i:0;a:5:{s:4:\"data\";s:29:\"Fri, 01 Nov 2013 00:50:36 GMT\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}}}s:36:\"http://a9.com/-/spec/opensearch/1.1/\";a:3:{s:12:\"totalResults\";a:1:{i:0;a:5:{s:4:\"data\";s:7:\"3980000\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:10:\"startIndex\";a:1:{i:0;a:5:{s:4:\"data\";s:1:\"1\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}s:12:\"itemsPerPage\";a:1:{i:0;a:5:{s:4:\"data\";s:2:\"10\";s:7:\"attribs\";a:0:{}s:8:\"xml_base\";s:0:\"\";s:17:\"xml_base_explicit\";b:0;s:8:\"xml_lang\";s:0:\"\";}}}}}}}}}}}}s:4:\"type\";i:128;s:7:\"headers\";a:10:{s:12:\"content-type\";s:28:\"text/xml; charset=ISO-8859-1\";s:4:\"date\";s:29:\"Fri, 01 Nov 2013 11:57:28 GMT\";s:7:\"expires\";s:2:\"-1\";s:13:\"cache-control\";s:18:\"private, max-age=0\";s:10:\"set-cookie\";a:2:{i:0;s:143:\"PREF=ID=5e8593dd6c0724da:FF=0:TM=1383307048:LM=1383307048:S=xjH4nCXwpgnGAaWL; expires=Sun, 01-Nov-2015 11:57:28 GMT; path=/; domain=.google.com\";i:1;s:212:\"NID=67=lLLsu30POifgyeHo3mSH-fvcSC-eXF51VIqOeSx5sgwBjyzhs7hf595khmR20s8MZDG44o-bVRFgWmm3SYLvU5CGgfB-qIEh10CSsrloOeibyzTfzYLbHxx8AqOKVCcQ; expires=Sat, 03-May-2014 11:57:28 GMT; path=/; domain=.google.com; HttpOnly\";}s:3:\"p3p\";s:122:\"CP=\"This is not a P3P policy! See http://www.google.com/support/accounts/bin/answer.py?hl=en&answer=151657 for more info.\"\";s:6:\"server\";s:3:\"gws\";s:16:\"x-xss-protection\";s:13:\"1; mode=block\";s:15:\"x-frame-options\";s:10:\"SAMEORIGIN\";s:18:\"alternate-protocol\";s:7:\"80:quic\";}s:5:\"build\";s:14:\"20131030164356\";}','no'),
	(901,'_transient_timeout_feed_mod_0234f6c28c3459442b82c8845e2f17f7','1383350249','no'),
	(902,'_transient_feed_mod_0234f6c28c3459442b82c8845e2f17f7','1383307049','no'),
	(903,'_transient_timeout_dash_20494a3d90a6669585674ed0eb8dcd8f','1383350249','no'),
	(904,'_transient_dash_20494a3d90a6669585674ed0eb8dcd8f','<ul>\n	<li><strong>emilecastelnuovo</strong> verlinkt hierher in dem <a href=\"http://vrbrain.wordpress.com/2013/11/01/new-firmware-3-1-11-in-download-section/\">Beitrag</a>, \"... log download Yellow led on board now show Sche &hellip;\"</li>\n	<li><strong>osdilson</strong> verlinkt hierher in dem <a href=\"http://osdilson.wordpress.com/2013/11/01/a-moderna-gestao-doentia/\">Beitrag</a>, \"... nas últimas décadas. E segue a passos firmes. &hellip;\"</li>\n	<li><strong>rcpanic</strong> verlinkt hierher in dem <a href=\"http://rcpanic.wordpress.com/2013/11/01/lenin-1922-lettera-al-congresso/\">Beitrag</a>, \"tutto il lavoro dev&#039;essere diretto al suo mig &hellip;\"</li>\n	<li><strong>wordsaredust</strong> verlinkt hierher in dem <a href=\"http://wordsaredust.wordpress.com/2013/11/01/lenovo-ideapad-z500-vs-linux-debian-7/\">Beitrag</a>, \"See the following link for details: # http://who-t &hellip;\"</li>\n	<li><strong>Francosy</strong> verlinkt hierher in dem <a href=\"http://cis.cut.ac.cy/wordpress/?p=12073\">Beitrag</a>, \"dev.comlounge.net gav memberdata portal portrait x &hellip;\"</li>\n	<li><strong>Alongkon Am-mawongchit</strong> verlinkt hierher in dem <a href=\"http://happyfreedomcreation.blogspot.com/2013/11/twitter-card-validator.html\">Beitrag</a>, \"วิธีติดตั้ง Twitter Card ให้ WordPress http://t.co &hellip;\"</li>\n	<li><strong>connect@feedgrids.com</strong> verlinkt hierher in dem <a href=\"http://feedgrids.com/source/sweet-station/p116771\">Beitrag</a>, \"Welcome to THE ultimate resource for creatives. Up &hellip;\"</li>\n	<li><strong>webbud</strong> verlinkt hierher in dem <a href=\"http://webbuds.fr/free-softies-icons-by-elegantthemes/\">Beitrag</a>, \"Webbuds - Web Dev Services. Développements et Serv &hellip;\"</li>\n	<li><strong>putracode</strong> verlinkt hierher in dem <a href=\"http://wordpressmind.com/how-to-growing-a-mailing-list-or-email-subscription-with-best-newsletter-wordpress-plugins/\">Beitrag</a>, \"We created you a list of 7 Best Premium &amp; Free &hellip;\"</li>\n	<li><strong>Sam Deering</strong> verlinkt hierher in dem <a href=\"http://www.jquery4u.com/random/10-interesting-web-dev-finds-october-2013/\">Beitrag</a>, \"1. BladeRunnerJS. (BRJS) is a development tool kit &hellip;\"</li>\n</ul>\n','no'),
	(905,'_transient_timeout_plugin_slugs','1383396128','no'),
	(906,'_transient_plugin_slugs','a:16:{i:0;s:41:\"add-lightbox-title/add-lightbox-title.php\";i:1;s:33:\"admin-menu-editor/menu-editor.php\";i:2;s:30:\"advanced-custom-fields/acf.php\";i:3;s:27:\"acf-gallery/acf-gallery.php\";i:4;s:37:\"acf-options-page/acf-options-page.php\";i:5;s:29:\"acf-repeater/acf-repeater.php\";i:6;s:49:\"ajax-thumbnail-rebuild/ajax-thumbnail-rebuild.php\";i:7;s:43:\"all-in-one-seo-pack/all_in_one_seo_pack.php\";i:8;s:29:\"antispam-bee/antispam_bee.php\";i:9;s:36:\"google-sitemap-generator/sitemap.php\";i:10;s:29:\"gravityforms/gravityforms.php\";i:11;s:29:\"image-widget/image-widget.php\";i:12;s:38:\"post-duplicator/m4c-postduplicator.php\";i:13;s:48:\"welcome-email-editor/sb_welcome_email_editor.php\";i:14;s:37:\"tinymce-advanced/tinymce-advanced.php\";i:15;s:28:\"wp-beautifier/beautifier.php\";}','no');

/*!40000 ALTER TABLE `wrdprss_options` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle wrdprss_postmeta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wrdprss_postmeta`;

CREATE TABLE `wrdprss_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `wrdprss_postmeta` WRITE;
/*!40000 ALTER TABLE `wrdprss_postmeta` DISABLE KEYS */;

INSERT INTO `wrdprss_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`)
VALUES
	(1,2,'_edit_last','1'),
	(2,2,'_edit_lock','1357588905:1'),
	(3,2,'_wp_page_template','default'),
	(4,3,'_edit_last','1'),
	(5,3,'_edit_lock','1355349476:1'),
	(6,3,'_wp_page_template','default'),
	(7,9,'_menu_item_type','post_type'),
	(8,9,'_menu_item_menu_item_parent','0'),
	(9,9,'_menu_item_object_id','3'),
	(10,9,'_menu_item_object','page'),
	(11,9,'_menu_item_target',''),
	(12,9,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
	(13,9,'_menu_item_xfn',''),
	(14,9,'_menu_item_url',''),
	(16,10,'_menu_item_type','post_type'),
	(17,10,'_menu_item_menu_item_parent','0'),
	(18,10,'_menu_item_object_id','2'),
	(19,10,'_menu_item_object','page'),
	(20,10,'_menu_item_target',''),
	(21,10,'_menu_item_classes','a:1:{i:0;s:0:\"\";}'),
	(22,10,'_menu_item_xfn',''),
	(23,10,'_menu_item_url','');

/*!40000 ALTER TABLE `wrdprss_postmeta` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle wrdprss_posts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wrdprss_posts`;

CREATE TABLE `wrdprss_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext NOT NULL,
  `post_title` text NOT NULL,
  `post_excerpt` text NOT NULL,
  `post_status` varchar(20) NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) NOT NULL DEFAULT 'open',
  `post_password` varchar(20) NOT NULL DEFAULT '',
  `post_name` varchar(200) NOT NULL DEFAULT '',
  `to_ping` text NOT NULL,
  `pinged` text NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `wrdprss_posts` WRITE;
/*!40000 ALTER TABLE `wrdprss_posts` DISABLE KEYS */;

INSERT INTO `wrdprss_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`)
VALUES
	(2,1,'2012-07-06 17:51:44','2012-07-06 15:51:44','<h3>Firma\r\nStr. 12\r\n04109 Leipzig</h3>\r\n<h1>Und watt is hier</h1>\r\n<blockquote>Und hier?</blockquote>\r\n<pre>Möp</pre>','Impressum','','publish','closed','closed','','impressum','','','2012-11-08 18:30:52','2012-11-08 17:30:52','',0,'http://wordpress.dev/?page_id=2',0,'page','',0),
	(3,1,'2012-07-06 17:51:56','2012-07-06 15:51:56','','Home','','publish','closed','closed','','home','','','2012-12-12 23:07:49','2012-12-12 22:07:49','',0,'http://wordpress.dev/?page_id=3',0,'page','',0),
	(9,1,'2012-09-11 14:50:05','2012-09-11 12:50:05',' ','','','publish','closed','closed','','9','','','2012-09-11 14:50:05','2012-09-11 12:50:05','',0,'http://wordpress.dev/?p=9',1,'nav_menu_item','',0),
	(10,1,'2012-09-11 14:50:05','2012-09-11 12:50:05',' ','','','publish','closed','closed','','10','','','2012-09-11 14:50:05','2012-09-11 12:50:05','',0,'http://wordpress.dev/?p=10',2,'nav_menu_item','',0),
	(12,1,'2013-01-07 20:41:05','2013-01-07 19:41:05','<h3>Firma\nStr. 12\n04109 Leipzig</h3>\n<h1>Und watt is hier</h1>\n<blockquote>Und hier?</blockquote>\n<pre>Möp</pre>','Impressum','','inherit','closed','closed','','2-autosave','','','2013-01-07 20:41:05','2013-01-07 19:41:05','',2,'http://wordpress.dev/2012/09/26/2-autosave/',0,'revision','',0),
	(15,1,'2013-10-30 17:45:48','0000-00-00 00:00:00','','Automatisch gespeicherter Entwurf','','auto-draft','closed','closed','','','','','2013-10-30 17:45:48','0000-00-00 00:00:00','',0,'http://wordpress.dev/?p=15',0,'post','',0);

/*!40000 ALTER TABLE `wrdprss_posts` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle wrdprss_term_relationships
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wrdprss_term_relationships`;

CREATE TABLE `wrdprss_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `wrdprss_term_relationships` WRITE;
/*!40000 ALTER TABLE `wrdprss_term_relationships` DISABLE KEYS */;

INSERT INTO `wrdprss_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`)
VALUES
	(9,3,0),
	(10,3,0);

/*!40000 ALTER TABLE `wrdprss_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle wrdprss_term_taxonomy
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wrdprss_term_taxonomy`;

CREATE TABLE `wrdprss_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) NOT NULL DEFAULT '',
  `description` longtext NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `wrdprss_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `wrdprss_term_taxonomy` DISABLE KEYS */;

INSERT INTO `wrdprss_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`)
VALUES
	(1,1,'category','',0,0),
	(2,2,'link_category','',0,0),
	(3,3,'nav_menu','',0,2);

/*!40000 ALTER TABLE `wrdprss_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle wrdprss_terms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wrdprss_terms`;

CREATE TABLE `wrdprss_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `slug` varchar(200) NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  UNIQUE KEY `slug` (`slug`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `wrdprss_terms` WRITE;
/*!40000 ALTER TABLE `wrdprss_terms` DISABLE KEYS */;

INSERT INTO `wrdprss_terms` (`term_id`, `name`, `slug`, `term_group`)
VALUES
	(1,'Allgemein','allgemein',0),
	(2,'Blogroll','blogroll',0),
	(3,'Hauptnavigation','hauptnavigation',0);

/*!40000 ALTER TABLE `wrdprss_terms` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle wrdprss_usermeta
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wrdprss_usermeta`;

CREATE TABLE `wrdprss_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) DEFAULT NULL,
  `meta_value` longtext,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `wrdprss_usermeta` WRITE;
/*!40000 ALTER TABLE `wrdprss_usermeta` DISABLE KEYS */;

INSERT INTO `wrdprss_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`)
VALUES
	(1,1,'first_name',''),
	(2,1,'last_name',''),
	(3,1,'nickname','admin'),
	(4,1,'description',''),
	(5,1,'rich_editing','true'),
	(6,1,'comment_shortcuts','false'),
	(7,1,'admin_color','fresh'),
	(8,1,'use_ssl','0'),
	(9,1,'show_admin_bar_front','true'),
	(11,1,'aim',''),
	(12,1,'yim',''),
	(13,1,'jabber',''),
	(14,1,'wrdprss_capabilities','a:1:{s:13:\"administrator\";s:1:\"1\";}'),
	(15,1,'wrdprss_user_level','10'),
	(16,1,'wrdprss_user-settings','editor=tinymce&galfile=1&m9=c'),
	(17,1,'wrdprss_user-settings-time','1355350066'),
	(18,1,'wrdprss_dashboard_quick_press_last_post_id','15'),
	(19,1,'closedpostboxes_dashboard','a:0:{}'),
	(20,1,'metaboxhidden_dashboard','a:4:{i:0;s:17:\"dashboard_plugins\";i:1;s:21:\"dashboard_quick_press\";i:2;s:17:\"dashboard_primary\";i:3;s:19:\"dashboard_secondary\";}'),
	(21,1,'meta-box-order_dashboard','a:4:{s:6:\"normal\";s:63:\"dashboard_right_now,dashboard_recent_comments,dashboard_plugins\";s:4:\"side\";s:108:\"dashboard_quick_press,dashboard_recent_drafts,dashboard_primary,dashboard_incoming_links,dashboard_secondary\";s:7:\"column3\";s:0:\"\";s:7:\"column4\";s:0:\"\";}'),
	(22,1,'screen_layout_dashboard','2'),
	(23,1,'managenav-menuscolumnshidden','a:4:{i:0;s:11:\"link-target\";i:1;s:11:\"css-classes\";i:2;s:3:\"xfn\";i:3;s:11:\"description\";}'),
	(24,1,'metaboxhidden_nav-menus','a:2:{i:0;s:8:\"add-post\";i:1;s:12:\"add-post_tag\";}'),
	(25,1,'dismissed_wp_pointers','wp330_toolbar,wp330_saving_widgets,wp330_media_uploader,wp340_customize_current_theme_link,wp350_media,aioseop_welcome,aioseop_donate,aioseop_menu_202,aioseop_menu_203,aioseop_menu_204'),
	(26,1,'nav_menu_recently_edited','3');

/*!40000 ALTER TABLE `wrdprss_usermeta` ENABLE KEYS */;
UNLOCK TABLES;


# Export von Tabelle wrdprss_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `wrdprss_users`;

CREATE TABLE `wrdprss_users` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '',
  `user_pass` varchar(64) NOT NULL DEFAULT '',
  `user_nicename` varchar(50) NOT NULL DEFAULT '',
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_url` varchar(100) NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT '0',
  `display_name` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`ID`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `wrdprss_users` WRITE;
/*!40000 ALTER TABLE `wrdprss_users` DISABLE KEYS */;

INSERT INTO `wrdprss_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`)
VALUES
	(1,'admin','$P$BDjdQBV2OuD9tai53yeDLf3HfsqaqC.','admin','kontakt@webgefrickel.de','','2011-07-18 15:18:15','',0,'admin');

/*!40000 ALTER TABLE `wrdprss_users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
